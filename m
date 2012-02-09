Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RvQD6-0007Pc-Cv
	for mharc-qemu-trivial@gnu.org; Thu, 09 Feb 2012 04:22:36 -0500
Received: from eggs.gnu.org ([140.186.70.92]:45004)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RvQCz-0007Ob-H2
	for qemu-trivial@nongnu.org; Thu, 09 Feb 2012 04:22:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RvQCy-0007jr-8H
	for qemu-trivial@nongnu.org; Thu, 09 Feb 2012 04:22:29 -0500
Received: from mail-wi0-f173.google.com ([209.85.212.173]:36360)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1RvQCy-0007i1-3B; Thu, 09 Feb 2012 04:22:28 -0500
Received: by mail-wi0-f173.google.com with SMTP id hi20so1152830wib.4
	for <multiple recipients>; Thu, 09 Feb 2012 01:22:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=+JLZ9U4cS/Cd/9NChfyZOfloqVn63o5hkfz9FANY6F0=;
	b=dFIfwZr2EacUlXwU86AyNuFnTvrbPDnr6FrWrYtCh+soiOJBUNL3wE4qCAxf3VbtGf
	pEqo6cJKLD7JemjeO0+lnxNvz5a7xdb+TM6PUIu65GQ6nqYs1ooIfXINXZSkPhneTpbe
	hTfD+UXc9ER4q6lL1Ec/ENT5U3B5R4S6/8DIs=
Received: by 10.180.82.227 with SMTP id l3mr1520318wiy.1.1328779347378;
	Thu, 09 Feb 2012 01:22:27 -0800 (PST)
Received: from localhost (gbibp9ph1--blueice2n1.emea.ibm.com. [195.212.29.75])
	by mx.google.com with ESMTPS id eq5sm6053995wib.2.2012.02.09.01.22.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 09 Feb 2012 01:22:26 -0800 (PST)
Date: Thu, 9 Feb 2012 08:35:13 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <20120209083513.GA30956@stefanha-thinkpad.localdomain>
References: <4F2BCCBD.8050009@siemens.com>
	<CAAu8pHvB_cG6KWaq350-ZAdsAiBr+m2FCSzuAX3LAYUdDUHX5A@mail.gmail.com>
	<4F2D2352.80204@web.de>
	<CAAu8pHvBnW2v-q9YG57m0SH9BShbeyor+NY-TjGiT6Cj=f9kRQ@mail.gmail.com>
	<4F2D45FF.9070204@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4F2D45FF.9070204@web.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.212.173
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
X-List-Received-Date: Thu, 09 Feb 2012 09:22:35 -0000

On Sat, Feb 04, 2012 at 03:51:43PM +0100, Jan Kiszka wrote:
> On 2012-02-04 13:32, Blue Swirl wrote:
> > On Sat, Feb 4, 2012 at 12:23, Jan Kiszka <jan.kiszka@web.de> wrote:
> >> On 2012-02-04 13:12, Blue Swirl wrote:
> >>> On Fri, Feb 3, 2012 at 12:02, Jan Kiszka <jan.kiszka@siemens.com> wrote:
> >>>> Helpful to understand guest configurations of things like the i440FX's
> >>>> PAM.
> >>>>
> >>>> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
> >>>> ---
> >>>>  memory.c |    6 ++++--
> >>>>  1 files changed, 4 insertions(+), 2 deletions(-)
> >>>>
> >>>> diff --git a/memory.c b/memory.c
> >>>> index ee4c98a..ea4adda 100644
> >>>> --- a/memory.c
> >>>> +++ b/memory.c
> >>>> @@ -1608,23 +1608,25 @@ static void mtree_print_mr(fprintf_function mon_printf, void *f,
> >>>>             ml->printed = false;
> >>>>             QTAILQ_INSERT_TAIL(alias_print_queue, ml, queue);
> >>>>         }
> >>>> -        mon_printf(f, TARGET_FMT_plx "-" TARGET_FMT_plx " (prio %d): alias %s @%s "
> >>>> +        mon_printf(f, TARGET_FMT_plx "-" TARGET_FMT_plx " (prio %d, %s): alias %s @%s "
> >>>>                    TARGET_FMT_plx "-" TARGET_FMT_plx "\n",
> >>>>                    base + mr->addr,
> >>>>                    base + mr->addr
> >>>>                    + (target_phys_addr_t)int128_get64(mr->size) - 1,
> >>>>                    mr->priority,
> >>>> +                   mr->readonly ? "RO" : "RW",
> >>>
> >>> I think the reserved regions which are unreadable and unwritable
> >>> should be shown as well. Then the output should be a combination of
> >>> 'R', 'W' or neither ('-').
> >>
> >> Reserved regions are in the hand of some other device model (so far only
> >> the KVM kernel). That says nothing about their R/W property. If we ever
> >> have a reserved region that is not writable, the owner could still set
> >> the corresponding flag for documentation purposes.
> > 
> > OK. But it's also possible for a region to have readable == false
> > while readonly == false, which would imply 'WO' or '-W'. That also
> > supports separate 'R', 'W' and '-' flags.
> 
> Yep, I encoded the ROM device state as well. And this revealed a
> regression of the memory region conversion of the cfi02. Gave up
> counting how often I fixed this type of bug in the flash code.

Is this patch ready to go?  Seems fine to me but do you still want to
add the 'WO' output that Blue Swirl suggested?

Stefan

