require_relative '02_searchable'
require 'active_support/inflector'
require "byebug"

# Phase IIIa
class AssocOptions
  attr_accessor(
    :foreign_key,
    :class_name,
    :primary_key
  )

  def model_class
    # ...
    self.class_name.constantize
  end

  def table_name
    # ...
    self.class_name.downcase + "s"
  end
end

class BelongsToOptions < AssocOptions
  def initialize(name, options = {})
    # ...
    defaults = { 
      :foreign_key => "#{name}_id".to_sym,
      :class_name => name.to_s.camelcase,
      :primary_key => :id
    }
    defaults.keys.each do |key|
      self.send("#{key}=", options[key] || defaults[key])
    end
  end
end

class HasManyOptions < AssocOptions
  def initialize(name, self_class_name, options = {})
    # ...
    defaults = {
      :foreign_key => "#{self_class_name.downcase}_id".to_sym,
      :class_name => name.capitalize.singularize,
      :primary_key => :id
    }
    defaults.keys.each do |key|
      self.send("#{key}=", options[key] || defaults[key])
    end
  end
end

module Associatable
  # Phase IIIb
  def belongs_to(name, options = {})
    # ...
    option = BelongsToOptions.new(name, options)
    define_method("#{name}") do 
    # debugger
      foreign_key = send("#{option.foreign_key}")
      option.model_class
      self.class.where(option.primary_key => foreign_key).first
      
    end

  end

  def has_many(name, options = {})
    # ...
    # option = HasManyOptions.new(name, option.model_class, options)
    # define_method("#{name}") do 
    # # debugger
    #   foreign_key = send("#{option.foreign_key}")
    #   option.model_class
    #   self.class.where(option.primary_key => foreign_key).first
    # end

  end

  def assoc_options
    # Wait to implement this in Phase IVa. Modify `belongs_to`, too.
  end
end

class SQLObject
  # Mixin Associatable here...
  extend Associatable
end
