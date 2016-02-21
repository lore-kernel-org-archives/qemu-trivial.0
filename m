Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aXVeA-0005YN-UD
	for mharc-qemu-trivial@gnu.org; Sun, 21 Feb 2016 10:10:06 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53521)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <raghavanil4m@gmail.com>) id 1aXVe8-0005TB-IL
	for qemu-trivial@nongnu.org; Sun, 21 Feb 2016 10:10:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <raghavanil4m@gmail.com>) id 1aXVe7-0006vS-0r
	for qemu-trivial@nongnu.org; Sun, 21 Feb 2016 10:10:04 -0500
Received: from mail-lb0-x230.google.com ([2a00:1450:4010:c04::230]:34464)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <raghavanil4m@gmail.com>)
	id 1aXVe3-0006ub-A7; Sun, 21 Feb 2016 10:09:59 -0500
Received: by mail-lb0-x230.google.com with SMTP id of3so69862326lbc.1;
	Sun, 21 Feb 2016 07:09:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=c24PWk6UzxjQjNn4FTl3qsOXXyHSmj+T3JLBI++EtCU=;
	b=dhN02K9Bbz7PsHLQte5lcopGG6OaDS24S3Eg65AUBfKT/B1xvMKRy7CcGzh8tIhMgN
	6h3ZhJqhZJ69hHGPB+qm5JQEM65jv2LLrMcvoId/Zee4GltN+Bt8VHFsRbrVcB4wckYl
	44eMe9M3FU2KE91yeKR+iyQTyNmKvoYcaA3D/qT2y3sVLIeSWr3e39mcM7vuCKWEq5sq
	hHF/LMn9oJ56uoNIVhf6bmmViwxwPG+iz758/vKRD+RyzbHn/k+xlgo2vw/CC+w6NjDX
	VfGE1e2HB/yKbUukh89yiY9AcGuB1/AbesLC7HiYxfiw2UwF/KXasipNle+mdKU8x9Dk
	AtQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=c24PWk6UzxjQjNn4FTl3qsOXXyHSmj+T3JLBI++EtCU=;
	b=AT2mm+eeDaqHas9J6oApKalMfu/XpzzoUwcGtE6PFaORyFqZUunyyCbMI7mSy88IP6
	qufAu7t7bCAZwzM563LlsbWQWKCKruHzY4StDPc7wwd3rNLUD6/CvWZNWsSS3wJa7dIp
	InLvQMpVgYGAFliYdFL9UWp8OVfZZppkfBvqO2edATh3p2mZEDHf0/mf9c9/eOF/RV65
	3JkFsqxA6aZzeaoN13EqMi0m90h0OQnYeQGzLFviNZjuhgMfsX5GtGRiifafvuzFx8eM
	lLwiIFs2ZeYJNjkDjyCMGxBLpkKF/j7bqZ6JsW17hPREv1UVCJuRQX29Bp7tJ+Zl4cWA
	rymQ==
X-Gm-Message-State: AG10YOTZCZGSg7VTe32fVhxac+NwYV8rvgON4rUFX6dsKjE6X/hQjUdqvcadPzT/R992UurAzraxJlr7x9iIjw==
MIME-Version: 1.0
X-Received: by 10.112.126.72 with SMTP id mw8mr8730508lbb.14.1456067398107;
	Sun, 21 Feb 2016 07:09:58 -0800 (PST)
Received: by 10.112.78.4 with HTTP; Sun, 21 Feb 2016 07:09:58 -0800 (PST)
In-Reply-To: <CAKWsRc2NX_Pz5_P6kEhU26=JWK4UemBuGUO7suHvMiuJph48KQ@mail.gmail.com>
References: <CAKWsRc2MyUByd3tjyZMx_q_3+Oy=D5kUtw7MLU6HP7h9xVAy6A@mail.gmail.com>
	<CAKWsRc2NX_Pz5_P6kEhU26=JWK4UemBuGUO7suHvMiuJph48KQ@mail.gmail.com>
