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
        select_value("SELECT nextval('#{PGconn.quote_ident(sequence)}')").to_i
      end

      def current_in_sequence(sequence)
        select_value("SELECT currval('#{PGconn.quote_ident(sequence)}')").to_i
      end

      def set_sequence(sequence, value, value_used = true)
        select_value("SELECT setval('#{PGconn.quote_ident(sequence)}', #{quote(value)}, #{quote(value_used)})")
      end

      def create_sequence(sequence, start = nil)
        options = ''
        options << " START #{quote(start)}" if start # Set start value (ie: value returned by next_in_sequence on next call)
        execute "CREATE SEQUENCE #{quote_table_name(sequence)} #{options}" unless sequence_exists?(sequence)
      end

      def drop_sequence(sequence)
        execute "DROP SEQUENCE IF EXISTS #{quote_table_name(sequence)}"
      end

      def sequence_exists?(sequence)
        query("SELECT relname FROM pg_class WHERE relkind='S'").flatten.include?(sequence)
      end
    end
  end
end