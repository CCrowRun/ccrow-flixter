FactoryBot.define do
  factory :user do
    sequence :email do |n|
      "dummyEmail#{n}@gmail.com"
    end
    password { "secretPassword" }
    password_confirmation { "secretPassword" }
  end

  factory :course do
    title { "Test Course" }
    description { "Course Factory" }
    cost { 50 }
  end

  factory :section do
    title { "Test Section" }
  end

  factory :lesson do
    title { "Test Lesson" }
    subtitle { "Lesson Factory" }
  end
end