Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dUrbm-0007YY-0s
	for mharc-qemu-trivial@gnu.org; Tue, 11 Jul 2017 05:37:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46115)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1dUrbk-0007Xn-6r
	for qemu-trivial@nongnu.org; Tue, 11 Jul 2017 05:37:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1dUrbj-0001ZI-FI
	for qemu-trivial@nongnu.org; Tue, 11 Jul 2017 05:37:28 -0400
Received: from mail-lf0-f45.google.com ([209.85.215.45]:36135)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <stefanha@gmail.com>)
	id 1dUrbf-0001Xy-2e; Tue, 11 Jul 2017 05:37:23 -0400
Received: by mail-lf0-f45.google.com with SMTP id h22so79524468lfk.3;
	Tue, 11 Jul 2017 02:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=fzJjb6Y4oLuyjvpJevZUgo3/Ir8WI48S0uAiI6X6/4U=;
	b=bdWd/FZyzrgijrylbKaDDK4Sie2Fcgi3Yi3V9PTXpUFZGiNrkyKc2IkyKf8RWuYhIM
	s2U3KhBccDWRad7V485PQkIvqDcil1TrFNIG4DJMJ/NGyEVFqqntf92tSH3FSXPasAvn
	Aa02wOR3HBV1tlrvjittXJQNUoQFKq2d7sY6MLyIDgo36Kus9Q1wOX2Wjj53wfogmwVH
	R6GWmsa4N2gakDtVlvBVE6Uf+LlWDqiAHR90RAI2eFS+WyLbiL5UDYQl8kbrsaZgbLXp
	z8ns7JvutvfjQOXnpcj+zlwyOjLQna4l464inpcKVMrA0F2rWLAsQZr7e5Jsw53Fd2KQ
	O54Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=fzJjb6Y4oLuyjvpJevZUgo3/Ir8WI48S0uAiI6X6/4U=;
	b=Z4iG4ZrzoG5ofwyFUUKX1JxE3mQOaZ+LbfJ6qv9031A97vx/d7HGksxLH5pCTdqpjY
	lb2VaGhIbTlrNTe88oRzlEca6t+ReNIU19wo62sFHYrkCnHypSLDXim1zQ9CbZ0So6kI
	Az1IwO2fFl+sYj6wuV21ycFt81K31s400a7xJDwUuIx0abL4c6XtEKHeR+Aj21QwL+g4
	tc59WAvPIYORNx7arZFw44psA8AJfSDyWTi+mGvJEqpKQlUMfn1CxBhoP/QzFY/KxlLZ
	rHrTG2t1X78p3j7oa4C5iCxUygW5JIObiqKhNJN1pBHmOysHRqA2SXBCMfvcQhmHqH1G
	OdUg==
X-Gm-Message-State: AIVw110YbJXomxVb+6Kx8fSuOD5uJwFZMjbORxUa2EbS8MS0p4ZHpC9k
	OnwXECzZNkZbpw==
X-Received: by 10.80.148.118 with SMTP id q51mr1941169eda.28.1499765781667;
	Tue, 11 Jul 2017 02:36:21 -0700 (PDT)
Received: from localhost ([51.15.41.238])
	by smtp.gmail.com with ESMTPSA id l4sm629675edb.35.2017.07.11.02.36.20
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 11 Jul 2017 02:36:20 -0700 (PDT)
Date: Tue, 11 Jul 2017 10:36:19 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, marcandre.lureau@redhat.com
Message-ID: <20170711093619.GH17792@stefanha-x1.localdomain>
References: <20170707154646.22230-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qM81t570OJUP5TU/"
Content-Disposition: inline
In-Reply-To: <20170707154646.22230-1-pbonzini@redhat.com>
User-Agent: Mutt/1.8.0 (2017-02-23)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.215.45
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] hxtool: remove dead -q
 option
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
X-List-Received-Date: Tue, 11 Jul 2017 09:37:29 -0000


--qM81t570OJUP5TU/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 07, 2017 at 05:46:46PM +0200, Paolo Bonzini wrote:
> This was used to extract .txt documentation for QMP.  This was
> changed to use the QAPI schema instead, so zap it.
>=20
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  scripts/hxtool | 46 +---------------------------------------------
>  1 file changed, 1 insertion(+), 45 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--qM81t570OJUP5TU/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJZZJwTAAoJEJykq7OBq3PIi84H/jP4dQFSbbttSBbvP8lDJNFH
ALi2h5DotiLrVw/VgqY8cv9dLzQhw71d05O0NOCLOlepURPoPhWf5IVUU8cjidRu
opuS33lQ0qEAQbs1ZnzDE37l+HpQfUwrFTgtMOC3zXe7imlCuTMPiyo+AnVI4KLX
AJqgH1/Fxb2PBEobDEOBCSH9is4ZYuNmQk5Ex47rRRY0ZOSxm6xZJKCkyUbS0fZK
dhLlfpoS6uX/eEau3XAto8wB0+6CiV1RiZG0OBaKuODgxAJ/3d9vhX49h33LniJy
Xy+XPZB+fTJjyj63lmOCbrQo8EzKg9OkGxy1s0WBRVwTHb5H9DRJ3Lpdbw0kyEQ=
=iQtW
-----END PGP SIGNATURE-----

--qM81t570OJUP5TU/--

