class Admin::OrderSearchForm
  include ActiveModel::Model

  def search 
  	orders = Orders.where(user: [email: email]) if email.present?
  end
end