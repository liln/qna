require "test_helper"

feature "Editing A Question" do
  scenario "unauthenticated site visitors cannot edit answers" do
    visit question_path(questions(:q2))
    page.wont_have_content "Edit"

    visit questions_path
    page.wont_have_content "Edit"
  end

  scenario "users can edit answers" do
    sign_in
    visit question_path(questions(:q2))
    # email listed at the top
    page.must_have_content users(:one).email, count: 1
    click_on "Edit"

    fill_in "Answer", with: "blah blah"
    click_on "Update Question"

    page.text.must_include "Question was successfully updated"
    page.text.must_include "blah blah"
    page.must_have_content users(:one).email, count: 2
    page.must_have_content users(:two).email
  end
end
