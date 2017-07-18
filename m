Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dXaYV-0006ld-2z
	for mharc-qemu-trivial@gnu.org; Tue, 18 Jul 2017 18:01:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51435)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dXaYS-0006jJ-Hy
	for qemu-trivial@nongnu.org; Tue, 18 Jul 2017 18:01:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dXaYR-0001cT-M9
	for qemu-trivial@nongnu.org; Tue, 18 Jul 2017 18:01:20 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53900)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1dXaYL-0001Zh-D4; Tue, 18 Jul 2017 18:01:13 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1232B7F6B0;
	Tue, 18 Jul 2017 22:01:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 1232B7F6B0
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eblake@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 1232B7F6B0
Received: from [10.10.120.160] (ovpn-120-160.rdu2.redhat.com [10.10.120.160])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 680A177DF3;
	Tue, 18 Jul 2017 22:01:11 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
References: <1500395194-21455-1-git-send-email-peter.maydell@linaro.org>
	<1500395194-21455-5-git-send-email-peter.maydell@linaro.org>
Cc: patches@linaro.org
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <b27c6322-49f7-3f73-6df3-e8f4ddae9652@redhat.com>
Date: Tue, 18 Jul 2017 17:01:10 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1500395194-21455-5-git-send-email-peter.maydell@linaro.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="oqF0PEK6SiOdNrquXm7iooovLv7N8DHT3"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Tue, 18 Jul 2017 22:01:12 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH for-2.10 4/4]
 bsd-user/main.c: Fix unused variable warning
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
X-List-Received-Date: Tue, 18 Jul 2017 22:01:21 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--oqF0PEK6SiOdNrquXm7iooovLv7N8DHT3
Content-Type: multipart/mixed; boundary="JuJF3Df8ODv3FlM9VkfHNI6f7SrNCFGnr";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
Cc: patches@linaro.org
Message-ID: <b27c6322-49f7-3f73-6df3-e8f4ddae9652@redhat.com>
Subject: Re: [Qemu-devel] [PATCH for-2.10 4/4] bsd-user/main.c: Fix unused
 variable warning
References: <1500395194-21455-1-git-send-email-peter.maydell@linaro.org>
 <1500395194-21455-5-git-send-email-peter.maydell@linaro.org>
In-Reply-To: <1500395194-21455-5-git-send-email-peter.maydell@linaro.org>

--JuJF3Df8ODv3FlM9VkfHNI6f7SrNCFGnr
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 07/18/2017 11:26 AM, Peter Maydell wrote:
> On OpenBSD the compiler warns:
> bsd-user/main.c:622:21: warning: variable 'sig' set but not used [-Wunu=
sed-but-set-variable]
>=20
> This is because a lot of the signal delivery code is #if-0'd
> out as unused. Reshuffle #ifdefs a bit to silence the warning.

Why not just nuke the #if 0 code instead (we can always 'git revert' it
later as a starting point for someone that wants to implement it).

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


--JuJF3Df8ODv3FlM9VkfHNI6f7SrNCFGnr--

--oqF0PEK6SiOdNrquXm7iooovLv7N8DHT3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAlluhSYACgkQp6FrSiUn
Q2oW9AgAgBBKucdENlPDMPletaUcuhRl7j/M2paG2eeDy3m6pjSKbpj1lz+RZfRK
mL545LKV2BMK8hWSgl+dO5dIMxJmWrRkgkbKaHCsHgZ7Lo5g8N1B7XsCEWRCoOh5
feuOcrY6mcO9L3HgrgYRc3LkfQUMSF5w5N0KgY+GASPW9qh3w+vy+Adm4ctwZE3p
gmn0UUeySY4vjtMf5d5xjoWJ5ZYiGSibHC+Ue8DrDpsSKSi20jCMY1JRyytpyjTj
yrRWpVLA+pJbEGV2iZ+wE3pNkOI248YoH/Qxf1qfTHQkAA1e83pyT6mCi33LPkIl
NL36Dg6MyMevG9m7mfOzJp/mv07bVw==
=KGTS
-----END PGP SIGNATURE-----

--oqF0PEK6SiOdNrquXm7iooovLv7N8DHT3--

