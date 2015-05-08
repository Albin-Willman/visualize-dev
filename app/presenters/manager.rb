class Manager
  def initialize(nbr_developers, efficiency = 0.75)
    @developers = []
    nbr_developers.times do
      @developers << Developer.new(efficiency)
    end
  end

  def distribute_feature(feature)
    @developers.last.add_feature(feature)
    sort_developers!
  end

  def developers
    @developers
  end

  def sort_developers!
    @developers.sort_by!(&:expected).reverse!
  end
end