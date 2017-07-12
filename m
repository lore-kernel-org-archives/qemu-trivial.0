Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dVI8z-0000kT-6z
	for mharc-qemu-trivial@gnu.org; Wed, 12 Jul 2017 09:57:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40153)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dVI8x-0000id-8z
	for qemu-trivial@nongnu.org; Wed, 12 Jul 2017 09:57:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dVI8t-0001Lb-96
	for qemu-trivial@nongnu.org; Wed, 12 Jul 2017 09:57:31 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35120)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1dVI8q-0001KD-T0; Wed, 12 Jul 2017 09:57:25 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9271F7F405;
	Wed, 12 Jul 2017 13:57:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 9271F7F405
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eblake@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 9271F7F405
Received: from [10.10.121.60] (ovpn-121-60.rdu2.redhat.com [10.10.121.60])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2BDCC70BA3;
	Wed, 12 Jul 2017 13:57:21 +0000 (UTC)
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
References: <cover.1499866676.git.mjt@msgid.tls.msk.ru>
Cc: qemu-trivial@nongnu.org
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <47cedaad-93e6-fc94-0bc2-278e2eea25e2@redhat.com>
Date: Wed, 12 Jul 2017 08:57:20 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <cover.1499866676.git.mjt@msgid.tls.msk.ru>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="Q0fHUFTSxaJbLprqSVlDwuOgv51veKv7U"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Wed, 12 Jul 2017 13:57:23 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PULL 00/13] Trivial patches for
 2017-07-12
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
X-List-Received-Date: Wed, 12 Jul 2017 13:57:32 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Q0fHUFTSxaJbLprqSVlDwuOgv51veKv7U
Content-Type: multipart/mixed; boundary="FJDkCO49Jx7kwKG1XRETGmCHRooIeSTl2";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
Message-ID: <47cedaad-93e6-fc94-0bc2-278e2eea25e2@redhat.com>
Subject: Re: [Qemu-devel] [PULL 00/13] Trivial patches for 2017-07-12
References: <cover.1499866676.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1499866676.git.mjt@msgid.tls.msk.ru>

--FJDkCO49Jx7kwKG1XRETGmCHRooIeSTl2
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 07/12/2017 08:37 AM, Michael Tokarev wrote:
> The following changes since commit 6b06e3e49eb8c91cc286c16d6bf3181ac296=
f33d:
>=20
>   Merge remote-tracking branch 'remotes/ericb/tags/pull-nbd-2017-07-10-=
v2' into staging (2017-07-10 16:12:47 +0100)
>=20
> are available in the git repository at:
>=20
>   git://git.corpit.ru/qemu.git tags/trivial-patches-fetch
>=20
> for you to fetch changes up to 10cb4ec41734243b2798bd1d53919827eaccd673=
:
>=20
>   qobject: Update coccinelle script to catch Q{INC, DEC}REF (2017-07-12=
 16:34:44 +0300)
>=20
> ----------------------------------------------------------------
> trivial patches for 2017-07-12
>=20
> ----------------------------------------------------------------
> Eric Blake (2):
>       qobject: Catch another straggler for use of qdict_put_str()
>       qobject: Update coccinelle script to catch Q{INC, DEC}REF

You picked up v1 of these patches, when Markus was already planning on
merging v2.  It may be easier to respin a v2 of the pull request that
drops these patches from -trivial.

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


--FJDkCO49Jx7kwKG1XRETGmCHRooIeSTl2--

--Q0fHUFTSxaJbLprqSVlDwuOgv51veKv7U
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJZZirAAAoJEKeha0olJ0Nq8C0H/A+iuTZ7huY6jOadXmVJZ+Z5
9uO1DQ2iH9AkpDCIG6JaYW+JVKaqs1xPt7Ldkw72rhxBDwZNS4UQJhWeMo8mpcGN
t6bFUnzoRgFcawXdzYO+WlVFfgYxBptc9eoH9EUmuSNVLuCg/BXqMynzOjG2N49R
HFVcwHFaWw1iTsmngmuxgJyFi/Sjcm36CSBp7CZbjLlz19oIzTR4gitAbBWXulY+
/Iwjykph6Kfprxac427i/q5u/I0UIk9zX6tdS4lK/jGSYzSgMEhMbLtyjSaLNUcz
VgMHBeorLRXY860IhnYYHsDrRgR39AOwxx1R6j0soUSIMKrFDmr+0XopVk6HbW0=
=H5Ei
-----END PGP SIGNATURE-----

--Q0fHUFTSxaJbLprqSVlDwuOgv51veKv7U--

