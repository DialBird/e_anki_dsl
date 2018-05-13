# frozen_string_literal: true

require 'bundler/setup'
require 'active_record'
require 'pry'
require 'yaml'

db_conf = YAML.load_file('./config/database.yml')
ActiveRecord::Base.establish_connection(db_conf['development'])

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

  def wrongs(w1, w2, w3)
    self.wrong1, self.wrong2, self.wrong3 = w1, w2, w3
  end
end
