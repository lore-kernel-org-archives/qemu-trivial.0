Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1U4uEM-0000Rk-8T
	for mharc-qemu-trivial@gnu.org; Mon, 11 Feb 2013 09:19:38 -0500
Received: from eggs.gnu.org ([208.118.235.92]:45265)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1U4uEJ-0000Iy-Mg
	for qemu-trivial@nongnu.org; Mon, 11 Feb 2013 09:19:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1U4uEI-00017k-Dn
	for qemu-trivial@nongnu.org; Mon, 11 Feb 2013 09:19:35 -0500
Received: from cantor2.suse.de ([195.135.220.15]:33090 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1U4uEC-00016u-Eb; Mon, 11 Feb 2013 09:19:28 -0500
Received: from relay1.suse.de (unknown [195.135.220.254])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx2.suse.de (Postfix) with ESMTP id E6FC9A4C0E;
	Mon, 11 Feb 2013 15:19:27 +0100 (CET)
Message-ID: <5118FDE9.2000101@suse.de>
Date: Mon, 11 Feb 2013 15:19:21 +0100
From: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130105 Thunderbird/17.0.2
MIME-Version: 1.0
To: Markus Armbruster <armbru@redhat.com>
References: <1360534332-6549-1-git-send-email-hpoussin@reactos.org>
	<20130211132727.GC6491@stefanha-thinkpad.redhat.com>
	<5118F322.709@redhat.com> <87k3qf9cg8.fsf@blackfin.pond.sub.org>
In-Reply-To: <87k3qf9cg8.fsf@blackfin.pond.sub.org>
X-Enigmail-Version: 1.5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x
X-Received-From: 195.135.220.15
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
	Anthony Liguori <aliguori@us.ibm.com>, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org, Blue Swirl <blauwirbel@gmail.com>,
	=?UTF-8?B?SGVy?= =?UTF-8?B?dsOpIFBvdXNzaW5lYXU=?= <hpoussin@reactos.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] ide: log error when trying
 to use ATAPI overlapping features
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
X-List-Received-Date: Mon, 11 Feb 2013 14:19:37 -0000

Am 11.02.2013 15:01, schrieb Markus Armbruster:
> Kevin Wolf <kwolf@redhat.com> writes:
>=20
>> Am 11.02.2013 14:27, schrieb Stefan Hajnoczi:
>>> On Sun, Feb 10, 2013 at 11:12:11PM +0100, Herv=C3=A9 Poussineau wrote=
:
>>>>
>>>> Signed-off-by: Herv=C3=A9 Poussineau <hpoussin@reactos.org>
>>>> ---
>>>>  hw/ide/core.c |    4 +++-
>>>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/hw/ide/core.c b/hw/ide/core.c
>>>> index 3743dc3..f0ab1a8 100644
>>>> --- a/hw/ide/core.c
>>>> +++ b/hw/ide/core.c
>>>> @@ -1394,8 +1394,10 @@ void ide_exec_cmd(IDEBus *bus, uint32_t val)
>>>>          break;
>>>>      case WIN_PACKETCMD:
>>>>          /* overlapping commands not supported */
>>>> -        if (s->feature & 0x02)
>>>> +        if (s->feature & 0x02) {
>>>> +            qemu_log_mask(LOG_UNIMP, "ide: overlapping command not =
supported");
>>>
>>> qemu_log_*() isn't used much in hw/.
>>>
>>> I think we need to side-track this patch email to figure out what to
>>> use:
>>>
>>> fprintf(stderr) - some warnings/errors use this
>>> error_report() - goes to the monitor, if possible, otherwise stderr
>>
>> These look wrong to me.
>=20
> "Wrong" is a bit strong, in particular since there's ample precedence
> for these uses.
>=20
>>> qemu_log_*() - goes to the qemu log, seems a little TCG-centric
>>
>> I would suggest either this or just trace points. (And by the way, it'=
s
>> a pity that -d is so TCG-centric, it's been more than once the reason
>> why I disabled KVM when debugging a guest... Having at least -d int
>> would be so useful.)
>=20
> Tracepoints don't really fit when we want to report the guest does
> something we don't handle.  Users deserve fair warning then, don't they=
?
>=20
> Could qemu_log() & friends be made fit for general use?  What's missing=
?

Blue already did some work to make it more usable, and I believe Peter
adopted LOG_UNIMPL for ARM devices in place of hw_error(), which is
another reporting option people have chosen in the past (but which
allows a guest to exit the QEMU process).

Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=C3=B6rffer; HRB 16746 AG N=C3=BC=
rnberg

