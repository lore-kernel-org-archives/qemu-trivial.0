Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YsSOx-0008OC-3N
	for mharc-qemu-trivial@gnu.org; Wed, 13 May 2015 04:52:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41824)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1YsSOv-0008Mn-Fn
	for qemu-trivial@nongnu.org; Wed, 13 May 2015 04:52:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1YsSOu-0003gD-Hs
	for qemu-trivial@nongnu.org; Wed, 13 May 2015 04:52:25 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35548)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>)
	id 1YsSOp-0003ak-7H; Wed, 13 May 2015 04:52:19 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id A9B9FC4080;
	Wed, 13 May 2015 08:52:18 +0000 (UTC)
Received: from localhost (dhcp-14-155.nay.redhat.com [10.66.14.155])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t4D8qGON009374; Wed, 13 May 2015 04:52:17 -0400
Date: Wed, 13 May 2015 16:52:16 +0800
From: Fam Zheng <famz@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20150513085216.GA30644@ad.nay.redhat.com>
References: <1431522928-5292-1-git-send-email-famz@redhat.com>
	<55530EAD.5070104@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <55530EAD.5070104@redhat.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] iscsi: Remove pointless
 runtime check of macro value
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
X-List-Received-Date: Wed, 13 May 2015 08:52:26 -0000

On Wed, 05/13 10:43, Paolo Bonzini wrote:
> 
> 
> On 13/05/2015 15:15, Fam Zheng wrote:
> > raw_bsd already has QEMU_BUILD_BUG_ON(BDRV_SECTOR_SIZE != 512), so iscsi
> > should relax.
> 
> It's okay to have the same QEMU_BUILD_BUG_ON in different places.
> However, you're right that this should be a compile-time check rather
> than run-time check.

I agree with you, but I can't imaging this value could ever change, so there is
little gain to duplicate in this case.

Fam

> 
> Paolo
> 
> > Signed-off-by: Fam Zheng <famz@redhat.com>
> > ---
> >  block/iscsi.c | 7 -------
> >  1 file changed, 7 deletions(-)
> > 
> > diff --git a/block/iscsi.c b/block/iscsi.c
> > index 8fca1d3..14e97a6 100644
> > --- a/block/iscsi.c
> > +++ b/block/iscsi.c
> > @@ -1323,13 +1323,6 @@ static int iscsi_open(BlockDriverState *bs, QDict *options, int flags,
> >      const char *filename;
> >      int i, ret = 0;
> >  
> > -    if ((BDRV_SECTOR_SIZE % 512) != 0) {
> > -        error_setg(errp, "iSCSI: Invalid BDRV_SECTOR_SIZE. "
> > -                   "BDRV_SECTOR_SIZE(%lld) is not a multiple "
> > -                   "of 512", BDRV_SECTOR_SIZE);
> > -        return -EINVAL;
> > -    }
> > -
> >      opts = qemu_opts_create(&runtime_opts, NULL, 0, &error_abort);
> >      qemu_opts_absorb_qdict(opts, options, &local_err);
> >      if (local_err) {
> > 
> 

