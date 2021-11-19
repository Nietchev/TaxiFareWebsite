import streamlit as st
import datetime
import requests
import pandas as pd
'''
# TaxiFareModel front
'''

st.markdown('''
Remember that there are several ways to output content into your web page...

Either as with the title by just creating a string (or an f-string). Or as with this paragraph using the `st.` functions
''')
'''
## Here we would like to add some controllers in order to ask the user to select the parameters of the ride

1. Let's ask for:

'''
d = st.date_input(
    "Date of pick-up",
    datetime.date(2021, 11, 19))

t = st.time_input(
    'Time of pick-up',
    datetime.time(8, 45))

p_lon = st.number_input('Pick-up long', value=40.7614327, format='%f')
p_lat = st.number_input('Pick-up lat', value= -73.9798156, format='%f')
d_lon = st.number_input('Drop-off long', value=40.6513111, format='%f')
d_lat = st.number_input('Drop-off lat', value= -73.8803331, format='%f')
count = st.number_input('Number of passengers', format='%d', value=1)

#2013-07-06 17:18:00 UTC
date_time = f"{d} {t}"
#st.write(date_time)

param = {'pickup_datetime' : date_time,
         'pickup_longitude' : p_lon,
         'pickup_latitude' : p_lat,
         'dropoff_longitude'  : d_lon,
         'dropoff_latitude'  : d_lat,
         'passenger_count' : count}


pickup = (p_lon, p_lat)
dropoff = (d_lon, d_lat)

df = pd.DataFrame([pickup, dropoff],columns=['lat', 'lon'])

st.write(df)
st.map(df)


'''
'''

# if st.button('click me'):
#     # print is visible in the server output, not in the page
#     print('button clicked!')
#     st.write('I was clicked 🎉')
#     st.write('Further clicks are not visible but are executed')
# else:
#     st.write('I was not clicked 😞')



url = 'https://taxifare.lewagon.ai/predict'

if st.button('click me'):
    res = requests.get(url, params = param).json()
    st.write(f"Price predicted : {res['prediction']} $")
else:
    st.write('I was not clicked 😞')
