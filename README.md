# attr_readonly

## Author

 Romain GEORGES <romain@ultragreen.net>
 Ultragreen Software

## Copyright 

Ultragreen Software (c) 2013
BSD-2 License 

## Description

Provide a new macro like attr_accessor to make real read_only accessors to frozen dup of the attributs given in parameters

## Version 

   current : 1.0.0

## Installation

Add this line to your application's Gemfile:

    gem 'attr_readonly'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install attr_readonly

## Usage

This gem add the macro : attr_readonly to class definition   

You could create reader accessors, in Ruby like :

    class Test 
      attr_reader :foo
      def initialize(foo: '')
        @foo = foo
      end
    end       

if you try to do a direct affectation you raise an exception NoMethodError : 

    Test::new.foo= 'bar'    
    # => undefined method `foo=' for #<Test:0x00000801932598 @foo=""> (NoMethodError)
   
But if you try to use a method on this accessor (for exemple <<), you could modify it !

    test = Test::new
    p test.foo << 'bar'
    # => "bar"
    p test
    # => <Test:0x000008019323b8 @foo="bar">
    
if you want to secure an API, or prevent inapriopriate usage of a componant you want to diffuse, this a problem.

So, use this gem, replace the macro attr_reader by attr_readonly :

    require 'attr_readonly'
    class Test
      attr_readonly :foo
      def initialize(foo: '')
        @foo = foo
      end
    end

    Test::new.foo << 'bar'    
    # => can't modify frozen String (RuntimeError)

No fear, it's just a frozen copy (dup), your real attribut is not frozen


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
