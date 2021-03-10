class Organization < ApplicationRecord
    has_many :students
    has_many :teams
    has_many :student_teams, through: :students
    has_many :student_teams, through: :teams


    scope :active, -> { where(active: true) }
    scope :inactive, -> { where(active: false) }
    scope :alphabetical, -> { order('name') }

    validates_presence_of :name
    validates_presence_of :street_1
    validates_presence_of :zip
    validates_presence_of :short_name

    validates_format_of :zip, with: /\A\d{5}\z/, message: "should be five digits long", allow_blank: true
    validates_uniqueness_of :short_name, message:"short_name already in the records"

    validates_inclusion_of :state, in: %w[AL AK AZ AR CA CO CT DE FL GA HI ID IL IN IA KS KY LA ME MD MA MI MN MS MO MT NE NV NH NJ NM NY NC ND OH OK OR PA RI SC SD TN TX UT VT VA WA WV WI WY], message: "is not an option"


    def make_active
  self.active=true
  self.save!
end

      
def make_inactive
    self.active=false
    self.save!
end


end
