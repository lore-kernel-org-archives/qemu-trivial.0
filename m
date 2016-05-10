Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b0AYd-0000Mb-AW
	for mharc-qemu-trivial@gnu.org; Tue, 10 May 2016 12:30:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38991)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <quentin.casasnovas@oracle.com>) id 1b0AYZ-0000Hv-SQ
	for qemu-trivial@nongnu.org; Tue, 10 May 2016 12:30:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <quentin.casasnovas@oracle.com>) id 1b0AYT-0006AB-7w
	for qemu-trivial@nongnu.org; Tue, 10 May 2016 12:30:46 -0400
Received: from aserp1040.oracle.com ([141.146.126.69]:32141)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <quentin.casasnovas@oracle.com>)
	id 1b0AYS-00069M-UP; Tue, 10 May 2016 12:30:41 -0400
Received: from aserv0021.oracle.com (aserv0021.oracle.com [141.146.126.233])
	by aserp1040.oracle.com (Sentrion-MTA-4.3.2/Sentrion-MTA-4.3.2) with
	ESMTP id u4AGUR4k006190
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Tue, 10 May 2016 16:30:27 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
	by aserv0021.oracle.com (8.13.8/8.13.8) with ESMTP id u4AGUPEe026580
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Tue, 10 May 2016 16:30:27 GMT
Received: from abhmp0010.oracle.com (abhmp0010.oracle.com [141.146.116.16])
	by userv0121.oracle.com (8.13.8/8.13.8) with ESMTP id u4AGUOYu020714;
	Tue, 10 May 2016 16:30:25 GMT
Received: from localhost (/10.175.241.84)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Tue, 10 May 2016 09:30:23 -0700
Date: Tue, 10 May 2016 18:33:09 +0200
From: Quentin Casasnovas <quentin.casasnovas@oracle.com>
To: Quentin Casasnovas <quentin.casasnovas@oracle.com>
Cc: Eric Blake <eblake@redhat.com>, Alex Bligh <alex@alex.org.uk>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	"nbd-general@lists.sourceforge.net" <nbd-general@lists.sourceforge.net>,
	"qemu-stable@nongnu.org" <qemu-stable@nongnu.org>,
	qemu block <qemu-block@nongnu.org>
Message-ID: <20160510163309.GF28315@chrystal.uk.oracle.com>
References: <1462524302-15558-1-git-send-email-quentin.casasnovas@oracle.com>
	<5731E99C.3000108@redhat.com>
	<3271D86E-D54C-44FC-9FD6-2E2C51F5FB6D@alex.org.uk>
	<5731FE53.6010602@redhat.com>
	<C84A91D0-D90A-4B7B-B72D-A33E1C189354@alex.org.uk>
	<5732025C.2050703@redhat.com>
	<20160510155444.GC28315@chrystal.uk.oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160510155444.GC28315@chrystal.uk.oracle.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Source-IP: aserv0021.oracle.com [141.146.126.233]
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 141.146.126.69
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
X-List-Received-Date: Tue, 10 May 2016 16:30:49 -0000

On Tue, May 10, 2016 at 05:54:44PM +0200, Quentin Casasnovas wrote:
> On Tue, May 10, 2016 at 09:46:36AM -0600, Eric Blake wrote:
> > On 05/10/2016 09:41 AM, Alex Bligh wrote:
> > > 
> > > On 10 May 2016, at 16:29, Eric Blake <eblake@redhat.com> wrote:
> > > 
> > >> So the kernel is currently one of the clients that does NOT honor block
> > >> sizes, and as such, servers should be prepared for ANY size up to
> > >> UINT_MAX (other than DoS handling).
> > > 
> > > Interesting followup question:
> > > 
> > > If the kernel does not fragment TRIM requests at all (in the
> > > same way it fragments read and write requests), I suspect
> > > something bad may happen with TRIM requests over 2^31
> > > in size (particularly over 2^32 in size), as the length
> > > field in nbd only has 32 bits.
> > > 
> > > Whether it supports block size constraints or not, it is
> > > going to need to do *some* breaking up of requests.
> > 
> > Does anyone have an easy way to cause the kernel to request a trim
> > operation that large on a > 4G export?  I'm not familiar enough with
> > EXT4 operation to know what file system operations you can run to
> > ultimately indirectly create a file system trim operation that large.
> > But maybe there is something simpler - does the kernel let you use the
> > fallocate(2) syscall operation with FALLOC_FL_PUNCH_HOLE or
> > FALLOC_FL_ZERO_RANGE on an fd backed by an NBD device?
> > 
> 
> It was fairly reproducible here, we just used a random qcow2 image with
> some Debian minimal system pre-installed, mounted that qcow2 image through
> qemu-nbd then compiled a whole kernel inside it.  Then you can make clean
> and run fstrim on the mount point.  I'm assuming you can go faster than
> that by just writing a big file to the qcow2 image mounted without -o
> discard, delete the big file, then remount with -o discard + run fstrim.
> 

Looks like there's an easier way:

 $ qemu-img create -f qcow2 foo.qcow2 10G
 $ qemu-nbd --discard=on -c /dev/nbd0 foo.qcow2
 $ mkfs.ext4 /dev/nbd0
 mke2fs 1.42.13 (17-May-2015)
 Discarding device blocks: failed - Input/output error
 Creating filesystem with 2621440 4k blocks and 655360 inodes
 Filesystem UUID: 25aeb51f-0dea-4c1d-8b65-61f6bcdf97e9
 Superblock backups stored on blocks:
	   32768, 98304, 163840, 229376, 294912, 819200, 884736, 1605632

 Allocating group tables: done
 Writing inode tables: done
 Creating journal (32768 blocks): done
 Writing superblocks and filesystem accounting information: done

Notice the "Discarding device blocks: failed - Input/output error" line, I
bet that it is mkfs.ext4 trying to trim all blocks prior to writing the
filesystem, but it gets an I/O error while doing so.  I haven't verified it
is the same problem, but it it isn't, simply mount the resulting filesystem
and run fstrim on it:

 $ mount -o discard /dev/nbd0 /tmp/foo
 $ fstrim /tmp/foo
 fstrim: /tmp/foo: FITRIM ioctl failed: Input/output error

Quentin

