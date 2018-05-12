# frozen_string_literal: true

require 'bundler/setup'
require 'active_record'
require 'pry'
require './schema'

Dir.glob('./lib/ext/*.rb').each { |f| require f }

lambda {
  vocabs = []

  define_method :remember do |name, &block|
    v = Vocab.new(name: name)
    block.call v
    vocabs << v
  end

  define_method :each_vocabs do |&block|
    vocabs.each do |vocab|
      block.call vocab
    end
  end

  class CleanObject
    attr_accessor(*Vocab::ATTRIBUTES)
  end
}.call

load './vocab_list.rb'

# main
if $PROGRAM_NAME == __FILE__
  each_vocabs do |vocab|
    ActiveRecord::Base.transaction do
      vocab.save!
    end
    puts "#{vocab.name.red} is perfectly registered!"
  rescue ActiveRecord::RecordInvalid => e
    if e.message.include?('has already been taken')
      puts "Sorry but #{e.record.name.red} is already registered"
    else
      puts "Error with #{e.record.name.red}: #{e.message}"
    end
  end
end
