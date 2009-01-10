module ActiveRecord
  class Base
    def self.id_sequence
      connection.default_sequence_name
    end
    
    # Returns the next id on the table's id sequence.
    def self.next_id
      connection.next_in_sequence(id_sequence)
    end
    
    def self.current_id
      connection.current_in_sequence(id_sequence)
    end

    def self.last_id
      connection.current_in_sequence(id_sequence)
    end
  end
  
  module ConnectionAdapters
    class PostgreSQLAdapter 
      # Returns the next value in sequence.
      def next_in_sequence(sequence)
        select_value("SELECT nextval('#{sequence}')").to_i
      end

      def current_in_sequence(sequence)
        select_value("SELECT currval('#{sequence}')").to_i
      end

      def current_in_sequence(sequence)
        select_value("SELECT lastval('#{sequence}')").to_i
      end
    
      def set_sequence(sequence, value, value_used = true)
        select_value("SELECT setval('#{sequence}', #{value}, #{value_used})")
      end
    end
  end
end