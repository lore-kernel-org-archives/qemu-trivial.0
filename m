Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b0mpT-000612-03
	for mharc-qemu-trivial@gnu.org; Thu, 12 May 2016 05:22:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34318)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wouter@grep.be>) id 1b0bOz-0003ZO-6x
	for qemu-trivial@nongnu.org; Wed, 11 May 2016 17:10:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <wouter@grep.be>) id 1b0bOx-0005rr-JD
	for qemu-trivial@nongnu.org; Wed, 11 May 2016 17:10:41 -0400
Received: from barbershop.grep.be ([89.106.240.122]:50719)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wouter@grep.be>)
	id 1b0bOp-0005qI-P8; Wed, 11 May 2016 17:10:31 -0400
Received: from d54c66c97.access.telenet.be ([84.198.108.151] helo=gangtai)
	by barbershop.grep.be with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.84_2)
	(envelope-from <wouter@grep.be>)
	id 1b0bOk-0004Kc-Dz; Wed, 11 May 2016 23:10:26 +0200
Received: from wouter by gangtai with local (Exim 4.87)
	(envelope-from <wouter@grep.be>)
	id 1b0bOe-0002JV-UO; Wed, 11 May 2016 23:10:20 +0200
Date: Wed, 11 May 2016 23:10:20 +0200
From: Wouter Verhelst <w@uter.be>
To: Eric Blake <eblake@redhat.com>
Cc: Alex Bligh <alex@alex.org.uk>,
	"nbd-general@lists.sourceforge.net" <nbd-general@lists.sourceforge.net>,
	qemu block <qemu-block@nongnu.org>,
	"qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	"qemu-stable@nongnu.org" <qemu-stable@nongnu.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Quentin Casasnovas <quentin.casasnovas@oracle.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20160511211020.GC5054@grep.be>
References: <1462524302-15558-1-git-send-email-quentin.casasnovas@oracle.com>
	<5731E99C.3000108@redhat.com>
	<3271D86E-D54C-44FC-9FD6-2E2C51F5FB6D@alex.org.uk>
	<5731FE53.6010602@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5731FE53.6010602@redhat.com>
X-Speed: Gates' Law: Every 18 months, the speed of software halves.
Organization: none
User-Agent: Mutt/1.6.0 (2016-04-01)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 89.106.240.122
X-Mailman-Approved-At: Thu, 12 May 2016 05:22:44 -0400
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
X-List-Received-Date: Wed, 11 May 2016 21:10:43 -0000

On Tue, May 10, 2016 at 09:29:23AM -0600, Eric Blake wrote:
> On 05/10/2016 09:08 AM, Alex Bligh wrote:
> > Eric,
> > 
> >> Hmm. The current wording of the experimental block size additions does
> >> NOT allow the client to send a NBD_CMD_TRIM with a size larger than the
> >> maximum NBD_CMD_WRITE:
> >> https://github.com/yoe/nbd/blob/extension-info/doc/proto.md#block-size-constraints
> > 
> > Correct
> > 
> >> Maybe we should revisit that in the spec, and/or advertise yet another
> >> block size (since the maximum size for a trim and/or write_zeroes
> >> request may indeed be different than the maximum size for a read/write).
> > 
> > I think it's up to the server to either handle large requests, or
> > for the client to break these up.
> 
> But the question at hand here is whether we should permit servers to
> advertise multiple maximum block sizes (one for read/write, another one
> for trim/write_zero, or even two [at least qemu tracks a separate
> maximum trim vs. write_zero sizing in its generic block layer]), or
> merely stick with the current wording that requires clients that honor
> maximum block size to obey the same maximum for ALL commands, regardless
> of amount of data sent over the wire.
> 
> > 
> > The core problem here is that the kernel (and, ahem, most servers) are
> > ignorant of the block size extension, and need to guess how to break
> > things up. In my view the client (kernel in this case) should
> > be breaking the trim requests up into whatever size it uses as the
> > maximum size write requests. But then it would have to know about block
> > sizes which are in (another) experimental extension.
> 
> Correct - no one has yet patched the kernel to honor block sizes
> advertised through what is currently an experimental extension.  (We
> have ioctl(NBD_SET_BLKSIZE) which can be argued to set the kernel's
> minimum block size, but I haven't audited whether the kernel actually
> guarantees that all client requests are sent aligned to the value passed
> that way - but we have nothing to set the maximum size, and are at the
> mercy of however the kernel currently decides to split large requests).

I don't actually think it does that at all, tbh. There is an
"integrityhuge" test in the reference server test suite which performs a
number of large requests (up to 50M), and which was created by a script
that just does direct read requests to /dev/nbdX.

It just so happens that most upper layers (filesystems etc) don't make
requests larger than about 32MiB, but that's not related.

> So the kernel is currently one of the clients that does NOT honor block
> sizes, and as such, servers should be prepared for ANY size up to
> UINT_MAX (other than DoS handling).  My question above only applies to
> clients that use the experimental block size extensions.

Right.

[...]

-- 
< ron> I mean, the main *practical* problem with C++, is there's like a dozen
       people in the world who think they really understand all of its rules,
       and pretty much all of them are just lying to themselves too.
 -- #debian-devel, OFTC, 2016-02-12

