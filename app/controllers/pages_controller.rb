class PagesController < ApplicationController
  def home

  end
  
  def companytable
    @companies = Company.where('name LIKE ?', "%#{params[:sSearch]}%").order("#{companytable_columns(params[:iSortCol_0])} #{params[:sSortDir_0] || "ASC"}").limit(params[:iDisplayLength]).offset(params[:iDisplayStart])
    @iTotalRecords = Company.count
    @iTotalDisplayRecords = Company.where('name LIKE ?', "%#{params[:sSearch]}%").count
    @sEcho = params[:sEcho].to_i
    render :layout => false
  end

  def companytable_columns(column_id)
    case column_id.to_i
      when 0
        return "name"
      end
  end
end
