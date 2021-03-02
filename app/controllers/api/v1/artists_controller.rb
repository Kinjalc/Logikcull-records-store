class Api::V1::ArtistsController < ApplicationController

  before_action :find_artist, only: [:show, :update, :destroy, :records_per_year]

  def index
    @artists = Artist.order(:name).page(params[:page])

    render json: json_format(@artists)
  end

  def show
    render json: json_format(@artist)
  end

  def create
    @artist = Artist.new(record_params)

    if @artist.save
      render json: json_format(@artist)
    else
      render json: { :errors => @artist.errors.full_messages}
    end
  end

  def update
    if @artist.update(record_params)
      render json: json_format(@artist), status: 200
    else
      render json: { :errors => @artist.errors.full_messages }
    end
  end

  def destroy
  end

  def records_per_year
     @artist_records = @artist.records.group_by{ |record| record.year }
     render json: @artist_records, status: 200
  end

  private

  def record_params
    params.permit(:name)
  end

  def find_artist
    @artist = Artist.find(params[:id])
  end

  def json_format(result)
    result.to_json(only: [:id, :name])
  end
end
