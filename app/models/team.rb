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

  scope :for_organization, -> (organization) { where("organization_id = ?", organization_id) }


  private
  def organization_is_active
    # get an array of all active owners in the PATS system
    all_owner_ids = Organization.active.all.map{|o| o.id}
    # add error unless the owner id of the pet is in the array of active owners
    unless all_owner_ids.include?(self.owner_id)
      errors.add(:owner, "is not an active owner in PATS")
    end
  end
  
end
