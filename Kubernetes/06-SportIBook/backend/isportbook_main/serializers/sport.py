from rest_framework import serializers
from isportbook_main.models.sport import Sport

class SportSerializer(serializers.ModelSerializer):
    class Meta:
        model = Sport
        fields = ("name","id", "icon")

