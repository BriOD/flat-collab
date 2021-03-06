class PairRequest < ApplicationRecord
  validates_presence_of :project, :user_id
  belongs_to :user

  enum status: [:active, :inactive]

  scope :persisted, -> { where "id IS NOT NULL" }

  def mark_inactive
    if self.active?
      self.status = "inactive"
      self.save
    end
  end
end
