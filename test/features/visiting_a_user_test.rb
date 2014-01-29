require "test_helper"

feature "Visiting A User Page" do
  scenario "unauthenticated site visitor can see which questions a user contributed to" do
    visit user_path(users(:one))
    page.must_have_content users(:one).email
    page.must_have_content questions(:q1).question
    page.must_have_content questions(:q3).question
  end
end
