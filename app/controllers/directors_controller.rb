class DirectorsController < ApplicationController
  def index
    @all_directors = Director.all
    render("directors/index.html.erb")
  end

  def show
    @one_director = Director.find(params[:id])
    render("directors/show_details.html.erb")
  end

  def new_form
    render("directors/new_form.html.erb")
  end

  def create_row
    @new_director = Director.new
    @new_director.dob = params[:dob]
    @new_director.name = params[:name]
    @new_director.bio = params[:bio]
    @new_director.image_url = params[:image_url]

    @new_director.save
    redirect_to("/")
  end

  def edit_form
    @director = Director.find(params[:id])
    render("/directors/edit_form.html.erb")
  end

  def update_row
    director = Director.find(params[:id])
    director.dob = params[:the_dob]
    director.name = params[:the_name]
    director.bio = params[:the_bio]
    director.image_url = params[:the_image_url]
    director.save

    redirect_to("/directors")
  end

  def destroy
    @director = Director.find(params[:id])
    @director.destroy
    render("directors/destroy.html.erb")
  end
end
