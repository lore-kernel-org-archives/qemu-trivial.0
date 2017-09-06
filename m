Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dpXpZ-0005Lm-2C
	for mharc-qemu-trivial@gnu.org; Wed, 06 Sep 2017 06:45:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36898)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rjones@redhat.com>) id 1dpXpP-0005D6-Lh
	for qemu-trivial@nongnu.org; Wed, 06 Sep 2017 06:45:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rjones@redhat.com>) id 1dpXpO-0002WV-Ir
	for qemu-trivial@nongnu.org; Wed, 06 Sep 2017 06:45:03 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43698)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <rjones@redhat.com>)
	id 1dpXpI-0002Td-RN; Wed, 06 Sep 2017 06:44:57 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D34D7356F8;
	Wed,  6 Sep 2017 10:44:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com D34D7356F8
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=rjones@redhat.com
Received: from localhost (ovpn-117-64.ams2.redhat.com [10.36.117.64])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A14EB5C544;
	Wed,  6 Sep 2017 10:44:53 +0000 (UTC)
Date: Wed, 6 Sep 2017 11:44:51 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-devel@nongnu.org, armbru@redhat.com, famz@redhat.com,
	qemu-trivial@nongnu.org, mjt@tls.msk.ru
Message-ID: <20170906104451.GM20914@redhat.com>
References: <20170906085006.26983-1-rjones@redhat.com>
	<20170906101905.GD3753@dhcp-200-186.str.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170906101905.GD3753@dhcp-200-186.str.redhat.com>
User-Agent: Mutt/1.5.20 (2009-12-10)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Wed, 06 Sep 2017 10:44:56 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH for-2.10] qemu-options: Document the
 -drive locking parameter.
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
X-List-Received-Date: Wed, 06 Sep 2017 10:45:11 -0000

On Wed, Sep 06, 2017 at 12:19:05PM +0200, Kevin Wolf wrote:
> Am 06.09.2017 um 10:50 hat Richard W.M. Jones geschrieben:
> > Commit 16b48d5d66d2 ("file-posix: Add 'locking' option") added this
> > option, but as it was not documented in the -help output it was not
> > easily possible to tell if a particular qemu binary supports it.
> > 
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
> 'locking' is a driver-specific option and not universally available for
> all images, so it shouldn't be included here.

Indeed this patch is wrong, please ignore it.

However I couldn't work out the incantation to disable locking for a
qcow2 overlay backed by a file which is locked by another qemu
process:

  ...
      -drive file=/home/rjones/d/libguestfs/tmp/libguestfsSOXEiU/overlay1,cache=unsafe,format=qcow2,file.locking=off,id=hd0,if=none \
      -device scsi-hd,drive=hd0 \
  ...
  qemu-system-x86_64: -device scsi-hd,drive=hd0: Failed to get shared "write" lock
  Is another process using the image?
  ...

I'm guessing I need another level of indirection to get to the backing
file, but file.file.locking=off did not work either.

I think the error message there is wrong as well since it doesn't
refer to the right command line option nor tell you which file is
locked.

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
virt-p2v converts physical machines to virtual machines.  Boot with a
live CD or over the network (PXE) and turn machines into KVM guests.
http://libguestfs.org/virt-v2v

