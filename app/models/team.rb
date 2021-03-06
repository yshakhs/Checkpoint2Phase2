class Team < ApplicationRecord
  belongs_to :organization_id
  has_and_belongs_to_many :students

  validates_presence_of :name
  validates_presence_of :organization_id
  validates_presence_of :division


  scope :active, -> { where(active: true) }
  scope :inactive, -> { where(active: false) }
  scope :alphabetical, -> { order('name') }
  scope :juniors, -> { where(division: Junior) }
  scope :seniors, -> { where(division: Senior) }
  
  validates_inclusion_of :division, in: %w[Junior Senior], message: "is not an option"


  def make_active
    self.active=true
    self.save!
  end
  
        
  def make_inactive
      self.active=false
      self.save!
  end

  scope :for_organization, -> (organization) { where("organization_id = ?", organization) }

  validate :organization_is_active_in_system

  private
  def organization_is_active_in_system
    # get an array of all active organizations in the system
    all_org_ids = Organization.active.all.map{|o| o.id}
    # add error unless the organization id of the team is in the array of active organizations
    unless all_org_ids.include?(self.organization_id)
      errors.add(:organization, "is not an active organization in the system")
    end
  end
  
end
