module DBNuker
  VERSION = "1.0.0"

  def self.boom!
    query = tables_to_delete.map do |table|
      "DELETE FROM #{table};"
    end.join("")

    execute query if query.size > 0
  end

  def self.connection
    ActiveRecord::Base.connection
  end

  def self.execute(query)
    connection.execute query
  end

  def self.tables_to_delete
    result = execute("SELECT table_name FROM information_schema.tables WHERE table_schema = '#{db_name}' AND table_rows > 0")
    result.map{ |row| row[0] } - tables_to_skip
  end

  def self.tables_to_skip
    @tables_to_skip ||= %w{ schema_migrations sessions }
  end

  def self.db_name
    @db_name ||= connection.instance_variable_get('@config')[:database]
  end
end
