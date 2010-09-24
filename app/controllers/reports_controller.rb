class ReportsController < ApplicationController
  before_filter :title, :except => [:destroy]
  
  def index
    @users = User.all
    @registrations = Registration.all
    @interests = Interest.all
    @promos = Promo.all
  end
  
  def title
    @title = "Reportes"
  end
  
  def datatable
      @users = User.all( :order => "#{datatable_columns(params[:iSortCol_0])} #{params[:sSortDir_0] || "ASC"}",
                         :limit => params[:iDisplayLength],
                         :offset => params[:iDisplayStart],
                         :conditions => [ 'fname LIKE ? OR lname LIKE ?', "%#{params[:sSearch]}%", "%#{params[:sSearch]}%"])
      @iTotalRecords = User.count
      @iTotalDisplayRecords = User.count( :conditions => [ 'fname LIKE ? OR lname LIKE ?', "%#{params[:sSearch]}%", "%#{params[:sSearch]}%"] )
      @sEcho = params[:sEcho].to_i
      render :layout => false
   end
   
   def datatable_columns(column_id)
     case column_id.to_i
     when 0
       return "lname"
     when 1
       return "id"
     end
   end
   
   def companytable
       @companies = Company.all( :order => "#{companytable_columns(params[:iSortCol_0])} #{params[:sSortDir_0] || "ASC"}",
                          :limit => params[:iDisplayLength],
                          :offset => params[:iDisplayStart],
                          :conditions => [ 'name LIKE ?', "%#{params[:sSearch]}%" ])
       @iTotalRecords = Company.count
       @iTotalDisplayRecords = Company.count( :conditions => [ 'name LIKE ?', "%#{params[:sSearch]}%" ] )
       @sEcho = params[:sEcho].to_i
       render :layout => false
    end

    def companytable_columns(column_id)
      case column_id.to_i
      when 0
        return "name"
      when 1
        return "id"
      end
    end
 
end
