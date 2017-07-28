Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1db4Do-0004fX-Pe
	for mharc-qemu-trivial@gnu.org; Fri, 28 Jul 2017 08:18:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59224)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1db4Dm-0004db-JI
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 08:18:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1db4Dl-0002FD-33
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 08:18:22 -0400
Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241]:37469)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <stefanha@gmail.com>)
	id 1db4Dd-00029u-Vt; Fri, 28 Jul 2017 08:18:14 -0400
Received: by mail-wm0-x241.google.com with SMTP id t138so8353766wmt.4;
	Fri, 28 Jul 2017 05:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=K7S+izXJ/9VjqQVwrCiDXHgAfotJwkLbwRPJQt96U9o=;
	b=m3jjiWiIKujfL1thkwXlAQNhi42hWOJIxsb2X5eqi650QBiaDKKm9jpi1uxvvDUT3m
	4QoELpTraU6CIE74t4arytcDFY/SmWUDEo98yEcLBuGTtFUv32MH2DVo2oniV1aCc0bM
	mvIGDT+qkkGJioEGzm/vCfhbY8BiqYD9wrt1DjzuLHWIxfhmacRjburuy2UNb3lX9spb
	Ox17PG/r3gnLlR1UcoFEUoRe3tUMCVk7fgn01eWnuCAj6W0Fqbw3st4b4fTdxIZZ4Efk
	0bqxD5fgI+d1Rtd+jfZmVJ4ZfQ4r0zEYOZgs5kW+67nAPINqIe97nqZD+YevtIVVh+jm
	cBtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=K7S+izXJ/9VjqQVwrCiDXHgAfotJwkLbwRPJQt96U9o=;
	b=Hpvd4OgHxtJQXj5rQy1qfbeSNZ25Si/yg4OgfbqjX3S0lxxq34AHPioUqV5tAaI3SX
	TmaTXh0JjJZ8XO9Eqpdv/bJMRxn1kcsxW3tfK5MumTX9P/wyUjtmLgp66F6a7wd7dj0p
	d1m3nvPTuFf8fOwbOBEYgv8CLojSZZ4LVgLzqUWfZYpacEOrUM5uv6sH+rOTWhM0t+ZM
	EKzZGXRY0bx0gN0gAd3d2sKwwh3aYx2Pee7W2Rao7iEiCV+L5rrQkfVeziTEfmYwD+ul
	v+IZNQ0hNjJ02NYx/DntbDG6QNONp0R2Oe9iOIHgVuRulcEZ2BtJ2KbRdYubT9t8OnnS
	DHCw==
X-Gm-Message-State: AIVw111hBkaVZvN8l0vMRB9lRAehDThE3Y1hKUN6kI2z+xpAi01hmcJh
	ZZlVtPBEMAD3d2TbRps=
X-Received: by 10.80.179.156 with SMTP id s28mr6603653edd.57.1501244293076;
	Fri, 28 Jul 2017 05:18:13 -0700 (PDT)
Received: from localhost ([51.15.41.238]) by smtp.gmail.com with ESMTPSA id
	t12sm2626931edi.19.2017.07.28.05.18.11
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 28 Jul 2017 05:18:12 -0700 (PDT)
Date: Fri, 28 Jul 2017 13:18:10 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Cleber Rosa <crosa@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Kevin Wolf <kwolf@redhat.com>
Message-ID: <20170728121810.GK12364@stefanha-x1.localdomain>
References: <20170727120210.6943-1-crosa@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Jtds+vpI57xq70EV"
Content-Disposition: inline
In-Reply-To: <20170727120210.6943-1-crosa@redhat.com>
User-Agent: Mutt/1.8.3 (2017-05-23)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::241
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 0/5] Trivial fixes and
 cleanups
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
X-List-Received-Date: Fri, 28 Jul 2017 12:18:23 -0000


--Jtds+vpI57xq70EV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 27, 2017 at 08:02:05AM -0400, Cleber Rosa wrote:
> This is a collection of trivial fixes and cleanups.  The only expected
> behavior change is in the output on config.log, as per the first
> patch.
>=20
> Cleber Rosa(5):
>   configure: remove duplicate single quotes on config.log
>   qemu-iotests: get rid of _full_imgproto_details()
>   qemu-iotests: remove commented out variables
>   qemu-iotests: remove comment about root privileges
>   docs: fix broken paths to docs/interop dir
>=20
>  configure                           |  4 +---
>  docs/devel/writing-qmp-commands.txt |  2 +-
>  qapi-schema.json                    |  2 +-
>  tests/qemu-iotests/check            | 13 +------------
>  tests/qemu-iotests/common.rc        |  5 -----
>  5 files changed, 4 insertions(+), 22 deletions(-)

CCing Kevin Wolf for qemu-iotests changes.

--Jtds+vpI57xq70EV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJZeyuCAAoJEJykq7OBq3PIlrsH/3Ayv4QECyKxXyp6GulhAFYS
hWTqMi0dqusNqMGJ7nkZrapGCdkWx68J/XiBt3BfxcLABDDawW439oa6KKV1jp29
93mpCgEMYsKIN5hB/9gLJZCzYP8dzrTVVjQcucns35Oh0eMBZVN1sdt635k5EBOX
CU7NMtsR2vK+mIY7RQdQWR71qhbIzmoRknDEJU9cng/ACZQA/AFPx8DYVL1Hchv2
WNuYpYoNLdH08vYPIFicOIkEU1tB4dK+NDUx6qc/8fluIryq7ZrYDXFV4YNMbduj
7FpFVPS/Fo+JujEslgm+d5y/lYVq6jiP6L0fdfkqbnt/Dyqc5oOPvGszDs9XuqI=
=IkX0
-----END PGP SIGNATURE-----

--Jtds+vpI57xq70EV--

