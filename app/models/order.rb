# == Schema Information
#
# Table name: orders
#
#  id                        :bigint           not null, primary key
#  adjustment_total_in_cents :integer          not null
#  item_total_in_cents       :integer          not null
#  shipment_total_in_cents   :integer          not null
#  tax_total_in_cents        :integer          not null
#  total_in_cents            :integer          not null
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#  store_id                  :bigint
#  user_id                   :bigint
#
# Indexes
#
#  index_orders_on_store_id  (store_id)
#  index_orders_on_user_id   (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (store_id => stores.id)
#  fk_rails_...  (user_id => users.id)
#
class Order < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :store, optional: true
end