Date: Sun, 21 Feb 2016 07:09:58 -0800
Message-ID: <CAKWsRc1-oyuVZZnK2XPsC+c4OB=aWj=VtqSAgwjKT6zs9SxzPQ@mail.gmail.com>
From: Raghavan Santhanam <raghavanil4m@gmail.com>
To: qemu-stable@nongnu.org, qemu-trivial@nongnu.org, qemu-discuss@nongnu.org
Content-Type: multipart/alternative; boundary=001a11c37656088b2a052c491c8a
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c04::230
Cc: Raghavan Santhanam <raghavanil4m@gmail.com>
Subject: Re: [Qemu-trivial] Regarding Intel IGD passthru support for QEMU/KVM
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sun, 21 Feb 2016 15:10:06 -0000

--001a11c37656088b2a052c491c8a
Content-Type: text/plain; charset=UTF-8

Hi All,

Here is my most recent successful and more complete Android Sensor
Emulation(Intel-IGD-passsthru ~ QEMU/KVM) update by me.

Watch it in action : www dot youtube dot com/watch?v=vdcOS247F-4

**== Android Sensor Emulation, fully UNLEASHED! ==**

 - Fueled by GoogleNexus5
 - Powered by Intel IGD
 - Run on QEMU/KVM

**== Android Sensor Emulation, fully UNLEASHED!! ==**

 - Turn your Android Smartphone into a JOYSTICK!



 - Play. Every. Single. Motion-sensor game. On. Any. Sensor-less Android
   device.
 - Run. Every. Single. sensor-based application. On. Any. Sensor-less
   Android device.



 - Let your games and other applications be "unique selves". No need to
   alter your "favorite" game or "useful" other sensor-based application
   to make use of my Android Sensor Emulation support.

**== DETAILS ==**

My current work as shown by this demo emulates the below 27 sensors(all the
sensors of Google Nexus 5). Watch the video for more and precise details.

---------------------------------------------------------------------------------------------------------
1. Accelerometer
2. Light
3. Proximity
4. Magnetometer
5. Gyroscope
6. Gravity
7. Linear Acceleration
8. Orientation
9. Rotation Vector

---------------------------------------------------------------------------------------------------------
10. Game Rotation Vector
11. Barometer
12. Step Detector
13. Step Counter
14. Significant Motion Detector
15. Tilt Detector
16. Absolute Motion Detector(AMD)
17. Relative Motion Detector(RMD)
18. Basic Gestures

---------------------------------------------------------------------------------------------------------
19. Tap Detector
20. Facing Detector
21. (QTI) Tilt Detector
22. Pedometer
23. Pedestrian Activity Monitor
24. Geomagnetic Rotation Vector
25. (InvenSense) Game Rotation Vector
26. Magnetometer (Uncalibrated)
27. Gyroscope (Uncalibrated)

---------------------------------------------------------------------------------------------------------

Cheers,
Raghavan

On Tue, Feb 9, 2016 at 7:14 AM, Raghavan Santhanam <raghavanil4m@gmail.com>
wrote:

> Hi All,
>
> I am glad to share my successful Intel IGD passthru with QEMU/KVM, here as
> well
> in addition to my previous report on qemu-devel mailing list so that
> interested ones
> can have a look at my demos.
>
> Here are some of the popular platforms running smoothly with my successful
> Intel IGD passthru + QEMU/KVM setup on Ubuntu 14.04 LTS 64-bit host
> running on my
> Lenovo touchscreen-enabled laptop.
>
> *First success :* Android-x86 5.1 Lollipop -
> https://www.youtube.com/watch?v=PBN1DmarJ7k
> *Second success :* Windows 10 LTSB 64-bit -
> https://www.youtube.com/watch?v=WmKzRGT2cjI
> *Third success :* Ubuntu 15.10 64-bit -
> https://www.youtube.com/watch?v=1_VXTDgqnHg
>
> And I take this opportunity to appreicate the years of work on QEMU + KVM
> + XEN. Good work, developers!
>
> Best,
> Raghavan
>
>
>
>
>
>
>
>
> On Sun, Jan 17, 2016 at 6:23 PM, Raghavan Santhanam <
> raghavanil4m@gmail.com> wrote:
>
>> Hi,
>>
>> Based on the Intel IGD passthru support that has been added to Qemu/Xen
>> code base,
>> is there any way to use/reuse the same logic currently to have a
>> successful passthru of an Intel
>> IGD with Qemu/KVM on a Linux host(Ubuntu x86_64) or will that require
>> some more
>> work in addition to what Xen code based already has for the IGD passthru?
>>
>> Best,
>> Raghavan
>>
>>
>

