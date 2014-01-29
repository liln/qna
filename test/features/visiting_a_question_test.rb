require "test_helper"

feature "Visiting A Question" do
  scenario "unauthenticated user can visit a question" do
    visit question_path(questions(:q3))
    page.must_have_content questions(:q3).question
    page.must_have_content users(:one).email
    page.must_have_content users(:two).email
  end
end
