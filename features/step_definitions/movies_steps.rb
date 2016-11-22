# Add a declarative step here for populating the DB with movies.

Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    # {"title"=>"Aladdin", "rating"=>"G", "release_date"=>"25-Nov-1992"}
    Movie.create!(movie)
  end
  #flunk "Unimplemented"
end

Then /^the director of "(.*)" should be "(.*)"$/ do |title_value, director_value|
    movie = Movie.find_by_title(title_value)
    expect(movie.director).to eq director_value
end
# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /I should see "(.*)" before "(.*)"/ do |movie_title1, movie_title2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  body = page.body
  location_of_movie_title1_in_body = body.index(movie_title1)
  location_of_movie_title2_in_body = body.index(movie_title2)
  loc1 = location_of_movie_title1_in_body
  loc2 = location_of_movie_title2_in_body
  if loc1==nil || loc2==nil
      fail "One of both search parameters not found"
  else
      expect(loc1<loc2).to eq true
  end
end

# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  # HINT: use String#split to split up the rating_list, then
  #   iterate over the ratings and reuse the "When I check..." or
  #   "When I uncheck..." steps in lines 89-95 of web_steps.rb
  # rating_list = "PG, R"
  # uncheck = nil or "un"

  rating_list.split(/,\s*/).each { |rating|  # , one or more spaces characters
    if uncheck
      step "I uncheck \"ratings_#{rating.strip}\""
    else
      step "I check \"ratings_#{rating.strip}\""
    end
  }
end

Then /I should see all the movies/ do 
  # Make sure that all the movies in the app are visible in the table 
  # have_css if from capybara
  # expect is from rspec
  # have_css with rpsec matcher == has_css capybara matcher
  expect(page).to have_css("table#movies tbody tr", count: Movie.count)
  #flunk "Unimplemented"
end