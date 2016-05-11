Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b0mpS-00060E-I7
	for mharc-qemu-trivial@gnu.org; Thu, 12 May 2016 05:22:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35064)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wouter@grep.be>) id 1b0bR7-0006YT-0H
	for qemu-trivial@nongnu.org; Wed, 11 May 2016 17:12:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <wouter@grep.be>) id 1b0bR4-0006SL-Qp
	for qemu-trivial@nongnu.org; Wed, 11 May 2016 17:12:51 -0400
Received: from barbershop.grep.be ([89.106.240.122]:53883)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wouter@grep.be>)
	id 1b0bQx-0006RT-Ct; Wed, 11 May 2016 17:12:43 -0400
Received: from d54c66c97.access.telenet.be ([84.198.108.151] helo=gangtai)
	by barbershop.grep.be with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.84_2)
	(envelope-from <wouter@grep.be>)
	id 1b0bQt-0004Ld-1V; Wed, 11 May 2016 23:12:39 +0200
Received: from wouter by gangtai with local (Exim 4.87)
	(envelope-from <wouter@grep.be>)
	id 1b0bQn-0002Ne-KN; Wed, 11 May 2016 23:12:33 +0200
Date: Wed, 11 May 2016 23:12:33 +0200
From: Wouter Verhelst <w@uter.be>
To: Alex Bligh <alex@alex.org.uk>
Cc: Eric Blake <eblake@redhat.com>,
	"nbd-general@lists.sourceforge.net" <nbd-general@lists.sourceforge.net>,
	qemu block <qemu-block@nongnu.org>,
	"qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-stable@nongnu.org" <qemu-stable@nongnu.org>,
	Quentin Casasnovas <quentin.casasnovas@oracle.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20160511211233.GD5054@grep.be>
References: <1462524302-15558-1-git-send-email-quentin.casasnovas@oracle.com>
	<5731E99C.3000108@redhat.com>
	<3271D86E-D54C-44FC-9FD6-2E2C51F5FB6D@alex.org.uk>
	<5731FE53.6010602@redhat.com>
	<672ED845-88C6-4C96-B2DC-F4BCBD85F788@alex.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <672ED845-88C6-4C96-B2DC-F4BCBD85F788@alex.org.uk>
X-Speed: Gates' Law: Every 18 months, the speed of software halves.
Organization: none
User-Agent: Mutt/1.6.0 (2016-04-01)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 89.106.240.122
X-Mailman-Approved-At: Thu, 12 May 2016 05:22:45 -0400
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
X-List-Received-Date: Wed, 11 May 2016 21:12:54 -0000

On Tue, May 10, 2016 at 04:38:29PM +0100, Alex Bligh wrote:
> On 10 May 2016, at 16:29, Eric Blake <eblake@redhat.com> wrote:
> > So the kernel is currently one of the clients that does NOT honor block
> > sizes, and as such, servers should be prepared for ANY size up to
> > UINT_MAX (other than DoS handling).
> 
> Or not to permit a connection.

Right -- and this is why I was recommending against making this a MUST in the
first place.

[...]

-- 
< ron> I mean, the main *practical* problem with C++, is there's like a dozen
       people in the world who think they really understand all of its rules,
       and pretty much all of them are just lying to themselves too.
 -- #debian-devel, OFTC, 2016-02-12

