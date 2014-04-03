class RecipesController < ApplicationController
  def index
    if params[:search]
      @recipes = Recipe.search(params[:search])
    else
    @recipes = Recipe.all.order(rating: :desc)
    render('recipes/index.html.erb')
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
    render('recipes/show.html.erb')
  end

  def new
    @recipe = Recipe.new
    render('recipes/new.html.erb')
  end

  def create
    @tag = Tag.find(params[:tag_id])
    #@recipe = Recipe.new(:name => params[:name],
                   #      :description => params[:description])
    @recipes = @tag.recipes.create(:name => params[:name],
                                   :description => params[:description])

    if @recipes.save
      redirect_to("/recipes/#{@recipe_id}")
    else
      render('recipes/new.html.erb')
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
    render('recipes/edit.html.erb')
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(:name => params[:name],
                      :description => params[:description],
                      :rating => params[:rating])
      redirect_to("/recipes/#{@recipe.id}")
    else
      render('recipes/edit.html.erb')
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    render('recipes/destroy.html.erb')
  end
end
