Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b09ug-00076v-DL
	for mharc-qemu-trivial@gnu.org; Tue, 10 May 2016 11:49:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50685)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex@alex.org.uk>) id 1b09uc-0006tq-0k
	for qemu-trivial@nongnu.org; Tue, 10 May 2016 11:49:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex@alex.org.uk>) id 1b09uZ-0000iy-Je
	for qemu-trivial@nongnu.org; Tue, 10 May 2016 11:49:28 -0400
Received: from mail.avalus.com ([89.16.176.221]:47373)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex@alex.org.uk>)
	id 1b09uH-0000c1-71; Tue, 10 May 2016 11:49:09 -0400
Received: by mail.avalus.com (Postfix) with ESMTPSA id 25D79C5608C;
	Tue, 10 May 2016 16:49:06 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=alex.org.uk; s=mail;
	t=1462895346; bh=msZNoOFTXNp2XmuJW8dVE8MpiN2hd6lQA0vL+R/unaw=;
	h=Subject:From:In-Reply-To:Date:Cc:References:To;
	b=qFD898fxWYm+kD6Mx2h0dsArFEfbRZH9LLU3/aP6m18gXH9AKw671HPHQr9Nv+O26
	ItbR0nME4zxfwPLBG2wop2YCNTAKoPEmG/6kqzQn+gnm7//A8gLvjVHvMNSbtNwf2V
	IudfOiLICpeqzPlSigZaTtCK3XC4I8PmtKCjXbUM=
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
From: Alex Bligh <alex@alex.org.uk>
In-Reply-To: <20160510154545.GB28315@chrystal.uk.oracle.com>
Date: Tue, 10 May 2016 16:49:57 +0100
Cc: Alex Bligh <alex@alex.org.uk>, Eric Blake <eblake@redhat.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	"nbd-general@lists.sourceforge.net" <nbd-general@lists.sourceforge.net>,
	"qemu-stable@nongnu.org" <qemu-stable@nongnu.org>,
	qemu block <qemu-block@nongnu.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <592DA6FD-75F8-4B7F-AA21-DEA8D591B723@alex.org.uk>
References: <1462524302-15558-1-git-send-email-quentin.casasnovas@oracle.com>
	<5731E99C.3000108@redhat.com>
	<3271D86E-D54C-44FC-9FD6-2E2C51F5FB6D@alex.org.uk>
	<5731FE53.6010602@redhat.com>
	<672ED845-88C6-4C96-B2DC-F4BCBD85F788@alex.org.uk>
	<20160510154545.GB28315@chrystal.uk.oracle.com>
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
X-List-Received-Date: Tue, 10 May 2016 15:49:31 -0000


On 10 May 2016, at 16:45, Quentin Casasnovas =
<quentin.casasnovas@oracle.com> wrote:

> I'm by no mean an expert in this, but why would the kernel break up =
those
> TRIM commands?  After all, breaking things up makes sense when the =
length
> of the request is big, not that much when it only contains the request
> header, which is the case for TRIM commands.

1. You are assuming that the only reason for limiting the size of =
operations is
   limiting the data transferred within one request. That is not =
necessarily
   the case. There are good reasons (if only orthogonality) to have =
limits
   in place even where no data is transferred.

2. As and when the blocksize extension is implemented in the kernel (it =
isn't
   now), the protocol requires it.

3. The maximum length of an NBD trim operation is 2^32. The maximum =
length
   of a trim operation is larger. Therefore the kernel needs to do at =
least
   some breaking up.

--=20
Alex Bligh





