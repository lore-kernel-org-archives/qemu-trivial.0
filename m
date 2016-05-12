Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b0scN-0000sP-AC
	for mharc-qemu-trivial@gnu.org; Thu, 12 May 2016 11:33:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40185)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex@alex.org.uk>) id 1b0scI-0000k4-RX
	for qemu-trivial@nongnu.org; Thu, 12 May 2016 11:33:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex@alex.org.uk>) id 1b0scG-0002TL-LV
	for qemu-trivial@nongnu.org; Thu, 12 May 2016 11:33:33 -0400
Received: from mail.avalus.com ([89.16.176.221]:36467)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex@alex.org.uk>)
	id 1b0sc0-0002OF-6A; Thu, 12 May 2016 11:33:16 -0400
Received: by mail.avalus.com (Postfix) with ESMTPSA id 295D2C5609C;
	Thu, 12 May 2016 16:33:14 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=alex.org.uk; s=mail;
	t=1463067195; bh=YdTTPchN51zAUYKk+rqEGyocVNax1rA9hhX41lujay0=;
	h=Subject:From:In-Reply-To:Date:Cc:References:To;
	b=wCDjcQnaTjSJMpaDDM1lJGkCWN3wGFSdY5iA+BQP+Ksdg6H3WA0cgcmg62xq3DHMV
	VGEUT6bWUpddvMR6BwOvTh8IL6CEdsdpl4fqsB145RCEisn4f7xY9XDkYaUl0qoJqr
	BN4q//Pwjhq+WrsVVlJAr9SmnPSZ4WsvJ7CP8YvA=
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
From: Alex Bligh <alex@alex.org.uk>
In-Reply-To: <20160511211233.GD5054@grep.be>
Date: Thu, 12 May 2016 16:33:25 +0100
Cc: Alex Bligh <alex@alex.org.uk>, Eric Blake <eblake@redhat.com>,
	"nbd-general@lists.sourceforge.net" <nbd-general@lists.sourceforge.net>,
	qemu block <qemu-block@nongnu.org>,
	"qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-stable@nongnu.org" <qemu-stable@nongnu.org>,
	Quentin Casasnovas <quentin.casasnovas@oracle.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <DBC2E45B-1D71-43D0-8099-123FFAC553D3@alex.org.uk>
References: <1462524302-15558-1-git-send-email-quentin.casasnovas@oracle.com>
	<5731E99C.3000108@redhat.com>
	<3271D86E-D54C-44FC-9FD6-2E2C51F5FB6D@alex.org.uk>
	<5731FE53.6010602@redhat.com>
	<672ED845-88C6-4C96-B2DC-F4BCBD85F788@alex.org.uk>
	<20160511211233.GD5054@grep.be>
To: Wouter Verhelst <w@uter.be>
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
X-List-Received-Date: Thu, 12 May 2016 15:33:38 -0000


On 11 May 2016, at 22:12, Wouter Verhelst <w@uter.be> wrote:

> On Tue, May 10, 2016 at 04:38:29PM +0100, Alex Bligh wrote:
>> On 10 May 2016, at 16:29, Eric Blake <eblake@redhat.com> wrote:
>>> So the kernel is currently one of the clients that does NOT honor =
block
>>> sizes, and as such, servers should be prepared for ANY size up to
>>> UINT_MAX (other than DoS handling).
>>=20
>> Or not to permit a connection.
>=20
> Right -- and this is why I was recommending against making this a MUST =
in the
> first place.

Indeed, and it currently is a 'MAY':

> except that if a server believes a client's behaviour constitutes
> a denial of service, it MAY initiate a hard disconnect.

--=20
Alex Bligh





