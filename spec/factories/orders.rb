FactoryBot.define do
  factory :order do
    total_in_cents { 1 }
    adjustment_total_in_cents { 1 }
    item_total_in_cents { 1 }
    tax_total_in_cents { 1 }
    shipment_total_in_cents { 1 }
    user { nil }
    store { nil }
  end
end
