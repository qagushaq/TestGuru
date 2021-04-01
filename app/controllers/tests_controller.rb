class TestsController < ApplicationController
  #skip_before_action :find_test, only: :show
  before_action :find_test, only: %i[show]
  #after_action :send_log_message
  around_action :log_execute_time

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index
    result = ["Class: #{params.class}", "Parameters: #{params.inspect}"]
    render plain: result.join("\n")
  end

  def start
    render plain: 'Start certain test'
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


=begin

render plain: 'All tests'
render html: '<h1>All tests</h1>'.html_safe
render json: { tests: User.all }
render inline: '<p> My favourite language is <%= %[ybuR].reverse! %>!</p>'
render file: 'public/hello', layout: false
head 204
head :no_content
byebug
render inline: '<% console %>'
logger.info(self.object_id)
respond_to do |format|
  format.html { render plain: 'All users' }
  format.json { render json: { users: User.all } }
end
def show
  redirect_to root_path
end

=end
