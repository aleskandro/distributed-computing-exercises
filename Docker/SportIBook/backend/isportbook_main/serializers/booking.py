from rest_framework import serializers
from isportbook_main.models.booking import Booking

class BookingSerializer(serializers.ModelSerializer):
    class Meta:
        model = Booking
        fields = ("first_name", "last_name", "telephone", "email", "company", "sport")
