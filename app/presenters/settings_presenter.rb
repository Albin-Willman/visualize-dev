class SettingsPresenter
  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations

  ATTRIBUTES = [
    :developers,
    :projects,
    :project_ids
  ]

  attr_accessor(*ATTRIBUTES)

  def initialize(params = {})
    @developers = params[:developers].blank? ? 2 : params[:developers].to_i
    @project_ids = params[:project_ids] && params[:project_ids].reject!(&:blank?)
    if @project_ids && @project_ids.length > 0
      @projects = Project.where(id: params[:project_ids])
    else
      @projects = Project.all
    end
  end

  def features
    @features ||= Feature.where(project_id: project_ids).estimated.with_project
  end

  def efficiency
    1.0 - 0.25*projects.length
  end

end