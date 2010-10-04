pdf.font_size = Label.first.font_size

pdf.text @user.label_name, :style => :bold, :align => :center
pdf.text @user.company.name, :align => :center unless @user.company.nil?
pdf.text @user.registration.name, :align => :center