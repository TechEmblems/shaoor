class DevicesController < ApplicationController
  before_action :set_device, only: [:show, :edit, :update, :destroy]
  skip_authorization_check only: [:search, :update_status]
  before_filter :authenticate_user!, except: [:search, :update_status]

  # GET /devices
  # GET /devices.json
  def index
    @devices = current_user.devices.personal_devices
  end

  def others
    @devices = current_user.devices.other_devices

    render :index
  end

  def pending
    @devices = current_user.pending_requests
  end

  # GET /devices/1
  # GET /devices/1.json
  def show
  end

  # GET /devices/new
  def new
    @device = Device.new
  end

  # GET /devices/1/edit
  def edit
  end

  # POST /devices
  # POST /devices.json
  def create
    validate_device(device_params)

    respond_to do |format|
      if @device.save
        format.html { redirect_to devices_path, notice: @notice }
        format.json { render :show, status: :created, location: @device }
      else
        format.html { render :new }
        format.json { render json: @device.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /devices/1
  # PATCH/PUT /devices/1.json
  def update
    respond_to do |format|
      if @device.update(device_params)
        format.html { redirect_to devices_path, notice: 'Device was successfully updated.' }
        format.json { render :show, status: :ok, location: @device }
      else
        format.html { render :edit }
        format.json { render json: @device.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_status
    @device = Device.find(params[:id])
    if @device.update_attributes(status: params[:device][:status])
      respond_to do |format|
        format.html
        format.js
      end
    end
  end

  # DELETE /devices/1
  # DELETE /devices/1.json
  def destroy
    @device.destroy
    respond_to do |format|
      format.html { redirect_to devices_url, notice: 'Device was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def search
    @device = Device.find_by_key(params[:search_key])
    @notice = @device.blank? ? "Not Registered yet" : "Status on RegDevice.com: #{@device.status}"
    respond_to do |format|
      format.html
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_device
      @device = Device.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def device_params
      params.require(:device).permit(:company, :model, :user_id, :type, :key, :status, :personal)
    end

  def validate_device(device_params)
    @device = Device.find_by_user_id_and_key(current_user.id, device_params[:key])
    @notice = 'Device already exist'
    unless @device
      if Device.find_by_key(device_params[:key])
        @device = current_user.pending_requests.build(device_params)
      else
        @device = current_user.devices.build(device_params)
      end
      @notice = 'Device was successfully created.'
    end
  end
end
