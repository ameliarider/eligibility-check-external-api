class MembersController < ApplicationController
  before_action :authorize_request

  def index
    members = Member.all

    render json: members
  end

  def show
    @member = Member.find_by(external_member_id: params[:external_member_id])

    if @member
      render json: @member, status: :ok, message: "Active"
    else
      @member = Member.find_by_sql("SELECT * FROM members WHERE first_name = '#{params[:first_name]}'AND last_name = '#{params[:last_name]}'")
      render json: { message: "Found via alternative method" }
    end
  end
end
