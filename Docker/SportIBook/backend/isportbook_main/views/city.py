from rest_framework import generics
from isportbook_main.models.city import City
from isportbook_main.models.sport import Sport
from isportbook_main.serializers.city import CitySerializer
from isportbook_main.serializers.sport import SportSerializer
from isportbook_main.serializers.company import CompanySerializer
from isportbook_main.models.profile import Profile

class ListCitiesView(generics.ListAPIView):
    queryset = City.objects.all()
    serializer_class = CitySerializer

class ListSportsByCityView(generics.ListAPIView):
    serializer_class = SportSerializer

    def get_queryset(self):
        city_id = self.kwargs.get("city_id")
        companies = Profile.objects.filter(city__id=city_id)
        sports = Sport.objects.filter(profile__in=list(companies)).distinct()
        #qs = Sport.objects.all()
        return sports

class ListCompaniesBySportCityView(generics.ListAPIView):
    serializer_class = CompanySerializer

    def get_queryset(self):
        city_id = self.kwargs.get("city_id")
        sport_id = self.kwargs.get("sport_id")
        companies = Profile.objects.filter(city__id=city_id, sports__id=sport_id, user__groups__in=[1,2])
        return sorted(companies, key=lambda x: -x.rating())

class GetCityView(generics.RetrieveAPIView):
    serializer_class = CitySerializer
    queryset = City.objects.filter()

