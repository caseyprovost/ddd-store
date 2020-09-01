class Store < ApplicationRecord
  belongs_to :owner
  has_many :store_users
  has_many :users, through: :store_users
  has_many :products

  validates :name, presence: true, uniqueness: true
  validates :subdomain, presence: true, uniqueness: true

  def add_products(candidate_products)
    existing_products = products.where(id: candidate_products.map(&:id))
    new_products = candidate_products - existing_products
    new_products.each { |product| self.products << product }
  end

  def add_users(candidate_users)
    existing_users = users.where(id: candidate_users.map(&:id))
    new_users = candidate_users - existing_users
    new_users.each { |user| self.users << user }
  end
end
