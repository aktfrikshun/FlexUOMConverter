class HomeController < ApplicationController

  skip_before_action :verify_authenticity_token

  def index
    @responses = StudentResponse.all.order(:created_at)
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
    sr.input = params[:student_response][:resp_input]
    sr.from = params[:student_response][:resp_from]
    sr.to = params[:student_response][:resp_to]
    sr.answer = params[:student_response][:resp_answer]
    sr.result = UOMConversion.check_answer(sr.input, sr.from, sr.to, sr.answer)
    sr.save
    respond_to do |format|
      format.html  { redirect_to :action => :index }
      format.json { render json: sr }
    end

  end

  def delete
    StudentResponse.delete_all
    respond_to do |format|
      format.html  { redirect_to :action => :index }
      format.json { render json: {"msg": "success"} }
    end
  end

  def list_compatible_units
    @units = UOMConversion.listCompatibleUnits(params["unit_name"])
    respond_to do |format|
      format.json { render json: @units }
    end
  end

end
