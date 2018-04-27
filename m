Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fC4Z0-0000ZI-0r
	for mharc-qemu-trivial@gnu.org; Fri, 27 Apr 2018 10:41:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45499)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1fC4Yx-0000Xy-NW
	for qemu-trivial@nongnu.org; Fri, 27 Apr 2018 10:41:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1fC4Yw-0003Pw-SR
	for qemu-trivial@nongnu.org; Fri, 27 Apr 2018 10:41:27 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:39572 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1fC4Yr-0003OZ-Gf; Fri, 27 Apr 2018 10:41:21 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A38B140201DF;
	Fri, 27 Apr 2018 14:41:17 +0000 (UTC)
Received: from [10.10.120.65] (ovpn-120-65.rdu2.redhat.com [10.10.120.65])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 547152156A32;
	Fri, 27 Apr 2018 14:41:13 +0000 (UTC)
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
References: <20180427111502.9822-1-dgilbert@redhat.com>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <7fd850c9-e757-40a0-457c-aaf0d813ccfa@redhat.com>
Date: Fri, 27 Apr 2018 09:41:12 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180427111502.9822-1-dgilbert@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="sTgRYxpTqf4Qs7uR7JGrDPJijlAOgOQhz"
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Fri, 27 Apr 2018 14:41:17 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Fri, 27 Apr 2018 14:41:17 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eblake@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [PATCH] migration: Textual fixups for blocktime
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
X-List-Received-Date: Fri, 27 Apr 2018 14:41:28 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--sTgRYxpTqf4Qs7uR7JGrDPJijlAOgOQhz
Content-Type: multipart/mixed; boundary="E2MrkbFKygWejNVBve8D6G7vwsAeLbMPs";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>,
 qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Message-ID: <7fd850c9-e757-40a0-457c-aaf0d813ccfa@redhat.com>
Subject: Re: [PATCH] migration: Textual fixups for blocktime
References: <20180427111502.9822-1-dgilbert@redhat.com>
In-Reply-To: <20180427111502.9822-1-dgilbert@redhat.com>

--E2MrkbFKygWejNVBve8D6G7vwsAeLbMPs
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 04/27/2018 06:15 AM, Dr. David Alan Gilbert (git) wrote:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>=20
> Blank lines and comments as suggested by Eric.
>=20
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> ---
>  qapi/migration.json | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>=20

Reviewed-by: Eric Blake <eblake@redhat.com>

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


--E2MrkbFKygWejNVBve8D6G7vwsAeLbMPs--

--sTgRYxpTqf4Qs7uR7JGrDPJijlAOgOQhz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAlrjNogACgkQp6FrSiUn
Q2oNhQgAkIoncgEaag+8MHErU0SLOASIkxtc/HlZ5sMDGjcU0X1K4hXSphTsGzfl
MlztykbyJDjCq/nkpWuDBEJIcIOuIablTS23eV391UnckuhW5eTPKFs5bTALxMQ1
1dmhrJ50jVMauC0F1JgR1EadwDtPPC+un99XzJCy+I7IbClqRzmoWowiTc8TMO+O
nMnCn8iz4URoPMtrk4CHMxJh/aGsOWPsS8hD/SihBryHaBjdLbtDFS62ePV7rGB7
L6/RyxA+F8PAttODVRLHXpBwSjPyFugL+GaPUet/g9g8Da2WgrfUXlnep94oRUa0
6HEV3c1sXKBVlFhqh1Sz3dT4gcQsrA==
=Rme/
-----END PGP SIGNATURE-----

--sTgRYxpTqf4Qs7uR7JGrDPJijlAOgOQhz--

