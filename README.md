# Superbot::Capybara

test:

    echo "{\"eval\": \"visit 'http://google.com'\"}" | exe/sb-capybara

leave STDIN open:

    (echo "{\"eval\": \"visit 'http://google.com'\"}" && cat) | exe/sb-capybara
