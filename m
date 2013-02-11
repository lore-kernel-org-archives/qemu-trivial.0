Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1U4tx8-0001uX-Mf
	for mharc-qemu-trivial@gnu.org; Mon, 11 Feb 2013 09:01:50 -0500
Received: from eggs.gnu.org ([208.118.235.92]:38882)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1U4tx5-0001i4-1q
	for qemu-trivial@nongnu.org; Mon, 11 Feb 2013 09:01:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1U4twz-0005QL-B5
	for qemu-trivial@nongnu.org; Mon, 11 Feb 2013 09:01:46 -0500
Received: from mx1.redhat.com ([209.132.183.28]:43246)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1U4twp-0005PE-Jk; Mon, 11 Feb 2013 09:01:31 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r1BE1TQJ007050
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 11 Feb 2013 09:01:29 -0500
Received: from blackfin.pond.sub.org (ovpn-116-78.ams2.redhat.com
	[10.36.116.78])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r1BE1Sij021698; Mon, 11 Feb 2013 09:01:29 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 0EEE7200AA; Mon, 11 Feb 2013 15:01:28 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
References: <1360534332-6549-1-git-send-email-hpoussin@reactos.org>
	<20130211132727.GC6491@stefanha-thinkpad.redhat.com>
	<5118F322.709@redhat.com>
Date: Mon, 11 Feb 2013 15:01:27 +0100
In-Reply-To: <5118F322.709@redhat.com> (Kevin Wolf's message of "Mon, 11 Feb
	2013 14:33:22 +0100")
Message-ID: <87k3qf9cg8.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: Anthony Liguori <aliguori@us.ibm.com>, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org, Blue Swirl <blauwirbel@gmail.com>,
	=?utf-8?Q?Herv=C3=A9?= Poussineau <hpoussin@reactos.org>
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
X-List-Received-Date: Mon, 11 Feb 2013 14:01:49 -0000

Kevin Wolf <kwolf@redhat.com> writes:

> Am 11.02.2013 14:27, schrieb Stefan Hajnoczi:
>> On Sun, Feb 10, 2013 at 11:12:11PM +0100, Herv=C3=A9 Poussineau wrote:
>>>
>>> Signed-off-by: Herv=C3=A9 Poussineau <hpoussin@reactos.org>
>>> ---
>>>  hw/ide/core.c |    4 +++-
>>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/hw/ide/core.c b/hw/ide/core.c
>>> index 3743dc3..f0ab1a8 100644
>>> --- a/hw/ide/core.c
>>> +++ b/hw/ide/core.c
>>> @@ -1394,8 +1394,10 @@ void ide_exec_cmd(IDEBus *bus, uint32_t val)
>>>          break;
>>>      case WIN_PACKETCMD:
>>>          /* overlapping commands not supported */
>>> -        if (s->feature & 0x02)
>>> +        if (s->feature & 0x02) {
>>> +            qemu_log_mask(LOG_UNIMP, "ide: overlapping command not sup=
ported");
>>=20
>> qemu_log_*() isn't used much in hw/.
>>=20
>> I think we need to side-track this patch email to figure out what to
>> use:
>>=20
>> fprintf(stderr) - some warnings/errors use this
>> error_report() - goes to the monitor, if possible, otherwise stderr
>
> These look wrong to me.

"Wrong" is a bit strong, in particular since there's ample precedence
for these uses.

>> qemu_log_*() - goes to the qemu log, seems a little TCG-centric
>
> I would suggest either this or just trace points. (And by the way, it's
> a pity that -d is so TCG-centric, it's been more than once the reason
> why I disabled KVM when debugging a guest... Having at least -d int
> would be so useful.)

Tracepoints don't really fit when we want to report the guest does
something we don't handle.  Users deserve fair warning then, don't they?

Could qemu_log() & friends be made fit for general use?  What's missing?

