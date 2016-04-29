Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1awC1M-0008Pd-12
	for mharc-qemu-trivial@gnu.org; Fri, 29 Apr 2016 13:16:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47086)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jano.vesely@gmail.com>) id 1awC1E-00089b-Dt
	for qemu-trivial@nongnu.org; Fri, 29 Apr 2016 13:16:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jano.vesely@gmail.com>) id 1awC13-0000LJ-K5
	for qemu-trivial@nongnu.org; Fri, 29 Apr 2016 13:15:51 -0400
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:35774)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jano.vesely@gmail.com>)
	id 1awC0k-00007T-06; Fri, 29 Apr 2016 13:15:27 -0400
Received: by mail-qk0-x241.google.com with SMTP id b63so7766861qkg.2;
	Fri, 29 Apr 2016 10:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:mime-version; bh=+cUixCUjZ6LpLUp9FZ0kGxOoc5xsMAbp3ULJaXeXNZk=;
	b=mMlED+NRfw2dYspoDoBU3Q7SaVz52u1/zZnzks9aFyrI7SsV/2kgX5Annh7v2Cae67
	GaznjXhWObp+aFA4kRBtsEB4gp3ErsiGdIjaUIefJ0qQRbPVix/2ITE28pLXXKlq3ouf
	bRHd2dembIXBWFSVFB0rejBm+pmeOoJv05rs1sWxnHQQpIYtVQT1TnnHEQgSkujmV7w6
	sTNRZYWunWqAn56JBHFY9kSeL8Em6bsWWhfR4sYUzHsMG2KDCQt3VxENaNF7iOeJtWuP
	IZ97X8GTO77i05kXr+HKD51JvP2EJe8xrPgTJPbw4oynuNdFHfHQqN6YKmDD8ys/Oyet
	JMSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version;
	bh=+cUixCUjZ6LpLUp9FZ0kGxOoc5xsMAbp3ULJaXeXNZk=;
	b=VpnUTyF0F6agrRdXWNrccSt0kLvY0dpSAC9e3ux9Nt002gb4smQEai21AS6rQ/VKPV
	ODEFHeOjorZ53chEmu3vEKb/udwWMe3z9S0WU1KzxjhuVK6iOFvOWo9OLDSh1D+sqxP+
	eTjmYT0z3SylvGnsvNbyHDHV/7l71Xv2jIwZnBaRWJDjIWjvJBTGKqHvzzDGfrLr/7ku
	EyYEqqtys3sOBjkWsKABN/hiF/jbvodn/cJnC287GFejDEqWHGmpJxrbwrqAZ0JXPm1I
	Q31DeYNeTM22evOSY8kRMj6dB2+2SbeXLe0PuZYk+v/gdVcpj15q7sig8EejkJKHJ8vE
	sjBQ==
X-Gm-Message-State: AOPr4FUayhL2ufD1Ngd5E66qBaWJOgLRnM0IaEpnxwk7XEfThsZdpyJzfRrfy0DNJuf3pw==
X-Received: by 10.55.26.31 with SMTP id a31mr20798920qka.23.1461950094487;
	Fri, 29 Apr 2016 10:14:54 -0700 (PDT)
Received: from [192.168.233.78] (lawn-gw.rutgers.edu. [128.6.168.245])
	by smtp.gmail.com with ESMTPSA id
	r18sm4708029qhb.35.2016.04.29.10.14.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 29 Apr 2016 10:14:53 -0700 (PDT)
Message-ID: <1461950091.4285.2.camel@gmail.com>
From: Jan Vesely <jano.vesely@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>, Stefan Weil <sw@weilnetz.de>
Cc: QEMU Developers <qemu-devel@nongnu.org>, QEMU Trivial
	<qemu-trivial@nongnu.org>, Markus Armbruster <armbru@redhat.com>
