from rest_framework import serializers
from isportbook_main.models.profile import Profile
from django.contrib.auth.models import Group
from isportbook_main.models.city import City

class GroupSerializer(serializers.ModelSerializer):
    class Meta:
        model = Group
        fields = ('id', 'name')

class CitySerializer(serializers.ModelSerializer):
    class Meta:
        model = City
        fields = ('id', 'name')

class CompanySerializer(serializers.ModelSerializer):
    groups = GroupSerializer(many=True)
    city = CitySerializer()
    class Meta:
        model = Profile
        fields = ("id","name", "address", "description", "city", "sports", "rating", "groups", "post_code", "services", "open_times", "age", "profession", "certifications", "bio", "awards", "super_powers", "photo")

