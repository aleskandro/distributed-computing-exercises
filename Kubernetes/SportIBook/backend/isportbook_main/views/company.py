from rest_framework import generics
from isportbook_main.serializers.company import CompanySerializer
from isportbook_main.models.profile import Profile

class ListCompaniesView(generics.ListAPIView):
    queryset = Profile.objects.all()
    serializer_class = CompanySerializer

class GetCompanyView(generics.RetrieveAPIView):
    serializer_class = CompanySerializer
    queryset = Profile.objects.filter()

