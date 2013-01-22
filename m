Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TxfwN-0007tu-9u
	for mharc-qemu-trivial@gnu.org; Tue, 22 Jan 2013 10:39:11 -0500
Received: from eggs.gnu.org ([208.118.235.92]:44755)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1TxfwG-0007rN-W6
	for qemu-trivial@nongnu.org; Tue, 22 Jan 2013 10:39:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1TxfwF-0004JN-Bn
	for qemu-trivial@nongnu.org; Tue, 22 Jan 2013 10:39:04 -0500
Received: from mx1.redhat.com ([209.132.183.28]:43384)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1TxfwF-0004JC-3t; Tue, 22 Jan 2013 10:39:03 -0500
Received: from int-mx12.intmail.prod.int.phx2.redhat.com
	(int-mx12.intmail.prod.int.phx2.redhat.com [10.5.11.25])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r0MFcwSq002892
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Tue, 22 Jan 2013 10:38:59 -0500
Received: from blackfin.pond.sub.org (ovpn-116-70.ams2.redhat.com
	[10.36.116.70])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r0MF0Pm4017775; Tue, 22 Jan 2013 10:00:28 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 124B0200AA; Tue, 22 Jan 2013 16:00:25 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: KONRAD =?utf-8?B?RnLDqWTDqXJpYw==?= <fred.konrad@greensocs.com>
References: <1358357540-29862-1-git-send-email-armbru@redhat.com>
	<1358357540-29862-4-git-send-email-armbru@redhat.com>
	<20130117111951.GH2586@stefanha-thinkpad.redhat.com>
	<87fw20rllu.fsf@blackfin.pond.sub.org>
	<87y5fl1pp1.fsf@blackfin.pond.sub.org>
	<50FE995C.3080504@greensocs.com>
Date: Tue, 22 Jan 2013 16:00:24 +0100
In-Reply-To: <50FE995C.3080504@greensocs.com> ("KONRAD =?utf-8?B?RnLDqWQ=?=
	=?utf-8?B?w6lyaWMiJ3M=?= message of
	"Tue, 22 Jan 2013 14:51:24 +0100")
Message-ID: <8738xts1o7.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.25
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 03/11] hw/9pfs: Fix
	unchecked strdup() by converting to g_strdup()
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
X-List-Received-Date: Tue, 22 Jan 2013 15:39:09 -0000

KONRAD Fr=C3=A9d=C3=A9ric <fred.konrad@greensocs.com> writes:

> On 22/01/2013 11:23, Markus Armbruster wrote:
>> Markus Armbruster <armbru@redhat.com> writes:
>>
>>> Stefan Hajnoczi <stefanha@gmail.com> writes:
>>>
>>>> On Wed, Jan 16, 2013 at 06:32:12PM +0100, Markus Armbruster wrote:
>>>>> diff --git a/hw/9pfs/virtio-9p-device.c b/hw/9pfs/virtio-9p-device.c
>>>>> index 6eab7f7..74155fb 100644
>>>>> --- a/hw/9pfs/virtio-9p-device.c
>>>>> +++ b/hw/9pfs/virtio-9p-device.c
>>>>> @@ -94,7 +94,7 @@ VirtIODevice *virtio_9p_init(DeviceState *dev, V9fs=
Conf *conf)
>>>>>           exit(1);
>>>>>       }
>>>>>   -    s->tag =3D strdup(conf->tag);
>>>>> +    s->tag =3D g_strdup(conf->tag);
>>>>>       s->ctx.uid =3D -1;
>>>>>         s->ops =3D fse->ops;
>>>> s->tag is leaked.  Want to send a follow-up patch to g_free() it?
>>> I'll give it a try.
>> Mind if I wait for Fred Konrad's virtio refactoring to settle?  It
>> should make the fix easier, and avoid getting into his way with
>> pointless conflicts.
> Hi,
>
> Maybe it's due to missing exit function?
>
> Do you want me to add an exit function to g_free this conf->tag?

Yes, please!

