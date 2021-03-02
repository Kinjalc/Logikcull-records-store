class Api::V1::RecordsController < ApplicationController
  before_action :find_record, only: [:show, :update, :destroy]

  def index
    @records = Record.order(:title).page(params[:page])

    render json: json_format(@records)
  end

  def show
    render json: json_format(@record)
  end

  def create
    @record = Record.new(record_params)

    if @record.save
      render json: json_format(@record)
    else
      render json: { :errors => @record.errors.full_messages}
    end
  end

  def update
    if @record.update(record_params)
      render json: json_format(@record), status: 200
    else
      render json: { :errors => @record.errors.full_messages }
    end
  end

  def destroy
    if @record.destroy
      render json: {message: 'Fact successfully deleted.'}, status: 200
    else
      render json: { :errors => @record.errors.full_messages }
    end
  end

  def most_common_word
    @common_word = ApiServices::CommonWordFinder.call
    render json: @common_word
  end

  def search
    @q =  Record.ransack(title_cont: params[:q], artists_name_cont: params[:q], m: 'or').result

    render json: json_format(@q)
  end

  private

  def record_params
    params.permit(:title, :year, :condition, artist_ids: [])
  end

  def find_record
    @record = Record.find(params[:id])
  end

  def json_format(result)
    result.to_json(only: [:title, :year, :condition, :id],
      include: [artists: {only: [:id, :name]}])
  end
end
