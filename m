Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b0AR8-0000Xt-P9
	for mharc-qemu-trivial@gnu.org; Tue, 10 May 2016 12:23:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37099)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex@alex.org.uk>) id 1b0AR1-0000Ke-LB
	for qemu-trivial@nongnu.org; Tue, 10 May 2016 12:23:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex@alex.org.uk>) id 1b0AQw-00044x-Vw
	for qemu-trivial@nongnu.org; Tue, 10 May 2016 12:22:59 -0400
Received: from mail.avalus.com ([89.16.176.221]:47507)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex@alex.org.uk>)
	id 1b0AQa-00040X-4u; Tue, 10 May 2016 12:22:32 -0400
Received: by mail.avalus.com (Postfix) with ESMTPSA id 4845032A6005;
	Tue, 10 May 2016 17:22:30 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=alex.org.uk; s=mail;
	t=1462897351; bh=YjOww2mirjfobbP+pw/IIn8VEGXqxTL/vl+O4FT9XoQ=;
	h=Subject:From:In-Reply-To:Date:Cc:References:To;
	b=yOt5Zqn8ML4/RUFOPN54fNQfqRypis46ec8ZANljcoak2eqkILvuNBUKJZNzHkEKX
	n5DTdr5C5RYJUdNKgpVjcLKhdNtpNreedQC04HWLo8NZzMsoq4Gw8XSg3sLmFkI/Jy
	NppqK8fitQrpvBfTkKwUyHZ1JrYPRS3bGI2CUi2o=
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
From: Alex Bligh <alex@alex.org.uk>
In-Reply-To: <20160510160438.GD28315@chrystal.uk.oracle.com>
Date: Tue, 10 May 2016 17:23:21 +0100
Cc: Alex Bligh <alex@alex.org.uk>, Eric Blake <eblake@redhat.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	"nbd-general@lists.sourceforge.net" <nbd-general@lists.sourceforge.net>,
	"qemu-stable@nongnu.org" <qemu-stable@nongnu.org>,
	qemu block <qemu-block@nongnu.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <8F0007CD-40E2-43C1-8196-B4BE401B8EF4@alex.org.uk>
References: <1462524302-15558-1-git-send-email-quentin.casasnovas@oracle.com>
	<5731E99C.3000108@redhat.com>
	<3271D86E-D54C-44FC-9FD6-2E2C51F5FB6D@alex.org.uk>
	<5731FE53.6010602@redhat.com>
	<672ED845-88C6-4C96-B2DC-F4BCBD85F788@alex.org.uk>
	<20160510154545.GB28315@chrystal.uk.oracle.com>
	<592DA6FD-75F8-4B7F-AA21-DEA8D591B723@alex.org.uk>
	<20160510160438.GD28315@chrystal.uk.oracle.com>
To: Quentin Casasnovas <quentin.casasnovas@oracle.com>
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
X-List-Received-Date: Tue, 10 May 2016 16:23:04 -0000


On 10 May 2016, at 17:04, Quentin Casasnovas =
<quentin.casasnovas@oracle.com> wrote:

> Alright, I assumed by 'length of an NBD request', the specification =
was
> talking about the length of.. well, the request as opposed to whatever =
is
> in the length field of the request header.

With NBD_CMD_TRIM the length in the header field is 32 bit and specifies
the length of data to trim, not the length of the data transferred =
(which
is none).

> Is there a use case where you'd want to split up a single big TRIM =
request
> in smaller ones (as in some hardware would not support it or =
something)?
> Even then, it looks like this splitting up would be hardware dependant =
and
> better implemented in block device drivers.

Part of the point of the block size extension is to push such limits to =
the
client.

I could make up use cases (e.g. that performing a multi-gigabyte trim in
a single threaded server will effectively block all other I/O), but the
main reason in my book is orthogonality, and the fact the client needs
to do some breaking up anyway.

> I'm just finding odd that something that fits inside the length field =
can't
> be used.

That's a different point. That's Qemu's 'Denial of Service Attack'
prevention, *not* maximum block sizes. It isn't dropping it because
of a maximum block size parameter. If it doesn't support the block size
extension which the version you're looking at does not, it's meant
to handle requests up to 2^32-1 long EXCEPT that it MAY error requests
so long as to cause a denial of service attack. As this doesn't fit
into that case (it's a TRIM), it shouldn't be erroring it on that =
grounds.

I agree Qemu should fix that.

(So in a sense Eric and I are arguing about something irrelevant to
your current problem, which is how this would work /with/ the block
size extensions, as Eric is in the process of implementing them).

>  I do agree with your point number 3, obviously if the lenght
> field type doesn't allow something bigger than a u32, then the kernel =
has
> to do some breaking up in that case.


--=20
Alex Bligh





