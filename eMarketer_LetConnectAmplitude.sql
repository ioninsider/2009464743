use database fivetran;
use schema amplitude;
 select 
   S.*
  from  (select
   SESSION_ID,
   event_time, 
   ID, 
   AMPLITUDE_ID,
   UUID,
   USER_ID,
   Paying,
   Platform, 
   event_type,  
   event_properties:id, 
   event_properties:url, 
   user_properties:email,
   user_properties:initial_referrer, 
   user_properties:initial_referring_domain, 
   user_properties:initial_utm_campaign,
   user_properties:initial_utm_medium,
   user_properties:initial_utm_source, 
   user_properties:initial_utm_term,
   user_properties:visitorId,
   user_properties:extranetid
  from event where event_time > '2021-11-01' and event_time < '2021-12-01' ) as S
  join event as E on S.session_id=E.session_id
  
  where  E.event_properties:url  like '%https://subscriptions-na2.emarketer.com/app/build/#/notAuth?DisablePodRedirection=true%'
 
  group by 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20 order by session_id DESC, event_time;

