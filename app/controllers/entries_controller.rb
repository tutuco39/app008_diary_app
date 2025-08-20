class EntriesController < ApplicationController
  before_action :authenticate_user!         # ログイン必須
  before_action :set_entry, only: %i[show edit update destroy]

  def index                                            #自分の記事のみ表示
    @q = params[:q].to_s.strip
    entries = current_user.entries.recent
    entries = entries.where("title LIKE ? OR body LIKE ?", "%#{@q}%", "%#{@q}%") if @q.present?
    @entries = entries
  end

  # def index
  #   @entries = Entry.order(date: :desc)                  # 全ユーザー分
  # end

  def show
  end

  def new
    @entry = current_user.entries.new(date: Date.current)
  end

  def edit
  end

  def create
    @entry = current_user.entries.new(entry_params)
    if @entry.save
      redirect_to @entry, notice: "日記を作成しました。"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @entry.update(entry_params)
      redirect_to @entry, notice: "更新しました。"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @entry.destroy!
    redirect_to entries_url, notice: "削除しました。"
  end

  private

  def set_entry
    @entry = current_user.entries.find(params[:id])  # 他人のIDは404
  end

  def entry_params
    params.require(:entry).permit(:date, :title, :body, :mood, :photo)
  end
end
