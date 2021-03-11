module Contexts
    module Teams
  
    def create_teams
      @tamu = FactoryBot.create(:organization) #default organization
      @cornell = FactoryBot.create(:organization, name: "Cornell Medicine", street: "EC street 2" , zip: "33821" ,short_name: "Med" , active: false)
      @cmu = FactoryBot.create(:organization, name: "Carnegie Mellon University", short_name: "CMU" )
      @engineer = FactoryBot.create(:team, organization_id_id: 1)
        
    end
      
    def destroy_teams
      @engineer.destroy
      @tamu.destroy
      @cornell.destroy
      @cmu.destroy
    end
  
    end
  end