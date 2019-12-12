from django.contrib import admin
from django.contrib.auth.forms import UserCreationForm, UserChangeForm
from .models.profile import Profile
from .models.city import City
from .models.sport import Sport
from .models.booking import Booking
from .models.feedback import Feedback

from django.contrib.auth.models import User
from django.contrib.auth.admin import UserAdmin as BaseUserAdmin
from django.utils.html import format_html
from django.urls import reverse
from django.conf.urls import url
from django.http import HttpResponseRedirect
import uuid

from django.core.mail import send_mail
from django.template.loader import render_to_string
from django.conf import settings
from django.utils.translation import gettext_lazy as _

admin.site.index_title = _("SportIBook")
admin.site.site_header = _("SportIBook")
admin.site.site_title = _("SportIBook")

class ProfileInline(admin.StackedInline):
    model = Profile
    can_delete = False
    verbose_name_plural = "User"

class UserAdmin(BaseUserAdmin):
    inlines = (ProfileInline,)


class BookingAdmin(admin.ModelAdmin):
    list_display = ['first_name', 'last_name', 'email', 'company', 'sport', 'booking_actions']

    def send_feedback_mail(self, request, booking_id):
        Booking.objects.filter(pk=booking_id).update(uuid=uuid.uuid4())
        booking = Booking.objects.get(pk=booking_id)
        params = {"booking": booking, "frontend_url": settings.FRONTEND_URL}
        msg_plain = render_to_string("feedback/mail.txt", params)
        msg_html = render_to_string("feedback/mail.html", params)
        send_mail(
            'Your session has finished',
            msg_plain,
            settings.EMAIL_FROM,
            [booking.email],
            html_message=msg_html
        )
        self.message_user(request, "Feedback mail sent")
        return HttpResponseRedirect("../..")

    def booking_actions(self, obj):
        if not Feedback.objects.filter(booking__id=obj.pk).exists() and obj.uuid is None:
            return format_html(
                    '<a class="button" href={}>%s</a>' % (_("Booking complete")), reverse('admin:send-feedback-mail', args=[obj.pk]))

    def get_urls(self):
        urls = super().get_urls()
        custom_urls = [
                url(r'^feedback/(?P<booking_id>.+)/$',
                    self.send_feedback_mail,
                    name='send-feedback-mail')
                ]
        return custom_urls + urls

    def get_queryset(self, request):
        qs = super(BookingAdmin, self).get_queryset(request)
        if request.user.is_superuser:
            return qs
        return qs.filter(company=request.user.profile)

    def formfield_for_foreignkey(self, db_field, request, **kwargs):
        if db_field.name == "company":
            if not request.user.is_superuser:
                kwargs["queryset"] = User.objects.filter(username=request.user)
        return super(BookingAdmin, self).formfield_for_foreignkey(db_field, request, **kwargs)

class FeedbackAdmin(admin.ModelAdmin):
    list_display = ['booking_first_name', 'booking_last_name', 'booking_company']

    def booking_first_name(self, obj):
        return obj.booking.first_name
    booking_first_name.short_description = _("First name")

    def booking_last_name(self, obj):
        return obj.booking.last_name
    booking_last_name.short_description = _("Last name")

    def booking_company(self, obj):
        return obj.booking.company.name
    booking_company.short_description = _("Company")

    def get_queryset(self, request):
        qs = super(FeedbackAdmin, self).get_queryset(request)
        if request.user.is_superuser:
            return qs

        # TODO make a JOIN
        bookings = Booking.objects.filter(company=request.user.profile)
        return qs.filter(booking__in=list(bookings))

    def formfield_for_foreignkey(self, db_field, request, **kwargs):
        if db_field.name == "booking":
            if not request.user.is_superuser:
                kwargs["queryset"] = Booking.objects.filter(company=request.user.profile)
        return super(FeedbackAdmin, self).formfield_for_foreignkey(db_field, request, **kwargs)



admin.site.register(City)
admin.site.register(Sport)
admin.site.register(Booking, BookingAdmin)
admin.site.register(Feedback, FeedbackAdmin)
admin.site.unregister(User)
admin.site.register(User, UserAdmin)

