from django.db import models

# Create your models here.
class Login(models.Model):
    Username=models.CharField(max_length=40)
    Password=models.CharField(max_length=40)
    Type=models.CharField(max_length=40)

class Pharmacy(models.Model):
    LOGIN=models.ForeignKey(Login,on_delete=models.CASCADE)
    Name=models.CharField(max_length=40)
    Place=models.CharField(max_length=40)
    Post=models.CharField(max_length=40)
    status=models.CharField(max_length=40)
    Pincode=models.IntegerField()
    Phone_no=models.BigIntegerField()
    Email=models.CharField(max_length=100)
    Latitude=models.CharField(max_length=20)
    Longitude=models.CharField(max_length=20)
    Image=models.FileField()


class Category(models.Model):
    Category=models.CharField(max_length=30)
    Description=models.CharField(max_length=60)



class Medicine(models.Model):
    PHARMACY=models.ForeignKey(Pharmacy,on_delete=models.CASCADE)
    Medicine_name=models.CharField(max_length=40)
    image=models.CharField(max_length=400)
    CATEGORY=models.ForeignKey(Category,on_delete=models.CASCADE)



class Stock(models.Model):
    MEDICINE_NAME=models.ForeignKey(Medicine,on_delete=models.CASCADE)
    Batch_no=models.CharField(max_length=50)
    Dosage=models.CharField(max_length=20)
    expire=models.CharField(max_length=100)
    description=models.CharField(max_length=2000)
    Quantity=models.IntegerField()
    Price =models.FloatField()


class Bill(models.Model):
    PHARMACY = models.ForeignKey(Pharmacy, on_delete=models.CASCADE)
    Usere=models.CharField(max_length=20)
    Phone_no = models.BigIntegerField()
    Date=models.DateField()
    Amount=models.IntegerField()
    Status=models.CharField(max_length=20)


class Bill_Sub(models.Model):
    BILL=models.ForeignKey(Bill, on_delete=models.CASCADE)
    STOCK=models.ForeignKey(Stock, on_delete=models.CASCADE)
    QUANTITY=models.IntegerField()
    PRICE=models.FloatField()



class Feedback(models.Model):
    Name=models.CharField(max_length=50)
    Phone_no = models.BigIntegerField()
    PHARMACY = models.ForeignKey(Pharmacy, on_delete=models.CASCADE)
    Feedback=models.CharField(max_length=50)
    Rating=models.IntegerField()
    Date=models.DateField()


class Ingredients(models.Model):
    MEDICINE=models.ForeignKey(Medicine,on_delete=models.CASCADE)
    Content=models.CharField(max_length=50)
    Quantity=models.IntegerField()





