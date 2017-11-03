Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eAdhx-0002c0-TH
	for mharc-qemu-trivial@gnu.org; Fri, 03 Nov 2017 11:16:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33997)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1eAdht-0002Zb-EZ
	for qemu-trivial@nongnu.org; Fri, 03 Nov 2017 11:16:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1eAdhn-0003gl-Si
	for qemu-trivial@nongnu.org; Fri, 03 Nov 2017 11:16:29 -0400
Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244]:48241)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <stefanha@gmail.com>)
	id 1eAdhg-0003XZ-SI; Fri, 03 Nov 2017 11:16:17 -0400
Received: by mail-wm0-x244.google.com with SMTP id p75so2192123wmg.3;
	Fri, 03 Nov 2017 08:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=CAiZxREQRlyxjciUVbPxPnAhzWoSaIxhTUQYSQPBMvY=;
	b=HpeLA3vN5lNkUxHttXjh8DnM81mEEDkvgFoFf0V3ESD84AKt2/k0rNFYCKmyfMG+pK
	j5N8y9y7g3VyZcbLDgMGk4QcHSTXcWT+8TU3fcz0hoGs1nKNprvcDv9ttnEDQ/CSqqJW
	zYX8x/8Qvm3IM9cT4fD0DFZAN5PzWLp2Ok4TDBidEfFEs074XIxsMr8ot3n4A9eH1Fdn
	YH5T2RqDqdt99Yc2cuJOWI1RcIAFhF7Jlfs14gkr7BzWIr5AxRTuRXqhuNlWmV/h74It
	qwfDyjm58UChyHvTQEBLvx1LBOKBnxO8taU6MqRBIo6yKmD1mbh0gW6XllbIXjJaEcQp
	JpGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=CAiZxREQRlyxjciUVbPxPnAhzWoSaIxhTUQYSQPBMvY=;
	b=jLWe+GKulIvJRklOnQ1nks9F6nm3Dfs5w4jsTUuHiLEm42zoV7A1YfGorR86HKlmKX
	SUw7kmbzQtYf1dQWr+i9W3Z/dZChrWwAwAt4+OQ57a4AGfs/Aam3qPwweSLtGUim87tW
	F/SjTsJn4UWmmmCbxFdlAKM2noRKHaYlDL+15iDyY3J3FV/GjVusq6A+lsqULOHoWRTQ
	65Nl11xqsXYW2ok0fzMemC+Y4NdVZ6wqtXo98GJ1jh+WncCA8YWc/SGz+77wXqyputRJ
	ao7t+0JM2SbD8pYNoBqw87UCxcc+KWmNowbeqDqcUPiHc1m+Yo3bqIliOyyyCgCQaWtt
	bR4A==
X-Gm-Message-State: AJaThX5QKUSHQ30bfIQ76U0t+8eafllcin4roqJckTlZiM+wBOgUAGNB
	TRyqphGrIXTxHZxl74vKm/M=
X-Google-Smtp-Source: ABhQp+S2Orgdm80RONXHarBetG6yBA4wBmk+jUTYK+O2Oc0UTTkslrspwq8W2S4nLWORgCFrC5zu0A==
X-Received: by 10.28.55.78 with SMTP id e75mr109355wma.112.1509722175867;
	Fri, 03 Nov 2017 08:16:15 -0700 (PDT)
Received: from localhost ([51.15.41.238])
	by smtp.gmail.com with ESMTPSA id f84sm935909wme.44.2017.11.03.08.16.14
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 03 Nov 2017 08:16:14 -0700 (PDT)
Date: Fri, 3 Nov 2017 15:16:13 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org,
	QEMU Trivial <qemu-trivial@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20171103151613.GB10959@stefanha-x1.localdomain>
References: <20170126153837.25597-1-stefanha@redhat.com>
	<3ca6376a-ae3e-1e5c-503f-239e4e62799c@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="p4qYPpj5QlsIQJ0K"
Content-Disposition: inline
In-Reply-To: <3ca6376a-ae3e-1e5c-503f-239e4e62799c@redhat.com>
User-Agent: Mutt/1.9.1 (2017-09-22)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::244
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] aio-posix: drop
 QEMU_AIO_POLL_MAX_NS env var
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
X-List-Received-Date: Fri, 03 Nov 2017 15:16:32 -0000


--p4qYPpj5QlsIQJ0K
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 02, 2017 at 07:31:13AM +0100, Thomas Huth wrote:
> On 26.01.2017 16:38, Stefan Hajnoczi wrote:
> > This hunk should not have been merged but I forgot to remove it.  Let's
> > remove it before it slips into a QEMU release.
>=20
> Too late - looks like this patch has never been committed :-(
>=20
> >=20
> > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> > ---
> >  aio-posix.c | 7 -------
> >  1 file changed, 7 deletions(-)
> >=20
> > diff --git a/aio-posix.c b/aio-posix.c
> > index 9453d83..9a6348b 100644
> > --- a/aio-posix.c
> > +++ b/aio-posix.c
> > @@ -723,13 +723,6 @@ bool aio_poll(AioContext *ctx, bool blocking)
> > =20
> >  void aio_context_setup(AioContext *ctx)
> >  {
> > -    /* TODO remove this in final patch submission */
> > -    if (getenv("QEMU_AIO_POLL_MAX_NS")) {
> > -        fprintf(stderr, "The QEMU_AIO_POLL_MAX_NS environment variable=
 has "
> > -                "been replaced with -object iothread,poll-max-ns=3DNUM=
\n");
> > -        exit(1);
> > -    }
> > -
> >  #ifdef CONFIG_EPOLL_CREATE1
> >      assert(!ctx->epollfd);
> >      ctx->epollfd =3D epoll_create1(EPOLL_CLOEXEC);
> >=20
>=20
> Could we get this at least added for QEMU 2.11 ?
>=20
> Reviewed-by: Thomas Huth <thuth@redhat.com>

I am sending a new version of this patch (it needs to be rebased).

Stefan

--p4qYPpj5QlsIQJ0K
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJZ/Ig9AAoJEJykq7OBq3PIKZQIAJz+Wifjl5lIIVVZkd5vY9DG
J0af5Z9gXYj/MHSA/MuiMYRsxX9xkcuUgbGxxON/Gg6JzimHeK7B7oyUJ20wRLJ9
U8ylpjHCdfR3EFygdoeju796hQPORc04fjI1dHDpwZJViP+D0ojLNstyFGbJkUnR
/FAT2AVB7T0af2Rbusk+pGTIq5lm6PSXsr135kJ579WB8DqksXA2NVElkLu0arU6
WLGKI3LyzCCXG2t+Cnj1TxLyYVEVMR3/ZUIULZ0vPO+3OgqXkJG7iuCZgjbuRGAV
U4me9yUrfc3fmSd02MJKclVZI1wwMTuOCfuPiAgJH0noRhgEvhwpH6nS2WJA/bw=
=bLgj
-----END PGP SIGNATURE-----

--p4qYPpj5QlsIQJ0K--

