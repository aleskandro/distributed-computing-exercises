from rest_framework import serializers
from isportbook_main.models.city import City

class CitySerializer(serializers.ModelSerializer):
    class Meta:
        model = City
        fields = ("name","id")

