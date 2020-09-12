# == Schema Information
#
# Table name: products
#
#  id             :bigint           not null, primary key
#  description    :text
#  featured_image :string
#  name           :string           default(""), not null
#  price_in_cents :bigint           not null
#  slug           :string           default(""), not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  store_id       :bigint           not null
#
# Indexes
#
#  index_products_on_name      (name) UNIQUE
#  index_products_on_slug      (slug) UNIQUE
#  index_products_on_store_id  (store_id)
#
# Foreign Keys
#
#  fk_rails_...  (store_id => stores.id)
#
class Product < ApplicationRecord
  belongs_to :store

  validates :name, presence: true, uniqueness: true

  before_create :create_slug

  private
  
  def create_slug
    return if slug.present?
    self.slug = name.downcase.parameterize
  end
end
