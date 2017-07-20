Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dYFiG-0000iP-AM
	for mharc-qemu-trivial@gnu.org; Thu, 20 Jul 2017 13:58:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38752)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dYFiD-0000gb-Up
	for qemu-trivial@nongnu.org; Thu, 20 Jul 2017 13:58:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dYFiD-0007GU-8F
	for qemu-trivial@nongnu.org; Thu, 20 Jul 2017 13:58:10 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51576)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1dYFi5-0007EF-Qv; Thu, 20 Jul 2017 13:58:02 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7921E83F43;
	Thu, 20 Jul 2017 17:58:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 7921E83F43
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eblake@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 7921E83F43
Received: from [10.10.120.37] (ovpn-120-37.rdu2.redhat.com [10.10.120.37])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 15BEB176C6;
	Thu, 20 Jul 2017 17:57:57 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
References: <1500568290-7966-1-git-send-email-peter.maydell@linaro.org>
Cc: patches@linaro.org, Cornelia Huck <cohuck@redhat.com>,
	Alexander Graf <agraf@suse.de>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Kamil Rytarowski <kamil@netbsd.org>, qemu-ppc@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Richard Henderson <rth@twiddle.net>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <2ba1a0e2-3e15-189c-b66f-2128dfb61bad@redhat.com>
Date: Thu, 20 Jul 2017 12:57:52 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1500568290-7966-1-git-send-email-peter.maydell@linaro.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="fttReTR1AOKOwKGEuFOXNi635VXj50GTX"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Thu, 20 Jul 2017 17:58:00 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH for-2.10] Use qemu_tolower()
 and qemu_toupper(), not tolower() and toupper()
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
X-List-Received-Date: Thu, 20 Jul 2017 17:58:11 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--fttReTR1AOKOwKGEuFOXNi635VXj50GTX
Content-Type: multipart/mixed; boundary="lRu3SdDnlMO5enX7qpJBcf59nPSXdr5Vk";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
Cc: patches@linaro.org, Cornelia Huck <cohuck@redhat.com>,
 Alexander Graf <agraf@suse.de>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Kamil Rytarowski <kamil@netbsd.org>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Richard Henderson <rth@twiddle.net>
Message-ID: <2ba1a0e2-3e15-189c-b66f-2128dfb61bad@redhat.com>
Subject: Re: [Qemu-devel] [PATCH for-2.10] Use qemu_tolower() and
 qemu_toupper(), not tolower() and toupper()
References: <1500568290-7966-1-git-send-email-peter.maydell@linaro.org>
In-Reply-To: <1500568290-7966-1-git-send-email-peter.maydell@linaro.org>

--lRu3SdDnlMO5enX7qpJBcf59nPSXdr5Vk
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 07/20/2017 11:31 AM, Peter Maydell wrote:
> On NetBSD, where tolower() and toupper() are implemented using an
> array lookup, the compiler warns if you pass a plain 'char'
> to these functions:
>=20
> gdbstub.c:914:13: warning: array subscript has type 'char'
>=20
> This reflects the fact that toupper() and tolower() give
> undefined behaviour if they are passed a value that isn't
> a valid 'unsigned char' or EOF.
>=20
> We have qemu_tolower() and qemu_toupper() to avoid this problem;
> use them.
>=20
> (The use in scsi-generic.c does not trigger the warning because
> it passes a uint8_t; we switch it anyway, for consistency.)
>=20
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---

Reviewed-by: Eric Blake <eblake@redhat.com>

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


--lRu3SdDnlMO5enX7qpJBcf59nPSXdr5Vk--

--fttReTR1AOKOwKGEuFOXNi635VXj50GTX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAllw7yAACgkQp6FrSiUn
Q2oowgf/TqIbkjwW7kDuvJklojbmdlHqw3+CpZm0QPdatq7tlCSrh7H5e/QGbFUb
aL5Dp9vFOjywUbIR6qCC5nK/+85lB+dW8LEJP0Jl7OY6YhenKPYO+z0RS2e/tx6Z
ekeL+1KAgf5u0JVpvqh9MwyUh74JHb6ihK/gBfRRvVlOwnTSuq0keaCRO9N+DuP+
xH+b/MdWSpO3joLR0fvharTv0+/jQIb33oasHSd34MT8wdZPiezUzW+ecZx7TOfz
DcSCuxN6UhaZgyNejLWIrdKPLFZqMyCfNJr2QYN63NhVDoXHcU+6qHFrhsHlS9wy
CwVX6GOb6Er0WWuUJikybaNwzS0BOg==
=l3lX
-----END PGP SIGNATURE-----

--fttReTR1AOKOwKGEuFOXNi635VXj50GTX--

