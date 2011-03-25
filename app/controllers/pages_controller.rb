class PagesController < ApplicationController
  def home

  end
  
  def companytable
    @companies = Company.all( :order => "#{companytable_columns(params[:iSortCol_0])} #{params[:sSortDir_0] || "ASC"}", :limit => params[:iDisplayLength], :offset => params[:iDisplayStart], :conditions => [ 'name LIKE ?', "%#{params[:sSearch]}%" ])
    @iTotalRecords = Company.count
    @iTotalDisplayRecords = Company.count( :conditions => [ 'name LIKE ?', "%#{params[:sSearch]}%" ] )
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
