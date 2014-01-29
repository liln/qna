require "test_helper"

feature "Creating A Question" do
  scenario "logged in user can create a question" do
    sign_in
    visit questions_path
    click_on "New Question"

    fill_in "Question", with: "What's going on?"
    click_on "Create Question"

    page.text.must_include "Question was successfully created"
    page.text.must_include "What's going on?"
    page.must_have_content users(:one).email
  end

  scenario "logged in user cannot create a blank question" do
    sign_in
    visit questions_path
    click_on "New Question"

    click_on "Create Question"

    page.text.must_include "Question can't be blank"
  end

  scenario "unauthenticated site visitors cannot create a question" do
    visit questions_path
    page.wont_have_content "New Question"
  end
end
