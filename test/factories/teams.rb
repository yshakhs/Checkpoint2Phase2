FactoryBot.define do
    factory :team do
      name { "Electrical engineer" }
      organization_id_id { 1 }
      division { "Junior" }
      active { true }
    end
  end