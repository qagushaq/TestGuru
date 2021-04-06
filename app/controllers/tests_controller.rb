class TestsController < ApplicationController
  before_action :find_test, only: %i[show]
  around_action :log_execute_time

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index
    @tests = Test.all
  end

  def all_tests
    render json: { tests: Test.all }
  end

  def show
    render inline: '<%= @test.title %>'
  end

  def new
  end

  def create
    test = Test.new(test_params)
    render plain: test.inspect
  end

  def search
    result = ["Class: #{params.class}", "Parameters: #{params.inspect}"]
    render plain: result.join("\n")
  end

  private

  def test_params
    params.require(:test).permit(:title, :level)
  end

  def find_test
    @test = Test.find(params[:id])
  end

  def send_log_message
    logger.info ("Action [#{action_name}] was finished")
  end

  def log_execute_time
    start = Time.now
    yield
    finish = Time.now - start
    logger.info("Execution time: #{finish * 1000}ms")
  end

  def rescue_with_test_not_found
    render plain: "Test not found"
  end

end
