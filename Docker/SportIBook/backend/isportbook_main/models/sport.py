from django.db import models
from django.utils.translation import gettext_lazy as _
class Sport(models.Model):
    name = models.CharField(max_length=100, blank=False, verbose_name=_("Name"))
    icon = models.ImageField(upload_to="sports/", null=True, verbose_name=_("Icon"))

    def __str__(self):
        return self.name
