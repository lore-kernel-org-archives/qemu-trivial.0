Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dZiF2-0008Au-5I
	for mharc-qemu-trivial@gnu.org; Mon, 24 Jul 2017 14:38:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52223)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dZiEz-00088P-GC
	for qemu-trivial@nongnu.org; Mon, 24 Jul 2017 14:38:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dZiEy-0001k9-6V
	for qemu-trivial@nongnu.org; Mon, 24 Jul 2017 14:38:01 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36234)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1dZiEs-0001cE-AP; Mon, 24 Jul 2017 14:37:54 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 070628046F;
	Mon, 24 Jul 2017 18:37:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 070628046F
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eblake@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 070628046F
Received: from [10.10.121.48] (ovpn-121-48.rdu2.redhat.com [10.10.121.48])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6F298600C0;
	Mon, 24 Jul 2017 18:37:50 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	=?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	Riku Voipio <riku.voipio@iki.fi>
References: <20170724182751.18261-1-f4bug@amsat.org>
	<20170724182751.18261-4-f4bug@amsat.org>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <acb16999-952f-bd1e-254b-befe65a259d3@redhat.com>
Date: Mon, 24 Jul 2017 13:37:49 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170724182751.18261-4-f4bug@amsat.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="6PIAcAXlOh7KRIppsrAfDWxHbQ72xmbI4"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Mon, 24 Jul 2017 18:37:53 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH for 2.10 03/35] thunk: check nb_fields is
 valid before continuing
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
X-List-Received-Date: Mon, 24 Jul 2017 18:38:02 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--6PIAcAXlOh7KRIppsrAfDWxHbQ72xmbI4
Content-Type: multipart/mixed; boundary="vKPSJcONh6jn1mRTRKr6tsmwCtruEHlVE";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Riku Voipio <riku.voipio@iki.fi>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Message-ID: <acb16999-952f-bd1e-254b-befe65a259d3@redhat.com>
Subject: Re: [PATCH for 2.10 03/35] thunk: check nb_fields is valid before
 continuing
References: <20170724182751.18261-1-f4bug@amsat.org>
 <20170724182751.18261-4-f4bug@amsat.org>
In-Reply-To: <20170724182751.18261-4-f4bug@amsat.org>

--vKPSJcONh6jn1mRTRKr6tsmwCtruEHlVE
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 07/24/2017 01:27 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> thunk.c:91:32: warning: Call to 'malloc' has an allocation size of 0 by=
tes
>         se->field_offsets[i] =3D malloc(nb_fields * sizeof(int));
>                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>=20
> Reported-by: Clang Static Analyzer
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  thunk.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

Better would be fixing the code to use g_new0, and the corresponding free=
=2E

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


--vKPSJcONh6jn1mRTRKr6tsmwCtruEHlVE--

--6PIAcAXlOh7KRIppsrAfDWxHbQ72xmbI4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAll2Pn0ACgkQp6FrSiUn
Q2oBowf9EUZN9joBagpJ4DWIdKpv3Z2FlBjJNLnrwvb/0MvwHl4e54kf7pXW3NuZ
5RqkfT33aV8P5f/jcFgOE8USCkLMtNoZNb9TX8/ly7GVZ3mx2u2N9k23xGw8zjvi
eo7+tTInKYTA5s/rvnMioBoFHNYoFh4kMXOKJIbaS8yq+kfFo44awuu+P8olm88U
w6sbrrXtfp3+I0L1ODVd/x832ziW4sBZZg7ei2RAS+BRZqWnd6Ol7FX34ZRkVNt+
hHDWkV7Q3bcjMnpRhhhelrR6LeHHDXWcmSp3reRTn6Qem4bbqNhWCTrXRyGauU/2
EOPmTjqGPfmSzu/fkph5DNf58GFz3A==
=qYLB
-----END PGP SIGNATURE-----

--6PIAcAXlOh7KRIppsrAfDWxHbQ72xmbI4--

