Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dT2DF-0005Up-6k
	for mharc-qemu-trivial@gnu.org; Thu, 06 Jul 2017 04:32:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36310)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1dT2DD-0005TW-Kx
	for qemu-trivial@nongnu.org; Thu, 06 Jul 2017 04:32:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1dT2DC-0005mp-Nz
	for qemu-trivial@nongnu.org; Thu, 06 Jul 2017 04:32:35 -0400
Received: from mail-wr0-x22a.google.com ([2a00:1450:400c:c0c::22a]:33812)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <stefanha@gmail.com>)
	id 1dT2D6-0005im-O1; Thu, 06 Jul 2017 04:32:28 -0400
Received: by mail-wr0-x22a.google.com with SMTP id 77so18675964wrb.1;
	Thu, 06 Jul 2017 01:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=/4cFlSnhCFOU/CchqXjdHC89DVqHeRJqsHgqzrs6ULM=;
	b=Eou0JxFaxC7/OQzUOivAsLScuM+FLU2k9/QJhJGgnSfzeUjIgUjyuK9WKyWOsrUsEw
	UAWD7TXN7SqonA+JX32IjQwSt+SGWE89JDCBUn2HXHoygqOsIdF0ALKGsENik+Kal6E0
	N1lk4jQbqvi1Oi5+DpfDO9LhNU3Ed1+JkadlyMY9gMEm711IaPLtF4ui4+x2QAmZHMDY
	CvcWVcmnAAvMNvDSzH1n295Pusi0I64Z5pxikipGT8FQDZ4pswu/OOinaFEMGiLvSjk7
	T6Quuy6iW+YMCHpm1VkagXHaRJ4p5LTvKmXMhA2G+Luentjcpy0RmARTci2fRqkxbfMh
	syOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=/4cFlSnhCFOU/CchqXjdHC89DVqHeRJqsHgqzrs6ULM=;
	b=OZ8/n1nOGLuG7T82b/F/xYYYTjdkcvCpann/ZYoOt72rOXpgZARAM4Olm92hBp9RfC
	1k5xZUO5f0AB8Ic41t8v034XVWE6z0lqq0FRvjFyzRKcwLmEN2JgTWb/45XRo593/3l8
	z0/RDWbBcEglSvH3OTxt6ySgEhxxGZfwqAzOQ5/bBaExCBMTGJC7ar79LIRMTwhYk/AY
	nxCaKpUYmF6OaqRlLYtsWo5wrB1iTdVE6rGh8LSz/hbcpug02WALzuwYbDFwB88o7w04
	mR/oshDtXApsuT+Kv5N+tDBeSVjZMz1Iqm48arZ30wN7zRlyadEoJkEoo4hdRoSJz7rN
	uF4A==
X-Gm-Message-State: AIVw110zXR69LcGxW/hHSiNTRU5AQ89leU+MCIbvJsSAQ+XWHgV9ADCV
	HMySSVZWXc08iw==
X-Received: by 10.80.180.207 with SMTP id x15mr14902284edd.117.1499329947668; 
	Thu, 06 Jul 2017 01:32:27 -0700 (PDT)
Received: from localhost ([51.15.41.238]) by smtp.gmail.com with ESMTPSA id
	k49sm20544485eda.45.2017.07.06.01.32.26
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 06 Jul 2017 01:32:26 -0700 (PDT)
Date: Thu, 6 Jul 2017 09:32:25 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: "Daniel P. Berrange" <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	=?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>
Message-ID: <20170706083225.GA30447@stefanha-x1.localdomain>
References: <20170629162046.4135-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Nq2Wo0NMKNjxTN9z"
Content-Disposition: inline
In-Reply-To: <20170629162046.4135-1-berrange@redhat.com>
User-Agent: Mutt/1.8.0 (2017-02-23)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::22a
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] backends: remove empty
 trace-events file
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
X-List-Received-Date: Thu, 06 Jul 2017 08:32:36 -0000


--Nq2Wo0NMKNjxTN9z
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 29, 2017 at 05:20:46PM +0100, Daniel P. Berrange wrote:
> The content of the backends/trace-events file was entirely
> removed in
>=20
>   commit 6b10e573d15ef82dbc5c5b3726028e6642e134f6
>   Author: Marc-Andr=E9 Lureau <marcandre.lureau@redhat.com>
>   Date:   Mon May 29 12:39:42 2017 +0400
>=20
>     char: move char devices to chardev/
>=20
> Leaving the empty file around, causes tracetool to generate
> an empty .dtrace file which makes the dtrace compiler throw
> a syntax error.
>=20
> Signed-off-by: Daniel P. Berrange <berrange@redhat.com>
> ---
>  Makefile.objs         | 1 -
>  backends/trace-events | 0
>  2 files changed, 1 deletion(-)
>  delete mode 100644 backends/trace-events

Thanks, applied to my tracing tree:
https://github.com/stefanha/qemu/commits/tracing

Stefan

--Nq2Wo0NMKNjxTN9z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJZXfWZAAoJEJykq7OBq3PIdTYH/2MHwB0155Zlz7Qt+PnrxBje
QUfBHZGkRcWmaNZBkrsFm6s4wROZZpPPtgn3E6XtylyBBwz4xu3sNIfL1RlVUjUr
Zc0MePCnaKqJevKEjp1kno21No470ylHu5gZh0W9QjT9DV7RLQoK+Yiaarz3wlVM
AbrgJCiuXPeQ+7VJ2j2lw7M32MurJVNmuGHDDlzPp1nQD92bl6QKEDbdtc8mCK7s
cOxpiElo4x7RUZni6tK/3PXBedH5VAEYAKU8gpBqOFkmi8AmnrP3OG/41+pfTeuV
NUwKHdxFsjpMCClkgWOaswsSOpLFKVlap2WH2Kqc+KIghhXWeduaCCoRR+IwmtU=
=ID6p
-----END PGP SIGNATURE-----

--Nq2Wo0NMKNjxTN9z--

