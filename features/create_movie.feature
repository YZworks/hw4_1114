Feature: create movie
 
  As a concerned user
  So that I can manage all movies
  I want to be able to create a movie

Background: movies in database

  Given the following movies exist:
  | title        | rating | director     | release_date |
  | Star Wars    | PG     | George Lucas |   1977-05-25 |
  | Blade Runner | PG     | Ridley Scott |   1982-06-25 |
  | Alien        | R      |              |   1979-05-25 |
  | THX-1138     | R      | George Lucas |   1971-03-11 |

Scenario: creating a new movie
  When I am on the RottenPotatoes home page
  And I follow "Add new movie"
  And I fill in "Title" with "Flipped"
  And I select "PG-13" from "Rating"
  And I select "2011" from "movie_release_date_1i"
  And I select "September" from "movie_release_date_2i"
  And I select "10" from "movie_release_date_3i"
  And I press "Save Changes"
  Then I should see "Flipped was successfully created."
  And I should see "PG-13"
  And I should see "2011-09-10"