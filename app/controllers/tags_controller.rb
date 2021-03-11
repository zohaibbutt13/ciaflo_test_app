class TagsController < ApplicationController
  before_action :validate_resource

  def create
    @tag = Tag.create(tag_params)
    if @tag.valid?
      render json: { tag: @tag }
    else
      render json: { error: @tag.errors.full_messages }
    end
  end

  private

  def validate_resource
    if tag_params[:tag_id].present?
      @parent_tag = Tag.find_by(id: tag_params[:tag_id])
      render json: { message: 'Invalid Parent Tag ID' }, status: :unauthorized if @parent_tag.blank?
    end
  end

  def tag_params
    params.permit(:name, :tag_id)
  end
end
