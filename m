Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1db4ET-0005mk-24
	for mharc-qemu-trivial@gnu.org; Fri, 28 Jul 2017 08:19:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59565)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1db4EP-0005ku-TC
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 08:19:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1db4EL-0002cQ-Ki
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 08:19:01 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53702)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1db4EJ-0002as-CM; Fri, 28 Jul 2017 08:18:55 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6B42C2D9210;
	Fri, 28 Jul 2017 12:18:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 6B42C2D9210
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=eblake@redhat.com
Received: from [10.10.120.22] (ovpn-120-22.rdu2.redhat.com [10.10.120.22])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5149D60BE3;
	Fri, 28 Jul 2017 12:18:50 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Eduardo Habkost <ehabkost@redhat.com>, Markus Armbruster
	<armbru@redhat.com>, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
	<marcandre.lureau@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
	Laurent Vivier <lvivier@redhat.com>
References: <20170728053610.15770-1-f4bug@amsat.org>
	<20170728053610.15770-47-f4bug@amsat.org>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <e17ab1d2-3ee8-3a5e-b91f-fdd7d44e1783@redhat.com>
Date: Fri, 28 Jul 2017 07:18:49 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170728053610.15770-47-f4bug@amsat.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="s4Ujwo1tEfExk72AHB7PRWkmA6aEPlJ60"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Fri, 28 Jul 2017 12:18:54 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [RFC PATCH 46/47] MAINTAINERS: add missing
 entries for Coccinelle scripts
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
X-List-Received-Date: Fri, 28 Jul 2017 12:19:03 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--s4Ujwo1tEfExk72AHB7PRWkmA6aEPlJ60
Content-Type: multipart/mixed; boundary="OgOqEBsqjqCC3Vu0wQ9nElERE51IFl8Cj";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Markus Armbruster
 <armbru@redhat.com>, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <lvivier@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Message-ID: <e17ab1d2-3ee8-3a5e-b91f-fdd7d44e1783@redhat.com>
Subject: Re: [RFC PATCH 46/47] MAINTAINERS: add missing entries for Coccinelle
 scripts
References: <20170728053610.15770-1-f4bug@amsat.org>
 <20170728053610.15770-47-f4bug@amsat.org>
In-Reply-To: <20170728053610.15770-47-f4bug@amsat.org>

--OgOqEBsqjqCC3Vu0wQ9nElERE51IFl8Cj
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 07/28/2017 12:36 AM, Philippe Mathieu-Daud=C3=A9 wrote:
> and voluntary myself as reviewer

s/voluntary/volunteer/

>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>=20
> I'm not a Coccinelle specialist but willing to learn and help!
>=20

I'm not sure adding an orphan-only section helps; and some of the
particular scripts have specific maintainers (qobject.cocci).

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


--OgOqEBsqjqCC3Vu0wQ9nElERE51IFl8Cj--

--s4Ujwo1tEfExk72AHB7PRWkmA6aEPlJ60
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAll7K6kACgkQp6FrSiUn
Q2rAPAf9ERacisn5Tl1N45wveBDWN08gODdMJMaXo0Fpst53SM0yof80VT6OeVIK
IDKqmGo0TEodi1b7wWoK4/4od3pP9r0Lm4SV2hFCx3JWlmmKPwCpnkSsYOtuPbpM
P98pE1YtInD73Yg6jRxmavs5yd+sbhirpg9Vmef537JVuyK9Wbto/7EaCGxTLabe
hwEhacC1LxPpc7Jv28ZAXe+FvXuMsRTwR4v0M15e9/Ka4gSWj+RbOkaPIiplK24m
ZR5gb3nSxe/lpUt9NkQIg0EIL8eBVWWONUkdBWx80BXCnxYe5vnMfZH/HHus59ew
PqzcAg0lzYfZnU+TK3C+ORWa0xqBeg==
=lmJz
-----END PGP SIGNATURE-----

--s4Ujwo1tEfExk72AHB7PRWkmA6aEPlJ60--

