class HomeController < ApplicationController

  skip_before_action :verify_authenticity_token

  def index
    @worksheet = get_worksheet
    @responses = StudentResponse.where(worksheet_id: @worksheet).order(:created_at)
    @total_correct = @responses.select { | resp | resp.result == "correct" }.count
    @pct_correct = ((@total_correct.to_f / @responses.count.to_f) * 100.0).round(2)
    @unit_names = UOMConversion.listUnits()

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @responses }
    end
  end

  def create
    sr = StudentResponse.new
    sr.input = params[:student_response][:resp_input] rescue "missing input"
    sr.from = params[:student_response][:resp_from] rescue "missing from"
    sr.to = params[:student_response][:resp_to] rescue "missing to"
    sr.answer = params[:student_response][:resp_answer] rescue "missing answer"
    sr.result = UOMConversion.check_answer(sr.input, sr.from, sr.to, sr.answer)
    sr.worksheet_id = get_worksheet
    sr.save
    respond_to do |format|
      format.html  { redirect_to :action => :index, :worksheet => sr.worksheet_id }
      format.json { render json: sr }
    end
  end

  def delete
    @worksheet = get_worksheet
    StudentResponse.where(:worksheet_id => @worksheet).delete_all
    respond_to do |format|
      format.html  { redirect_to :action => :index, :worksheet => @worksheet }
      format.json { render json: {"msg": "success"} }
    end
  end

  def list_compatible_units
    @units = UOMConversion.listCompatibleUnits(params["unit_name"])
    respond_to do |format|
      format.json { render json: @units }
    end
  end

private
  def get_worksheet
    params[:worksheet].blank? ? 1 : params[:worksheet].to_i
  end

end
