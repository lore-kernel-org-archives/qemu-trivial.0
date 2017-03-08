Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cldGM-0006zF-AE
	for mharc-qemu-trivial@gnu.org; Wed, 08 Mar 2017 10:12:26 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51015)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1cldGK-0006yK-ON
	for qemu-trivial@nongnu.org; Wed, 08 Mar 2017 10:12:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1cldGG-0003G3-Uo
	for qemu-trivial@nongnu.org; Wed, 08 Mar 2017 10:12:24 -0500
Received: from mx1.redhat.com ([209.132.183.28]:42722)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1cldGC-0003Cr-8I; Wed, 08 Mar 2017 10:12:16 -0500
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6EE4F3A76AB;
	Wed,  8 Mar 2017 15:12:16 +0000 (UTC)
Received: from [10.10.124.84] (ovpn-124-84.rdu2.redhat.com [10.10.124.84] (may
	be forged))
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v28FCFoT030247; Wed, 8 Mar 2017 10:12:15 -0500
To: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org
References: <20170307184517.21521-1-eblake@redhat.com>
	<32c14d52-e8d0-09a7-4232-52dab2ae3e8c@redhat.com>
Cc: qemu-trivial@nongnu.org
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <8dda4d42-59ed-5ed3-2037-ca1202df87a6@redhat.com>
Date: Wed, 8 Mar 2017 09:12:13 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <32c14d52-e8d0-09a7-4232-52dab2ae3e8c@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="oh54W3q65IbssfXdjV9jJNtoOJ19kLSHA"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Wed, 08 Mar 2017 15:12:16 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH for-2.9?] tests: Ignore more test
 executables
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
X-List-Received-Date: Wed, 08 Mar 2017 15:12:25 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--oh54W3q65IbssfXdjV9jJNtoOJ19kLSHA
Content-Type: multipart/mixed; boundary="mrTrQVVHbrTcb7jRQPE36LAVWDPMtAmCb";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
Message-ID: <8dda4d42-59ed-5ed3-2037-ca1202df87a6@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH for-2.9?] tests: Ignore more test
 executables
References: <20170307184517.21521-1-eblake@redhat.com>
 <32c14d52-e8d0-09a7-4232-52dab2ae3e8c@redhat.com>
In-Reply-To: <32c14d52-e8d0-09a7-4232-52dab2ae3e8c@redhat.com>

--mrTrQVVHbrTcb7jRQPE36LAVWDPMtAmCb
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 03/08/2017 04:00 AM, Laurent Vivier wrote:
> and tests/test-arm-mptimer?

Introduced in commit 882fac37. Looks like my usual subset build focusing
on x86 doesn't see it, but indeed an all-targets build shows it. I'll
spin a v2.

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--mrTrQVVHbrTcb7jRQPE36LAVWDPMtAmCb--

--oh54W3q65IbssfXdjV9jJNtoOJ19kLSHA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJYwB9NAAoJEKeha0olJ0NqH5AH/R8o0hmRnYz7zgBOiZeylxB9
9Wr1Lk8ziG91lAL11yJq4G/Sw8dRK7KQ1JfqAJJI1IXxvVZs4Icnwu5ojXd0BWrm
RJNOPJ3WHBUYBXIGcQSFTaqY5IxT3RqPRJC4QSNCtGCkopbOJjd6pORVNdSealMF
T4AWjXfdYdZRMQm+IP4KjKGC452bRkWruSUVw4ZCu0WzbYbhxGFoB1ilEMUcIoR2
Mo2flm76oJn8q3oZImnr8Einweuu6+A+hTkp5Eavg45dMjWqnuh/z/7/GntRnTBL
eh0L0Z5JXL2ma5Ib5+wln/Q3/zsNSZpSCfFxISSJgfLngk7+AtSDDynTeOLTvNI=
=aUj4
-----END PGP SIGNATURE-----

--oh54W3q65IbssfXdjV9jJNtoOJ19kLSHA--

