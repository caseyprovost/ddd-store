# == Schema Information
#
# Table name: stores
#
#  id         :bigint           not null, primary key
#  name       :string           default(""), not null
#  subdomain  :string           default(""), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  owner_id   :bigint           not null
#
# Indexes
#
#  index_stores_on_name       (name) UNIQUE
#  index_stores_on_owner_id   (owner_id)
#  index_stores_on_subdomain  (subdomain) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (owner_id => users.id)
#
class Store < ApplicationRecord
  belongs_to :owner, class_name: "User"
  has_many :store_users
  has_many :users, through: :store_users
  has_many :products

  validates :name, presence: true, uniqueness: true
  validates :subdomain, presence: true, uniqueness: true

  def add_products(candidate_products)
    new_products = candidate_products - products
    self.products = products.concat(new_products)
    save!
  end

  def add_users(candidate_users)
    new_users = candidate_users - users
    self.users = users.concat(new_users)
    save!
  end
end
