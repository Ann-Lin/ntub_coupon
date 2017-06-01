class CouponCodesController < ApplicationController
  before_action :set_coupon_code, only: [:show, :edit, :update, :destroy]

  def index
    @coupon_codes = CouponCode.all
  end

  def show
  end

  def new
    @coupon_code = CouponCode.new
  end

  def edit
  end

  def create
    @coupon_code = CouponCode.new(coupon_code_params)

    respond_to do |format|
      if @coupon_code.save
        format.html { redirect_to @coupon_code, notice: 'Coupon code was successfully created.' }
        format.json { render :show, status: :created, location: @coupon_code }
      else
        format.html { render :new }
        format.json { render json: @coupon_code.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @coupon_code.update(coupon_code_params)
        format.html { redirect_to @coupon_code, notice: 'Coupon code was successfully updated.' }
        format.json { render :show, status: :ok, location: @coupon_code }
      else
        format.html { render :edit }
        format.json { render json: @coupon_code.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @coupon_code.destroy
    respond_to do |format|
      format.html { redirect_to coupon_codes_url, notice: 'Coupon code was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_coupon_code
      @coupon_code = CouponCode.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def coupon_code_params
      params.require(:coupon_code).permit(:code, :discount, :begin_at, :end_at, :allow_multiple_usage)
    end
end
