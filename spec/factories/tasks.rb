FactoryGirl.define do
  factory :task do
    name "Sample Task"
    description "This is a sample task."
    state "to-do"
    project nil
  end
end
