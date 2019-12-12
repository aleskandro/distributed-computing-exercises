from rest_framework import serializers
from .feedback import FeedbackSerializer
from isportbook_main.models.feedback import Feedback

class FeedbackRequest(serializers.Serializer):
    uuid = serializers.UUIDField()
    pk = serializers.IntegerField()
    feedback = FeedbackSerializer()

