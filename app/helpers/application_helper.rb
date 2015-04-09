module ApplicationHelper
  def date_from_param(params, symbol_name)
    Date.new(params[symbol_name][:year].to_i, 
                        params[symbol_name][:month].to_i,
                        params[symbol_name][:day].to_i)
  rescue
    Date.today
  end

  def date_from_symbol_val(sym)
      Date.new([sym][:year].to_i, 
                        [sym][:month].to_i,
                        [sym][:day].to_i)
  rescue
      Date.today
  end
end
