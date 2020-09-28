module ApplicationHelper
  def print_bootstrap_alerts
    flash.each do |message_type, message|
      concat(content_tag(:div, message, class: ['alert', "alert-#{message_type}", 'flash-message']))
    end
    nil
  end
end
