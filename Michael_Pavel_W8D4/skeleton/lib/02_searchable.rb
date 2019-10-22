require_relative 'db_connection'
require_relative '01_sql_object'
require 'byebug'
module Searchable
  def where(params)
    # ...
    where_line = params.keys.map { |param| "#{param} = ?" }.join(" AND ")
    vals = params.values
    # debugger
    q = DBConnection.execute(<<-SQL, vals)
    SELECT
      *
    FROM
      #{self.table_name}
    WHERE
      #{where_line}
    SQL
    #
    q.map { |hash| self.new(hash) }
  end

end

class SQLObject
  extend Searchable
end
