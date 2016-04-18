require 'mailgun'
class HomeController < ApplicationController
  def index
  
  end
  
  def sending
    @green = params[:given]
    @heat = params[:head]
    @bird = params[:body]
    
    new_post = Post.new
    new_post.title = @heat
    new_post.content = @bird
    new_post.save
    
    mg_client = Mailgun::Client.new("key-155e4eeb507734091129b3afac670bc3")
    
    message_params =  {
                       from: 'josang1204@gmail.com',
                       to: @green,
                       subject: @heat,
                       text: @bird
                      }
    
    result = mg_client.send_message('sandbox17622311ca6048dfbf7a84d22ec48697.mailgun.org', message_params).to_h!
    
    message_id = result['id']
    message = result['message']
  
  end
  
  def listing
    @green = params[:given]
    @heat = params[:head]
    @bird = params[:body]
    
    new_post = Post.new
    new_post.title = @heat
    new_post.content = @bird
    new_post.save
    
    redirect_to '/list'    
  end  
    
  def list
    @every_post = Post.all.order("id asc")
    
  end
  
  def destroy
    @one_post = Post.find(params[:id])
    @one_post.destroy
    redirect_to '/list'
      
  end
  
  def update_view
    @one_post = Post.find(params[:id])
      
      
  end
  
  def update_act
    @one_post = Post.find(params[:id])
    @one_post.title = params[:head]
    @one_post.content = params[:body]
    @one_post.save
    
    redirect_to '/list'
  end
  
end