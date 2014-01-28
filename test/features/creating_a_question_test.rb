require "test_helper"

feature "Creating A Question" do
  scenario "logged in user can create a question" do
    sign_in
    visit questions_path
    click_on "New Question"

    fill_in "Question", with: "What's going on?"
    click_on "Create Question"

    page.text.must_include "Question was successfully created"
    page.text.must_include ""
  end

  scenario "unauthenticated site visitors cannot create a question" do
    visit questions_path
    page.wont_have_content "Add Question"
  end
end