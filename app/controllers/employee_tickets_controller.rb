class EmployeeTicketsController < ApplicationController
  def new
    EmployeeTicket.create(employee_tickets_params)
    redirect_to "/employees/#{params[:employee_id]}"
  end

  private
  def employee_tickets_params
    params.permit(:ticket_id, :employee_id)
  end
end