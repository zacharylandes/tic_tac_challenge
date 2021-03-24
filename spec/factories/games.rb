FactoryBot.define do
    factory :game do
      status { "MyString" }
      board { [["*",'*','*'],['*','*','*'],['*','*','*']] }
    end
  end
  