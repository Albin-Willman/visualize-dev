class DeveloperPresenter

  def initialize(efficiency = 0.75)
    @efficiency = efficiency.to_f
    @expected   = 0.0
    @features   = []
  end

  def add_feature(feature)
    @expected += feature.avg_days
    @features << feature
  end

  def expected
    @expected
  end

  def expected_length
    (expected/5*7/efficiency).to_i
  end

  def features
    @features
  end

  def width
    (10*expected/efficiency + 15*@features.length).to_i
  end

  def efficiency
    @efficiency
  end
end