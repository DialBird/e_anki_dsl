require 'bundler/setup'
require 'active_record'

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
