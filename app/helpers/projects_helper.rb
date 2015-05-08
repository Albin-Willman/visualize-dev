module ProjectsHelper
  def print_dev_track(dev_presenter)
    content_tag :div, class: 'dev-track', style: "width: #{dev_presenter.width}px" do
      safe_join([print_time_line(dev_presenter)] + dev_presenter.features.map do |feature|
        print_feature_block(feature, dev_presenter.efficiency)
      end)
    end
  end

  def print_time_line(dev_presenter)
    content_tag :div, class: 'time-line' do
      safe_join([
        content_tag(:span, Date.today, class: 'time-start'),
        content_tag(:span, Date.today + (dev_presenter.expected_length).days, class: 'time-stop')
        ])
    end
  end
end
