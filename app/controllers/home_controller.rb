class HomeController < ApplicationController
  def index

     @names = Name.all.order("id desc")
     @recommendedName = @names.sample

     #empty string이 나와서 ㅠㅠ
     while @recommendedName.name.empty? do
       @recommendedName = @names.sample
     end
  end


  def write

  end

  def write_process
    #중복단어무시.
      if params[:name].empty?
        redirect_to "/error"

      else
        new_row = Name.new
        new_row.name = params[:name]
        new_row.like_count = 0
        new_row.dislike_count = 0
        new_row.save
        redirect_to "/list"
      end
  end

  def list
    @names = Name.all.order("id desc")

  end

  def error


  end

  def update_like
    @target_name = Name.find(params[:name_id])
    @target_name.like_count +=1
    @target_name.save
    redirect_to :back
  end
  def delete
    # @target_name = Name.find(params[:name_id])
    # @target_name.destroy

    redirect_to :back
  end

end
