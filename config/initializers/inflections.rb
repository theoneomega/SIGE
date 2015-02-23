# Be sure to restart your server when you modify this file.

# Add new inflection rules using the following format
# (all these examples are active by default):
# ActiveSupport::Inflector.inflections do |inflect|
#   inflect.plural /^(ox)$/i, '\1en'
#   inflect.singular /^(ox)en/i, '\1'
#   inflect.irregular 'person', 'people'
#   inflect.uncountable %w( fish sheep )
# end
#
# These inflection rules are supported but not enabled by default:
# ActiveSupport::Inflector.inflections do |inflect|
#   inflect.acronym 'RESTful'
# end
module Sunspot
  #
  # DataExtractors present an internal API for the indexer to use to extract
  # field values from models for indexing. They must implement the #value_for
  # method, which takes an object and returns the value extracted from it.
  #
  module DataExtractor #:nodoc: all
    #
    # AttributeExtractors extract data by simply calling a method on the block.
    #
    class AttributeExtractor
      def initialize(attribute_name)
        @attribute_name = attribute_name
      end

      def value_for(object)
        Filter.new( object.send(@attribute_name) ).value
      end
    end

    #
    # BlockExtractors extract data by evaluating a block in the context of the
    # object instance, or if the block takes an argument, by passing the object
    # as the argument to the block. Either way, the return value of the block is
    # the value returned by the extractor.
    #
    class BlockExtractor
      def initialize(&block)
        @block = block
      end

      def value_for(object)
        Filter.new( Util.instance_eval_or_call(object, &@block) ).value
      end
    end

    #
    # Constant data extractors simply return the same value for every object.
    #
    class Constant
      def initialize(value)
        @value = value
      end

      def value_for(object)
        Filter.new(@value).value
      end
    end

    #
    # A Filter to allow easy value cleaning
    #
    class Filter
      def initialize(value)
        @value = value
      end
      def value
        strip_control_characters @value
      end
      def strip_control_characters(value)
        return value unless value.is_a? String

        value.chars.inject("") do |str, char|
          unless char.ascii_only? and (char.ord < 32 or char.ord == 127)
            str << char
          end
          str
        end

      end
    end

  end
end