Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eE8Mh-0005Gn-Uq
	for mharc-qemu-trivial@gnu.org; Mon, 13 Nov 2017 01:37:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35408)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1eE8Mb-0005DG-Qb
	for qemu-trivial@nongnu.org; Mon, 13 Nov 2017 01:37:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1eE8Ma-0002BL-OI
	for qemu-trivial@nongnu.org; Mon, 13 Nov 2017 01:36:57 -0500
Received: from mx1.redhat.com ([209.132.183.28]:41070)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1eE8MT-000293-2n; Mon, 13 Nov 2017 01:36:49 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1897C49010;
	Mon, 13 Nov 2017 06:36:47 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-30.ams2.redhat.com
	[10.36.116.30])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7146218947;
	Mon, 13 Nov 2017 06:36:43 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id E05AE1138647; Mon, 13 Nov 2017 07:36:41 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Jim Quigley <jim.quigley@oracle.com>
Cc: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org, alex.williamson@redhat.com, laurent@vivier.eu
References: <1507630928-28307-1-git-send-email-Jim.Quigley@oracle.com>
	<78aed453-49b8-a9e4-ae7c-39c731158eaa@msgid.tls.msk.ru>
	<1c3087f3-9019-26b3-b4be-df71da2033fc@oracle.com>
Date: Mon, 13 Nov 2017 07:36:41 +0100
In-Reply-To: <1c3087f3-9019-26b3-b4be-df71da2033fc@oracle.com> (Jim Quigley's
	message of "Fri, 10 Nov 2017 10:03:07 +0000")
Message-ID: <8760aey9ae.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Mon, 13 Nov 2017 06:36:47 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] hw/vfio: improve error
 message when cannot init vfio event notifiers
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
X-List-Received-Date: Mon, 13 Nov 2017 06:37:02 -0000

Jim Quigley <jim.quigley@oracle.com> writes:

> On 16/10/2017 19:07, Michael Tokarev wrote:
>> 10.10.2017 13:22, Jim Quigley wrote:
>>> More information is required to assist trouble-shooting when
>>> QEMU fails to initialise the event notifications for devices
>>> assigned with VFIO-PCI. Instead of supplying the user with a cryptic
>>> error number only, print out a proper error message with strerror()
>>> so that the user has a better way to figure out what the problem is.
>>>
>>> Reviewed-by: Liam Merwick <liam.merwick@oracle.com>
>>> Signed-off-by: Jim Quigley <Jim.Quigley@oracle.com>
>>> ---
>>> Cc: qemu-trivial@nongnu.org
>>> Cc: mjt@tls.msk.ru
>>> Cc: laurent@vivier.eu
>>> Cc: alex.williamson@redhat.com
>>> ---
>>>   hw/vfio/pci.c | 35 ++++++++++++++++++++++++-----------
>>>   1 file changed, 24 insertions(+), 11 deletions(-)
>>>
>>> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
>>> index 31e1edf..3bffb93 100644
>>> --- a/hw/vfio/pci.c
>>> +++ b/hw/vfio/pci.c
>>> @@ -430,13 +430,16 @@ static int vfio_enable_vectors(VFIOPCIDevice *vde=
v, bool msix)
>>>   static void vfio_add_kvm_msi_virq(VFIOPCIDevice *vdev, VFIOMSIVector =
*vector,
>>>                                     int vector_n, bool msix)
>>>   {
>>> -    int virq;
>>> +    int virq, ret;
>>>         if ((msix && vdev->no_kvm_msix) || (!msix &&
>>> vdev->no_kvm_msi)) {
>>>           return;
>>>       }
>>>   -    if (event_notifier_init(&vector->kvm_interrupt, 0)) {
>>> +    ret =3D event_notifier_init(&vector->kvm_interrupt, 0);
>>> +    if (ret) {
>>> +        error_report("vfio (%s): Error: unable to init event notifier:=
 %s (%d)",
>>> +                     __func__, strerror(-ret), -ret);
>> Since this pattern gets repeated again and again, maybe we can either

Parts of it are anti-patterns:

* Error messages are by definition meant for the user.  If you feel you
  need to include __func__ so it makes sense, you're obviously failing
  to address the end user.

* Likewise for the numeric encoding of errno.

* Printing "Error: " or similar is error_report()'s job.

That leaves printing strerror().

>> use a common wrapper or move that eror reporting into event_notifier_ini=
t()?
>> Note there are other users of this function, besides hw/vfio, and maybe
>> these, too, can benefit from better error reporting?
>
> =C2=A0=C2=A0=C2=A0 Ideally the strerror() would be included in the error_=
report()
> function,
> =C2=A0=C2=A0=C2=A0 (as per the error_setg() function), which obviously wo=
uld involve
> a more
> =C2=A0=C2=A0=C2=A0 extensive change to the code base. Would that be an ac=
ceptable
> solution ?

All existing uses error_report() that print strerror() would have to be
converted to the new function.  Same for error_vreport(), warn_report(),
...  Whether that's worthwhile is not obvious until we see patches.

> =C2=A0=C2=A0=C2=A0 Or I can move the reporting into theevent_notifier_ini=
t() function
> if that is
> =C2=A0=C2=A0=C2=A0 the preferred approach ?

Moving error_report() into event_notifier_init() makes it unusable in
contexts where error_report() is unwanted or wrong.

