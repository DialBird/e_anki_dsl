# frozen_string_literal: true

require 'bundler/setup'
# require 'pg'
require 'active_record'
require 'pry'

ActiveRecord::Base.establish_connection(
  adapter:  'postgresql',
  host: 'ruby25_db',
  username: 'root',
  database: 'e_anki_dsl'
)

# ActiveRecord::Migration.create_table :vocabs do |t|
#   t.string :name, null: false
#   t.string :answer, null: false
#   t.string :wrong1, null: false
#   t.string :wrong2, null: false
#   t.string :wrong3, null: false
#
#   t.timestamps
# end

class Vocab < ActiveRecord::Base
  self.table_name = 'vocabs'
end

load
