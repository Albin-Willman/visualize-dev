class HomeController < ApplicationController
  def start
    @settings     = SettingsPresenter.new(params[:settings_presenter] || {})
    @all_projects = Project.all
    @projects     = @settings.projects
    
    @manager      = Manager.new(@settings.developers, @settings.efficiency)
    @settings.features.each do |feature|
      @manager.distribute_feature(feature)
    end
  end
end