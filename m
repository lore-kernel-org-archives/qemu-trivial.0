Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b09mV-0001DY-0l
	for mharc-qemu-trivial@gnu.org; Tue, 10 May 2016 11:41:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47121)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex@alex.org.uk>) id 1b09mQ-00015E-0X
	for qemu-trivial@nongnu.org; Tue, 10 May 2016 11:41:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex@alex.org.uk>) id 1b09mN-0006XI-Im
	for qemu-trivial@nongnu.org; Tue, 10 May 2016 11:41:00 -0400
Received: from mail.avalus.com ([89.16.176.221]:37630)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex@alex.org.uk>)
	id 1b09m3-0006TB-6G; Tue, 10 May 2016 11:40:39 -0400
Received: by mail.avalus.com (Postfix) with ESMTPSA id E760CC5608C;
	Tue, 10 May 2016 16:40:36 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=alex.org.uk; s=mail;
	t=1462894837; bh=dGFxiU8AZKmquOeLotchq0wcs3ap2SbnVb3iGP4FiSg=;
	h=Subject:From:In-Reply-To:Date:Cc:References:To;
	b=KGp29OBGLdZqqDf/ICcxlAmY76vXdD+aoPvmCz1tIa3a71qjUqBIBzkgSitI3gDYA
	xFt3CmOqTKYIn13llf0zuFb4tZxIECudBe6Jn5RXD/2xhPVEdpTyIFUy4Mw9fghPTq
	Fsd0BE7vZGKQ5kX4cCQ4CJwUJXl8+wJhHXCoOC5Y=
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
Content-Type: multipart/signed;
	boundary="Apple-Mail=_6939E42B-CF2F-43D4-BB8E-BBFCB25C0295";
	protocol="application/pgp-signature"; micalg=pgp-sha512
X-Pgp-Agent: GPGMail 2.5.2
From: Alex Bligh <alex@alex.org.uk>
In-Reply-To: <5731FE53.6010602@redhat.com>
Date: Tue, 10 May 2016 16:41:27 +0100
Cc: Alex Bligh <alex@alex.org.uk>,
	Quentin Casasnovas <quentin.casasnovas@oracle.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	"nbd-general@lists.sourceforge.net" <nbd-general@lists.sourceforge.net>,
	"qemu-stable@nongnu.org" <qemu-stable@nongnu.org>,
	qemu block <qemu-block@nongnu.org>
Message-Id: <C84A91D0-D90A-4B7B-B72D-A33E1C189354@alex.org.uk>
References: <1462524302-15558-1-git-send-email-quentin.casasnovas@oracle.com>
	<5731E99C.3000108@redhat.com>
	<3271D86E-D54C-44FC-9FD6-2E2C51F5FB6D@alex.org.uk>
	<5731FE53.6010602@redhat.com>
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
X-List-Received-Date: Tue, 10 May 2016 15:41:06 -0000


--Apple-Mail=_6939E42B-CF2F-43D4-BB8E-BBFCB25C0295
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=us-ascii


On 10 May 2016, at 16:29, Eric Blake <eblake@redhat.com> wrote:

> So the kernel is currently one of the clients that does NOT honor block
> sizes, and as such, servers should be prepared for ANY size up to
> UINT_MAX (other than DoS handling).

Interesting followup question:

If the kernel does not fragment TRIM requests at all (in the
same way it fragments read and write requests), I suspect
something bad may happen with TRIM requests over 2^31
in size (particularly over 2^32 in size), as the length
field in nbd only has 32 bits.

Whether it supports block size constraints or not, it is
going to need to do *some* breaking up of requests.

--
Alex Bligh





--Apple-Mail=_6939E42B-CF2F-43D4-BB8E-BBFCB25C0295
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iQIcBAEBCgAGBQJXMgEnAAoJEBPm5K7i9iORrawP/RluNRjUl7+vPyvA3CMzW8ZY
2BexQcliKuIG05N6Em/Ost3+Q6WxyOUvRQcHRGLzpdRNXN2d21Dig1p6XPt0b+dE
MVPXecwGJjHeHLHjJR+UygVJHweoLYhC1wOuK9p4hGAMxph4GUHAMPiOEYNONcuE
4VypByPAJTIPGoPKLmRkxwfAp2sYuI66TLMmiPcswznlczwEUygGJz9fKFks+FOn
8ho3ZTF738YKlsKi7hOdOeKbolS764En19VjaD2/NIixPjurSYFC9StZenKWvaTe
fcJi+lIs65auRggKyBuK18zcGYcTpeBpKOrB6udEI0cH30WtfhkBZMc1yK+8CLoo
yC7Fjk8e1DUAuP5fDbTilsFCbCeZF0JLPJ6exTSJGbbPd0dj72JhMyhJNlHTXOQH
VaFi5WODuhlAxwey5khM2Ir3TNinJ0FS+K0tbugzzt1AAxdew6hAuPE8sJ5WJUiC
Pwb0+UWii45HYBfvOLOtHlD9CtOAEdokUX9PmJG0q+4TsuxdB/n4QZOic1ZFUTnn
jfX7QfMH6dNo7FgBftXToZfAOSTcbREcELnJT6NqP4fTJD/QkmfiLikesvuaDUj+
K2fHeDLZHBqlJPWMlHUyRc8L89Xj3PhP8Qq6wK1rabiqvmAUZguuXoORZ7XFIA5p
oM8sIa70mZWMbr5SpMjZ
=qKt1
-----END PGP SIGNATURE-----

--Apple-Mail=_6939E42B-CF2F-43D4-BB8E-BBFCB25C0295--

