Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dpWGP-0006ch-55
	for mharc-qemu-trivial@gnu.org; Wed, 06 Sep 2017 05:04:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60121)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rjones@redhat.com>) id 1dpWGM-0006bL-PD
	for qemu-trivial@nongnu.org; Wed, 06 Sep 2017 05:04:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rjones@redhat.com>) id 1dpWGE-0003SP-Ud
	for qemu-trivial@nongnu.org; Wed, 06 Sep 2017 05:04:45 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39444)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <rjones@redhat.com>)
	id 1dpWG5-0003PR-EH; Wed, 06 Sep 2017 05:04:29 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 62E1FC049D7F;
	Wed,  6 Sep 2017 09:04:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 62E1FC049D7F
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=rjones@redhat.com
Received: from localhost (ovpn-117-64.ams2.redhat.com [10.36.117.64])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8E6F460BE8;
	Wed,  6 Sep 2017 09:04:25 +0000 (UTC)
Date: Wed, 6 Sep 2017 10:04:24 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
To: "Daniel P. Berrange" <berrange@redhat.com>
Cc: kwolf@redhat.com, famz@redhat.com, qemu-trivial@nongnu.org,
	mjt@tls.msk.ru, qemu-devel@nongnu.org, armbru@redhat.com
Message-ID: <20170906090424.GA18719@redhat.com>
References: <20170906085006.26983-1-rjones@redhat.com>
	<20170906085902.GH15510@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170906085902.GH15510@redhat.com>
User-Agent: Mutt/1.5.20 (2009-12-10)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Wed, 06 Sep 2017 09:04:28 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH for-2.10] qemu-options:
 Document the -drive locking parameter.
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
X-List-Received-Date: Wed, 06 Sep 2017 09:04:48 -0000

On Wed, Sep 06, 2017 at 09:59:02AM +0100, Daniel P. Berrange wrote:
> The 2.10 versio nis already released. Did you mean that you wanted
> this in the stable branch ?  If so, then CC qemu-stable@nongnu.org
> 
> On Wed, Sep 06, 2017 at 09:50:06AM +0100, Richard W.M. Jones wrote:
> > Commit 16b48d5d66d2 ("file-posix: Add 'locking' option") added this
> > option, but as it was not documented in the -help output it was not
> > easily possible to tell if a particular qemu binary supports it.
> 
> NB, nothing should be parsing -help output to look for features
> anymore. Is there really no other way to detect this feature ?

It can be found from monitor output, but parsing -help output really
is easier in some cases.  In any case it's good to document it for end users.

Rich.

> > Signed-off-by: Richard W.M. Jones <rjones@redhat.com>
> > ---
> >  qemu-options.hx | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/qemu-options.hx b/qemu-options.hx
> > index 9f6e2adfff..f8f95eb498 100644
> > --- a/qemu-options.hx
> > +++ b/qemu-options.hx
> > @@ -796,7 +796,7 @@ DEF("drive", HAS_ARG, QEMU_OPTION_drive,
> >      "       [,cache=writethrough|writeback|none|directsync|unsafe][,format=f]\n"
> >      "       [,serial=s][,addr=A][,rerror=ignore|stop|report]\n"
> >      "       [,werror=ignore|stop|report|enospc][,id=name][,aio=threads|native]\n"
> > -    "       [,readonly=on|off][,copy-on-read=on|off]\n"
> > +    "       [,readonly=on|off][,copy-on-read=on|off][,locking=off|auto|on]\n"
> >      "       [,discard=ignore|unmap][,detect-zeroes=on|off|unmap]\n"
> >      "       [[,bps=b]|[[,bps_rd=r][,bps_wr=w]]]\n"
> >      "       [[,iops=i]|[[,iops_rd=r][,iops_wr=w]]]\n"
> 
> Reviewed-by: Daniel P. Berrange <berrange@redhat.com>
> 
> Regards,
> Daniel
> -- 
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
virt-p2v converts physical machines to virtual machines.  Boot with a
live CD or over the network (PXE) and turn machines into KVM guests.
http://libguestfs.org/virt-v2v

