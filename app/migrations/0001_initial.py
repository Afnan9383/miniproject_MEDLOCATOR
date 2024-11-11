# Generated by Django 5.0.3 on 2024-08-26 11:44

import django.db.models.deletion
from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Category',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('Category', models.CharField(max_length=30)),
                ('Description', models.CharField(max_length=60)),
            ],
        ),
        migrations.CreateModel(
            name='Login',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('Username', models.CharField(max_length=40)),
                ('Password', models.CharField(max_length=40)),
                ('Type', models.CharField(max_length=40)),
            ],
        ),
        migrations.CreateModel(
            name='Medicine',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('Medicine_name', models.CharField(max_length=40)),
                ('CATEGORY', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='app.category')),
            ],
        ),
        migrations.CreateModel(
            name='Ingredients',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('Content', models.CharField(max_length=50)),
                ('Quantity', models.IntegerField()),
                ('MEDICINE', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='app.medicine')),
            ],
        ),
        migrations.CreateModel(
            name='Pharmacy',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('Name', models.CharField(max_length=40)),
                ('Place', models.CharField(max_length=40)),
                ('Post', models.CharField(max_length=40)),
                ('Pincode', models.IntegerField()),
                ('Phone_no', models.BigIntegerField()),
                ('Email', models.CharField(max_length=30)),
                ('Latitude', models.CharField(max_length=20)),
                ('Longitude', models.CharField(max_length=20)),
                ('LOGIN', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='app.login')),
            ],
        ),
        migrations.AddField(
            model_name='medicine',
            name='PHARMACY',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='app.pharmacy'),
        ),
        migrations.CreateModel(
            name='Feedback',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('Name', models.CharField(max_length=50)),
                ('Phone_no', models.BigIntegerField()),
                ('Feedback', models.CharField(max_length=50)),
                ('Rating', models.IntegerField()),
                ('Date', models.DateField()),
                ('PHARMACY', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='app.pharmacy')),
            ],
        ),
        migrations.CreateModel(
            name='Bill',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('Usere', models.CharField(max_length=20)),
                ('Phone_no', models.BigIntegerField()),
                ('Date', models.DateField()),
                ('Amount', models.IntegerField()),
                ('Status', models.CharField(max_length=20)),
                ('PHARMACY', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='app.pharmacy')),
            ],
        ),
        migrations.CreateModel(
            name='Stock',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('Batch_no', models.CharField(max_length=50)),
                ('Dosage', models.CharField(max_length=20)),
                ('Quantity', models.IntegerField()),
                ('Price', models.IntegerField()),
                ('MEDICINE_NAME', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='app.medicine')),
            ],
        ),
        migrations.CreateModel(
            name='Bill_Sub',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('QUANTITY', models.IntegerField()),
                ('PRICE', models.FloatField()),
                ('BILL', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='app.bill')),
                ('STOCK', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='app.stock')),
            ],
        ),
    ]
