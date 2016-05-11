Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b0PYT-0005Mq-Gc
	for mharc-qemu-trivial@gnu.org; Wed, 11 May 2016 04:31:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46795)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <quentin.casasnovas@oracle.com>) id 1b0PYQ-0005JV-OA
	for qemu-trivial@nongnu.org; Wed, 11 May 2016 04:31:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <quentin.casasnovas@oracle.com>) id 1b0PYL-0006ge-KP
	for qemu-trivial@nongnu.org; Wed, 11 May 2016 04:31:37 -0400
Received: from aserp1040.oracle.com ([141.146.126.69]:38609)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <quentin.casasnovas@oracle.com>)
	id 1b0PYL-0006gE-BI; Wed, 11 May 2016 04:31:33 -0400
Received: from userv0021.oracle.com (userv0021.oracle.com [156.151.31.71])
	by aserp1040.oracle.com (Sentrion-MTA-4.3.2/Sentrion-MTA-4.3.2) with
	ESMTP id u4B8VTAD014954
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Wed, 11 May 2016 08:31:30 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
	by userv0021.oracle.com (8.13.8/8.13.8) with ESMTP id u4B8VSHG007752
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Wed, 11 May 2016 08:31:29 GMT
Received: from abhmp0015.oracle.com (abhmp0015.oracle.com [141.146.116.21])
	by aserv0121.oracle.com (8.13.8/8.13.8) with ESMTP id u4B8VRnb008041;
	Wed, 11 May 2016 08:31:28 GMT
Received: from localhost (/10.175.178.9)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Wed, 11 May 2016 01:31:27 -0700
Date: Wed, 11 May 2016 10:34:12 +0200
From: Quentin Casasnovas <quentin.casasnovas@oracle.com>
To: Eric Blake <eblake@redhat.com>
Cc: Quentin Casasnovas <quentin.casasnovas@oracle.com>,
	qemu-devel <qemu-devel@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>, qemu-trivial@nongnu.org,
	qemu-stable@nongnu.org
Message-ID: <20160511083412.GG28315@chrystal.uk.oracle.com>
References: <1462524302-15558-1-git-send-email-quentin.casasnovas@oracle.com>
	<573245CA.1030104@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <573245CA.1030104@redhat.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Source-IP: userv0021.oracle.com [156.151.31.71]
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 141.146.126.69
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] nbd: fix trim/discard
 commands with a length bigger than NBD_MAX_BUFFER_SIZE
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
X-List-Received-Date: Wed, 11 May 2016 08:31:40 -0000

On Tue, May 10, 2016 at 02:34:18PM -0600, Eric Blake wrote:
> On 05/06/2016 02:45 AM, Quentin Casasnovas wrote:
> > When running fstrim on a filesystem mounted through qemu-nbd with
> > --discard=on, fstrim would fail with I/O errors:
> > 
> >   $ fstrim /k/spl/ice/
> >   fstrim: /k/spl/ice/: FITRIM ioctl failed: Input/output error
> > 
> > and qemu-nbd was spitting these:
> > 
> >   nbd.c:nbd_co_receive_request():L1232: len (94621696) is larger than max len (33554432)
> 
> Your patch duplicates what is already present in qemu:
> 
> commit eb38c3b67018ff8069e4f674a28661931a8a3e4f
> Author: Paolo Bonzini <pbonzini@redhat.com>
> Date:   Thu Jan 7 14:32:42 2016 +0100
> 
>     nbd-server: do not check request length except for reads and writes
> 
>     Only reads and writes need to allocate memory correspondent to the
>     request length.  Other requests can be sent to the storage without
>     allocating any memory, and thus any request length is acceptable.
> 
>     Reported-by: Sitsofe Wheeler <sitsofe@yahoo.com>
>     Cc: qemu-block@nongnu.org
>     Reviewed-by: Max Reitz <mreitz@redhat.com>
>     Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> 
> For the purposes of qemu-stable, it's better to backport the existing
> patch than to write a new version of it.
> 

Ha sorry I missed this! I wouldn't have tried to debug/fix myself otherwise :)

> It also helps to state what version of qemu you were testing, as it is
> obviously not the (soon-to-be-released) version 2.6 which already has
> the fix.
>

I was using qemu-2.5.0-rc3 on Gentoo but this was also verified on some
Debian systems which appears to be on 1.1.2+dfsg-6a+deb7u12 and on Ubuntu
Xenial 2.0.0+dfsg-2ubuntu1.22.

I wrote the patch on top of https://github.com/bonzini/qemu.git:master
(a7e00e2) which didn't contain the fix last Friday.

Anyway, cool if the fix is going into mainline :)

Quentin

