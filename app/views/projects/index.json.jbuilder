json.array!(@projects) do |project|
  json.extract! project, :id, :name, :color
  json.url project_url(project, format: :json)
end
