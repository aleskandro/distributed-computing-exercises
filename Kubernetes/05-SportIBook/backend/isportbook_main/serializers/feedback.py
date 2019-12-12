from rest_framework import serializers
from isportbook_main.models.feedback import Feedback

class FeedbackSerializer(serializers.ModelSerializer):
    class Meta:
        model = Feedback
        fields = ('cleaning', 'motivation', 'value_for_money', 'professionality', 'passion', 'skill', 'booking')
