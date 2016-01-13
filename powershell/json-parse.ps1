# note: this is an actual SQS message, with identifiers redacted
$body = @"
{
  "Type" : "Notification",
  "MessageId" : "ffff-redacted-ffff",
  "TopicArn" : "arn:aws:sns:us-east-1:fffffffffff:InstanceTerminations",
  "Subject" : "Auto Scaling: termination for group \"WebAutoScalingGroup-AAAAAAAAAAAAAA\"",
  "Message" : "{\"StatusCode\":\"InProgress\",\"Service\":\"AWS Auto Scaling\",\"AutoScalingGroupName\":\"aaaaaaaaaaaaaaaaaaa\",\"Description\":\"Terminating EC2 instance: i-aaaaaaa\",\"ActivityId\":\"aaaaa-aaa-aaaaaaaa-aaaaa-aaa-a-aa-a\",\"Event\":\"autoscaling:EC2_INSTANCE_TERMINATE\",\"Details\":{\"Availability Zone\":\"us-east-1d\",\"Subnet ID\":\"subnet-aaaaaaaa\"},\"AutoScalingGroupARN\":\"arn:aws:autoscaling:us-east-1:11111111111111:autoScalingGroup:fffff-ffff-ff-ff-ffff-fff:autoScalingGroupName/BBBBBBBBBBBBB\",\"Progress\":50,\"Time\":\"2016-01-13T15:01:25.741Z\",\"AccountId\":\"1234567890\",\"RequestId\":\"111-11111-11-111111111-1\",\"StatusMessage\":\"\",\"EndTime\":\"2016-01-13T15:01:25.741Z\",\"EC2InstanceId\":\"i-fffffff\",\"StartTime\":\"2016-01-13T15:00:34.613Z\",\"Cause\":\"At 2016-01-13T15:00:07Z a user request update of AutoScalingGroup constraints to min: 0, max: 0, desired: 0 changing the desired capacity from 1 to 0.  At 2016-01-13T15:00:34Z an instance was taken out of service in response to a difference between desired and actual capacity, shrinking the capacity from 1 to 0.  At 2016-01-13T15:00:34Z instance i-bbbbbd was selected for termination.\"}",
  "Timestamp" : "2016-01-13T15:01:25.811Z",
  "SignatureVersion" : "1",
  "Signature" : "****************************************************************************************************************==",
  "SigningCertURL" : "https://sns.us-east-1.amazonaws.com/SimpleNotificationService-xxxxxxxxxxxxxxxxxxxxxxxx.pem",
  "UnsubscribeURL" : "https://sns.us-east-1.amazonaws.com/?Action=Unsubscribe&SubscriptionArn=arn:aws:sns:us-east-1:111111111111:aaaaaaaaaa:bbbbbbbbbbbbbbb"
}
"@

#$x = $body | ConvertFrom-JSON

#$msg = $x.Message | ConvertFrom-JSON

#$msg.EC2InstanceId

$( $( $body | ConvertFrom-JSON ).Message | ConvertFrom-JSON ).EC2InstanceId

