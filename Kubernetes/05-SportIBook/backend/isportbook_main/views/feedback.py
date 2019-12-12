from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from isportbook_main.serializers.feedback_request import FeedbackRequest
from isportbook_main.models.booking import Booking
from isportbook_main.models.feedback import Feedback

class FeedbackPost(APIView):
    def post(self, request, format=None):
        serializer = FeedbackRequest(data=request.data)
        if serializer.is_valid():
            validated_data = serializer.validated_data
            booking = Booking.objects.filter(pk=validated_data.get("pk"), uuid=validated_data.get("uuid"))
            feedback = Feedback.objects.filter(booking_id=validated_data.get("pk"))
            if booking.exists() and not feedback.exists():
                feedback_data = validated_data.get("feedback")
                feedback = Feedback.objects.create(**feedback_data)
                booking.update(uuid=None)
                return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.data, status=status.HTTP_400_BAD_REQUEST)


