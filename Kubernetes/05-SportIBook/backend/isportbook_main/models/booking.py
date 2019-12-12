from django.db import models
from django.contrib.auth.models import User
import uuid
from django.utils.translation import gettext_lazy as _

class Booking(models.Model):
    first_name = models.CharField(max_length=100, verbose_name=_("First name"))
    last_name = models.CharField(max_length=100, verbose_name=_("Last name"))
    telephone = models.CharField(max_length=50, verbose_name=_("Telephone"))
    email = models.EmailField(verbose_name=_("E-Mail"))
    company = models.ForeignKey("isportbook_main.Profile", on_delete=models.CASCADE, verbose_name=_("Company"))
    sport = models.ForeignKey("isportbook_main.Sport", on_delete=models.CASCADE)
    uuid = models.UUIDField(default=None, editable=True, blank=True, unique=True, null=True)

    def __str__(self):
        return self.first_name + " "  + self.last_name + " (" + self.sport.__str__() + ")"

    class Meta:
        verbose_name = _("Booking")
        verbose_name_plural = _("Bookings")