--001a11c37656088b2a052c491c8a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi All,</div><div><br></div><div>Here is my most rece=
nt successful and more complete Android Sensor Emulation(Intel-IGD-passsthr=
u ~ QEMU/KVM) update by me.</div><div><br></div><div>Watch it in action : w=
ww dot youtube dot com/watch?v=3DvdcOS247F-4</div><div><br></div><div>**=3D=
=3D Android Sensor Emulation, fully UNLEASHED! =3D=3D**</div><div><br></div=
><div>=C2=A0- Fueled by GoogleNexus5</div><div>=C2=A0- Powered by Intel IGD=
</div><div>=C2=A0- Run on QEMU/KVM</div><div><br></div><div>**=3D=3D Androi=
d Sensor Emulation, fully UNLEASHED!! =3D=3D**</div><div><br></div><div>=C2=
=A0- Turn your Android Smartphone into a JOYSTICK!</div><div><br></div><div=
>=C2=A0</div><div><br></div><div>=C2=A0- Play. Every. Single. Motion-sensor=
 game. On. Any. Sensor-less Android</div><div>=C2=A0 =C2=A0device.</div><di=
v>=C2=A0- Run. Every. Single. sensor-based application. On. Any. Sensor-les=
s</div><div>=C2=A0 =C2=A0Android device.</div><div><br></div><div>=C2=A0</d=
iv><div><br></div><div>=C2=A0- Let your games and other applications be &qu=
ot;unique selves&quot;. No need to</div><div>=C2=A0 =C2=A0alter your &quot;=
favorite&quot; game or &quot;useful&quot; other sensor-based application</d=
iv><div>=C2=A0 =C2=A0to make use of my Android Sensor Emulation support.</d=
iv><div><br></div><div>**=3D=3D DETAILS =3D=3D**</div><div><br></div><div>M=
y current work as shown by this demo emulates the below 27 sensors(all the =
sensors of Google Nexus 5). Watch the video for more and precise details.</=
div><div><br></div><div>---------------------------------------------------=
------------------------------------------------------</div><div>1. Acceler=
ometer</div><div>2. Light</div><div>3. Proximity</div><div>4. Magnetometer<=
/div><div>5. Gyroscope</div><div>6. Gravity</div><div>7. Linear Acceleratio=
n</div><div>8. Orientation</div><div>9. Rotation Vector</div><div><br></div=
><div>---------------------------------------------------------------------=
------------------------------------</div><div>10. Game Rotation Vector</di=
v><div>11. Barometer</div><div>12. Step Detector</div><div>13. Step Counter=
</div><div>14. Significant Motion Detector</div><div>15. Tilt Detector</div=
><div>16. Absolute Motion Detector(AMD)</div><div>17. Relative Motion Detec=
tor(RMD)</div><div>18. Basic Gestures</div><div><br></div><div>------------=
---------------------------------------------------------------------------=
------------------</div><div>19. Tap Detector</div><div>20. Facing Detector=
</div><div>21. (QTI) Tilt Detector</div><div>22. Pedometer</div><div>23. Pe=
destrian Activity Monitor</div><div>24. Geomagnetic Rotation Vector</div><d=
iv>25. (InvenSense) Game Rotation Vector</div><div>26. Magnetometer (Uncali=
brated)</div><div>27. Gyroscope (Uncalibrated)</div><div><br></div><div>---=
---------------------------------------------------------------------------=
---------------------------</div><div><br></div><div>Cheers,</div><div>Ragh=
avan</div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Tue,=
 Feb 9, 2016 at 7:14 AM, Raghavan Santhanam <span dir=3D"ltr">&lt;<a href=
