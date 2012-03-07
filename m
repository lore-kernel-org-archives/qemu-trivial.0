Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1S5KVB-0008NN-3V
	for mharc-qemu-trivial@gnu.org; Wed, 07 Mar 2012 12:18:13 -0500
Received: from eggs.gnu.org ([208.118.235.92]:39295)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1S5KV4-0008N2-N8
	for qemu-trivial@nongnu.org; Wed, 07 Mar 2012 12:18:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1S5KUu-0002Kr-Pu
	for qemu-trivial@nongnu.org; Wed, 07 Mar 2012 12:18:06 -0500
Received: from mx1.redhat.com ([209.132.183.28]:2432)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1S5KUu-0002Kf-H6; Wed, 07 Mar 2012 12:17:56 -0500
Received: from int-mx02.intmail.prod.int.phx2.redhat.com
	(int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q27HHqNL014937
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Wed, 7 Mar 2012 12:17:52 -0500
Received: from [10.3.113.123] (ovpn-113-123.phx2.redhat.com [10.3.113.123])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id q27HHop7025309; Wed, 7 Mar 2012 12:17:51 -0500
Message-ID: <4F579838.8050701@redhat.com>
Date: Wed, 07 Mar 2012 10:17:44 -0700
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <1331122589-15717-1-git-send-email-peter.maydell@linaro.org>
	<CAJSP0QVjZ_YqRNrf5dVPHTQmkLwPJeo_M1G2z7gfVHBY_-Z33w@mail.gmail.com>
	<4F57959C.5090408@redhat.com>
	<CAFEAcA8_dGFsB0x9gb97S15Mj=BdxuN=Q8u=vbCCkDEPLxhofA@mail.gmail.com>
In-Reply-To: <CAFEAcA8_dGFsB0x9gb97S15Mj=BdxuN=Q8u=vbCCkDEPLxhofA@mail.gmail.com>
X-Enigmail-Version: 1.3.5
OpenPGP: url=http://people.redhat.com/eblake/eblake.gpg
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------enig20E69DF3E0AC959B0F38E0B9"
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.12
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] configure: Quote the
 configure args printed in config.log
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 07 Mar 2012 17:18:12 -0000

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig20E69DF3E0AC959B0F38E0B9
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 03/07/2012 10:08 AM, Peter Maydell wrote:
> If you look at the whole change, rather than just the
> fragment Stefan quoted to comment on:
>=20
>  # Print a helpful header at the top of config.log
>  echo "# QEMU configure log $(date)" >> config.log
> -echo "# produced by $0 $*" >> config.log
> +printf "# Configured with:" >> config.log
> +printf " '%s'" "$0" "$@" >> config.log
> +echo >> config.log
>  echo "#" >> config.log
>=20
> ...you'll see that it does exactly what you suggest.

Good to hear!  Serves me right for not paying attention to the thread
until my personal keyword of 'opengroup' appeared mid-stream, at which
point I'd already deleted your original message to see the full context.

--=20
Eric Blake   eblake@redhat.com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--------------enig20E69DF3E0AC959B0F38E0B9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQEcBAEBCAAGBQJPV5g5AAoJEKeha0olJ0Nq1gIH/3jlyWQAW3qLPetKw0zEvK9u
l4A9pqLl1FeR2jcUtzSnUmh7suBPF40ZdRitAtizC0ckW9RuDqFBezSMSrW5cZJY
wE48YrsAkPJR4zGfb+IgyZgUOkh2+eQ1QmAegvGtIb2xQjGp1BOeuyd1RQiHefjB
yzvv20IUF/5gGCr1rUM8wpnpV4fdtf/SbWfYAPD9qlK+rgFgXT7Qa0HV0ZhNb5Xt
PrhayLN+b4gHptuMqIrM2zkYYERjLTnVekjejsfmA+eZuHZWS2FfgXPTI33Ojk7A
eN9XgDcA7ZFxfRXTqDfWyc2c4e3og+yHAKJNqg6CJzo/be5NC38qDf42dIwcgRQ=
=nV8D
-----END PGP SIGNATURE-----

--------------enig20E69DF3E0AC959B0F38E0B9--

