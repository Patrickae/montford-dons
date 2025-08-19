module ApplicationHelper
  def current_user
    @current_user ||= Current.session&.user
  end

  def format_currency(amount)
    number_to_currency(amount, precision: 2)
  end
end
