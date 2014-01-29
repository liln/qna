require "test_helper"

feature "Visiting A User Page" do
  scenario "unauthenticated site visitor can see which questions a user contributed to" do
    visit user_path(users(:one))
    page.must_have_content users(:one).email
    # or something like this to test the questions
    page.must_have_content users(:one).question
  end
end
