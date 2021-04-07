module QuestionsHelper
  def question_header(question)
    if question.new_record?
      "Create new #{question.test.title}-test question"
    else
      "Edit #{question.test.title}-test question"
    end
  end
end
