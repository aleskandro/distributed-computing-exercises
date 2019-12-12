from isportbook_main.serializers.booking import BookingSerializer
from isportbook_main.serializers.company import CompanySerializer
from isportbook_main.models.booking import Booking

from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status

from django.core.mail import send_mail
from django.template.loader import render_to_string
from django.conf import settings
from django.utils.translation import gettext_lazy as _

from django.conf import settings

class BookingPost(APIView):
    def post(self, request, format=None):
        serializer = BookingSerializer(data=request.data)
        if serializer.is_valid():
            booking = serializer.save()
            params = {"booking": booking, "frontend_url": settings.FRONTEND_URL}
            msg_plain = render_to_string("booking/mails/user_notification_booking/mail.txt", params)
            msg_html = render_to_string("booking/mails/user_notification_booking/mail.html", params)
            send_mail(
                _("YourBooking"),
                msg_plain,
                settings.EMAIL_FROM,
                [booking.email],
                html_message=msg_html
            )
            if len(booking.company.user.email) > 0:
                msg_plain = render_to_string("booking/mails/company_notification_booking/mail.txt", params)
                msg_html = render_to_string("booking/mails/company_notification_booking/mail.html", params)
                send_mail(
                    _("NewBookingReceived"),
                    msg_plain,
                    settings.EMAIL_FROM,
                    [booking.company.user.email],
                    html_message=msg_html
                )
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.data, status=status.HTTP_400_BAD_REQUEST)


class GetCompanyByBooking(APIView):
    def get(self, request, pk, uuid, format=None):
        try:
            booking = Booking.objects.get(pk=pk,uuid=uuid)
        except Booking.DoesNotExist:
            booking = None
        if booking is None:
            return Response({}, status=status.HTTP_404_NOT_FOUND)
        serializer = CompanySerializer(booking.company)
        return Response(serializer.data, status=status.HTTP_200_OK)

