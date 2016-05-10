Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b09og-0003pM-OV
	for mharc-qemu-trivial@gnu.org; Tue, 10 May 2016 11:43:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48031)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <quentin.casasnovas@oracle.com>) id 1b09od-0003jD-VL
	for qemu-trivial@nongnu.org; Tue, 10 May 2016 11:43:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <quentin.casasnovas@oracle.com>) id 1b09oZ-0007CH-KE
	for qemu-trivial@nongnu.org; Tue, 10 May 2016 11:43:19 -0400
Received: from aserp1040.oracle.com ([141.146.126.69]:32621)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <quentin.casasnovas@oracle.com>)
	id 1b09oZ-0007AW-9e; Tue, 10 May 2016 11:43:15 -0400
Received: from userv0021.oracle.com (userv0021.oracle.com [156.151.31.71])
	by aserp1040.oracle.com (Sentrion-MTA-4.3.2/Sentrion-MTA-4.3.2) with
	ESMTP id u4AFh1Pn030930
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Tue, 10 May 2016 15:43:02 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
	by userv0021.oracle.com (8.13.8/8.13.8) with ESMTP id u4AFh1Ps005763
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Tue, 10 May 2016 15:43:01 GMT
Received: from abhmp0004.oracle.com (abhmp0004.oracle.com [141.146.116.10])
	by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id u4AFgxi0019996;
	Tue, 10 May 2016 15:43:00 GMT
Received: from localhost (/10.175.241.84)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Tue, 10 May 2016 08:42:59 -0700
Date: Tue, 10 May 2016 17:45:45 +0200
From: Quentin Casasnovas <quentin.casasnovas@oracle.com>
To: Alex Bligh <alex@alex.org.uk>
Cc: Eric Blake <eblake@redhat.com>,
	Quentin Casasnovas <quentin.casasnovas@oracle.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	"nbd-general@lists.sourceforge.net" <nbd-general@lists.sourceforge.net>,
	"qemu-stable@nongnu.org" <qemu-stable@nongnu.org>,
	qemu block <qemu-block@nongnu.org>
Message-ID: <20160510154545.GB28315@chrystal.uk.oracle.com>
References: <1462524302-15558-1-git-send-email-quentin.casasnovas@oracle.com>
	<5731E99C.3000108@redhat.com>
	<3271D86E-D54C-44FC-9FD6-2E2C51F5FB6D@alex.org.uk>
	<5731FE53.6010602@redhat.com>
	<672ED845-88C6-4C96-B2DC-F4BCBD85F788@alex.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <672ED845-88C6-4C96-B2DC-F4BCBD85F788@alex.org.uk>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Source-IP: userv0021.oracle.com [156.151.31.71]
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
X-List-Received-Date: Tue, 10 May 2016 15:43:21 -0000

On Tue, May 10, 2016 at 04:38:29PM +0100, Alex Bligh wrote:
> Eric,
> 
> On 10 May 2016, at 16:29, Eric Blake <eblake@redhat.com> wrote:
> >>> Maybe we should revisit that in the spec, and/or advertise yet another
> >>> block size (since the maximum size for a trim and/or write_zeroes
> >>> request may indeed be different than the maximum size for a read/write).
> >> 
> >> I think it's up to the server to either handle large requests, or
> >> for the client to break these up.
> > 
> > But the question at hand here is whether we should permit servers to
> > advertise multiple maximum block sizes (one for read/write, another one
> > for trim/write_zero, or even two [at least qemu tracks a separate
> > maximum trim vs. write_zero sizing in its generic block layer]), or
> > merely stick with the current wording that requires clients that honor
> > maximum block size to obey the same maximum for ALL commands, regardless
> > of amount of data sent over the wire.
> 
> In my view, we should not change this. Block sizes maxima are not there
> to support DoS prevention (that's a separate phrase). They are there
> to impose maximum block sizes. Adding a different maximum block size
> for different commands is way too overengineered. There are after
> all reasons (especially without structured replies) why you'd want
> different maximum block sizes for writes and reads. If clients support
> block sizes, they will necessarily have to have the infrastructure
> to break requests up.
> 
> IE maximum block size should continue to mean maximum block size.
> 
> >> 
> >> The core problem here is that the kernel (and, ahem, most servers) are
> >> ignorant of the block size extension, and need to guess how to break
> >> things up. In my view the client (kernel in this case) should
> >> be breaking the trim requests up into whatever size it uses as the
> >> maximum size write requests. But then it would have to know about block
> >> sizes which are in (another) experimental extension.
> > 
> > Correct - no one has yet patched the kernel to honor block sizes
> > advertised through what is currently an experimental extension.
> 
> Unsurprising at it's still experimental, and only settled down a couple
> of weeks ago :-)
> 
> >  (We
> > have ioctl(NBD_SET_BLKSIZE) which can be argued to set the kernel's
> > minimum block size,
> 
> Technically that is 'out of band transmission of block size
> constraints' :-)
> 
> > but I haven't audited whether the kernel actually
> > guarantees that all client requests are sent aligned to the value passed
> > that way - but we have nothing to set the maximum size,
> 
> indeed
> 
> > and are at the
> > mercy of however the kernel currently decides to split large requests).
> 
> I am surprised TRIM doesn't get broken up the same way READ and WRITE
> do.
>

I'm by no mean an expert in this, but why would the kernel break up those
TRIM commands?  After all, breaking things up makes sense when the length
of the request is big, not that much when it only contains the request
header, which is the case for TRIM commands.

What am I missing?

Quentin

