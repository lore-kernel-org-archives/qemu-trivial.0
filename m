Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RvSau-0007BM-Be
	for mharc-qemu-trivial@gnu.org; Thu, 09 Feb 2012 06:55:20 -0500
Received: from eggs.gnu.org ([140.186.70.92]:38779)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RvSam-0006nO-Bm
	for qemu-trivial@nongnu.org; Thu, 09 Feb 2012 06:55:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RvSah-00081p-UZ
	for qemu-trivial@nongnu.org; Thu, 09 Feb 2012 06:55:11 -0500
Received: from mail-lpp01m020-f173.google.com ([209.85.217.173]:56650)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1RvSaW-0007vd-OE; Thu, 09 Feb 2012 06:54:56 -0500
Received: by lbbgf7 with SMTP id gf7so811418lbb.4
	for <multiple recipients>; Thu, 09 Feb 2012 03:54:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=Ci3zuxkBlDop2ASHdrDMVKO4WSX5XsGrg7e0062arSU=;
	b=NQpmLWGsh09rwT+cJtX8V+12ScMaWL4wtyP9o3xktb2447U8KpSgGhHOHBWVV3vUgl
	+BSHMN6ORSlpVJZITOcWspAhW+zynWp+l1ie+ls4ETJG9Rt87I9h5fick57ECSvl1q+z
	ZTNZmZsTNi2Z9zoApSffjJEji/PCqgRkxgrc8=
MIME-Version: 1.0
Received: by 10.152.112.132 with SMTP id iq4mr948275lab.28.1328788494452; Thu,
	09 Feb 2012 03:54:54 -0800 (PST)
Received: by 10.112.29.233 with HTTP; Thu, 9 Feb 2012 03:54:54 -0800 (PST)
In-Reply-To: <4F339B0A.3070601@web.de>
References: <4F2BCCBD.8050009@siemens.com>
	<CAAu8pHvB_cG6KWaq350-ZAdsAiBr+m2FCSzuAX3LAYUdDUHX5A@mail.gmail.com>
	<4F2D2352.80204@web.de>
	<CAAu8pHvBnW2v-q9YG57m0SH9BShbeyor+NY-TjGiT6Cj=f9kRQ@mail.gmail.com>
	<4F2D45FF.9070204@web.de>
	<20120209083513.GA30956@stefanha-thinkpad.localdomain>
	<4F339B0A.3070601@web.de>
Date: Thu, 9 Feb 2012 11:54:54 +0000
Message-ID: <CAJSP0QX3K9MJz-roVX3FZo2gdaeWRwJHvFgsOYa_C8f2WuGg8A@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Jan Kiszka <jan.kiszka@web.de>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.217.173
Cc: Blue Swirl <blauwirbel@gmail.com>, qemu-trivial <qemu-trivial@nongnu.org>,
	qemu-devel <qemu-devel@nongnu.org>, Avi Kivity <avi@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH] memory-region: Report if region is
 read-only on info mtree
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
X-List-Received-Date: Thu, 09 Feb 2012 11:55:18 -0000

On Thu, Feb 9, 2012 at 10:08 AM, Jan Kiszka <jan.kiszka@web.de> wrote:
> On 2012-02-09 09:35, Stefan Hajnoczi wrote:
>> On Sat, Feb 04, 2012 at 03:51:43PM +0100, Jan Kiszka wrote:
>>> On 2012-02-04 13:32, Blue Swirl wrote:
>>>> On Sat, Feb 4, 2012 at 12:23, Jan Kiszka <jan.kiszka@web.de> wrote:
>>>>> On 2012-02-04 13:12, Blue Swirl wrote:
>>>>>> On Fri, Feb 3, 2012 at 12:02, Jan Kiszka <jan.kiszka@siemens.com> wr=
ote:
>>>>>>> Helpful to understand guest configurations of things like the i440F=
X's
>>>>>>> PAM.
>>>>>>>
>>>>>>> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
>>>>>>> ---
>>>>>>> =A0memory.c | =A0 =A06 ++++--
>>>>>>> =A01 files changed, 4 insertions(+), 2 deletions(-)
>>>>>>>
>>>>>>> diff --git a/memory.c b/memory.c
>>>>>>> index ee4c98a..ea4adda 100644
>>>>>>> --- a/memory.c
>>>>>>> +++ b/memory.c
>>>>>>> @@ -1608,23 +1608,25 @@ static void mtree_print_mr(fprintf_function=
 mon_printf, void *f,
>>>>>>> =A0 =A0 =A0 =A0 =A0 =A0 ml->printed =3D false;
>>>>>>> =A0 =A0 =A0 =A0 =A0 =A0 QTAILQ_INSERT_TAIL(alias_print_queue, ml, q=
ueue);
>>>>>>> =A0 =A0 =A0 =A0 }
>>>>>>> - =A0 =A0 =A0 =A0mon_printf(f, TARGET_FMT_plx "-" TARGET_FMT_plx " =
(prio %d): alias %s @%s "
>>>>>>> + =A0 =A0 =A0 =A0mon_printf(f, TARGET_FMT_plx "-" TARGET_FMT_plx " =
(prio %d, %s): alias %s @%s "
>>>>>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0TARGET_FMT_plx "-" TARGET_FM=
T_plx "\n",
>>>>>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0base + mr->addr,
>>>>>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0base + mr->addr
>>>>>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0+ (target_phys_addr_t)int128=
_get64(mr->size) - 1,
>>>>>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0mr->priority,
>>>>>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 mr->readonly ? "RO" : "RW",
>>>>>>
>>>>>> I think the reserved regions which are unreadable and unwritable
>>>>>> should be shown as well. Then the output should be a combination of
>>>>>> 'R', 'W' or neither ('-').
>>>>>
>>>>> Reserved regions are in the hand of some other device model (so far o=
nly
>>>>> the KVM kernel). That says nothing about their R/W property. If we ev=
er
>>>>> have a reserved region that is not writable, the owner could still se=
t
>>>>> the corresponding flag for documentation purposes.
>>>>
>>>> OK. But it's also possible for a region to have readable =3D=3D false
>>>> while readonly =3D=3D false, which would imply 'WO' or '-W'. That also
>>>> supports separate 'R', 'W' and '-' flags.
>>>
>>> Yep, I encoded the ROM device state as well. And this revealed a
>>> regression of the memory region conversion of the cfi02. Gave up
>>> counting how often I fixed this type of bug in the flash code.
>>
>> Is this patch ready to go? =A0Seems fine to me but do you still want to
>> add the 'WO' output that Blue Swirl suggested?
>
> There is v2 on the list, but I removed trival from CC due to the
> discussion. Needs an ack from Blue, I think.

Okay, I missed it.  Thanks for the update!

Stefan

