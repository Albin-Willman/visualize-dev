class SettingsPresenter
  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations

  ATTRIBUTES = [
    :developers,
    :projects,
    :project_ids,
    :parallell_projects
  ]

  attr_accessor(*ATTRIBUTES)

  def initialize(params = {})
    @parallell_projects = params[:parallell_projects].blank? ? 2 : params[:parallell_projects].to_i
    @developers = params[:developers].blank? ? 2 : params[:developers].to_i
    @project_ids = params[:project_ids] && params[:project_ids].reject!(&:blank?)
    if @project_ids && @project_ids.length > 0
      @projects = Project.where(id: params[:project_ids])
    else
      @projects = Project.all
      @project_ids = @projects.map(&:id)
    end
  end

  def features
    @features ||= Feature.where(project_id: project_ids).estimated.with_project
  end

  def efficiency
    return base_efficiency if parallell_projects <= projects.length
    (base_efficiency/parallell_projects)*projects.length
  end

  private

  def base_efficiency
    1.0 - 0.25*parallell_projects
  end

end