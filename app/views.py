import smtplib
from email.mime.text import MIMEText

import datetime
from django.core.files.storage import FileSystemStorage
from django.http import HttpResponse
from django.shortcuts import render, redirect


# Create your views here.
from app.models import *


def ln(request):
    request.session['sk']=""
    ob=Medicine.objects.all()
    for i in ob:
        a=Stock.objects.filter(MEDICINE_NAME__id=i.id)
        if len(a)>0:
            i.p=a[0].Price
        else:
            i.pa="Na"
    ob1=Category.objects.all()
    return render(request,"home_page.html",{"med":ob,"cat":ob1})
def home_search(request,id):
    ob=Medicine.objects.filter(CATEGORY__id=id,Medicine_name__istartswith=request.session['sk'])
    for i in ob:
        a=Stock.objects.filter(MEDICINE_NAME__id=i.id)
        if len(a)>0:
            i.p=a[0].Price
        else:
            i.pa="Na"
    ob1=Category.objects.all()

    return render(request,"home_page.html",{"med":ob,"cat":ob1})

# def home_search1(request):
#     request.session['sk']=request.POST['sk']
#     ob=Medicine.objects.filter(Medicine_name__istartswith=request.session['sk'])
#
#     ob1=Category.objects.all()
#
#     return render(request,"home_page.html",{"med":ob,"cat":ob1})



def home_search1(request):
    # Store the search keyword in the session
    request.session['sk'] = request.POST.get('sk', '')

    # Filter the medicines based on the search keyword
    ob = Medicine.objects.filter(Medicine_name__istartswith=request.session['sk'])
    for i in ob:
        a=Stock.objects.filter(MEDICINE_NAME__id=i.id)
        if len(a)>0:
            i.p=a[0].Price
        else:
            i.pa="Na"
    ob1 = Category.objects.all()

    # Pass a flag to the template if no matches are found
    no_matches = not ob.exists()

    return render(request, "home_page.html", {"med": ob, "cat": ob1, "no_matches": no_matches})

def loginpage(request):
    return render(request,"index.html")

def adminhome(request):
    ob=Pharmacy.objects.filter(LOGIN__Type='pharmacy')
    return render(request,"admin/adminindex.html",{"val":ob})

#
# def admin_block_pharmacy(request,id):
#     a=Pharmacy.objects.get(id=id)
#     a.update(LOGIN__Type='BLOCKED')
#     return redirect('/adminhome')



def admin_block_pharmacy(request, id):
    login = Login.objects.filter(id=id).update(Type='Blocked')
    pharmacy = Pharmacy.objects.filter(LOGIN_id=id).update(status='blocked')


    return redirect('/admin_home')




def accept_reject(request):
    return render(request,"admin/admin accept or reject.html")



def pharmacy_signup(request):
    return render(request,"p_reg.html")


def pharmsign(request):
    Name=request.POST['Name']
    Place=request.POST['Place']
    Post = request.POST['Post']
    Pincode= request.POST['Pincode']
    Phone_no = request.POST['Phone_no']
    Email= request.POST['Email']
    username=request.POST['username']
    password=request.POST['password']


    aa=Pharmacy.objects.filter(Email=Email)
    if aa.exists():
        return HttpResponse(''' 
                        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@10">
                        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
                        <script>
                            document.addEventListener("DOMContentLoaded", function() {
                                Swal.fire({
                                    icon: 'error',
                                    title: 'Already Taken',
                                    text: 'pharmacy already exist',
                                    confirmButtonText: 'OK',
                                    reverseButtons: true
                                }).then((result) => {
                                    if (result.isConfirmed) {
                                        window.location='/pharmacy_signup';  
                                    }
                                });
                            });
                        </script>
                    ''')


    ob=Login.objects.filter(Username=username,Password=password)
    if ob.exists():
        return HttpResponse(''' 
                        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@10">
                        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
                        <script>
                            document.addEventListener("DOMContentLoaded", function() {
                                Swal.fire({
                                    icon: 'error',
                                    title: 'Already Taken',
                                    text: '',
                                    confirmButtonText: 'OK',
                                    reverseButtons: true
                                }).then((result) => {
                                    if (result.isConfirmed) {
                                        window.location='/pharmacy_signup';  
                                    }
                                });
                            });
                        </script>
                    ''')


    # if len(ob)>0:
    #     return HttpResponse('''<script>alert("Username already existing.....")</script>''')
    # else:


    pharmacy_login_details = Login()
    pharmacy_login_details.Username = username
    pharmacy_login_details.Password = password
    pharmacy_login_details.Type = 'pending'
    pharmacy_login_details.save()



    image = request.FILES['image']
    fs = FileSystemStorage()
    path = fs.save(image.name, image)

    pharmacy_profile = Pharmacy()
    pharmacy_profile.LOGIN = pharmacy_login_details
    pharmacy_profile.Name = Name
    pharmacy_profile.Place = Place
    pharmacy_profile.Post = Post
    pharmacy_profile.Pincode = Pincode
    pharmacy_profile.Phone_no = Phone_no
    pharmacy_profile.Email = Email
    pharmacy_profile.status = 'pending'
    pharmacy_profile.Image = path
    pharmacy_profile.save()
    request.session['pid']=pharmacy_profile.id
    return render(request,"map_start.html")
