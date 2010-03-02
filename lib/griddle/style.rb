module Griddle
  class Style
    
    attr_accessor :name, :definition
    
    def initialize(name, definition)
      @name = name
      @definition = case 
      when definition.is_a?(String)
        {
          :geometry => definition
        }
      when definition.is_a?(Array)
        raise "Don't send an array to Style"
      else
        raise "Definition must be a type of String, Array, or Hash" unless definition.is_a?(Hash)
        {
          :geometry => definition[:geometry]
        }
      end
      
    end
    
    def [](key)
      return nil unless respond_to? key
      send(key)
    end
    
    def geometry
      @definition[:geometry]
    end
    
  end
end