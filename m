Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cZf1p-0008Ql-1u
	for mharc-qemu-trivial@gnu.org; Fri, 03 Feb 2017 09:39:57 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46471)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1cZf1n-0008PH-82
	for qemu-trivial@nongnu.org; Fri, 03 Feb 2017 09:39:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1cZf1m-0003jq-9O
	for qemu-trivial@nongnu.org; Fri, 03 Feb 2017 09:39:55 -0500
Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243]:36399)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <stefanha@gmail.com>)
	id 1cZf1g-0003hn-3J; Fri, 03 Feb 2017 09:39:48 -0500
Received: by mail-wm0-x243.google.com with SMTP id r18so4772507wmd.3;
	Fri, 03 Feb 2017 06:39:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=YOip93W6j1APJj+dyqctbJmEdlMq2ivJGcZVcWsjgBg=;
	b=GCQkRBe3tQwX1I3isWt13a4DcoRq7xJ5WcTZgP9Z4EzEX+/qKHGDL0bDYW1FFsxy5X
	h1U5uiEq7sSjQ6qxm+3sS3OJ0j88Rs5gnzswHsL3+TfIdfwlXXxjdgvIeROGZvXSjjKE
	VRwmm/gX64XKa+b2h6nUp3QNRlIPEqVZoC7KRkP7Q2VX1XilZdlrZAZggshUL8C7jQcu
	UHhKE8FLNghMe5oZSrBb6ykySd4mnrPXwz8soPPelg3+7ss2wMDmnmDHjfD8SOQYbIm3
	DvegFRFObGjJpWFrCbFCYmJDmGa1FFxZd+099tnwycv9eClS4HJ1PEGC2W27evvpxxps
	ljhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=YOip93W6j1APJj+dyqctbJmEdlMq2ivJGcZVcWsjgBg=;
	b=LB2Jj9drXJ6OQWAgz4kbeSdPqTHPIW691hZqoCOtF3PM0WUaD7jT4lf9KQcuZgr/QP
	bbzsJ+QzT9bbdrG0Ug62NNAAIdKoacpznxxJ8I35twC+dY1GhU3SlrvqIsJQPMeaujK7
	A6q0MOuAwDzKfXjKU+bYYAvu6lOijIilXz5/HUVLyIiPQ7m8qrjC6CZom7pFwAS23Pwg
	Srkob99h3iKe1r/h5WwAWJgSH1BYS/1Qc/EzlmCYhOTW/5GULE0sQ9ZmZJq9NRqEIGOW
	KOUMQrDMYlZdszDOWOW8+TYEMBDIQECeqk5hHZLwxy2NkenQqlcX0tdfC8Ii84IodiCo
	wJJw==
X-Gm-Message-State: AMke39l+h5O3CCdKquYvTCPsipwuJFaOC2wyYr2/rmuBqUvlIG84+hDgKAuQTEyAPIKgCA==
X-Received: by 10.28.27.69 with SMTP id b66mr1680696wmb.50.1486132787078;
	Fri, 03 Feb 2017 06:39:47 -0800 (PST)
Received: from localhost (229.227-241-81.adsl-static.isp.belgacom.be.
	[81.241.227.229]) by smtp.gmail.com with ESMTPSA id
	202sm3316092wmp.20.2017.02.03.06.39.45
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 03 Feb 2017 06:39:45 -0800 (PST)
Date: Fri, 3 Feb 2017 14:39:44 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Philipp Gesang <philipp.gesang@intra2net.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Message-ID: <20170203143944.GC642@stefanha-x1.localdomain>
References: <20170202114101.2655-1-philipp.gesang@intra2net.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="kfjH4zxOES6UT95V"
Content-Disposition: inline
In-Reply-To: <20170202114101.2655-1-philipp.gesang@intra2net.com>
User-Agent: Mutt/1.7.1 (2016-10-04)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::243
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] docs: update manpage for
 stderr->log rename
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
X-List-Received-Date: Fri, 03 Feb 2017 14:39:56 -0000


--kfjH4zxOES6UT95V
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 02, 2017 at 12:41:01PM +0100, Philipp Gesang wrote:
> With commit ed7f5f1d8db06fc31352a5ef4f54985e630c575a the name of
> this backend changed from =E2=80=9Cstderr=E2=80=9D to =E2=80=9Clog=E2=80=
=9D.
>=20
> Signed-off-by: Philipp Gesang <philipp.gesang@intra2net.com>
> ---
>  qemu-option-trace.texi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Thanks, applied to my tracing tree:
https://github.com/stefanha/qemu/commits/tracing

Stefan

--kfjH4zxOES6UT95V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJYlJYvAAoJEJykq7OBq3PIKzgIALY+RFz7vW5JFugL1SxQmfqI
pANXTyhNi20h0Hj6jUw1c6GJPYGX9UsAtco9rZmKXOWpc4slwkmCvhq3HpYzngUH
3aHD5FsdcolwQqcgvcMGykoCCQV1BadyXQ3X47NoTroKB9voSuLYJg6FNk3W7ZhP
15TamXqQS2ZPU4Rsx4WeXAOqBgtVRDl6sX7OUFVcn82QiTkkq2NbR/DiRHGVIere
692z+nFKYtkMnzYQmfwxyL/+visKadpLyBp+CRiJFYoTHz5aHO6V52NqnR7N0Tys
JQoVRgJRugDxMSD414XXu7Mi+1145neEXHT+Lm3R2rTWfII0K3T40PnjeZS/LQo=
=ialI
-----END PGP SIGNATURE-----

--kfjH4zxOES6UT95V--

