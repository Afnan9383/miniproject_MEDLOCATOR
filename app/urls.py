"""
URL configuration for medlocator project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/5.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from . import views
urlpatterns = [
    path('', views.ln),
    path('home_search/<id>', views.home_search),
    path('home_search1', views.home_search1),
    path('loginpage', views.loginpage),
    path('pharmacy_signup', views.pharmacy_signup),
    path('pharmacy_home', views.pharmacy_home),
    path('profile', views.profile),
    path('add1', views.add1),
    path('admin_home', views.adminhome),
    path('accept_reject', views.accept_reject),
    path('pharmsign', views.pharmsign),
    path('logincode', views.logincode),
    path('manage_pharmacy', views.manage_pharmacy),
    path('manage_category', views.manage_category),
    path('add_category_post', views.add_category_post),
    path('add_category', views.add_category),
    path('update_profile', views.update_profile),
    path('edit_medicine_post', views.edit_medicine_post),
    path('view_medicine', views.view_medicine),
    path('edit_medicine/<id>', views.edit_medicine),
    path('add_medicine', views.add_medicine),
    path('add_medicine_post', views.add_medicine_post),
    path('stock_medicine', views.stock_medicine),
    path('manage_medicine', views.manage_medicine),
    path('edit_category_post', views.edit_category_post),
    path('edit_category/<id>', views.edit_category),
    path('accept_pharmacy/<id>', views.accept_pharmacy),
    path('reject_pharmacy/<id>', views.reject_pharmacy),
    path('delete_cat/<id>', views.delete_cat),
    path('Add_New_stock', views.Add_New_stock),
    path('view_medicine_details/<id>', views.view_medicine_details),
    path('delete_medicine/<id>', views.delete_medicine),
    path('edit_stock/<id>', views.edit_stock),
    path('view_medicine_post', views.view_medicine_post),
    path('update_medicine_post', views.update_medicine_post),
    path('forgot_password', views.forgot_password),
    path('forgot_password_post', views.forgot_password_post),
    path('admin_block_pharmacy/<id>', views.admin_block_pharmacy),
    path('med_details/<id>', views.med_details),


]
