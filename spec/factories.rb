FactoryGirl.define do
  factory :sentence do
    title "Some title"
    description  "Some awesome description"
    author "Jim Hendrix"
  end

  factory :comment do
    author "Jimmy Salivan"
    content { |n| "Drum i good, doode#{Random.rand(1000)}"}
  end
end