Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1f3Qw9-0004sM-Sk
	for mharc-qemu-trivial@gnu.org; Tue, 03 Apr 2018 14:45:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56648)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1f3Qw7-0004rJ-FM
	for qemu-trivial@nongnu.org; Tue, 03 Apr 2018 14:45:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1f3Qw6-0008VS-Jz
	for qemu-trivial@nongnu.org; Tue, 03 Apr 2018 14:45:39 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:34600 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1f3Qw2-0008TQ-1q; Tue, 03 Apr 2018 14:45:34 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 70E12406EA52;
	Tue,  3 Apr 2018 18:45:29 +0000 (UTC)
Received: from [10.10.123.104] (ovpn-123-104.rdu2.redhat.com [10.10.123.104])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8A5647C54;
	Tue,  3 Apr 2018 18:45:25 +0000 (UTC)
To: qemu-devel@nongnu.org
References: <20180326184147.1565719-1-eblake@redhat.com>
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <cceeaa0f-946d-5c26-2fad-55cebbb73027@redhat.com>
Date: Tue, 3 Apr 2018 13:45:24 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180326184147.1565719-1-eblake@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="fMrb6uERX3NjXmOY2DMtI2stMHhjjNb7B"
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Tue, 03 Apr 2018 18:45:29 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Tue, 03 Apr 2018 18:45:29 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eblake@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH for-2.12] maint: Add
 .mailmap entries for patches claiming list authorship
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
X-List-Received-Date: Tue, 03 Apr 2018 18:45:40 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--fMrb6uERX3NjXmOY2DMtI2stMHhjjNb7B
Content-Type: multipart/mixed; boundary="Hi0JRBfB4ajtSmauGz43kurhmBrCPI7vr";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org
Message-ID: <cceeaa0f-946d-5c26-2fad-55cebbb73027@redhat.com>
Subject: Re: [Qemu-devel] [PATCH for-2.12] maint: Add .mailmap entries for
 patches claiming list authorship
References: <20180326184147.1565719-1-eblake@redhat.com>
In-Reply-To: <20180326184147.1565719-1-eblake@redhat.com>

--Hi0JRBfB4ajtSmauGz43kurhmBrCPI7vr
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 03/26/2018 01:41 PM, Eric Blake wrote:
> The list did not author any patches, but it does rewrite the
> 'From:' header of messages sent from any domain with restrictive
> SPF policies that would otherwise prevent the message from reaching
> all list recipients.  If a maintainer is not careful to undo the
> list header rewrite, and the author did not include a manual
> 'From:' line in the body to fix the munged header, then 'git am'
> happily attributes the patch to the list.  Add some mailmap
> entries to correct the few that have escaped our attention; while
> we also work on improving the tooling to catch the problem in
> the future before a merge is even made.
>=20
> Also improve the comments occurring in the file, including line
> length improvements.
>=20
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
>=20
> Probably worth inclusion in 2.12-rc1, since it makes statistics
> about the release easier to follow.

I'll include this in my qapi+misc pull for 2.12-rc2

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


--Hi0JRBfB4ajtSmauGz43kurhmBrCPI7vr--

--fMrb6uERX3NjXmOY2DMtI2stMHhjjNb7B
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAlrDy8UACgkQp6FrSiUn
Q2pXSQf/dUqCBhdowFfbfUuHPinKrGtXQOU08oyO4I9MkIw2Ph74puutW/wEWOVg
2pxmOy0u1KXfmrjqmZopoHG7DnDyFugk0+NB6WyftcPAulfh3FIJWH/LkkyJJ7Ix
1RyhzK1l/Vt1fPQQ+RseICf7cFha3C5LmaKQXUpWp9E0zhnV//jCDm2qCM6e0qiQ
OK35f+9Tbbz/RtIPiAHBy4UfRG4WOWTIbJgJyeW8E/DU1XkUkJO2yUqqQUR+Ktrt
7l99YL01yZWmu6KCmBIsnP+ixhXP02w7aeNG3okSpx+D5nyKZ+izge2kutJ8WRyJ
+Fs5G9fOQq0muLqdVmE7613lAR5Glw==
=4yDl
-----END PGP SIGNATURE-----

--fMrb6uERX3NjXmOY2DMtI2stMHhjjNb7B--

