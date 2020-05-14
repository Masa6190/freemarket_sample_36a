class AddressesController < ApplicationController  
  
  def new
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
    if @address.save
      redirect_to root_path, notice: '本人情報を作成しました'
    else
      render :new
    end  
  end

  private
  def address_params
    params.require(:address).permit(:familyname, :firstname, :familyname_kana, :firstname_kana, :birth_year, :birth_month, :birth_day, :familyname_deliver, :firstname_deliver, :familyname_deliver_kana, :firstname_deliver_kana, :postal_code, :prefecture, :city, :block, :building, :phone_number).merge(user_id: current_user.id)
  end  

end

