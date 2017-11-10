Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eD69Y-0002mf-8m
	for mharc-qemu-trivial@gnu.org; Fri, 10 Nov 2017 05:03:12 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41212)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jim.quigley@oracle.com>) id 1eD69Q-0002im-IT
	for qemu-trivial@nongnu.org; Fri, 10 Nov 2017 05:03:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jim.quigley@oracle.com>) id 1eD69K-00007a-3O
	for qemu-trivial@nongnu.org; Fri, 10 Nov 2017 05:03:04 -0500
Received: from userp1040.oracle.com ([156.151.31.81]:16895)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <jim.quigley@oracle.com>)
	id 1eD69J-0008W6-P7; Fri, 10 Nov 2017 05:02:58 -0500
Received: from aserv0022.oracle.com (aserv0022.oracle.com [141.146.126.234])
	by userp1040.oracle.com (Sentrion-MTA-4.3.2/Sentrion-MTA-4.3.2) with
	ESMTP id vAAA2r3o007665
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 10 Nov 2017 10:02:54 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
	by aserv0022.oracle.com (8.14.4/8.14.4) with ESMTP id vAAA2qXa029454
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Fri, 10 Nov 2017 10:02:53 GMT
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
	by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id vAAA2n6c017812;
	Fri, 10 Nov 2017 10:02:49 GMT
Received: from [10.169.110.250] (/10.169.110.250)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Fri, 10 Nov 2017 02:02:48 -0800
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, alex.williamson@redhat.com, laurent@vivier.eu,
	Jim Quigley <jim.quigley@oracle.com>
References: <1507630928-28307-1-git-send-email-Jim.Quigley@oracle.com>
	<78aed453-49b8-a9e4-ae7c-39c731158eaa@msgid.tls.msk.ru>
From: Jim Quigley <jim.quigley@oracle.com>
Organization: Oracle Corporation
Message-ID: <1c3087f3-9019-26b3-b4be-df71da2033fc@oracle.com>
Date: Fri, 10 Nov 2017 10:03:07 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <78aed453-49b8-a9e4-ae7c-39c731158eaa@msgid.tls.msk.ru>
Content-Type: multipart/alternative;
	boundary="------------AC770E9CCE772B8741A440C9"
Content-Language: en-US
X-Source-IP: aserv0022.oracle.com [141.146.126.234]
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
	[fuzzy]
X-Received-From: 156.151.31.81
Subject: Re: [Qemu-trivial] [PATCH] hw/vfio: improve error message when
 cannot init vfio event notifiers
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 10 Nov 2017 10:03:11 -0000

This is a multi-part message in MIME format.
--------------AC770E9CCE772B8741A440C9
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by userp1040.oracle.com id vAAA2r3o007665



