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
end
