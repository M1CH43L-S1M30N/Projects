require_relative 'db_connection'
require 'active_support/inflector'
require 'byebug'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    # ...
    return @columns if @columns
    col_names = DBConnection.execute2(<<-SQL)
      SELECT
        *
      FROM
        #{self.table_name}
    SQL
    @columns = col_names.first.map { |ele| ele.to_sym  }
  end

  def self.finalize!
    self.columns.each do |col|
      define_method("#{ col }=") do |val|
        self.attributes[col] = val   
      end

      define_method(col) do
        self.attributes[col]
      end
      @attributes
    end
  end

  def self.table_name=(table_name)
    # ...
    @table_name = table_name
  end

  def self.table_name
    # ...
    @table_name = self.to_s.downcase + "s"
  end

  def self.all
    # ...
    rows = DBConnection.execute(<<-SQL)
      SELECT
        *
      FROM
        #{self.table_name}
    SQL

    self.parse_all(rows)
  end

  def self.parse_all(results)
    # ...
    results.map { |result| self.new(result) }
  end

  def self.find(id)
    # ...
    finds = DBConnection.execute(<<-SQL, id)
      SELECT
        *
      FROM
        #{self.table_name}
      WHERE
        id = ?
    SQL
    # debugger
    if finds.empty?
      return nil
    else
      self.new(*finds)
    end
  end

  def initialize(params = {})
    # ...
    params.keys.each do |attr_name|
      attr_sym = attr_name.to_sym
      if self.class.columns.include?(attr_sym)
        # debugger
        self.send("#{attr_sym}=", params[attr_name])
      else
        raise "unknown attribute '#{attr_name}'"
      end
    end
    # self.class.finalize!
  end

  def attributes
    # ...
    @attributes ||= {}
  end

  def attribute_values
    # ...
    self.attributes.values
  end

  def insert
    # ...
    table = self.class.table_name
    col_names = self.class.columns.drop(1).join(", ")
    vals = *self.attribute_values
    q_marks = (['?'] * vals.length).join(", ")
    # debugger
    DBConnection.execute(<<-SQL, vals)
    INSERT INTO
      #{table} (#{col_names})
    VALUES
      (#{q_marks})
    SQL
    self.id = DBConnection.last_insert_row_id
  end

  def update
    # ...
    table = self.class.table_name
    col_names = self.class.columns.drop(1)
    new_cols = col_names.map { |col| "#{col} = ?"}.join(", ")
    vals = *self.attribute_values
    id = vals.shift
    q_marks = (['?'] * vals.length).join(", ")
    # debugger
    DBConnection.execute(<<-SQL, vals, id)
    UPDATE
      #{table}
    SET
      #{new_cols}
    WHERE
      id = ?
    SQL
  end

  def save
    # ...
    if self.class.find(self.id)
      self.update
    else
      self.insert
    end
  end
end
