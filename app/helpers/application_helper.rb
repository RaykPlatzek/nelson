module ApplicationHelper

  def flash_class_helper_toastr(level)
    case level
      when 'notice'           then 'info'
      when 'notice_html_safe' then 'info'
      when 'success'          then 'success'
      when 'success_html_safe'then 'success'
      when 'error'            then 'error'
      when 'error_html_safe'  then 'error'
      when 'alert'            then 'warning'
      when 'alert_html_safe'  then 'warning'
      when 'recaptcha_error'  then 'error'
      else 'info'
    end
  end

  def trend_color(trend)
    return "bg-danger" if trend == TREND_DOWN 
    return "bg-success" if trend == TREND_UP 
    "bg-info"
  end

  def controller?(*controller)
    controller.include?(params[:controller])
  end

  def action?(*action)
    action.include?(params[:action])
  end
end
