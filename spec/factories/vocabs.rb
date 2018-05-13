FactoryBot.define do
  factory :vocab do
    sequence(:name) { |n| "happy#{n}" }
    answer '幸せ'
    wrong1 '悲しむ'
    wrong2 '葛藤する'
    wrong3 '見上げる'
  end
end
