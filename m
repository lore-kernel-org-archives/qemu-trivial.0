Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dzlJq-0000rG-Tl
	for mharc-qemu-trivial@gnu.org; Wed, 04 Oct 2017 11:10:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56366)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1dzlJl-0000oT-Fn
	for qemu-trivial@nongnu.org; Wed, 04 Oct 2017 11:10:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1dzlJg-0002hl-MP
	for qemu-trivial@nongnu.org; Wed, 04 Oct 2017 11:10:37 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45440)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kwolf@redhat.com>)
	id 1dzlJO-0002Ld-9X; Wed, 04 Oct 2017 11:10:14 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1FB863D948;
	Wed,  4 Oct 2017 15:10:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 1FB863D948
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=kwolf@redhat.com
Received: from localhost.localdomain (ovpn-117-103.ams2.redhat.com
	[10.36.117.103])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9F3855E1A7;
	Wed,  4 Oct 2017 15:10:11 +0000 (UTC)
Date: Wed, 4 Oct 2017 17:10:09 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org, qemu-block@nongnu.org,
	Max Reitz <mreitz@redhat.com>
Message-ID: <20171004151009.GC9801@localhost.localdomain>
References: <1507024644-14853-1-git-send-email-thuth@redhat.com>
	<56ac2027-6aa5-6dc9-f2e3-3de54fe8f230@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <56ac2027-6aa5-6dc9-f2e3-3de54fe8f230@redhat.com>
User-Agent: Mutt/1.9.0 (2017-09-02)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Wed, 04 Oct 2017 15:10:13 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] hw/block/onenand: Remove dead code block
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
X-List-Received-Date: Wed, 04 Oct 2017 15:10:42 -0000

Am 03.10.2017 um 12:25 hat Laurent Vivier geschrieben:
> On 03/10/2017 11:57, Thomas Huth wrote:
> > The condition of the for-loop makes sure that b is always smaller
> > than s->blocks, so the "if (b >= s->blocks)" statement is completely
> > superfluous here.
> > 
> > Buglink: https://bugs.launchpad.net/qemu/+bug/1715007
> > Signed-off-by: Thomas Huth <thuth@redhat.com>
> > ---
> >  hw/block/onenand.c | 4 ----
> >  1 file changed, 4 deletions(-)
> > 
> > diff --git a/hw/block/onenand.c b/hw/block/onenand.c
> > index 30e40f3..de65c9e 100644
> > --- a/hw/block/onenand.c
> > +++ b/hw/block/onenand.c
> > @@ -520,10 +520,6 @@ static void onenand_command(OneNANDState *s)
> >          s->intstatus |= ONEN_INT;
> >  
> >          for (b = 0; b < s->blocks; b ++) {
> > -            if (b >= s->blocks) {
> > -                s->status |= ONEN_ERR_CMD;
> > -                break;
> > -            }
> >              if (s->blockwp[b] == ONEN_LOCK_LOCKTIGHTEN)
> >                  break;
> >  
> > 
> 
> Looks like a bad cut'n'paste from case 0x23.
> 
> Reviewed-by: Laurent Vivier <lvivier@redhat.com>

Thanks, applied to the block branch.

Kevin

