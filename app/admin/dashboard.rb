# frozen_string_literal: true
ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }


    # Here is an example of a simple dashboard with columns and panels.
    #
    # columns do
    #   column do
    #     panel "Recent Posts" do
    #       ul do
    #         Post.recent(5).map do |post|
    #           li link_to(post.title, admin_post_path(post))
    #         end
    #       end
    #     end
    #   end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
   # content
   content title: "OverView" do
    div div class: "blank_slate_container", id: "dashboard_default_message" do
      columns do
        column do
          panel "Total Layouts" do
            para Layout.count
          end
        end
        column do
          panel "Total Plots" do
            para Layout.sum(:total_plots)
          end
        end
        column do
          panel "Total Customers" do
            para Plot.select(:customer).distinct.count
          end
        end
      end
      columns do
        column do
          panel "Plots Sold" do
            para Layout.pluck(:sold).sum
          end
        end
        column do
          panel "Plots Remaining" do
            para Layout.pluck(:pending).sum
          end
        end
        column do
          panel "Total Amount Sold" do
            para Layout.pluck(:amt_sold).sum
          end
        end
      end
    end
  end
end
