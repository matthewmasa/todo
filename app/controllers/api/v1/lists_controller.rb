# frozen_string_literal: true
 module Api
  module V1

class ListsController < ApplicationController

  def index
   @lists =List.all
  end

  def search
    @lists= List.all
    respond_to? do |format|
      format.json
    end
  end

  def create
    @list= List.new(list_params)
    if @list.save
      render json: @list, status: :created
    else
      render json: @list.errors, stasus: :errors
    end
  end

  def show
    @list=List.find(params[:id])
  end

  def update
    @list= List.find(params[:id])
     if @list.save
      render json: @list, status: :accepted
     else
      render json: @list.errors, status: :bad_request
     end
  end

  def destroy
    @list= List.find(params[:id])
    if @list.destroy
      render json: :@list, status: :ok
    else
      render json: @list.errors, status: :bad_request
    end
  end

 private
  def list_params
     params.permit(:name, :content)
  end

    end
   end
 end