Date: Fri, 29 Apr 2016 13:14:51 -0400
In-Reply-To: <CAFEAcA-gYp9TS=JrEGgnP8uwXGuhcUzq5+wgdTDhigTyDNND9w@mail.gmail.com>
References: <1461935279-30418-1-git-send-email-jano.vesely@gmail.com>
	<CAFEAcA-yNp8wGnyzMrTu=28g4vYPv-5F-PJ4aeHq8xSnxRZLkA@mail.gmail.com>
	<5723680D.2050601@weilnetz.de>
	<CAFEAcA9dHj60vTBm5TG0Ob072U64Vy8A0cGocPg7LNdO=aNqow@mail.gmail.com>
	<9e437a9d-1725-5e2a-a43d-7952ccdf79ed@weilnetz.de>
	<CAFEAcA-gYp9TS=JrEGgnP8uwXGuhcUzq5+wgdTDhigTyDNND9w@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-+S2qoxkA572K8Fii/pMM"
X-Mailer: Evolution 3.18.5.1 
Mime-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c09::241
Subject: Re: [Qemu-trivial] [PATCH] configure: Check if struct fsxattr is
 available from linux header
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
X-List-Received-Date: Fri, 29 Apr 2016 17:16:02 -0000


--=-+S2qoxkA572K8Fii/pMM
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2016-04-29 at 15:49 +0100, Peter Maydell wrote:
> On 29 April 2016 at 15:31, Stefan Weil <sw@weilnetz.de> wrote:
> >=20
> > Is it a bug of the system headers? Or simply a design which
> > requires users to be careful when including certain header files?
> >=20
> > Both /usr/include/xfs/xfs_fs.h and /usr/include/linux/fs.h define
> > the same struct fsxattr, and both definitions are identical.
> That sounds like a header bug to me...
>=20
> http://oss.sgi.com/archives/xfs/2016-02/msg00324.html
>=20
> suggests that (a) the xfsprogs folks are updating their
> header to deal with what the kernel header is doing and that
> (b) they think the distros ought to be updating both of them
> in sync in some way...

yes, even more so that xfsprogs/xfslib will fail to compile using
linux-headers-4.5 for the very same reason. However, it looks like
distros are not keen on keeping them in sync.

the patch is a workaround.

Jan

>=20
> >=20
> > Of course a good comment would be helpful here, e. g.
> >=20
> > # Avoid redefinition of struct fsxattr in xfs/xfs_fs.h.
> > # It is already defined in linux/fs.h.
> Yes, this is really all I want: a note that some versions of
> the kernel headers and the xfs headers clash, so we suppress
> the xfs version if the kernel header is providing the struct.
>=20
> thanks
> -- PMM

--=-+S2qoxkA572K8Fii/pMM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJXI5aLAAoJEOCQZixVs7KBTxUP/0I3T/APykbMVVmIDDKXnRG1
J9UkB45EnsHsh98Vj5VjHJWyEEO+aajmRN+p0SaUcQAioUBFKdbEWhS2xstkTXY7
/ENXw6q9K7sLSjHwJvW1Yb2HQbhfAGsqEDz3XhdvZ4u3BBy2WLmqifThGCCWcUAQ
ycs8cseX8NQvn287uP7DDgZOZD9FVhCk8rbn+14ZEHzJKz1nQLcpuf1wN0Byph/Y
WCBp5tVAqAMuV2kZOiZEgWPOmWxSu+W2fyQ5E31NII4ogKJ7zT7cinH7vgSU+bgh
fWGcPOQPN/MFY54l/NUIu1T5bk3GsqSlgLFTw7e4NaQNj1UYGDgAOsKz/UP+WOAV
h3TJHyaHGvIzUAkjK3m+wu0zfYMiBzdD6OQqKFIJRSJlOwTAudIMVPBdUuv6YNE0
oA1HPutnCBR2OrgkaTD07z9Gysfr+lLERLmnXJMFS4HKKEmgrbWwiQjH2Zn2UPTa
wOWA7JyyC+oYtIFS6E3wNju3OueUZkJkaXPGzmWfiiapQDhO2eiyvUeA1J2EyI/+
9DTEUgv/uYXTfpMHy0F3pzGdJKco1Les7wDYhHFvgq3HQOzULFatdHX8WGsJxqnz
ubibXpdA4STm4HSAPr/8hUgaakII7be/fVTrReZaOoqXkRNZQpCFkQE4G+hk+eVp
Yj30IaygHqFBJS2JbsOC
=gJeN
-----END PGP SIGNATURE-----

--=-+S2qoxkA572K8Fii/pMM--


