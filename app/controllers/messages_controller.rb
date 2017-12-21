class MessagesController < ApplicationController
    before_action :redirect_if_not_logged_in
    before_action :admin_user,     only: :destroy
    require 'will_paginate/array'

    def index
        init_params = params[:q]
        if init_params.nil?
            init_params = {}
            init_params[:sender_id_eq_or_receiver_id_eq] = current_user.id
        else
            init_params[:sender_id_eq_or_receiver_id_eq] = current_user.id
        end
        @q = Message.ransack(init_params)
        @messages = @q.result(distinct: true)
        @messages = @messages.where(sender_id: current_user.id) | @messages.where(receiver_id: current_user.id)
    end
    
    def new
        @receiver = User.find(params[:receiver_id])
        @sender = current_user
        @message = Message.new
    end

    def create
        @message = Message.new(message_params)
        receiver = User.find(message_params[:receiver_id])
        if @message.save
            flash[:success] = "Message sent to " + receiver.name
            redirect_to receiver
        else
            flash[:error] = "Message not sent!"
        end
    end

    def edit
        @message = Message.find(params[:id])
    end

    def update
        @message = Message.find(params[:id])
        if @message.update_attributes(message_params)
            flash[:success] = "Message Updated"
            redirect_to @message
        else
            render 'edit'
        end
    end

    def destroy
        Message.find(params[:id]).destroy
        flash[:success] = "Message deleted"
        redirect_to users_url
    end

    private
    def message_params
        params.require(:message).permit(:content, :sender_id, :receiver_id, :id)
    end
end
