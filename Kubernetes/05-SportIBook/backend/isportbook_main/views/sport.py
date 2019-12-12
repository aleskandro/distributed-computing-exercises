from rest_framework import generics
from isportbook_main.models.sport import Sport
from isportbook_main.serializers.sport import SportSerializer

class GetSportView(generics.RetrieveAPIView):
    serializer_class = SportSerializer
    queryset = Sport.objects.filter()

