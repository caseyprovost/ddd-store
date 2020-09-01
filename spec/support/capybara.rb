require "capybara/cuprite"

Capybara.javascript_driver = :cuprite
Capybara.register_driver(:cuprite) do |app|
  Capybara::Cuprite::Driver.new(
    app,
    window_size: [1200,800],
    browser_options: { 'no-sandbox': nil },
    inspector: ENV['CUPRITE_INSPECTOR'] # should be "true" or empty
  )
end