Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dZiCb-0006I5-E9
	for mharc-qemu-trivial@gnu.org; Mon, 24 Jul 2017 14:35:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51818)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1dZiCY-0006FD-5P
	for qemu-trivial@nongnu.org; Mon, 24 Jul 2017 14:35:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1dZiCX-0008Bi-8J
	for qemu-trivial@nongnu.org; Mon, 24 Jul 2017 14:35:30 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59472)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgilbert@redhat.com>)
	id 1dZiCR-0008Aj-3M; Mon, 24 Jul 2017 14:35:23 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CF53461B9D;
	Mon, 24 Jul 2017 18:35:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com CF53461B9D
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=dgilbert@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com CF53461B9D
Received: from work-vm (ovpn-117-120.ams2.redhat.com [10.36.117.120])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C6F7E619CD;
	Mon, 24 Jul 2017 18:35:20 +0000 (UTC)
Date: Mon, 24 Jul 2017 19:35:18 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>,
	"patches@linaro.org" <patches@linaro.org>
Message-ID: <20170724183517.GA2427@work-vm>
References: <1500309462-12792-1-git-send-email-peter.maydell@linaro.org>
	<CAFEAcA9yup9CQzst6m14oO+7JHZ2F0mkrsnUN5LLx++=9ctqMw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA9yup9CQzst6m14oO+7JHZ2F0mkrsnUN5LLx++=9ctqMw@mail.gmail.com>
User-Agent: Mutt/1.8.3 (2017-05-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Mon, 24 Jul 2017 18:35:22 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH for-2.10] hw/display/sm501:
 Don't use vmstate_register_ram_global()
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
X-List-Received-Date: Mon, 24 Jul 2017 18:35:31 -0000

* Peter Maydell (peter.maydell@linaro.org) wrote:
> Ping for review, please? Would be nice to get this into rc0.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> 
> thanks
> -- PMM
> 
> On 17 July 2017 at 17:37, Peter Maydell <peter.maydell@linaro.org> wrote:
> > The sm501 device uses vmstate_register_ram_global() to register its
> > memory region for migration.  This means it gets a name that is
> > assumed to be global to the whole system, which in turn means that if
> > you create two of the device we assert because of the duplication:
> >
> > qemu-system-ppc -device sm501 -device sm501
> > RAMBlock "sm501.local" already registered, abort!
> > Aborted (core dumped)
> >
> > Changing this to just use memory_region_init_ram()'s automatic
> > registration of the memory region with a device-local name fixes
> > this.  The downside is that it breaks migration compatibility, but
> > luckily we only added migration support to this device in the 2.10
> > release cycle so we haven't released a QEMU version with the broken
> > implementation.
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> > Recent refactoring that renamed the old "memory_region_init_ram"
> > to memory_region_init_ram_nomigrate" made this bug a bit easier
> > to find via grep...
> >
> >  hw/display/sm501.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/hw/display/sm501.c b/hw/display/sm501.c
> > index af792c5..9aa515b 100644
> > --- a/hw/display/sm501.c
> > +++ b/hw/display/sm501.c
> > @@ -1578,9 +1578,8 @@ static void sm501_init(SM501State *s, DeviceState *dev,
> >                    s->local_mem_size_index);
> >
> >      /* local memory */
> > -    memory_region_init_ram_nomigrate(&s->local_mem_region, OBJECT(dev), "sm501.local",
> > +    memory_region_init_ram(&s->local_mem_region, OBJECT(dev), "sm501.local",
> >                             get_local_mem_size(s), &error_fatal);
> > -    vmstate_register_ram_global(&s->local_mem_region);
> >      memory_region_set_log(&s->local_mem_region, true, DIRTY_MEMORY_VGA);
> >      s->local_mem = memory_region_get_ram_ptr(&s->local_mem_region);
> >
> > --P
> 
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

