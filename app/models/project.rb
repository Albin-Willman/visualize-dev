class Project < ActiveRecord::Base
  has_many :features

  scope :with_features, -> { includes(:features) }

  enum color: ['red', 'green', 'blue']

  def expected_time
    features.inject(0.0) { |sum, el| sum + el.avg_days }
  end
end