def add1(request):
    ob=Pharmacy.objects.get(id=request.session['pid'])
    ob.Latitude=request.POST['lat']
    ob.Longitude=request.POST['lon']
    ob.save()
    return HttpResponse(''' 
                    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@10">
                    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
                    <script>
                        document.addEventListener("DOMContentLoaded", function() {
                            Swal.fire({
                                icon: 'success',
                                title: 'Login Success',
                                text: 'Success',
                                confirmButtonText: 'OK',
                                reverseButtons: true
                            }).then((result) => {
                                if (result.isConfirmed) {
                                    window.location='/';  
                                }
                            });
                        });
                    </script>
                ''')


def pharmacy_home(request):

    return render(request, "pharmacy/phome.html")





def profile(request):
    ob=Pharmacy.objects.get(LOGIN__id=request.session['lid'])
    return render(request, "pharmacy/p_reg.html",{"val":ob})


# def update_profile(request):
#     Name=request.POST['Name']
#     Place=request.POST['Place']
#     Post = request.POST['Post']
#     Pincode= request.POST['Pincode']
#     Phone_no = request.POST['Phone_no']
#     Email= request.POST['Email']
#
#
#
#     a=Pharmacy.objects.filter(Email=Email)
#     if a.exists():
#         return redirect('/profile')
#
#
#     pharmacy_profile = Pharmacy.objects.get(LOGIN__id=request.session['lid'])
#
#     pharmacy_profile.Name = Name
#     pharmacy_profile.Place = Place
#     pharmacy_profile.Post = Post
#     pharmacy_profile.Pincode = Pincode
#     pharmacy_profile.Phone_no = Phone_no
#     pharmacy_profile.Email = Email
#     if 'Image' in request.FILES:
#         image = request.FILES['Image']
#         fs = FileSystemStorage()
#         path = fs.save(image.name, image)
#
#         pharmacy_profile.Image = path
#     pharmacy_profile.save()
#     return redirect("/profile")

from django.core.files.storage import FileSystemStorage
from django.shortcuts import redirect, get_object_or_404
from .models import Pharmacy

def update_profile(request):
    # Retrieve form data
    Name = request.POST.get('Name')
    Place = request.POST.get('Place')
    Post = request.POST.get('Post')
    Pincode = request.POST.get('Pincode')
    Phone_no = request.POST.get('Phone_no')
    Email = request.POST.get('Email')

    # Get the current pharmacy profile based on session
    try:
        pharmacy_profile = Pharmacy.objects.get(LOGIN__id=request.session['lid'])
    except Pharmacy.DoesNotExist:
        # Redirect or render error if profile not found
        return redirect('/profile')

    # Check if a different profile already uses this email
    if Pharmacy.objects.filter(Email=Email).exclude(id=pharmacy_profile.id).exists():
        # Redirect or show message if email already exists
        return redirect('/profile')

    # Update profile fields
    pharmacy_profile.Name = Name
    pharmacy_profile.Place = Place
    pharmacy_profile.Post = Post
    pharmacy_profile.Pincode = Pincode
    pharmacy_profile.Phone_no = Phone_no
    pharmacy_profile.Email = Email

    # Check and save the uploaded image
    if 'Image' in request.FILES:
        image = request.FILES['Image']
        fs = FileSystemStorage()
        path = fs.save(image.name, image)
        pharmacy_profile.Image = path

    # Save the updated profile
    pharmacy_profile.save()
    return redirect("/profile")



def logincode(request):
    username=request.POST['textfield']
    password=request.POST['textfield2']
    try:
        ob=Login.objects.get(Username=username,Password=password)
        request.session['lid']=ob.id
        if ob.Type=="admin":
            return redirect('/admin_home')
        elif ob.Type=="pharmacy":
            return redirect('/pharmacy_home')
        else:
            return HttpResponse('''<script>alert("invalid");window.location="/"</script>''')
    except:

        return HttpResponse('''<script>alert("invalid");window.location="/"</script>''')

