from django.db import models
from .models_utils.integer_range_field import IntegerRangeField
from django.utils.translation import gettext_lazy as _

class Feedback(models.Model):
    min_value = 0
    max_value = 10
    cleaning = IntegerRangeField(min_value=min_value, max_value=max_value, default=0, verbose_name=_("Cleaning"))
    motivation = IntegerRangeField(min_value=min_value, max_value=max_value, default=0, verbose_name=_("Motivation"))
    value_for_money = IntegerRangeField(min_value=min_value, max_value=max_value, default=0, verbose_name=_("Value for money"))
    professionality = IntegerRangeField(min_value=min_value, max_value=max_value, default=0, verbose_name=_("Professionality"))
    passion = IntegerRangeField(min_value=min_value, max_value=max_value, default=0, verbose_name=_("Passion"))
    skill = IntegerRangeField(min_value=min_value, max_value=max_value, default=0, verbose_name=_("Skill"))
    booking = models.OneToOneField("isportbook_main.Booking", on_delete=models.CASCADE, verbose_name=_("Booking"))

    def __str__(self):
        return self.booking.__str__()

    class Meta:
        verbose_name = _("Feedback")
        verbose_name_plural = _("Feedbacks")
