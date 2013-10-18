require "attr_readonly/version"

module AttrReadonly


  def attr_readonly *syms
    syms.each do |method|
      define_method(method){
        return self.instance_variable_get("@#{method.to_s}").dup.freeze 
      }
    end
  end

end


class Module 

  include AttrReadonly

end
