class Feature < ActiveRecord::Base
  belongs_to :project
  validates_presence_of :project
  scope :with_project, -> { includes(:project) }

  def avg_days
    (min_days + max_days) / 2.0
  end
end
