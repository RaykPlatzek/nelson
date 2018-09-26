class UserDecorator < Draper::Decorator
  delegate_all
  decorates_association :account, with: AccountDecorator
  
  def color_style_chart(number_colors)
     color_array = ["#27B6AF", "#207cb8", "#83cfff", "#a1c8e1"]
     color_array = add_new_color(number_colors, color_array) if number_colors > color_array.length
     color_array
  end

  def add_new_color(number_colors, color_array)
    (color_array.length - number_colors).times do 
      color_array << "#cc" + number_colors.to_s + rand(999).to_s 
    end
    color_array
  end
end