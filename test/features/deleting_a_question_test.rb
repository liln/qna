require "test_helper"

feature "Deleting A Question" do
  scenario "unauthenticated site visitors cannot delete questions" do
    visit question_path(questions(:q2))
    page.wont_have_content "Destroy"

    visit questions_path
    page.wont_have_content "Destroy"
  end

  scenario "users can delete questions" do
    sign_in
    # Given an existing post
    visit questions_path

    # When the delete link is clicked
    page.find("a[href='#{question_path(questions(:q1))}'][data-method='delete']").click

    # Then the post is deleted
    page.wont_have_content "why is the sky blue?"
  end
end
