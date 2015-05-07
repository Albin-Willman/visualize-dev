class DeveloperPresenter

  def initialize(efficiency = 0.75)
    @efficiency = efficiency
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

  def features
    @features
  end

  def width
    10*expected/efficiency + 15*@features.length
  end

  def efficiency
    @efficiency
  end
end