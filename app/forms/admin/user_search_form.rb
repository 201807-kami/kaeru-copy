class Admin::UserSearchForm
  include ActiveModel::Model

  attr_accessor :email, :created_at_from, :created_at_to

  def search(page)
    users = User.all
    #users = User.where.not(confirmed_at: nil)
    users = users.where('`users`.`email` like ?', "%#{email}%") if email.present?
    # users = users.where('`users`.`name` like ?', "%#{name}%") if name.present?
    users = users.where('`users`.`created_at` >= ?', created_at_from) if created_at_from.present?
    users = users.where('`users`.`created_at` <= ?', created_at_to) if created_at_to.present?
    # users = users.where(leave_at: nil) if leaved.blank? || leaved == '0'
    users.page(page).per(50).order(id: :desc)
  end

end