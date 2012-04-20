# app/controllers/questions_controller.rb
class QuestionsController < ApplicationController
  def survey
    @questions = SurveyQuestions.find_all_by_sid(1)
  end
  def updateResults
    @show = params
    @responses = Array.new
    @survey = SurveyQuestions.find_all_by_sid(params[:survey_id])
    @survey.each do |s|
      @responses << s.qid
    end
    @values = Array.new
    @responses.each do |r|
      @values << params[r.to_s]
    end
    conn = ActiveRecord::Base.connection
    @responses.each do |r|
      conn.execute("select updateResult(" +
        r.to_s + "," + params[r.to_s] + ")")
    end
  def createSurvey
    q1 = params[:q_1]
    q2 = params[:q_2]
    q3 = params[:q_3]
    q4 = params[:q_4]
    q5 = params[:q_5]
    @questions = Question.new(:q_1 => q1, :q_2 => q2, :q_3 => q3, :q_4 => q4, :q_5 => q5)
    @questions.save
  end
  end
end
