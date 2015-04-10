class ReasonsController < ApplicationController
  def create
    @reason = Reason.new(reason_params)
    if @reason.save
      return render json: { success: true, reason_id: @reason.id }
    else
      return render json: { success: false }
    end
  end

  private
  def reason_params
    params.require(:reason).permit(:name, :reason_type, :voting_id, :position)
  end
end