def forgot_password(request):

    return render(request, "fogetpassword.html")



def forgot_password_post(request):
    un=request.POST['textfield']
    try:
        ob=Login.objects.get(Username=un)


        try:
            gmail = smtplib.SMTP('smtp.gmail.com', 587)
            gmail.ehlo()
            gmail.starttls()
            gmail.login('riitnaveen@gmail.com', 'zlidlqfaxkln tjln')
            print("login=======")
        except Exception as e:
            print("Couldn't setup email!!" + str(e))
        msg = MIMEText("Your new password is : " + str(ob.Password))
        print(msg)
        msg['Subject'] = 'MedLocator'
        msg['To'] = un
        msg['From'] = 'riitnaveen@gmail.com'

        print("ok====")

        try:
            gmail.send_message(msg)
            return HttpResponse('''<script>alert("check your mail");window.location="/"</script>''')


        except Exception as e:
            return HttpResponse('''<script>alert("Network error");window.location="/forgot_password"</script>''')



    except:

        return HttpResponse('''<script>alert("Invalid Username");window.location="/forgot_password"</script>''')


def manage_category(request):
    # Get all categories to display
    ob = Category.objects.all()

    if request.method == "POST":
        category_name = request.POST.get('category_name').strip()

        # Check if the category already exists (case insensitive)
        if Category.objects.filter(name__iexact=category_name).exists():
            messages.error(request, "This category already exists!")
        else:
            # Create and save the new category if it doesn't exist
            new_category = Category(name=category_name)
            new_category.save()
            messages.success(request, "Category added successfully!")

    return render(request, "admin/manage_category.html", {"val": ob})
def add_category(request):
    return render(request,"admin/add_category.html")

def add_category_post(request):
    c = request.POST['cat']
    b = request.POST['det']

    aa=Category.objects.filter(Category=c)
    if aa.exists():
        return HttpResponse(''' 
                        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@10">
                        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
                        <script>
                            document.addEventListener("DOMContentLoaded", function() {
                                Swal.fire({
                                    icon: 'error',
                                    title: 'Already Taken',
                                    text: '',
                                    confirmButtonText: 'OK',
                                    reverseButtons: true
                                }).then((result) => {
                                    if (result.isConfirmed) {
                                        window.location='/add_category';  
                                    }
                                });
                            });
                        </script>
                    ''')




    ob = Category()
    ob.Category = c
    ob.Description = b
    ob.save()
    return redirect('/manage_category')


def delete_cat(request,id):
    var=Category.objects.get(id=id)
    var.delete()
    return redirect('/manage_category')




def edit_category(request,id):
    ob = Category.objects.get(id=id)
    return render(request,"admin/edit_category.html", {"data": ob})


def edit_category_post(request):
    id=request.POST['id']
    c=request.POST['cat']
    b=request.POST['det']
    ob = Category.objects.get(id=id)
    ob.Category=c
    ob.Description=b
    ob.save()
    return redirect('/manage_category')



def manage_pharmacy(request):
    ob = Pharmacy.objects.filter(LOGIN__Type='pending')
    return render(request,"admin/manage_pharmacy.html", {"val": ob})





def accept_pharmacy(request,id):
    ob = Login.objects.get(id=id)
    ob.Type='pharmacy'
    ob.save()
    return HttpResponse('''<script>alert("Accepted");window.location="/manage_pharmacy"</script>''')





def reject_pharmacy(request,id):
    ob = Login.objects.get(id=id)
    ob.Type = 'pharmacy'
    ob.delete()
    return HttpResponse('''<script>alert("Rejected");window.location="/manage_pharmacy"</script>''')





def view_medicine(request):
    ob = Medicine.objects.filter(PHARMACY__LOGIN__id=request.session['lid'])
    return render(request,"pharmacy/p_add.html", {"data": ob})


def edit_medicine(request,id):
    c=Category.objects.all()
    a=Medicine.objects.get(id=id)
    return render(request,'pharmacy/edit medicine.html',{'data1':a,'data':c})

def add_medicine_post(request):
    cat=request.POST['category']
    name=request.POST['textfield2']
    image=request.FILES['image']

    fs=FileSystemStorage()
    date= datetime.datetime.now().strftime("%Y-%m-%d-%H-%M-%S")+'.jpg'
    fs.save(date,image)
    path=fs.url(date)
    ob=Medicine()
    ob.PHARMACY=Pharmacy.objects.get(LOGIN__id=request.session['lid'])
    ob.Medicine_name=name
    ob.image=path
    ob.CATEGORY=Category.objects.get(id=cat)
    ob.save()
    return redirect("/view_medicine")



