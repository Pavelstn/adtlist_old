class MainController < ApplicationController
#  load_and_authorize_resource :class => MainController, :except => [:index,:show]

 # before_filter :authenticate_user!, :except => [:index,:show]

 def index
  @posts = Post.ontop
end

def search
  category= params[:category]
  region= params[:region]
  if category.blank?
    begin
      @posts = Post.region_active_by_altname(region)
      #@posts = Post.ontop
    rescue
      redirect_to root_url
    end
  end

  if region.blank?
    begin
      @posts = Post.category_active(category)
      
    rescue
      redirect_to root_url
    end
  end

if !region.blank? && !category.blank?
  begin
    @posts = Post.region_category_active_by_altname(region, category)
  rescue
    redirect_to root_url
  end
end
  render "index"
end

def show
  begin
    @post = Post.where(:altname => params[:altname]).first
    @agentprofiles= Agentprofile.findbypost(@post.id)

    @posts = Post.region_active_by_id(@post.region_id).sample(10)
    #@posts = Post.all_active
    Stat.loadpage(@post.id)
    
    if !@post 
      redirect_to root_url
    end
  rescue
    redirect_to root_url
  end
end

def region
  begin
    @posts = Post.region_active_by_altname(params[:region])
    render "index"
  rescue
    redirect_to root_url
  end
end

def news
  begin
    @news_lists = NewsList.all_active
  rescue
    redirect_to root_url
  end
  render :layout => 'application'
end

def news_show
  begin
    @news_list = NewsList.find(params[:id])
    @news_lists = NewsList.all_active
  rescue
    redirect_to root_url
  end
  render :layout => 'application'
end



end
