class Api::V1::LinksController < ApplicationController
  attr_accessor :link
#   before_action :set_link, only: %i[ show edit update destroy ]

  def index
    links = Link.all
    render json: { success: true, links: links }
  end

  def create
    link = Link.create!(link_params)
    unless link.present?
        render json: { success: false, notice: "Unable to generate link" }
    end
    render json: { success: true, notice: "Short URL generated" }
  end

  def pinned
        
  end

  def report
    uuid = SecureRandom.uuid
    bg_job = CsvGeneratorJob.perform_later(uuid)
    unless bg_job    
      return
    end
    render json: { success: true, job_id: bg_job.job_id }
  end

  def download
    filename = "data-#{Time.now.to_date.to_s}.csv"
    render json: { success: true, status: csv_string }
  end   

  private

  def link_params
    params.require(:link).permit(:original_url)
  end
end
