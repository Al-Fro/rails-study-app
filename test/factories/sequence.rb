FactoryBot.define do
  sequence :string, aliases: %i[name password] do |n|
    "string#{n}"
  end

  sequence :email do |n|
    "email#{n}@example.com"
  end
end
