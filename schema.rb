# frozen_string_literal: true

require 'bundler/setup'
require 'active_record'
require 'pry'

ActiveRecord::Base.establish_connection(
  adapter:  'postgresql',
  host: 'ruby25_db',
  username: 'root',
  database: 'e_anki_dsl'
)

# ActiveRecord::Schema.define do
#   create_table :vocabs, force: true do |t|
#     t.string :name, null: false
#     t.string :answer, null: false
#     t.string :wrong1, null: false
#     t.string :wrong2, null: false
#     t.string :wrong3, null: false
#
#     t.timestamps
#   end
# end

class Vocab < ActiveRecord::Base
  ATTRIBUTES = %i[answer wrong1 wrong2 wrong3].freeze
  self.table_name = 'vocabs'

  validates :name, presence: true, uniqueness: true
  validates :answer, presence: true
  validates :wrong1, presence: true
  validates :wrong2, presence: true
  validates :wrong3, presence: true
end
