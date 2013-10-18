#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
# Copyright Ultragreen (c) 2012-2�~B013
#---
# Author : Romain GEORGES
# type : gem component library
# obj : Methodic Module
#---

# require version is securing for debug
begin 
  require "attr_readonly/version"
rescue LoadError
  puts 'debug'
end

# module Methodic
# @author Romain GEORGES <romain@ultragreen.net>
# @see http://www.ultragreen.net/projects/attr_reader
# @version 1.0.0
# @note this module include a method to be mix in Module (Class)
module AttrReadonly

  
  # pretty accessor for specifying mandatories options
  # @param [*Symbol] syms a list of symbols defining accessors to add
  # @return [Array] Array of symbols methods name (accessors) created
  # @example usage
  #    require 'attr_readonly' 
  #    class Test
  #      attr_readonly :foo
  #      def initialize(foo: '')
  #        @foo = :foo
  #      end
  #    end
  def attr_readonly *syms
    syms.each do |method|
      define_method(method){
        return self.instance_variable_get("@#{method.to_s}").dup.freeze 
      }
    end
  end

end



# reimplement Module
# adding AttrReadonly Mixin for attr_readonly macro
class Module 

  # include AttrReadonly
  include AttrReadonly

end



