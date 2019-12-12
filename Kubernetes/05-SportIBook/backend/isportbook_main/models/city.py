from django.db import models
from django.utils.translation import gettext_lazy as _

class City(models.Model):
    name = models.CharField(max_length=100, verbose_name=("Name"))
    def __str__(self):
        return self.name

    class Meta:
        verbose_name = _("City")
        verbose_name_plural = _("Cities")
