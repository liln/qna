require "test_helper"

feature "Visiting A Question" do
  scenario "unauthenticated user can visit a question" do
    visit question_path(questions(:q1))
    page.must_have_content questions(:q1).question
    # verify that page has list of collaborators
  end
end
