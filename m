Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VBQNs-0005w9-9k
	for mharc-qemu-trivial@gnu.org; Mon, 19 Aug 2013 10:24:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33269)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1VBQNl-0005hJ-9Q
	for qemu-trivial@nongnu.org; Mon, 19 Aug 2013 10:24:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1VBQNf-00034H-Ob
	for qemu-trivial@nongnu.org; Mon, 19 Aug 2013 10:24:33 -0400
Received: from cantor2.suse.de ([195.135.220.15]:36454 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1VBQNT-0002yO-7E; Mon, 19 Aug 2013 10:24:15 -0400
Received: from relay1.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id ABAC4A5464;
	Mon, 19 Aug 2013 16:24:08 +0200 (CEST)
Message-ID: <52122A86.1050605@suse.de>
Date: Mon, 19 Aug 2013 16:24:06 +0200
From: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130801 Thunderbird/17.0.8
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <1375447708-14545-1-git-send-email-chouteau@adacore.com>
	<1375447708-14545-2-git-send-email-chouteau@adacore.com>
	<5211D6C3.2000609@adacore.com>
	<CAFEAcA8rOis5qsqL-Oq-PCKR9icBsxsL1tJGGsLJfJtgXwL2UQ@mail.gmail.com>
In-Reply-To: <CAFEAcA8rOis5qsqL-Oq-PCKR9icBsxsL1tJGGsLJfJtgXwL2UQ@mail.gmail.com>
X-Enigmail-Version: 1.5.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x
X-Received-From: 195.135.220.15
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, lcapitulino@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 2/2] Add ARM registers
 definitions in Monitor commands
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
X-List-Received-Date: Mon, 19 Aug 2013 14:24:39 -0000

Am 19.08.2013 10:31, schrieb Peter Maydell:
> On 19 August 2013 09:26, Fabien Chouteau <chouteau@adacore.com> wrote:
>> Any comments?
>>
>> Regards,
>>
>> On 08/02/2013 02:48 PM, Fabien Chouteau wrote:
>>> Signed-off-by: Fabien Chouteau <chouteau@adacore.com>
>>> ---
>>>  monitor.c |   17 +++++++++++++++++
>>>  1 file changed, 17 insertions(+)
>>>
>>> diff --git a/monitor.c b/monitor.c
>>> index 5dc0aa9..78e93af 100644
>>> --- a/monitor.c
>>> +++ b/monitor.c
>>> @@ -3167,6 +3167,23 @@ static const MonitorDef monitor_defs[] =3D {
>>>      { "cleanwin", offsetof(CPUSPARCState, cleanwin) },
>>>      { "fprs", offsetof(CPUSPARCState, fprs) },
>>>  #endif
>>> +#elif defined(TARGET_ARM)
>>> +    { "r0",     offsetof(CPUARMState, regs[0])  },
>>> +    { "r1",     offsetof(CPUARMState, regs[1])  },
>=20
> Rather than adding yet another entry to this target-ifdef
> ladder in common code, maybe we can abstract this out to be
> a method/field of the CPU object?
>=20
> Andreas can probably suggest the best approach.

I had similar thoughts when I first saw this patch... I haven't looked
closely into monitor yet though (other than seeing it has too much
target dependencies).

Either a MonitorDef* field (null-terminating the array then) or,
depending on where/how this is used, a method in CPUClass might be
options to better abstract this. Given that there is going to be a
little bit of time before 1.7 now we could take some time to rethink our
design.

A related question that remained unanswered for the Program Counter in
the gdbstub context was whether we want QOM properties for such
registers, which would hint at further abstracting such a register list
to reuse it outside monitor.

Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=C3=B6rffer; HRB 16746 AG N=C3=BC=
rnberg

