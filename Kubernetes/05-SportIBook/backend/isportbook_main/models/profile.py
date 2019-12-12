from django.db import models
from django.contrib.auth.models import User
from django.db.models.signals import post_save
from django.dispatch import receiver
from django.contrib.auth.models import AbstractUser
from .city import City
from .sport import Sport
from .feedback import Feedback
from .booking import Booking
from django.utils.translation import gettext_lazy as _

# Create your models here.
class Profile(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    name = models.CharField(max_length=100, blank=False, verbose_name=_("Name"))
    address = models.CharField(max_length=100, blank=True, verbose_name=_("Address"))
    post_code = models.CharField(max_length=20, blank=True, verbose_name=_("Post code"))
    city = models.ForeignKey(City, on_delete=models.CASCADE, blank=False, verbose_name=_("City"))
    description = models.TextField(max_length=2000, blank=False, verbose_name=_("Description"))
    sports = models.ManyToManyField(Sport)
    services = models.TextField(max_length=2000, blank=True, verbose_name=_("Services"))
    open_times = models.TextField(max_length=2000, blank=True, verbose_name=_("Open times"))
    age = models.CharField(max_length=3, blank=True, verbose_name=_("Age"))
    profession = models.CharField(max_length=100, blank=True, verbose_name=_("Profession"))
    certifications = models.TextField(max_length=2000, blank=True, verbose_name=_("Certifications"))
    bio = models.TextField(max_length=500, blank=True, verbose_name=_("Biography"))
    awards = models.TextField(max_length=500, blank=True, verbose_name=_("Awards"))
    super_powers = models.TextField(max_length=500, blank=True, verbose_name=_("Super powers"))

    photo = models.ImageField(upload_to="profiles/", null=True, verbose_name=_("Photo"))

    def rating(self):
        bookings = Booking.objects.filter(company=self.user.profile)
        feedbacks = Feedback.objects.filter(booking__in=bookings)
        if feedbacks.count() == 0:
            return 0
        rating = 0
        struttura = False

        # TODO other ways? It's too hard-coded and coupled with the database
        for group in self.user.groups.all():
            if group.pk == 2:
                struttura = True
                break

        for feedback in feedbacks:
            trating = 0
            if struttura:
                trating += feedback.cleaning
                trating += feedback.motivation
                trating += feedback.value_for_money
            else:
                trating += feedback.professionality
                trating += feedback.passion
                trating += feedback.skill
            trating /= 3
            rating += trating
        return rating / feedbacks.count()

    def groups(self):
        return list(self.user.groups.all())

    def __str__(self):
        return self.user.username

    class Meta:
        verbose_name = _("Company")
        verbose_name_plural = _("Companies")

