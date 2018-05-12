# frozen_string_literal: true

class CreateVocabs < ActiveRecord::Migration[5.2]
  def change
    create_table :vocabs do |t|
      t.string :name, null: false
      t.string :answer, null: false
      t.string :wrong1, null: false
      t.string :wrong2, null: false
      t.string :wrong3, null: false

      t.timestamps
    end
  end
end
