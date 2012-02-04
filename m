Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RtenI-0007ah-8p
	for mharc-qemu-trivial@gnu.org; Sat, 04 Feb 2012 07:32:40 -0500
Received: from eggs.gnu.org ([140.186.70.92]:33457)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>) id 1RtenE-0007QC-FL
	for qemu-trivial@nongnu.org; Sat, 04 Feb 2012 07:32:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>) id 1RtenD-0007Mu-6t
	for qemu-trivial@nongnu.org; Sat, 04 Feb 2012 07:32:36 -0500
Received: from mail-iy0-f173.google.com ([209.85.210.173]:47698)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>)
	id 1RtenB-0007MZ-Ai; Sat, 04 Feb 2012 07:32:33 -0500
Received: by iahk25 with SMTP id k25so7515422iah.4
	for <multiple recipients>; Sat, 04 Feb 2012 04:32:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=BxwPG8/x+wwN81+sNpE5qdTjX3fweTdPLT8FdA6RSt0=;
	b=EAiw9JO84lSV2TCfReZnhOzGA0oy+AR+rvH3hqZhPTofIv6bIt15ufqRhmwiIhsqLx
	+1sXsImSr82j0GdHKnM7oQS/qCW4iVbETDlM3EAnStyKeciuEKLUErRuQ8LFWf2knrbf
	hq0WACIAwYtZkTeGYRQ07rKxMFIjDzCLfJ3K8=
Received: by 10.42.165.135 with SMTP id k7mr12101970icy.32.1328358752322; Sat,
	04 Feb 2012 04:32:32 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.15.167 with HTTP; Sat, 4 Feb 2012 04:32:12 -0800 (PST)
In-Reply-To: <4F2D2352.80204@web.de>
References: <4F2BCCBD.8050009@siemens.com>
	<CAAu8pHvB_cG6KWaq350-ZAdsAiBr+m2FCSzuAX3LAYUdDUHX5A@mail.gmail.com>
	<4F2D2352.80204@web.de>
From: Blue Swirl <blauwirbel@gmail.com>
Date: Sat, 4 Feb 2012 12:32:12 +0000
Message-ID: <CAAu8pHvBnW2v-q9YG57m0SH9BShbeyor+NY-TjGiT6Cj=f9kRQ@mail.gmail.com>
To: Jan Kiszka <jan.kiszka@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.210.173
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>,
	Avi Kivity <avi@redhat.com>
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
X-List-Received-Date: Sat, 04 Feb 2012 12:32:37 -0000

On Sat, Feb 4, 2012 at 12:23, Jan Kiszka <jan.kiszka@web.de> wrote:
> On 2012-02-04 13:12, Blue Swirl wrote:
>> On Fri, Feb 3, 2012 at 12:02, Jan Kiszka <jan.kiszka@siemens.com> wrote:
>>> Helpful to understand guest configurations of things like the i440FX's
>>> PAM.
>>>
>>> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
>>> ---
>>> =C2=A0memory.c | =C2=A0 =C2=A06 ++++--
>>> =C2=A01 files changed, 4 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/memory.c b/memory.c
>>> index ee4c98a..ea4adda 100644
>>> --- a/memory.c
>>> +++ b/memory.c
>>> @@ -1608,23 +1608,25 @@ static void mtree_print_mr(fprintf_function mon=
_printf, void *f,
>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ml->printed =3D false;
>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 QTAILQ_INSERT_TAIL(alias_prin=
t_queue, ml, queue);
>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
>>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0mon_printf(f, TARGET_FMT_plx "-" TARGET_FM=
T_plx " (prio %d): alias %s @%s "
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0mon_printf(f, TARGET_FMT_plx "-" TARGET_FM=
T_plx " (prio %d, %s): alias %s @%s "
>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TA=
RGET_FMT_plx "-" TARGET_FMT_plx "\n",
>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ba=
se + mr->addr,
>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ba=
se + mr->addr
>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+ =
(target_phys_addr_t)int128_get64(mr->size) - 1,
>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mr=
->priority,
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mr->re=
adonly ? "RO" : "RW",
>>
>> I think the reserved regions which are unreadable and unwritable
>> should be shown as well. Then the output should be a combination of
>> 'R', 'W' or neither ('-').
>
> Reserved regions are in the hand of some other device model (so far only
> the KVM kernel). That says nothing about their R/W property. If we ever
> have a reserved region that is not writable, the owner could still set
> the corresponding flag for documentation purposes.

OK. But it's also possible for a region to have readable =3D=3D false
while readonly =3D=3D false, which would imply 'WO' or '-W'. That also
supports separate 'R', 'W' and '-' flags.