def add_medicine(request):
    ob = Category.objects.all()
    return render(request,"pharmacy/p_view.html", {"data": ob})


def stock_medicine(request):
    ob = Category.objects.get(id=id)
    return render(request,"pharmacy/p_stock.html", {"data": ob})


def manage_medicine(request):
    ob = Category.objects.get(id=id)
    return render(request,"pharmacy/p_stock_mng.html", {"data": ob})

def edit_medicine_post(request):
    id=request.POST['id']
    cat=request.POST['category']
    name=request.POST['textfield2']

    ob=Medicine.objects.get(id=id)
    if 'image' in request.FILES:
        image = request.FILES['image']

        fs = FileSystemStorage()
        date = datetime.datetime.now().strftime("%Y-%m-%d-%H-%M-%S") + '.jpg'
        fs.save(date, image)
        path = fs.url(date)
        ob.image = path

    ob.PHARMACY=Pharmacy.objects.get(LOGIN__id=request.session['lid'])
    ob.Medicine_name=name
    ob.CATEGORY=Category.objects.get(id=cat)
    ob.save()
    return redirect("/view_medicine")

def view_medicine_details(request,id):
    ob=Stock.objects.filter(MEDICINE_NAME__id=id)
    request.session['mid']=id
    return render(request,"pharmacy/p_stock.html",{"val":ob})


def view_medicine_post(request):
    batch = request.POST['batch_no']
    Dosage = request.POST['dosage']
    Qty = request.POST['quantity']
    Price = request.POST['price']
    expire = request.POST['expiry']
    description = request.POST['description']
    ob = Stock()
    ob.MEDICINE_NAME=Medicine.objects.get(id=request.session['mid'])
    ob.Batch_no=batch
    ob.Dosage=Dosage
    ob.Quantity=Qty
    ob.expire=expire
    ob.description=description
    ob.Price =Price
    ob.save()
    return redirect("/view_medicine_details/"+str(request.session['mid']))
def delete_medicine(request,id):

    ob = Stock.objects.get(id=id)

    ob.delete()
    return redirect("/view_medicine_details/"+str(request.session['mid']))

def edit_stock(request,id):
    request.session['sid']=id
    ob=Stock.objects.get(id=id)
    return render(request,"pharmacy/p_stock_update.html",{"i":ob})

def update_medicine_post(request):
    batch = request.POST['batch_no']
    Dosage = request.POST['dosage']
    Qty = request.POST['quantity']
    Price = request.POST['price']
    expire = request.POST['expiry']
    Medicine_name = request.POST['med_name']
    description = request.POST['description']

    ob = Stock.objects.get(id=request.session['sid'])
    ob.MEDICINE_NAME=Medicine.objects.get(id=request.session['mid'])

    if 'image' in request.FILES:
        ob.image=request.FILES['image']
        ob.save()

    ob.MEDICINE_NAME.Medicine_name=Medicine_name
    ob.Batch_no=batch
    ob.Dosage=Dosage
    ob.expire=expire
    ob.description=description
    ob.Quantity=Qty
    ob.Price =Price
    ob.save()
    return redirect("/view_medicine_details/"+str(request.session['mid']))

def Add_New_stock(request):
    return render(request,"pharmacy/p_stock_mng.html")


# def med_details(request,id):
#     onm=Medicine.objects.get(id=id)
#     ob=Stock.objects.filter(MEDICINE_NAME__id=id,Quantity__gt=0)
#     ob1=Pharmacy.objects.get(id=onm.PHARMACY.id)
#     return render(request,"med_details.html",{"med":ob,"ph":ob1})

# def med_details(request, id):
#     # Get the medicine details based on ID
#     medicine = Medicine.objects.get(id=id)
#
#     # Filter stock information for this medicine, where quantity is greater than 0
#     stock_data = Stock.objects.filter(MEDICINE_NAME=medicine, Quantity__gt=0)
#
#     # Get pharmacy details associated with the medicine
#     pharmacy = medicine.PHARMACY
#     img=pharmacy.Image
#
#     return render(request, "med_details.html", {
#         "medicine": medicine,
#         "stock_data": stock_data,
#         "pharmacy": pharmacy,
#     })


def med_details(request, id):
    # Get the medicine details based on ID
    medicine = Medicine.objects.get(id=id)

    # Filter stock information for this medicine, where quantity is greater than 0
    stock_data = Stock.objects.filter(MEDICINE_NAME=medicine, Quantity__gt=0)

    # Get pharmacy details associated with the medicine
    pharmacy = medicine.PHARMACY

    return render(request, "med_details.html", {
        "medicine": medicine,
        "stock_data": stock_data,
        "pharmacy": pharmacy,
    })
