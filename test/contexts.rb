# require needed files that have the modules
require './test/sets/organization'
require './test/sets/teams'


module Contexts
  # explicitly include all sets of contexts used for testing 
  include Contexts::Organizations
  include Contexts::Teams

  
  def create_all
    puts "Building context..."
    create_organizations
    create_teams
    puts "Built departments"
    # create_faculties
    # puts "Built faculties"

  end
  
end