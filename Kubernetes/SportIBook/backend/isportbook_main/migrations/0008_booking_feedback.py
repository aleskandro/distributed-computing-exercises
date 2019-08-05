# Generated by Django 2.2.1 on 2019-05-14 17:51

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion
import isportbook_main.models.models_utils.integer_range_field


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('isportbook_main', '0007_profile_sports'),
    ]

    operations = [
        migrations.CreateModel(
            name='Booking',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('first_name', models.CharField(max_length=100)),
                ('last_name', models.CharField(max_length=100)),
                ('telephone', models.CharField(max_length=50)),
                ('email', models.EmailField(max_length=254)),
                ('company', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
                ('sport', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='isportbook_main.Sport')),
            ],
        ),
        migrations.CreateModel(
            name='Feedback',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('cleaning', isportbook_main.models.models_utils.integer_range_field.IntegerRangeField()),
                ('closeness', isportbook_main.models.models_utils.integer_range_field.IntegerRangeField()),
                ('value_for_money', isportbook_main.models.models_utils.integer_range_field.IntegerRangeField()),
                ('punctuality', isportbook_main.models.models_utils.integer_range_field.IntegerRangeField()),
                ('passion', isportbook_main.models.models_utils.integer_range_field.IntegerRangeField()),
                ('skill', isportbook_main.models.models_utils.integer_range_field.IntegerRangeField()),
                ('booking', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, to='isportbook_main.Booking')),
            ],
        ),
    ]