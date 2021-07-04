class Api::V1::LinksController < ApplicationController
  require 'csv'
  attr_accessor :link
#   before_action :set_link, only: %i[ show edit update destroy ]

  def index
    links = all_links
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
    link = Link.find(params[:id]);
    unless link
      render json: { success: false, notice: "link not found" }
    end
    update_param = link.pinned_at ? nil : Time.now
    link.update!(pinned_at: update_param)
    render json: { success: true, notice: "updated" }
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
    links = all_links
    csv_string = CSV.generate(headers: true) do |csv|
        csv << ["Original URL", "Short URL", "Visitors"]
        links.each do |link|
            csv << [link.original_url, link.short_url, link.counter]
        end
    end
    filename = "data-#{Time.now.to_date.to_s}.csv"
    send_data csv_string, type: 'text/csv; charset=utf-8; header=present', filename: filename
  end

  private

  def link_params
    params.require(:link).permit(:original_url)
  end

  def all_links
    Link.all.order('pinned_at')
  end
end
