Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YzjLc-0002VC-4n
	for mharc-qemu-trivial@gnu.org; Tue, 02 Jun 2015 06:23:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49573)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1YzjLZ-0002Ri-Pz
	for qemu-trivial@nongnu.org; Tue, 02 Jun 2015 06:23:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1YzjLV-0005eD-PG
	for qemu-trivial@nongnu.org; Tue, 02 Jun 2015 06:23:01 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45160)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>)
	id 1YzjLJ-0005VO-TM; Tue, 02 Jun 2015 06:22:45 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id 25A2B19F97C;
	Tue,  2 Jun 2015 10:22:45 +0000 (UTC)
Received: from localhost (dhcp-14-104.nay.redhat.com [10.66.14.104])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t52AMgrY023606; Tue, 2 Jun 2015 06:22:43 -0400
Date: Tue, 2 Jun 2015 18:22:40 +0800
From: Fam Zheng <famz@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Message-ID: <20150602102240.GC22059@dhcp-14-238.nay.redhat.com>
References: <1433237561-10846-1-git-send-email-famz@redhat.com>
	<20150602094531.GH3765@noname.str.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20150602094531.GH3765@noname.str.redhat.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-block@nongnu.org, qemu-trivial@nongnu.org,
	Jeff Cody <jcody@redhat.com>, qemu-devel@nongnu.org,
	mitake.hitoshi@lab.ntt.co.jp, namei.unix@gmail.com
Subject: Re: [Qemu-trivial] [PATCH] sheepdog: Fix error message if failed to
	load vmstate
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
X-List-Received-Date: Tue, 02 Jun 2015 10:23:02 -0000

On Tue, 06/02 11:45, Kevin Wolf wrote:
> [ CC to Sheepdog maintainers ]
> 
> Am 02.06.2015 um 11:32 hat Fam Zheng geschrieben:
> > Signed-off-by: Fam Zheng <famz@redhat.com>
> > ---
> >  block/sheepdog.c | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> > 
> > diff --git a/block/sheepdog.c b/block/sheepdog.c
> > index bd7cbed..a22f838 100644
> > --- a/block/sheepdog.c
> > +++ b/block/sheepdog.c
> > @@ -2556,7 +2556,11 @@ static int do_load_save_vmstate(BDRVSheepdogState *s, uint8_t *data,
> >          }
> >  
> >          if (ret < 0) {
> > -            error_report("failed to save vmstate %s", strerror(errno));
> > +            if (load) {
> > +                error_report("failed to load vmstate %s", strerror(errno));
> > +            } else {
> > +                error_report("failed to save vmstate %s", strerror(errno));
> > +            }
> >              goto cleanup;
> >          }
> 
> Why do we even print this message? We usually don't do this for a failed
> request, and much less so if we don't actually add any information that
> isn't covered by the return code. qemu_savevm_state() will already set
> an error that is even visible in QMP.
> 
> In fact, errno doesn't even contain anything relevant here, or in most
> (all?) other places that it's used in the sheepdog block driver.

Now I followed the called function and agree that reporting errno is not
helpful.  Maybe it's better to do a clean up on error reportings in this
driver, later.

Fam

