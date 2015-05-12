module ProjectsHelper
  def print_dev_track(developer, start_date)
    content_tag :div, class: 'dev-track', style: "width: #{developer.width}px" do
      safe_join([print_time_line(developer, start_date)] + developer.features.map do |feature|
        print_feature_block(feature, developer.efficiency)
      end)
    end
  end

  def print_time_line(developer, start_date)
    content_tag :div, class: 'time-line' do
      safe_join([
        content_tag(:span, start_date, class: 'time-start'),
        content_tag(:span, start_date + (developer.expected_length).days, class: 'time-stop')
        ])
    end
  end
end
