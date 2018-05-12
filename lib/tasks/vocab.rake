# frozen_string_literal: true

namespace :vocab do
  task default: :test

  desc 'Start vocab test'
  task :test do
    require File.expand_path('../../schema', __dir__)
    system 'clear'

    vocabs = Vocab.all
    results = Array.new(3, '-')
    3.times do |idx|
      v = vocabs.sample
      q_list = [v.answer, v.wrong1, v.wrong2, v.wrong3].shuffle

      puts <<~TEXT
        Question #{idx + 1}

        #{v.name}

        1) #{q_list[0]}
        2) #{q_list[1]}
        3) #{q_list[2]}
        4) #{q_list[3]}

      TEXT

      loop do
        case answer = STDIN.gets.chomp.to_i
        when 1, 2, 3, 4
          if q_list[answer - 1] == v.answer
            results[idx] = 'o'
            puts 'OK'
          else
            results[idx] = 'x'
            puts 'WRONG!!'
          end
          p results
          break
        else
          puts 'Not An Answer'
        end
      end

      sleep 1
      system 'clear'
    end

    puts 'Results'
    p results
    puts 'Congrat!!' if results.all? { |res| res == 'o' }
  end
end
