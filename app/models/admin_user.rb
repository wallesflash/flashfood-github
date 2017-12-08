class AdminUser < ApplicationRecord
  has_secure_password

  scope :sort_by_name, lambda{order("surename ASC, name ASC")}

end
