module StaticPagesHelper
  def set_active(controller, action=:index, custom='')
    if controller.is_a? String
      options = controller
    else
      options = {}
      options = {controller: controller, action: action}
    end
    custom+'active' if current_page?(options)
  end

  def set_open(index, custom='')
    custom+' open' if index == 0
  end

  def to_month_name(month_integer)
    months = {
        :'1' => 'january',
        :'2' => 'february',
        :'3' => 'march',
        :'4' => 'april',
        :'5' => 'may',
        :'6' => 'june',
        :'7' => 'july',
        :'8' => 'august',
        :'9' => 'september',
        :'10' => 'october',
        :'11' => 'november',
        :'12' => 'december',
    }
    t('months.'+months[month_integer.to_s.to_sym])
  end
end
