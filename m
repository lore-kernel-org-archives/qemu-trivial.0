Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dpsAV-00067L-6W
	for mharc-qemu-trivial@gnu.org; Thu, 07 Sep 2017 04:28:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34909)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <otubo@redhat.com>) id 1dpsAT-00066H-ME
	for qemu-trivial@nongnu.org; Thu, 07 Sep 2017 04:28:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <otubo@redhat.com>) id 1dpsAQ-00012D-B1
	for qemu-trivial@nongnu.org; Thu, 07 Sep 2017 04:28:09 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40452)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <otubo@redhat.com>)
	id 1dpsAG-0000uW-N1; Thu, 07 Sep 2017 04:27:56 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0AA58883B6;
	Thu,  7 Sep 2017 08:27:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 0AA58883B6
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=otubo@redhat.com
Received: from vader (ovpn-117-116.ams2.redhat.com [10.36.117.116])
	by smtp.corp.redhat.com (Postfix) with SMTP id 466855170F;
	Thu,  7 Sep 2017 08:27:50 +0000 (UTC)
Date: Thu, 7 Sep 2017 10:27:49 +0200
From: Eduardo Otubo <otubo@redhat.com>
To: Zhang Chen <zhangchen.fnst@cn.fujitsu.com>
Cc: qemu-trivial@nongnu.org, lizhijian@cn.fujitsu.com, mjt@tls.msk.ru,
	qemu-devel@nongnu.org
Message-ID: <20170907082749.GA2441@vader>
References: <20170821155005.16885-1-otubo@redhat.com>
	<45e8e004-5a55-07a3-190b-c01106af5de4@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <45e8e004-5a55-07a3-190b-c01106af5de4@cn.fujitsu.com>
User-Agent: Mutt/1.8.3+47 (5f034395e53d) (2017-05-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Thu, 07 Sep 2017 08:27:55 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] filter-mirror: segfault when specifying
 non existent device
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
X-List-Received-Date: Thu, 07 Sep 2017 08:28:10 -0000

On Tue, Aug 22, 2017 at 09:19:20AM +0800, Zhang Chen wrote:
> 
> 
> On 08/21/2017 11:50 PM, Eduardo Otubo wrote:
> > When using filter-mirror like the example below where the interface
> > 'ndev0' does not exist on the host, QEMU crashes into segmentation
> > fault.
> > 
> >   $ qemu-system-x86_64 -S -machine pc -netdev user,id=ndev0 -object filter-mirror,id=test-object,netdev=ndev0
> > 
> > This happens because the function filter_mirror_setup() does not checks
> > if the device actually exists and still keep on processing calling
> > qemu_chr_find(). This patch fixes this issue.
> > 
> > Signed-off-by: Eduardo Otubo <otubo@redhat.com>
> 
> Looks good for me.
> 
> Reviewed-by: Zhang Chen<zhangchen.fnst@cn.fujitsu.com>

Ping.

> 
> Thanks
> Zhang Chen
> 
> > ---
> >   net/filter-mirror.c | 14 +++++++++++---
> >   1 file changed, 11 insertions(+), 3 deletions(-)
> > 
> > diff --git a/net/filter-mirror.c b/net/filter-mirror.c
> > index 90e2c92337..e18a4b16a0 100644
> > --- a/net/filter-mirror.c
> > +++ b/net/filter-mirror.c
> > @@ -213,14 +213,22 @@ static void filter_mirror_setup(NetFilterState *nf, Error **errp)
> >       MirrorState *s = FILTER_MIRROR(nf);
> >       Chardev *chr;
> > +    if (s->outdev == NULL) {
> > +        goto err;
> > +    }
> > +
> >       chr = qemu_chr_find(s->outdev);
> > +
> >       if (chr == NULL) {
> > -        error_set(errp, ERROR_CLASS_DEVICE_NOT_FOUND,
> > -                  "Device '%s' not found", s->outdev);
> > -        return;
> > +        goto err;
> >       }
> >       qemu_chr_fe_init(&s->chr_out, chr, errp);
> > +
> > +err:
> > +    error_set(errp, ERROR_CLASS_DEVICE_NOT_FOUND, "Device '%s' not found",
> > +              nf->netdev_id);
> > +    return;
> >   }
> >   static void redirector_rs_finalize(SocketReadState *rs)
> 
> -- 
> Thanks
> Zhang Chen
> 
> 
> 
> 

-- 
Eduardo Otubo
Senior Software Engineer @ RedHat

