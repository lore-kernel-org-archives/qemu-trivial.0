Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b09xN-00058E-U0
	for mharc-qemu-trivial@gnu.org; Tue, 10 May 2016 11:52:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52317)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <quentin.casasnovas@oracle.com>) id 1b09xL-0004zp-Df
	for qemu-trivial@nongnu.org; Tue, 10 May 2016 11:52:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <quentin.casasnovas@oracle.com>) id 1b09xG-0001tj-Qa
	for qemu-trivial@nongnu.org; Tue, 10 May 2016 11:52:18 -0400
Received: from userp1040.oracle.com ([156.151.31.81]:19295)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <quentin.casasnovas@oracle.com>)
	id 1b09xG-0001tA-Dz; Tue, 10 May 2016 11:52:14 -0400
Received: from userv0022.oracle.com (userv0022.oracle.com [156.151.31.74])
	by userp1040.oracle.com (Sentrion-MTA-4.3.2/Sentrion-MTA-4.3.2) with
	ESMTP id u4AFpxJe029396
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 10 May 2016 15:52:00 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
	by userv0022.oracle.com (8.14.4/8.13.8) with ESMTP id u4AFpxen025039
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Tue, 10 May 2016 15:51:59 GMT
Received: from abhmp0019.oracle.com (abhmp0019.oracle.com [141.146.116.25])
	by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id u4AFpwhJ026653;
	Tue, 10 May 2016 15:51:59 GMT
Received: from localhost (/10.175.241.84)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Tue, 10 May 2016 08:51:58 -0700
Date: Tue, 10 May 2016 17:54:44 +0200
From: Quentin Casasnovas <quentin.casasnovas@oracle.com>
To: Eric Blake <eblake@redhat.com>
Cc: Alex Bligh <alex@alex.org.uk>,
	Quentin Casasnovas <quentin.casasnovas@oracle.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	"nbd-general@lists.sourceforge.net" <nbd-general@lists.sourceforge.net>,
	"qemu-stable@nongnu.org" <qemu-stable@nongnu.org>,
	qemu block <qemu-block@nongnu.org>
Message-ID: <20160510155444.GC28315@chrystal.uk.oracle.com>
References: <1462524302-15558-1-git-send-email-quentin.casasnovas@oracle.com>
	<5731E99C.3000108@redhat.com>
	<3271D86E-D54C-44FC-9FD6-2E2C51F5FB6D@alex.org.uk>
	<5731FE53.6010602@redhat.com>
	<C84A91D0-D90A-4B7B-B72D-A33E1C189354@alex.org.uk>
	<5732025C.2050703@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5732025C.2050703@redhat.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Source-IP: userv0022.oracle.com [156.151.31.74]
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 156.151.31.81
Subject: Re: [Qemu-trivial] [Nbd] [Qemu-devel] [PATCH] nbd: fix trim/discard
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
X-List-Received-Date: Tue, 10 May 2016 15:52:20 -0000

On Tue, May 10, 2016 at 09:46:36AM -0600, Eric Blake wrote:
> On 05/10/2016 09:41 AM, Alex Bligh wrote:
> > 
> > On 10 May 2016, at 16:29, Eric Blake <eblake@redhat.com> wrote:
> > 
> >> So the kernel is currently one of the clients that does NOT honor block
> >> sizes, and as such, servers should be prepared for ANY size up to
> >> UINT_MAX (other than DoS handling).
> > 
> > Interesting followup question:
> > 
> > If the kernel does not fragment TRIM requests at all (in the
> > same way it fragments read and write requests), I suspect
> > something bad may happen with TRIM requests over 2^31
> > in size (particularly over 2^32 in size), as the length
> > field in nbd only has 32 bits.
> > 
> > Whether it supports block size constraints or not, it is
> > going to need to do *some* breaking up of requests.
> 
> Does anyone have an easy way to cause the kernel to request a trim
> operation that large on a > 4G export?  I'm not familiar enough with
> EXT4 operation to know what file system operations you can run to
> ultimately indirectly create a file system trim operation that large.
> But maybe there is something simpler - does the kernel let you use the
> fallocate(2) syscall operation with FALLOC_FL_PUNCH_HOLE or
> FALLOC_FL_ZERO_RANGE on an fd backed by an NBD device?
> 

It was fairly reproducible here, we just used a random qcow2 image with
some Debian minimal system pre-installed, mounted that qcow2 image through
qemu-nbd then compiled a whole kernel inside it.  Then you can make clean
and run fstrim on the mount point.  I'm assuming you can go faster than
that by just writing a big file to the qcow2 image mounted without -o
discard, delete the big file, then remount with -o discard + run fstrim.

Quentin

