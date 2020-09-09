class Product < ApplicationRecord
  belongs_to :store

  before_create :create_slug

  private
  
  def create_slug
    self.slug ||= name.downcase.parameterize
  end
end
