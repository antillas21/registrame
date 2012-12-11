class PagesController < ApplicationController
  #before_filter :authenticate_user!, :except => [:home]
  def home

  end

  def dashboard
    @registrations = Registration.all
  end

  def companytable
    @companies = Company.where('name LIKE ?', "%#{params[:sSearch]}%"
    ).order(
      "#{companytable_columns(params[:iSortCol_0])} #{params[:sSortDir_0] || "ASC"}"
    ).limit(
      params[:iDisplayLength]
    ).offset(
      params[:iDisplayStart].to_i
    )
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
    @people = Person.where(
      'lname LIKE ?', "%#{params[:sSearch]}%"
    ).order(
      "#{people_columns(params[:iSortCol_0])} #{params[:sSortDir_0] || "ASC"}"
    ).limit(
      params[:iDisplayLength]
    ).offset(
      params[:iDisplayStart].to_i
    )
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

  def reporting
    @people = Person.where('lname LIKE ?', "%#{params[:sSearch]}%").includes(
      {:company => [:state, :country, :sector]}, :registration, :interests, :promotions
      ).order(
          "#{reporting_columns(params[:iSortCol_0])} #{params[:sSortDir_0] || "ASC"}"
      ).limit(
        params[:iDisplayLength]
      ).offset(params[:iDisplayStart])
    @iTotalRecords = Person.count
    @iTotalDisplayRecords = Person.where('lname LIKE ?', "%#{params[:sSearch]}%").count
    @sEcho = params[:sEcho].to_i
    render :layout => false
  end

  def reporting_columns(column_id)
    case column_id.to_i
    when 0
      return "registrations.name"
    when 1
      return "lname"
    when 2
      return "email"
    when 3
      return "phone"
    when 4
      return "job"
    when 5
      return "companies.name"
    when 6
      return "companies.address1"
    when 7
      return "companies.city"
    when 8
      return "states.name"
    when 9
      return "countries.name"
    when 10
      return "sectors.name"
    end
  end
end
