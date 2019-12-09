from django.urls import path
from .views.city import ListCitiesView, ListSportsByCityView, ListCompaniesBySportCityView, GetCityView
from .views.sport import GetSportView
from .views.company import ListCompaniesView, GetCompanyView
from .views.feedback import FeedbackPost
from .views.booking import BookingPost, GetCompanyByBooking
from .views.ping import Ping

urlpatterns = [
    path('cities/', ListCitiesView.as_view(), name="cities-all"),
    path('cities/<int:pk>', GetCityView.as_view(), name="city"),
    path('cities/<int:city_id>/sports', ListSportsByCityView.as_view(), name="sports-city"),
    path('cities/<int:city_id>/sports/<int:sport_id>/companies', ListCompaniesBySportCityView.as_view(), name="companies-sport-city"),
    path('sports/<int:pk>', GetSportView.as_view(), name="sport"),
    path('companies/', ListCompaniesView.as_view(), name="companies-all"),
    path('companies/<int:pk>', GetCompanyView.as_view(), name="company"),
    path('feedback/', FeedbackPost.as_view(), name="save-feedback"),
    path('booking/', BookingPost.as_view(), name="add-booking"),
    path('booking/<int:pk>/<str:uuid>/company', GetCompanyByBooking.as_view(), name="get-company-of-booking"),
    path('ping/', Ping.as_view(), name="ping")

]
