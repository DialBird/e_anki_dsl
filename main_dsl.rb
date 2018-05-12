# frozen_string_literal: true

require 'bundler/setup'
require 'active_record'
require 'pry'
require './schema'

Dir.glob('./lib/ext/*.rb').each { |f| require f }

lambda {
  vocabs = {}

  define_method :remember do |vocab, &block|
    vocabs[vocab] = block
  end

  define_method :each_vocabs do |&block|
    vocabs.each do |key, val|
      block.call [key, val]
    end
  end

  class CleanObject
    attr_accessor(*Vocab::ATTRIBUTES)
  end
}.call

load './vocab_list.rb'

# main
if $PROGRAM_NAME == __FILE__
  each_vocabs do |name, params|
    ActiveRecord::Base.transaction do
      v = Vocab.new(name: name)
      env = CleanObject.new
      env.instance_eval(&params)
      Vocab::ATTRIBUTES.each do |param|
        v.send("#{param}=", env.send(param))
      end
      v.save!
    end
    puts "#{name.red} is perfectly registered!"
  rescue ActiveRecord::RecordInvalid => e
    if e.message.include?('has already been taken')
      puts "Sorry but #{e.record.name.red} is already registered"
    else
      puts "Error with #{e.record.name.red}: #{e.message}"
    end
  end
end
