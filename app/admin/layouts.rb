ActiveAdmin.register Layout do

  menu priority: 2
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :address, :total_plots, :sold, :pending, :amt_sold
  filter :name
  
  
  form do |f|
    f.inputs do
      f.input :name
      f.input :address
      f.input :total_plots
    end
    f.actions
  end
  
  show do
    attributes_table do
      # row :id
      row :name
      row :address
      row :total_plots
      row :sold
      row :pending
      row :amt_sold
      row :created_at
      row :updated_at
      row "Plots" do |layout|
      #  layout.plots.map { |c| "#{c.plot_no} (#{c.customer})" }.join('<br>').html_safe
      #end

    #end
  
    panel "Plots" do
      table_for layout.plots do
       column :plot_no
       column :customer
       column :phone
       column :total_amt
       column :agreement
       column :advance
       column :next_duedate
       column :balance_amt
      end
     end
    end
  end
  end 
end
