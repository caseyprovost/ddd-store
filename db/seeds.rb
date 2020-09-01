include FactoryBot::Syntax::Methods

def provide_record(record_type:, attributes:)
  record = record_type.classify.constantize.find_by(attributes)
  record ||= create(record_type.to_sym, attributes)
end

admin = provide_record(record_type: :user, attributes: { username: "admin", name: "Tony Stark" })
admin.confirm unless admin.confirmed?

# Set up the test store
avengers_store = create(:store, name: "Avengers Store")

ironman = provide_record(record_type: :user, attributes: { username: "ironman", name: "Tony Stark" })
ironman.confirm unless ironman.confirmed?

hulk = provide_record(record_type: :user, attributes: { username: "hulk", name: "Bruce Banner" })
hulk.confirm unless hulk.confirmed?

products = create_list(:products, 20)
users = [ironman, hulk]

avengers_store.add_users(users)
avengers_store.add_products(products)