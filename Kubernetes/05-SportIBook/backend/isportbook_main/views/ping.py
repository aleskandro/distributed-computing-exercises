from rest_framework import generics
from isportbook_main.models.sport import Sport
from isportbook_main.serializers.sport import SportSerializer

from rest_framework.response import Response
from rest_framework.views import APIView
class Ping(APIView):
    def get(self, request):
        return Response({"status": "ok"})