On 16/10/2017 19:07, Michael Tokarev wrote:
> 10.10.2017 13:22, Jim Quigley wrote:
>> More information is required to assist trouble-shooting when
>> QEMU fails to initialise the event notifications for devices
>> assigned with VFIO-PCI. Instead of supplying the user with a cryptic
>> error number only, print out a proper error message with strerror()
>> so that the user has a better way to figure out what the problem is.
>>
>> Reviewed-by: Liam Merwick <liam.merwick@oracle.com>
>> Signed-off-by: Jim Quigley <Jim.Quigley@oracle.com>
>> ---
>> Cc: qemu-trivial@nongnu.org
>> Cc: mjt@tls.msk.ru
>> Cc: laurent@vivier.eu
>> Cc: alex.williamson@redhat.com
>> ---
>>   hw/vfio/pci.c | 35 ++++++++++++++++++++++++-----------
>>   1 file changed, 24 insertions(+), 11 deletions(-)
>>
>> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
>> index 31e1edf..3bffb93 100644
>> --- a/hw/vfio/pci.c
>> +++ b/hw/vfio/pci.c
>> @@ -430,13 +430,16 @@ static int vfio_enable_vectors(VFIOPCIDevice *vd=
ev, bool msix)
>>   static void vfio_add_kvm_msi_virq(VFIOPCIDevice *vdev, VFIOMSIVector=
 *vector,
>>                                     int vector_n, bool msix)
>>   {
>> -    int virq;
>> +    int virq, ret;
>>  =20
>>       if ((msix && vdev->no_kvm_msix) || (!msix && vdev->no_kvm_msi)) =
{
>>           return;
>>       }
>>  =20
>> -    if (event_notifier_init(&vector->kvm_interrupt, 0)) {
>> +    ret =3D event_notifier_init(&vector->kvm_interrupt, 0);
>> +    if (ret) {
>> +        error_report("vfio (%s): Error: unable to init event notifier=
: %s (%d)",
>> +                     __func__, strerror(-ret), -ret);
> Since this pattern gets repeated again and again, maybe we can either
> use a common wrapper or move that eror reporting into event_notifier_in=
it()?
> Note there are other users of this function, besides hw/vfio, and maybe
> these, too, can benefit from better error reporting?

 =C2=A0=C2=A0=C2=A0 Ideally the strerror() would be included in the error=
_report()=20
function,
 =C2=A0=C2=A0=C2=A0 (as per the error_setg() function), which obviously w=
ould involve a=20
more
 =C2=A0=C2=A0=C2=A0 extensive change to the code base. Would that be an a=
cceptable=20
solution ?
 =C2=A0=C2=A0=C2=A0 Or I can move the reporting into theevent_notifier_in=
it() function=20
if that is
 =C2=A0=C2=A0=C2=A0 the preferred approach ?

 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 thanks

 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 regards

 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 Jim Q.
>
> Thanks,
>
> /mjt
>
>


--------------AC770E9CCE772B8741A440C9
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by userp1040.oracle.com id vAAA2r3o007665

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf=
-8">
  </head>
  <body text=3D"#000000" bgcolor=3D"#FFFFFF">
    <p><br>
    </p>
    <br>
    <div class=3D"moz-cite-prefix">On 16/10/2017 19:07, Michael Tokarev
      wrote:<br>
    </div>
    <blockquote type=3D"cite"
      cite=3D"mid:78aed453-49b8-a9e4-ae7c-39c731158eaa@msgid.tls.msk.ru">
      <pre wrap=3D"">10.10.2017 13:22, Jim Quigley wrote:
</pre>
      <blockquote type=3D"cite">
        <pre wrap=3D"">More information is required to assist trouble-sho=
oting when
QEMU fails to initialise the event notifications for devices
assigned with VFIO-PCI. Instead of supplying the user with a cryptic
error number only, print out a proper error message with strerror()
so that the user has a better way to figure out what the problem is.

Reviewed-by: Liam Merwick <a class=3D"moz-txt-link-rfc2396E" href=3D"mail=
to:liam.merwick@oracle.com">&lt;liam.merwick@oracle.com&gt;</a>
Signed-off-by: Jim Quigley <a class=3D"moz-txt-link-rfc2396E" href=3D"mai=
lto:Jim.Quigley@oracle.com">&lt;Jim.Quigley@oracle.com&gt;</a>
---
Cc: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:qemu-trivial@non=
gnu.org">qemu-trivial@nongnu.org</a>
Cc: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:mjt@tls.msk.ru">=
mjt@tls.msk.ru</a>
Cc: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:laurent@vivier.e=
u">laurent@vivier.eu</a>
Cc: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:alex.williamson@=
redhat.com">alex.williamson@redhat.com</a>
---
 hw/vfio/pci.c | 35 ++++++++++++++++++++++++-----------
 1 file changed, 24 insertions(+), 11 deletions(-)

diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 31e1edf..3bffb93 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -430,13 +430,16 @@ static int vfio_enable_vectors(VFIOPCIDevice *vdev,=
 bool msix)
 static void vfio_add_kvm_msi_virq(VFIOPCIDevice *vdev, VFIOMSIVector *ve=
ctor,
                                   int vector_n, bool msix)
 {
-    int virq;
+    int virq, ret;
=20
     if ((msix &amp;&amp; vdev-&gt;no_kvm_msix) || (!msix &amp;&amp; vdev=
-&gt;no_kvm_msi)) {
         return;
     }
=20
-    if (event_notifier_init(&amp;vector-&gt;kvm_interrupt, 0)) {
+    ret =3D event_notifier_init(&amp;vector-&gt;kvm_interrupt, 0);
+    if (ret) {
+        error_report("vfio (%s): Error: unable to init event notifier: %=
s (%d)",
+                     __func__, strerror(-ret), -ret);
</pre>
      </blockquote>
      <pre wrap=3D"">
Since this pattern gets repeated again and again, maybe we can either
use a common wrapper or move that eror reporting into event_notifier_init=
()?
Note there are other users of this function, besides hw/vfio, and maybe
these, too, can benefit from better error reporting?</pre>
    </blockquote>
    <span id=3D"mainframespan"><tt><br>
      </tt></span><tt><span id=3D"mainframespan">=C2=A0=C2=A0=C2=A0 Ideal=
ly the
        strerror() would be included in the </span></tt><tt><span
        id=3D"mainframespan">error_report() function,</span></tt><tt><br>
    </tt><tt><span id=3D"mainframespan">=C2=A0=C2=A0=C2=A0 (as per the er=
ror_setg()
        function), which obviously would involve a more</span></tt><tt><b=
r>
    </tt><tt><span id=3D"mainframespan">=C2=A0=C2=A0=C2=A0 extensive chan=
ge to the code
        base. </span></tt><tt>Would that be an acceptable solution ?<br>
    </tt><tt><span id=3D"mainframespan"></span></tt><tt><span
        id=3D"mainframespan">=C2=A0=C2=A0=C2=A0 Or I can move the reporti=
ng into the</span></tt><tt>
      event_notifier_init() function if that is</tt><tt><br>
    </tt><tt>=C2=A0=C2=A0=C2=A0 the preferred approach ?</tt><br>
    =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 <br>
    =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 thanks<br>
    <br>
    =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 regards<br>
    <br>
    =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 Jim Q.<br>
    =C2=A0=C2=A0=C2=A0 <span id=3D"mainframespan"></span>
    <span id=3D"mainframespan"></span>
    <blockquote type=3D"cite"
      cite=3D"mid:78aed453-49b8-a9e4-ae7c-39c731158eaa@msgid.tls.msk.ru">
      <pre wrap=3D"">

Thanks,

/mjt


</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------AC770E9CCE772B8741A440C9--

