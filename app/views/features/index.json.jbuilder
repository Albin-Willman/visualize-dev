json.array!(@features) do |feature|
  json.extract! feature, :id, :name, :project_id, :min_days, :max_days
  json.url feature_url(feature, format: :json)
end
