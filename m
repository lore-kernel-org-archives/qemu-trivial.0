Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dSkYO-0008Q1-J1
	for mharc-qemu-trivial@gnu.org; Wed, 05 Jul 2017 09:41:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40025)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1dSkYL-0008OC-DQ
	for qemu-trivial@nongnu.org; Wed, 05 Jul 2017 09:41:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1dSkYK-0005vw-AW
	for qemu-trivial@nongnu.org; Wed, 05 Jul 2017 09:41:13 -0400
Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241]:36340)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <stefanha@gmail.com>)
	id 1dSkYF-0005nw-ON; Wed, 05 Jul 2017 09:41:07 -0400
Received: by mail-wm0-x241.google.com with SMTP id y5so32528294wmh.3;
	Wed, 05 Jul 2017 06:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=A1w2HD1NpZwXtWoaixdyiE3xaTfBa8WXHOH+j0pFWtQ=;
	b=POI6Zwr+Axwv4mhEEufvcHeBGqZ0zUrl5UWzBGI2dcDEq/78UL8YJyKEBicxQnf51M
	+pbKlecr5llZAttef41lWL2lKVH9jYAFqENaTDphjkmxHrXqCMqaIHQ5jmSgF2eYQVd4
	Tf+jyMGv15RmBzatOlAD1Cyx7OvCMlj3WhsXi0/Tv2TsL0krxD/QxgYEu6TyyMehhyEF
	HBTSb/0DCPxt4ZuwX3AisAmn2y8Fy4BqltB1aOdUytHzin9REsHxe3R3Y3/CPO77XpC8
	Grl+tYp5cCGzgpNobVTzHsICyE/qDYUfYd6UkZWe0jsryJngnwW1V6dd+2ssfE0FdlNC
	VtFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=A1w2HD1NpZwXtWoaixdyiE3xaTfBa8WXHOH+j0pFWtQ=;
	b=DxuL4Dv9Nlwcti+Gcd5KFPVRk/1ZYVo2L4oao5YE8oBLier/e9kZqoy8245E4EjUs0
	qvTwyCccGCqy1o3OAKyEBblTwt3Jr8YJeuckvmSQ33MAnJay6Gn42Fb3qiU+Vl90l/C1
	L5PpCpmRn5pLu+bbNNAQNX9fVE1KD15If0VGJc5YS/uwsujNuiAzzBQnx/qevTAaG+p2
	d7gTQXh3Sf6JweCo1KzWYpYG0WqYrbVEqnFr4TkxNWO9Zrf/gFCElkS7mn+gem2OJQyJ
	+H5FKafkUJoqxYl5jAw0YDxzq2jYxMqYrprbJXF5Zv5WmCrRasACKrfPyk9iq/1/+OK4
	ZBCQ==
X-Gm-Message-State: AKS2vOxjtaUOUZbp8RHtWOSo1M6ZU9YnvIG4QlU/QoI/K8ZfQ+WoN7AI
	uCP0zF/8aHx2Yw==
X-Received: by 10.80.148.249 with SMTP id t54mr22354390eda.128.1499262066452; 
	Wed, 05 Jul 2017 06:41:06 -0700 (PDT)
Received: from localhost ([51.15.41.238]) by smtp.gmail.com with ESMTPSA id
	k49sm18442797eda.45.2017.07.05.06.41.05
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 05 Jul 2017 06:41:05 -0700 (PDT)
Date: Wed, 5 Jul 2017 14:41:04 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Cc: "Daniel P. Berrange" <berrange@redhat.com>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20170705134104.GD1280@stefanha-x1.localdomain>
References: <20170626101159.19676-1-berrange@redhat.com>
	<c4381bd8-a417-0c3b-f3c2-1292ca9f6dfc@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wULyF7TL5taEdwHz"
Content-Disposition: inline
In-Reply-To: <c4381bd8-a417-0c3b-f3c2-1292ca9f6dfc@redhat.com>
User-Agent: Mutt/1.8.0 (2017-02-23)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::241
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] sockets: avoid formatting
 buffer that may not be NULL terminated
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
X-List-Received-Date: Wed, 05 Jul 2017 13:41:14 -0000


--wULyF7TL5taEdwHz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 26, 2017 at 12:19:40PM +0200, Thomas Huth wrote:
> On 26.06.2017 12:11, Daniel P. Berrange wrote:
> > The 'sun_path' field in the sockaddr_un struct is not required
> > to be NULL termianted, so when reporting an error, we must use
>=20
> s/NULL/NUL/
>=20
> NULL is a pointer, NUL is the '\0' character.

I wanted to point out the same thing to someone recently, so I chased up
a reference to the NUL character in RFC 20 "ASCII format for Network
Interchange".  After all, no one can argue with an RFC.

What I found shocked me!  There must be a typo in the ASCII RFC:
https://tools.ietf.org/html/rfc20#section-5.2

I closed my browser tab quickly and headed to Wikipedia instead.  If the
primary source didn't support my argument, I could always count on good
old Wikipedia...

But do you know what I found?  Someone had conflated nul and null on the
Wikipedia entry:
https://en.wikipedia.org/wiki/Null_character

Amateurs!  The Wikipedia editors probably didn't have the intellectual
calibre to question the correctness of the RFC text the way I did.

But to cut a long story short, as my search continued the evidence
became overwhelming.  It is acceptable to refer to the nul character as
the null character.

Coming back to the patch in question, although we can't complain about
the "NULL" it's with considerable joy that I'd like to highlight:

s/termianted/terminated/

:)
Stefan

--wULyF7TL5taEdwHz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJZXOxvAAoJEJykq7OBq3PIOlIH/jAQV2PBq44J8Cymoj8USWCN
mfE9VdOrQ97H8BSg4cixP+8CRwYlHhedjux+kn7DJN9P7xwE0w8hR1eHy9HR/3sb
USk79KLJ9u6w08lCzosGojqYho/hyQLa65kz1eNFXaSDJrN8QweCdsxOl1yQbvzq
NYh+O1R/9r4f1EBieLWYriFlotCJgRKKuRjfCOjka5Sr2VMGjwSC2dB280gvNIzz
Dn063pWHoBzcrSdy6KkgWVTQH1nrC7XJuhYB1StmBylSzOncIHeqcOyyWRQBbQYR
hcF+BdQmJwl3Xsr3kkLiXxC2YQRYu3z6Lp5Dmmg6AsOe9haQp0UoEr8jGrAsaS0=
=sISa
-----END PGP SIGNATURE-----

--wULyF7TL5taEdwHz--

