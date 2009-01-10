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
        select_value("SELECT nextval(#{quote_table_name(sequence)})").to_i
      end

      def current_in_sequence(sequence)
        select_value("SELECT currval(#{quote_table_name(sequence)})").to_i
      end

      def current_in_sequence(sequence)
        select_value("SELECT lastval(#{quote_table_name(sequence)})").to_i
      end
    
      def set_sequence(sequence, value, value_used = true)
        select_value("SELECT setval(#{quote_table_name(sequence)}, #{quote(value)}, #{quote(value_used)})")
      end
      
      def create_sequence(sequence, start = nil)
        options = ''
        options << " START #{quote(start)}" if start # Set start value (ie: value returned by next_in_sequence next time)
        execute "CREATE SEQUENCE #{quote_table_name(sequence)} #{options}"
      end
      
      def drop_sequence(sequence)
        execute "DROP SEQUENCE IF EXISTS #{quote_table_name(sequence)}"
      end
    end
  end
end