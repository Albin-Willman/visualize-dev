class HomeController < ApplicationController
  def start
    @dev_presenter = DeveloperPresenter.new
    Feature.all.with_project.each do |feature|
      @dev_presenter.add_feature(feature)
    end
    @all_projects = Project.all
    @projects = Project.all
  end
end