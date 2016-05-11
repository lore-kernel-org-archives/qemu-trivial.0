Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b0VdW-0005rx-4f
	for mharc-qemu-trivial@gnu.org; Wed, 11 May 2016 11:01:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52856)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex@alex.org.uk>) id 1b0VdP-0005cT-HV
	for qemu-trivial@nongnu.org; Wed, 11 May 2016 11:01:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex@alex.org.uk>) id 1b0VdM-00006S-QX
	for qemu-trivial@nongnu.org; Wed, 11 May 2016 11:01:11 -0400
Received: from mail.avalus.com ([89.16.176.221]:57617)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex@alex.org.uk>)
	id 1b0Vd4-0008Iw-Lu; Wed, 11 May 2016 11:00:50 -0400
Received: by mail.avalus.com (Postfix) with ESMTPSA id 6E7EBC5607E;
	Wed, 11 May 2016 15:55:43 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=alex.org.uk; s=mail;
	t=1462978545; bh=AuRt1e8TfBvzI8y7XjEYFPZM10hhVevvqF8CdVj9HXk=;
	h=Subject:From:In-Reply-To:Date:Cc:References:To;
	b=sQ/tPPzlNSaPkwMZIRwEm6GoDLvpFxTxhv4zc1K7CJ0EDw4B2kE4N+jvxlJUqkIYg
	tNyDwsXMFRmXmlxgNoJEjDGbFsD80ing0SgRls/NVg4Vwgj6TcZVCmMqYGO+8y0ole
	hyT4h3nFyTQhjariH7PiTpbgnpZ+3vNNRX5cxE3g=
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
Content-Type: multipart/signed;
	boundary="Apple-Mail=_CB35E750-93D0-4C86-8134-673F226F0BAB";
	protocol="application/pgp-signature"; micalg=pgp-sha512
X-Pgp-Agent: GPGMail 2.5.2
From: Alex Bligh <alex@alex.org.uk>
In-Reply-To: <57333CEB.7050705@redhat.com>
Date: Wed, 11 May 2016 15:55:40 +0100
Cc: Alex Bligh <alex@alex.org.uk>, Paolo Bonzini <pbonzini@redhat.com>,
	Quentin Casasnovas <quentin.casasnovas@oracle.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	"nbd-general@lists.sourceforge.net" <nbd-general@lists.sourceforge.net>,
	"qemu-stable@nongnu.org" <qemu-stable@nongnu.org>,
	qemu block <qemu-block@nongnu.org>
Message-Id: <E93C6545-4622-4E30-BE81-7B6E9B6DE219@alex.org.uk>
References: <1462524302-15558-1-git-send-email-quentin.casasnovas@oracle.com>
	<5731E99C.3000108@redhat.com>
	<3271D86E-D54C-44FC-9FD6-2E2C51F5FB6D@alex.org.uk>
	<5731FE53.6010602@redhat.com>
	<672ED845-88C6-4C96-B2DC-F4BCBD85F788@alex.org.uk>
	<20160510154545.GB28315@chrystal.uk.oracle.com>
	<592DA6FD-75F8-4B7F-AA21-DEA8D591B723@alex.org.uk>
	<20160510160438.GD28315@chrystal.uk.oracle.com>
	<8F0007CD-40E2-43C1-8196-B4BE401B8EF4@alex.org.uk>
	<5732FD8C.1080106@redhat.com> <57333CEB.7050705@redhat.com>
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
X-List-Received-Date: Wed, 11 May 2016 15:01:16 -0000


--Apple-Mail=_CB35E750-93D0-4C86-8134-673F226F0BAB
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=us-ascii


On 11 May 2016, at 15:08, Eric Blake <eblake@redhat.com> wrote:

> Then I think I will propose a doc patch to the extension-info branch
> that adds new INFO items for NBD_INFO_TRIM_SIZE and
> NBD_INFO_WRITE_ZERO_SIZE (if requested by client and replied by server,
> then this can be larger than the normal maximum size in
> NBD_INFO_BLOCK_SIZE; if either side doesn't request the info, then
> assume any maximum in NBD_INFO_BLOCK_SIZE applies, otherwise UINT32_MAX;
> and the two infos are separate items because NBD_FLAG_SEND_TRIM and
> NBD_FLAG_SEND_WRITE_ZEROES are orthogonally optional).

mmmm ...

at this rate you'd be better with a list of command / maximum size
tuples!

--
Alex Bligh





--Apple-Mail=_CB35E750-93D0-4C86-8134-673F226F0BAB
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iQIcBAEBCgAGBQJXM0ftAAoJEBPm5K7i9iORT3EP/AnI7AURAdW4SBTBSsbWN06B
puRkokK+dkqGK3xYFwuWt76DSorIjGrsKkt4MNHrRAjGwMjx8IQ9isG+NEOSte3E
gqcvD8igjHhvFcN91cRYLxmBOJ57lyowqMb4u1sHZAhxGerk/Iz1lixU2yu3qWqR
5tw6rljwNjM5aR8R2J9lt2GI1nQ9zauSjAegLteeM0IKddgrjwRPARjPjNrcl/1I
a9KR21J2F9RfyuoNS8HFyOzDWp/jWtxJs2sesACnpdXN4mE+V2fA4FoeHXH/Q6QQ
FbuzZ0YuRCekEK4mhwbWRMKAY3Dad8iPkYtDZtsqVd3vr+99aGRnAVQQ7fZ4jZkK
mvHFp17I3wLMw7Mb0ypPR8TsiIi+J3QqJ5W99JiTMUJxCdOgYxvO/EdQ1bmBCM5M
Jdb8fp4a1R1mBLcBOhZzOlmZHQekxU3nrhuVe6QfI8gXpUHh6g6VR0U8BlUgn4d9
ZkcatNNo1Zn/jVzvoL2KWCvc8ZkLgJZ9daK8cCgwh58PgOQxUMYGTx0ZM1K7f83T
1+PW8kBppIbbgbjcCKs4F9ToZ+45l7XzJcy9ODfGJ5/3jKphbdSF5wwEE+2wSMGf
grIJuBD1OTDzpPU4U8nHOMHDObEKU3hEd6nc1JYF0YltfI9AfQnIAGTP8EqAi8zR
cN4zDJJocRw3qzzrarNZ
=INfi
-----END PGP SIGNATURE-----

--Apple-Mail=_CB35E750-93D0-4C86-8134-673F226F0BAB--

