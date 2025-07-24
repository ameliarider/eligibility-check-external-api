class MembersController < ApplicationController
  before_action :authorize_request

  def index
    members = Member.all

    render json: members
  end

  def show
    if params[:external_member_id].present?
      @member = Member.find_by(external_member_id: params[:external_member_id])
      if @member
        render json: @member, status: :ok, message: "Active"
      elsif required_params.present?
        @member = Member.find_by(search_params)
        if @member
          render json: @member, status: :ok, message: "Active"
        else
          render json: { message: "Unable to find member" }, status: :not_found
        end
      else
        render json: { message: "Please provide all required fields" }
      end
    elsif required_params.present?
      @member = Member.find_by(search_params)
      if @member
        render json: @member, status: :ok, message: "Active"
      else
        render json: { message: "Unable to find member" }, status: :not_found
      end
    else
      render json: { message: "Please provide all required fields" }
    end
  end

  private
  def required_params
    required_params = params[:first_name] && params[:last_name] && params[:dob] && params[:zip]
  end

  def search_params
    search_params = { first_name: params[:first_name], last_name: params[:last_name], dob: params[:dob], zip: params[:zip] }
  end
end
