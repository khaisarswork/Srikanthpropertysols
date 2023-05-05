ActiveAdmin.register Plot do

  menu priority: 3
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :plot_no, :customer, :phone, :plt_amt, :advance, :agreement, :total_amt, :next_duedate, :first_installment, :second_installment, :third_installment, :balance_amt, :layout_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:plot_no, :customer, :phone, :plt_amt, :advance, :agreement, :total_amt, :next_duedate, :first_installment, :second_installment, :third_installment, :balance_amt, :layout_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  filter :customer
  filter :phone


  form do |f|
    f.inputs do
      f.input :layout
      f.input :plot_no
      f.input :customer
      f.input :phone
      f.input :plt_amt
      f.input :advance
      f.input :agreement
      f.input :first_installment
      f.input :second_installment
      f.input :third_installment
    end
    f.actions
  end
end
