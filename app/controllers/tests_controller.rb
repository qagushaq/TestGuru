class TestsController < ApplicationController

  before_action :authenticate_user!
  before_action :find_test, only: %i[start]

  def index
    @tests = Test.all
  end

  def start
    if @test.test_to_pass?
      current_user.tests.push(@test)
      redirect_to current_user.test_passage(@test)
    else
      flash[:notice] = "Тест #{@test.title} еще дорабатывается, подождите"
      redirect_to tests_path
    end
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

end
