✅ STEP 1 — Enable Billing Alerts (Global setting)

Billing alerts are NOT enabled by default, so do this first:

Go to AWS console

Top-right → click your account name → Billing Dashboard

Left menu → Billing preferences

Enable these checkboxes:

✔ Receive CloudWatch billing alerts
✔ Receive Free Tier usage alerts
✔ Receive text/email alerts for bills

Enter your email address

Click Save preferences




Left menu → Billing preferences

Enable these checkboxes:

✔ Receive CloudWatch billing alerts
✔ Receive Free Tier usage alerts
✔ Receive text/email alerts for bills

Enter your email address

Click Save preferences

![alt text](image.png)



✅ STEP 2 — Create a CloudWatch Billing Alarm (₹100 threshold)
Important:

Billing alarms only work in us-east-1 (N. Virginia), so make sure CloudWatch region is that.
1. Go to CloudWatch

Open AWS Console → Services → CloudWatch

Top-right: Set region = N. Virginia (us-east-1)

2. Open Billing Metrics

Left menu:

Metrics

Choose Billing

Click Total Estimated Charge

3. Select Currency

Choose the metric:

EstimatedCharges

Dimension: Currency = INR

4. Create Alarm

Click Actions → Create Alarm
![alt text](image-1.png)



after that:
5. Set Threshold

Threshold type: Static

Condition:

Greater than or equal to: 100

![alt text](image-3.png)
(This means ₹100 INR)

![alt text](image-2.png)


6. Set Notification

Notification type: Email

Create SNS topic (if not created):

Topic name:BillingAlarmTopic

![alt text](image-4.png)


name the alarm:
![alt text](image-5.png)


click on create alarm:


After creating an alarm you can see like this:

![alt text](image-6.png)

![alt text](image-7.png)