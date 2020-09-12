include FactoryBot::Syntax::Methods

def provide_record(record_type:, attributes:)
  record = record_type.to_s.classify.constantize.find_by(attributes)
  record ||= create(record_type.to_sym, attributes)
end

admin = provide_record(record_type: :user, attributes: { username: "admin", name: "Tony Stark" })
admin.confirm unless admin.confirmed?

# Set up the test store
avengers_store = provide_record(record_type: :store, attributes: { name: "Avengers Store" })

ironman = provide_record(record_type: :user, attributes: { username: "ironman", name: "Tony Stark" })
ironman.confirm unless ironman.confirmed?

hulk = provide_record(record_type: :user, attributes: { username: "hulk", name: "Bruce Banner" })
hulk.confirm unless hulk.confirmed?

products = 20.times.map do |i|
  book_title = "#{Faker::Book.unique.title} #{i + 1}"
  create(:product, name: book_title, store: avengers_store)
end

users = [ironman, hulk]
avengers_store.add_users(users)