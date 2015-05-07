module FeaturesHelper
  def print_feature_block(feature, efficiency)
    content_tag :div, class: 'feature-block', style: "background: #{feature.project.color}; width: #{feature.avg_days*10/efficiency}px;" do
      feature.name      
    end
  end
end
