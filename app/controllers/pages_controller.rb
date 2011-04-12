class PagesController < ApplicationController
  before_filter :authenticate_user!, :except => [:home]
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
  
  def peopletable
        @people = Person.where('lname LIKE ?', "%#{params[:sSearch]}%").order("#{people_columns(params[:iSortCol_0])} #{params[:sSortDir_0] || "ASC"}").limit(params[:iDisplayLength]).offset(params[:iDisplayStart])
        @iTotalRecords = Person.count
        @iTotalDisplayRecords = Person.where('lname LIKE ?', "%#{params[:sSearch]}%").count
        @sEcho = params[:sEcho].to_i
        render :layout => false
     end

     def people_columns(column_id)
       case column_id.to_i
       when 0
         return "lname"
       when 1
         return "id"
       end
     end
end
