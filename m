Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1etB0v-0001Dg-6z
	for mharc-qemu-trivial@gnu.org; Tue, 06 Mar 2018 06:44:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56337)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1etAyu-0007zE-Gj
	for qemu-trivial@nongnu.org; Tue, 06 Mar 2018 06:42:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1etAyq-0006oR-Nb
	for qemu-trivial@nongnu.org; Tue, 06 Mar 2018 06:42:08 -0500
Received: from mail-wm0-x229.google.com ([2a00:1450:400c:c09::229]:52085)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <stefanha@gmail.com>)
	id 1etAym-0006kN-8z; Tue, 06 Mar 2018 06:42:00 -0500
Received: by mail-wm0-x229.google.com with SMTP id h21so22098552wmd.1;
	Tue, 06 Mar 2018 03:41:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=usT1uTZTzxshCPCxX/JOUbST/og6W2U+kKwtnFiKoEo=;
	b=EMzwzub0Yd00ak+djOo4QIR6QkJm1mTAKZjabkStL3UNZ39REqoDxbzhX3Q1evOOgh
	iyyAwKx2/yzb02rZ4bMz4rRBK+YvJgvJOG1kdc2bwUpsc+FcWPcC8j4TABsnGNRFV1el
	Jt0+5nGKyyW7Q0iyxrjl9hNw/+WRKj5VdC2aQl6w0Bx9PgmYhCt44UlG0KqEZFDsJxpF
	v2fklDIYiIrytoAEIx8e3PD1Z1/pgQXMAMgcrrdLsIljV9kj7w5fO5m2sPUEeFG7woM8
	lsDpr03rPiPU6pY3LlzFnapCC7UxM7knS6JD+tymPNjb4yPLcTSSlyEjrlaUGnp3NIcR
	HZOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=usT1uTZTzxshCPCxX/JOUbST/og6W2U+kKwtnFiKoEo=;
	b=gR75bsYpV6Qek7dvILTDP6IS2qfRtMV152WD7rgZl/EM8Hl5GiPtB+1eDWHmosPax1
	5c+0zb0NnT3yaxuMLClftElPRdWkVAFWAl5Onw9tbNx03jN6S5FZUQbr+BZmYHqKViHR
	wpj7xWJlkCjyCi1nciKsY8bGZNXmgk2SB6b02PhMCa1eqoA99RsupcmiKm4xlU+DlMzR
	S6jHIEJ2ddhVEv0KMCE7Y1kgyfL1xd+Na28jqxawZxoKNzZhRhF7RZ7/7XMomUtcBdhX
	3ueeFfNeb2pAukG/i3wiU1j05lkBGuYVhpoXGe0BLx4ULMWXx1CPq4pFNCkhx7sT/oQX
	XqFQ==
X-Gm-Message-State: AElRT7FgFxp3aAIU52tuwL2KrTpx84KyOiMj8aWs2DYh/4dELSmgURaH
	BJenb7ik1BSI7BaaWEhIRyU=
X-Google-Smtp-Source: AG47ELvq3j2u6KCUtTFnE3+WmKVOR63oAfBmjXKSviesPyfbL3SBvRN6Gk7EmcBcEgJ/vGn9oNeqwA==
X-Received: by 10.28.227.86 with SMTP id a83mr11739838wmh.3.1520336518821;
	Tue, 06 Mar 2018 03:41:58 -0800 (PST)
Received: from localhost ([51.15.41.238])
	by smtp.gmail.com with ESMTPSA id 7sm8796759wmq.42.2018.03.06.03.41.57
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 06 Mar 2018 03:41:57 -0800 (PST)
Date: Tue, 6 Mar 2018 11:41:57 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Eric Blake <eblake@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	peter.maydell@linaro.org
Message-ID: <20180306114157.GF31045@stefanha-x1.localdomain>
References: <20180222215838.18223-1-eblake@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="WlEyl6ow+jlIgNUh"
Content-Disposition: inline
In-Reply-To: <20180222215838.18223-1-eblake@redhat.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::229
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] checkpatch: Exempt long URLs
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
X-List-Received-Date: Tue, 06 Mar 2018 11:44:12 -0000


--WlEyl6ow+jlIgNUh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 22, 2018 at 03:58:38PM -0600, Eric Blake wrote:
> Sometimes, we want to refer to really long URLs, but checkpatch
> balks, and we have to manually bypass the check.  URL shorterners
> may be nice at reducing long links, but it's hard to guarantee the
> shortened link will live as long as the real target, and it is
> also nice to see the original target without having to load the
> shortened URL through a browser.  So exempt a line containing
> only a URL from the long-line syntax check.
>=20
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
>  scripts/checkpatch.pl | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--WlEyl6ow+jlIgNUh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJann6FAAoJEJykq7OBq3PIjksH/1udaa9BV34N3rBWH+aWNZSz
ZDWmwfaf4sf1i30czTDghtRRolnoPiQbeDkxmblv3jy6JoSvhv/L+OthhqSWSYRF
z0V/+NxWacXCowKzvzwAV379yRhyB6QkJxj/CY/QOAbB/haSyVMN+XTbdYQ5MMBI
S6+yrLdRoXoD3std8GoUpOyhqrF5UaSo2XDze4c9Yh60M8lFh7rY+CDzzdsTb4bY
O95/N1S+HXOOWGr27J6WHF4NVmFMA5qHK5qyRGta9+obyB+M2PtEZtd/jw9Kuil1
MWZ+s7WSx1xWNI/dOmfx+lNEHs1sZRbcv3jvcPDPzT9HFPXplHHn2XUgk+sccRk=
=uyIe
-----END PGP SIGNATURE-----

--WlEyl6ow+jlIgNUh--

