Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1W352R-0004ub-Md
	for mharc-qemu-trivial@gnu.org; Tue, 14 Jan 2014 09:32:19 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44017)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sebastian.huber@embedded-brains.de>)
	id 1W2yf7-0005U7-Uc
	for qemu-trivial@nongnu.org; Tue, 14 Jan 2014 02:43:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sebastian.huber@embedded-brains.de>)
	id 1W2yf1-0002Oa-Du
	for qemu-trivial@nongnu.org; Tue, 14 Jan 2014 02:43:49 -0500
Received: from host-82-135-62-35.customer.m-online.net ([82.135.62.35]:57915
	helo=mail.embedded-brains.de) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sebastian.huber@embedded-brains.de>)
	id 1W2yf1-0002OS-5b
	for qemu-trivial@nongnu.org; Tue, 14 Jan 2014 02:43:43 -0500
Received: by mail.embedded-brains.de (Postfix, from userid 65534)
	id 390BF652CFD; Tue, 14 Jan 2014 08:04:42 +0100 (CET)
Received: from [192.168.100.11] (unknown [192.168.100.11])
	by mail.embedded-brains.de (Postfix) with ESMTP id 55F8C652CFB;
	Tue, 14 Jan 2014 08:04:40 +0100 (CET)
Message-ID: <52D4E188.6080704@embedded-brains.de>
Date: Tue, 14 Jan 2014 08:04:40 +0100
From: Sebastian Huber <sebastian.huber@embedded-brains.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130329 Thunderbird/17.0.5
MIME-Version: 1.0
To: qemu-devel@nongnu.org
References: <CAFEAcA8DyS8ftustsMmQWGxmhMUNujVN25m+5d6XCPxQVj3d0A@mail.gmail.com>	<1385538611-8149-1-git-send-email-sebastian.huber@embedded-brains.de>
	<52A20DF6.9070801@twiddle.net>
	<52CC4250.2060107@embedded-brains.de>
In-Reply-To: <52CC4250.2060107@embedded-brains.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 82.135.62.35
X-Mailman-Approved-At: Tue, 14 Jan 2014 09:32:18 -0500
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] SPARC: Fix LEON3 power
	down instruction
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
X-List-Received-Date: Tue, 14 Jan 2014 07:43:54 -0000

Hello,

maybe this patch can be qualified as trivial?

http://lists.nongnu.org/archive/html/qemu-devel/2013-11/msg03488.html

On 2014-01-07 19:07, Sebastian Huber wrote:
> Hello,
>
> would somebody mind committing this.
>
> On 12/06/2013 06:48 PM, Richard Henderson wrote:
>> On 11/27/2013 08:50 PM, Sebastian Huber wrote:
>>> Synchronize the program counter before the power down helper call
>>> otherwise interrupts will return to the wrong context.
>>>
>>> Signed-off-by: Sebastian Huber <sebastian.huber@embedded-brains.de>
>>> ---
>>>   target-sparc/translate.c |    1 +
>>>   1 files changed, 1 insertions(+), 0 deletions(-)
>>>
>>> diff --git a/target-sparc/translate.c b/target-sparc/translate.c
>>> index 05639ef..7481c85 100644
>>> --- a/target-sparc/translate.c
>>> +++ b/target-sparc/translate.c
>>> @@ -3630,6 +3630,7 @@ static void disas_sparc_insn(DisasContext * dc,
>>> unsigned int insn)
>>>                                   if ((rd =3D=3D 0x13) && (dc->def->f=
eatures &
>>>
>>> CPU_FEATURE_POWERDOWN)) {
>>>                                       /* LEON3 power-down */
>>> +                                    save_state(dc);
>>>                                       gen_helper_power_down(cpu_env);
>>>                                   }
>>>                                   break;
>>>
>> Reviewed-by: Richard Henderson <rth@twiddle.net>
>>
>>
>> r~
>>
>
>


--=20
Sebastian Huber, embedded brains GmbH

Address : Dornierstr. 4, D-82178 Puchheim, Germany
Phone   : +49 89 189 47 41-16
Fax     : +49 89 189 47 41-09
E-Mail  : sebastian.huber@embedded-brains.de
PGP     : Public key available on request.

Diese Nachricht ist keine gesch=E4ftliche Mitteilung im Sinne des EHUG.

