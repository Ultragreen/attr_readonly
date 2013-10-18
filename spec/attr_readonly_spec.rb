require './lib/attr_readonly.rb'

describe "Globale Conception" do
  
  
  describe AttrReadonly do
    subject { AttrReadonly }
    specify { subject.should be_an_instance_of Module }
    context "#attr_readonly" do
      it "should be defined a method call :attr_readonly in the module" do
        subject.method_defined?(:attr_readonly).should be_true 
      end
      it "should accept a variable number of parameters" do 
        subject.method(:attr_readonly).arity.should == -1
      end
    end
  end
  
  
  describe Module do 
    subject { Module }
    specify { subject.should be_an_instance_of Class }
    it "should include module AttrReadonly" do 
      subject.include?(AttrReadonly).should be_true
    end
    it "should include method :attr_readonly"do 
      subject.method_defined?(:attr_readonly).should be_true
    end
  end
  
  
  describe "Test Class instance" do 
    
    before :all do
      
      class Test 
        attr_readonly :array
        attr_readonly :string
        attr_readonly :hash
        def initialize(array: [], hash: {}, string: "")
          @array = array
          @hash = hash
          @string = string
        end
      end
    end 
    
    
    
    
    
    subject { Test::new }
    specify { subject.should be_an_instance_of Test }

    describe "instance variables" do 
      it "should be exist @hash with an empty hash" do
        subject.instance_variable_get('@hash').should == {}
      end 
     it "should be exist @array with an empty array" do
        subject.instance_variable_get('@array').should == []
      end 
     it "should be exist @string with an empty string" do
        subject.instance_variable_get('@string').should == ""
      end       
    end
    describe "Reader accessors" do 
      it "should include method :array" do 
        subject.methods.include?(:array).should be_true
      end
      it "should include method :string" do 
        subject.methods.include?(:string).should be_true
      end
      it "should include method :hash" do 
        subject.methods.include?(:hash).should be_true
      end
    end
    describe "No writer accessors" do 
      it "should not include method :array=" do 
        subject.methods.include?(:array=).should be_false
      end
      it "should not include method :string=" do 
        subject.methods.include?(:string=).should be_false
      end
      it "should not include method :hash=" do 
        subject.methods.include?(:hash=).should be_false
      end
      
    end
    describe "initials values for read accessors" do 
      it "should #hash return an empty hash" do 
        subject.hash.should == {}
      end
      it "should #array return an empty array" do 
        subject.array.should == [] 
      end
      it "should #string return an empty string" do 
        subject.string.should == ""
      end
    end
 
    describe "Attempt to write by attributs object methods" do 
      it "should raise an exception if trying to write hash[:test] = 'test'" do 
        lambda {subject.hash[:test] = 'test'}.should raise_error RuntimeError
        lambda {subject.hash.store(:key,'test')}.should raise_error RuntimeError
        lambda {subject.hash.merge!({:key => 'test'})}.should raise_error RuntimeError
      end
      it "should raise an exception if trying to write array[1] = 'test'" do 
        lambda {subject.array[1] = 'test'}.should raise_error RuntimeError
        lambda {subject.array.push('test')}.should raise_error RuntimeError
      end
      it "should raise an exception if trying to write string << 'test'" do 
        lambda {subject.string << 'test' }.should raise_error RuntimeError
        lambda {subject.string.concat(33)}.should raise_error RuntimeError
      end

    end

    describe "Getting the instance variable via the accessors could be done, if set by the inside of the Object (simulate via instance_variable_set)" do 
      it "should #hash return {:test => 'test'}" do 
        subject.instance_variable_set(:@hash,{:test => 'test'})
        subject.hash.should == {:test => 'test'}
      end  
      it "should #array return [:test]" do 
        subject.instance_variable_set(:@array,[:test])
        subject.array.should == [:test]
      end  
      it "should #string return 'test'" do 
        subject.instance_variable_set(:@string,'test')
        subject.string.should == "test"
      end  
    end
    
    
  end
  
end