=3D"mailto:raghavanil4m@gmail.com" target=3D"_blank">raghavanil4m@gmail.com=
</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204)=
;border-left-style:solid;padding-left:1ex"><div dir=3D"ltr">Hi All,<div><br=
></div><div>I am glad to share my successful Intel IGD passthru with QEMU/K=
VM, here as well</div><div>in addition to my previous report on qemu-devel =
mailing list so that interested ones</div><div>can have a look at my demos.=
</div><div><br></div><div>Here are some of the popular platforms running sm=
oothly with my successful</div><div>Intel IGD passthru + QEMU/KVM setup on =
Ubuntu 14.04 LTS 64-bit host running on my</div><div>Lenovo touchscreen-ena=
bled laptop.</div><div><br></div><div><b>First success :</b> Android-x86 5.=
1 Lollipop -=C2=A0<a href=3D"https://www.youtube.com/watch?v=3DPBN1DmarJ7k"=
 target=3D"_blank">https://www.youtube.com/watch?v=3DPBN1DmarJ7k</a></div><=
div><b>Second success :</b> Windows 10 LTSB 64-bit -=C2=A0<a href=3D"https:=
//www.youtube.com/watch?v=3DWmKzRGT2cjI" target=3D"_blank">https://www.yout=
ube.com/watch?v=3DWmKzRGT2cjI</a></div><div><b>Third success :</b> Ubuntu 1=
5.10 64-bit -=C2=A0<a href=3D"https://www.youtube.com/watch?v=3D1_VXTDgqnHg=
" target=3D"_blank">https://www.youtube.com/watch?v=3D1_VXTDgqnHg</a></div>=
<div><br></div><div>And I take this opportunity to appreicate the years of =
work on QEMU + KVM + XEN. Good work, developers!</div><div><br></div><div>B=
est,</div><div>Raghavan</div><div><br></div><div><br></div><div><br></div><=
div><br></div><div><br></div><div><br></div><div><br></div></div><div class=
=3D""><div class=3D"h5"><div class=3D"gmail_extra"><br><div class=3D"gmail_=
quote">On Sun, Jan 17, 2016 at 6:23 PM, Raghavan Santhanam <span dir=3D"ltr=
">&lt;<a href=3D"mailto:raghavanil4m@gmail.com" target=3D"_blank">raghavani=
l4m@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb=
(204,204,204);border-left-style:solid;padding-left:1ex"><div dir=3D"ltr"><s=
pan style=3D"font-size:12.8px">Hi,</span><div style=3D"font-size:12.8px"><b=
r></div><div style=3D"font-size:12.8px">Based on the Intel IGD passthru sup=
port that has been added to Qemu/Xen code base,</div><div style=3D"font-siz=
e:12.8px">is there any way to use/reuse the same logic currently to have a =
successful passthru of an Intel</div><div style=3D"font-size:12.8px">IGD wi=
th Qemu/KVM on a Linux host(Ubuntu x86_64) or will that require some more</=
div><div style=3D"font-size:12.8px">work in addition to what Xen code based=
 already has for the IGD passthru?</div><div style=3D"font-size:12.8px"><br=
></div><div style=3D"font-size:12.8px">Best,</div><div style=3D"font-size:1=
2.8px">Raghavan</div><div style=3D"font-size:12.8px"><br></div></div>
</blockquote></div><br></div>
</div></div></blockquote></div><br></div></div>

--001a11c37656088b2a052c491c8a--

