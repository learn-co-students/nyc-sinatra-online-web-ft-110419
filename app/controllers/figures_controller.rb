class FiguresController < ApplicationController
  
  get '/figures' do
    @figures = Figure.all
    erb :'figures/index'
  end

  get '/figures/new' do 
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'figures/new'
  end

  post '/figures' do 
    figure = Figure.find_or_create_by(:name => params[:figure][:name])
    
    title_ids = params[:figure][:title_ids]
    title_ids.each do |id|
       figure.titles << Title.find_or_create_by(:id => id)
    end

    if params[:title][:name] != ""
      figure.titles << Title.find_or_create_by(:name => params[:title][:name])
    end

    landmark_ids = params[:figure][:landmark_ids]
    landmark_ids.each do |id|
       figure.landmarks << Landmark.find_or_create_by(:id => id)
      # Landmark.find_or_create_by(:id => id)
    end

    if params[:landmark][:name] != "" && params[:landmark][:year] != ""
      figure.landmarks << Landmark.find_or_create_by(:name => params[:landmark][:name], :year_completed => params[:landmark][:year])
    end

    figure.save
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find_by_id(params[:id])
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'figures/edit'
  end

  # patch '/figures/:id' do
  #   binding.pry
  #   @figure = Figure.find_by_id(params[:id])
  #   @figure.name = params[:figure][:name]

  #   title_ids = params[:figure][:title_ids]
  #   title_ids.each do |id|
  #      @figure.titles << Title.find_or_create_by(:id => id)
  #   end

  #   if params[:title][:name] != ""
  #     @figure.titles << Title.find_or_create_by(:name => params[:title][:name])
  #   end

  #   landmark_ids = params[:figure][:landmark_ids]
  #   landmark_ids.each do |id|
  #      @figure.landmarks << Landmark.find_or_create_by(:id => id)
  #     # Landmark.find_or_create_by(:id => id)
  #   end

  #   if params[:landmark][:name] != "" && params[:landmark][:year] != ""
  #     @figure.landmarks << Landmark.find_or_create_by(:name => params[:landmark][:name], :year_completed => params[:landmark][:year])
  #   end

  #   @figure.save

  # end

end