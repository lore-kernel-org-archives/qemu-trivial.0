Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b09xU-0005Lk-NY
	for mharc-qemu-trivial@gnu.org; Tue, 10 May 2016 11:52:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52415)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex@alex.org.uk>) id 1b09xR-0005F4-4d
	for qemu-trivial@nongnu.org; Tue, 10 May 2016 11:52:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex@alex.org.uk>) id 1b09xN-0001yw-Jz
	for qemu-trivial@nongnu.org; Tue, 10 May 2016 11:52:24 -0400
Received: from mail.avalus.com ([89.16.176.221]:34258)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex@alex.org.uk>)
	id 1b09x3-0001lx-2j; Tue, 10 May 2016 11:52:01 -0400
Received: by mail.avalus.com (Postfix) with ESMTPSA id DE81EC5607D;
	Tue, 10 May 2016 16:51:58 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=alex.org.uk; s=mail;
	t=1462895519; bh=No1pPxz3Xg/ffJ3jBOie/x/J4pd+deejgDNcET3/o3w=;
	h=Subject:From:In-Reply-To:Date:Cc:References:To;
	b=B/6VcbonOeN3AYaj5ZLz+ooSfxkAM8rf/wCYWHrOd9F5MnVWHp2qD55/EYLNJDXIO
	IEvumReha8aOEjET6tNKIHYPtGUmfoYy91UYgJhQupiJutLVGbZCLAcn32HEhSYrmL
	7Pj9mPPCPe0YKVUbIvuJ6uez+K2T7e5MfnXhAspI=
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
Content-Type: multipart/signed;
	boundary="Apple-Mail=_1CB7686E-787F-42B2-AEFE-187AB8E62A10";
	protocol="application/pgp-signature"; micalg=pgp-sha512
X-Pgp-Agent: GPGMail 2.5.2
From: Alex Bligh <alex@alex.org.uk>
In-Reply-To: <5732025C.2050703@redhat.com>
Date: Tue, 10 May 2016 16:52:49 +0100
Cc: Alex Bligh <alex@alex.org.uk>,
	Quentin Casasnovas <quentin.casasnovas@oracle.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	"nbd-general@lists.sourceforge.net" <nbd-general@lists.sourceforge.net>,
	"qemu-stable@nongnu.org" <qemu-stable@nongnu.org>,
	qemu block <qemu-block@nongnu.org>
Message-Id: <599EB6B1-C4EF-4050-86CA-75ACFB7B975D@alex.org.uk>
References: <1462524302-15558-1-git-send-email-quentin.casasnovas@oracle.com>
	<5731E99C.3000108@redhat.com>
	<3271D86E-D54C-44FC-9FD6-2E2C51F5FB6D@alex.org.uk>
	<5731FE53.6010602@redhat.com>
	<C84A91D0-D90A-4B7B-B72D-A33E1C189354@alex.org.uk>
	<5732025C.2050703@redhat.com>
To: Eric Blake <eblake@redhat.com>
X-Mailer: Apple Mail (2.1878.6)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.16.176.221
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
X-List-Received-Date: Tue, 10 May 2016 15:52:27 -0000


--Apple-Mail=_1CB7686E-787F-42B2-AEFE-187AB8E62A10
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=us-ascii


On 10 May 2016, at 16:46, Eric Blake <eblake@redhat.com> wrote:

> Does anyone have an easy way to cause the kernel to request a trim
> operation that large on a > 4G export?  I'm not familiar enough with
> EXT4 operation to know what file system operations you can run to
> ultimately indirectly create a file system trim operation that large.
> But maybe there is something simpler - does the kernel let you use the
> fallocate(2) syscall operation with FALLOC_FL_PUNCH_HOLE or
> FALLOC_FL_ZERO_RANGE on an fd backed by an NBD device?

Not tried it, but fallocate(1) with -p ?

http://man7.org/linux/man-pages/man1/fallocate.1.html

As it takes length and offset in TB, PB, EB, ZB and YB, it
seems to be 64 bit aware :-)

--
Alex Bligh





--Apple-Mail=_1CB7686E-787F-42B2-AEFE-187AB8E62A10
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iQIcBAEBCgAGBQJXMgPSAAoJEBPm5K7i9iORrG4P/2U4N+JffU5IjHbK50zevLd4
qNMs6iT1BdHNTQPqaXAT6pTE/F3LefuC+Ti4CcsO9DLHA7pDWSdhRszG8lrQ3jMH
LtDICWvqa3r0hoWL3Ti7hHyhav2DA2MDeVQJvAc2aNDoriAQvQ86cwbSs8LAh5rU
OqJ1+jEQOeiY028CbIaIyFKrxQT6yyY+4riANrBt9o0N8qSUTI1F7G8cbdEMGGyl
jgKwBXIq/sFO6o7JxeK5yrvFnXoBuVz3mSm6n0TygVUZIb9lQeJSA3esJTH2BCDd
8nlpFdXYH6PjRCtau0g7sEr/cLO5I+SxMrxGYE6dd/voeDRmMkNYajeJBn45gaH+
lhFmFcObCXMCAXcQtA/pMJITIuKEMYc6wwUbBSWYRDe4B5GqL7k1Vnak202Kg5ot
8SDPAfCT6IIjrBZ7gyO+wSBnkOgBKVKB1MXrjqUzX+3N3jubuFAKlcuo6G7X+2Be
QiEwwUPBWSllR4mOYd3atICKUsY9PqHKEgEOU+6owfGHXaUS4yaoAbqyBOUyiRkk
6ibHDBRmfIGfUio7F8I3h6lh0P7Jo0G50ipqzUMKOK6COEgvsWhNb95sxKmEiuho
9qZNrCB/mD+yCVS7jOR2JGdVuxko/kvpM4DSFhYMYZU10DvVKIdxtR/7BoQQ6pXa
EiGGGGe39OyBywQ7+6r1
=F642
-----END PGP SIGNATURE-----

--Apple-Mail=_1CB7686E-787F-42B2-AEFE-187AB8E62A10--

