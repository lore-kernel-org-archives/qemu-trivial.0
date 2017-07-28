Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dbA7N-0003f2-PY
	for mharc-qemu-trivial@gnu.org; Fri, 28 Jul 2017 14:36:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54691)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dbA7L-0003bu-CV
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 14:36:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dbA7K-000195-F9
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 14:36:07 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37932)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1dbA7E-000159-99; Fri, 28 Jul 2017 14:36:00 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1DFC0CA393;
	Fri, 28 Jul 2017 18:35:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 1DFC0CA393
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=eblake@redhat.com
Received: from [10.10.120.22] (ovpn-120-22.rdu2.redhat.com [10.10.120.22])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CA8871713F;
	Fri, 28 Jul 2017 18:35:57 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Alberto Garcia <berto@igalia.com>, Max Reitz <mreitz@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>
References: <20170728012542.29975-1-f4bug@amsat.org>
	<20170728012542.29975-3-f4bug@amsat.org>
Cc: qemu-trivial@nongnu.org, qemu-block@nongnu.org, qemu-devel@nongnu.org
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <fae20dad-fec6-24cc-db4e-a0f64e1fc8ca@redhat.com>
Date: Fri, 28 Jul 2017 13:35:56 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170728012542.29975-3-f4bug@amsat.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="5uwtjmibBoCuCPOrPMTxFKPn5hfPgAqGF"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Fri, 28 Jul 2017 18:35:59 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH for 2.10 2/8] docs: fix
 broken paths to docs/interop/qcow2.txt
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
X-List-Received-Date: Fri, 28 Jul 2017 18:36:08 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--5uwtjmibBoCuCPOrPMTxFKPn5hfPgAqGF
Content-Type: multipart/mixed; boundary="ldKDr6bp9161BjBvcp6FTeAkOoMWBhqgS";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Alberto Garcia <berto@igalia.com>, Max Reitz <mreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>
Cc: qemu-trivial@nongnu.org, qemu-block@nongnu.org, qemu-devel@nongnu.org
Message-ID: <fae20dad-fec6-24cc-db4e-a0f64e1fc8ca@redhat.com>
Subject: Re: [Qemu-devel] [PATCH for 2.10 2/8] docs: fix broken paths to
 docs/interop/qcow2.txt
References: <20170728012542.29975-1-f4bug@amsat.org>
 <20170728012542.29975-3-f4bug@amsat.org>
In-Reply-To: <20170728012542.29975-3-f4bug@amsat.org>

--ldKDr6bp9161BjBvcp6FTeAkOoMWBhqgS
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 07/27/2017 08:25 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

The commit message in 1/8 was a lot nicer, in referring to which commit
broke the linkage.

(When backporting patches, a very common thing to do is 'git log' and
then grep for the commit id being backported - if any other commits
refer to the same id, then it's probably a good idea to consider
backporting those other commits as well. But it only works when there is
a good chain of 'patch B fixes patch A' in commit messages)


--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


--ldKDr6bp9161BjBvcp6FTeAkOoMWBhqgS--

--5uwtjmibBoCuCPOrPMTxFKPn5hfPgAqGF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAll7hAwACgkQp6FrSiUn
Q2pgfAgAlxacBJbFu7ju7V/xVednRszXwZ0do1m2AuxBykyU4sHafly0XZinqrCg
nSr58kvzqwuj6pkh0dQVCHzE/910Ayv+wXSKTAGyRCljNiML2kk+v/F5UmU4CzJP
gK371Ch2iBhRAmX9CzE5cKriBAhFlkY7xB6Eb7KaoVBEwBcRvhUVoDjIdAhwidxn
WdLxZMRz2DX/9odpd1gH+iW2UHOm3S7MXEcvAMUK4OTc2ajC/cw1n42HhV0XaEvx
dOmBO28AKbZjl207XJki48YRHZKe7e1oFEZBTL6t8fxFSu8Z4NLHMXyAMmr19W8e
kcPCyQoO5jovi2LeqEf31rZZ36q6LA==
=Z9Qd
-----END PGP SIGNATURE-----

--5uwtjmibBoCuCPOrPMTxFKPn5hfPgAqGF--

