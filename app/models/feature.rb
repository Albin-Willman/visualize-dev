class Feature < ActiveRecord::Base
  belongs_to :project
  validates_presence_of :project
  scope :with_project, -> { includes(:project) }
  scope :estimated,    -> { where.not(max_days: nil, min_days: nil)}

  def avg_days
    (min_days + max_days) / 2.0
  end
end
