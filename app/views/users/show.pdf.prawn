pdf.text @user.label_name, :size => 20, :style => :bold, :align => :center
pdf.text @user.company.name, :size => 18, :align => :center unless @user.company.nil?
pdf.text @user.registration.name, :size => 18, :align => :center