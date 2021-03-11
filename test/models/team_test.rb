require 'test_helper'

class TeamTest < ActiveSupport::TestCase

  have_and_belongs_to_many (:students)
  should belongs_to (:organization_id)
  should have_and_belongs_to_many(:students)

  should validate_presence_of(:name)
  should validate_presence_of(:organization_id)
  should validate_inclusion_of(:division)



    #context
    context "Given context" do 
    setup do 
      create_teams
    end 

    teardown do
        destroy_teams
    end
end
