@component('mail::message')
<h2>Hello {{$inquiry}} Dept.,</h2>

You have recieved an email!

<strong style="margin: auto;
text-align: center;
width: 100%;
display: block;
background: #2e3749;
color: white;">
    Message Details
</strong>
<div style="background-color: #8080800d;padding: 10px;">
    <p>Name:<span style="font-size: 18px; padding-left:4px; font-weight:600; ">{{$name}}</span> </p>
    <p>Email:<span style="font-size: 18px; padding-left:4px; font-weight:600;">{{$email}}</span> </p>
    <p>Subject:<span style="font-size: 18px; padding-left:4px; font-weight:600;">{{$subject}}</span> </p>
    <p>Message:<span style="font-size: 18px; padding-left:4px; font-weight:600;">{{$message}}</span> </p>
    
</div>
<br>
<br>
<p>You can reply the sender by clicking below
     @component('mail::button', ['url' => "mailto:".$email])
Reply Now!
@endcomponent </p>
 
 
 
Thanks,<br>
<a href=" "> Website</a>
@endcomponent