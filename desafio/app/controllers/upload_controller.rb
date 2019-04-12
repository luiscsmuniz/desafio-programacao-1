class UploadController < ApplicationController
  def index
    @upload = Record.new
    @record = Record.all
    @sum
  end

  def create
    file = params[:record][:file]
    if file
      @insert = Array.new
      File.open(file.tempfile, "r") do |f|
        parsed_file(f)
      end
      if Record.create(@insert)
        redirect_to action: :index, result: @sum
      else
        redirect_to action: :index, result: 'Ocorreu algum erro!'
      end

    else
      edirect_to action: :index, result: 'Necessário enviar um arquivo!'
    end
    
  end

  def parsed_file(args)
    sum = 0
    args.map.with_index do |line, index|
      if index > 0
        value = line.split("\t")
        @insert.push(
          purchaser_name: value[0],
          item_description: value[1],
          item_price: value[2],
          purchase_count: value[3],
          merchant_address: value[4],
          merchant_name: value[5],
        )

        sum = sum + value[2].to_f
      end
    end

    @sum = sum
  end
end
