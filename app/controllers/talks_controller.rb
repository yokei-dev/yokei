class TalksController < ApplicationController
  def index
    @talk = Talk.new
    @talks = Talk.order(id: :asc).page(params[:page]).per(20)
  end

  def show
  end

  def new
  end
  
  def create
    @talk = Talk.new(question_params)
    
    if @talk.save
      flash[:success] = '質問を投稿しました。'
      redirect_to talks_path
    else
      @talks = Talk.order(id: :asc).page(params[:page])
      flash.now[:danger] = '質問の投稿に失敗しました。'
      render :index
    end
  end
  
  def edit
    @talk = Talk.find(params[:id])
  end
  
  def update
    @talk = Talk.find(params[:id])
    @talk.question = params[:talk][:question]
    if @talk.save
      flash[:success] = '質問を更新しました。'
      redirect_to talks_path
    else
      flash.now[:danger] = '質問の更新に失敗しました。'
      render :edit
    end
  end
  
  def destroy
    @talk = Talk.find(params[:id])
    @talk.destroy
    flash[:success] = '質問を削除しました。'
    redirect_to talks_path
  end
  
  def answer_new
    @talk = Talk.find(params[:id])
  end
  
  def answer_create
    @talk = Talk.find(params[:id])
    @talk.answer = params[:answer]
    if @talk.save
      flash[:success] = '回答を投稿しました。'
      redirect_to talks_path
    else
      flash.now[:danger] = '回答の投稿に失敗しました。'
      render talks/answer_new
    end
  end
  
  
    private

  def question_params
    params.require(:talk).permit(:question)
  end

  
  
end