Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1d3qzh-0000ii-Hz
	for mharc-qemu-trivial@gnu.org; Thu, 27 Apr 2017 17:30:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37072)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1d3qzf-0000hH-Ia
	for qemu-trivial@nongnu.org; Thu, 27 Apr 2017 17:30:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1d3qze-0001p1-OW
	for qemu-trivial@nongnu.org; Thu, 27 Apr 2017 17:30:31 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46558)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1d3qzY-0001jY-P5; Thu, 27 Apr 2017 17:30:24 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8669FC03BD55;
	Thu, 27 Apr 2017 21:30:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 8669FC03BD55
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eblake@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 8669FC03BD55
Received: from [10.10.123.177] (ovpn-123-177.rdu2.redhat.com [10.10.123.177])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D41D5785EC;
	Thu, 27 Apr 2017 21:30:19 +0000 (UTC)
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, kwolf@redhat.com, mreitz@redhat.com
References: <20170427205100.9505-1-jsnow@redhat.com>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <c8128e40-50f0-ac35-8f83-1c0853cf059d@redhat.com>
Date: Thu, 27 Apr 2017 16:30:18 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.0
MIME-Version: 1.0
In-Reply-To: <20170427205100.9505-1-jsnow@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="lIM04rk9QijfsHmFdnB83atsfpV0j1CPS"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Thu, 27 Apr 2017 21:30:23 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH 0/2] iotests: trivial fixups
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
X-List-Received-Date: Thu, 27 Apr 2017 21:30:32 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--lIM04rk9QijfsHmFdnB83atsfpV0j1CPS
Content-Type: multipart/mixed; boundary="tCLs7m7bLf0SHSVNmbKKHlCJU45x5RhfB";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, kwolf@redhat.com, mreitz@redhat.com
Message-ID: <c8128e40-50f0-ac35-8f83-1c0853cf059d@redhat.com>
Subject: Re: [PATCH 0/2] iotests: trivial fixups
References: <20170427205100.9505-1-jsnow@redhat.com>
In-Reply-To: <20170427205100.9505-1-jsnow@redhat.com>

--tCLs7m7bLf0SHSVNmbKKHlCJU45x5RhfB
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 04/27/2017 03:50 PM, John Snow wrote:
> Excised from an old patchset from 2015, just a couple of touchups.
>=20
> John Snow (2):
>   iotests: clarify help text
>   iotests: fix exclusion option

Reviewed-by: Eric Blake <eblake@redhat.com>

[eww - we were really using 'ls' instead of 'echo' to expand a glob?
Your patch to switch to 'awk' is indeed nicer]

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


--tCLs7m7bLf0SHSVNmbKKHlCJU45x5RhfB--

--lIM04rk9QijfsHmFdnB83atsfpV0j1CPS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJZAmLqAAoJEKeha0olJ0NqezsH/iy7UVtUP/gWAXGBCkgD4box
SAmuJxbeyK3rse0tX7wP7Yz5r86iWGX9XFeT+TSrT11eXfBO8EItQTa6NuP7t0ZE
HyCerSnoTyRkKlCAb9EqkhN9ZXHdRcjdCe9c2WJHItLCKcvSR9c/opwcSYuZVdta
DCERRtFZrOs3t19q6lE79FJB1zX4jPUmcg69Amo50lULoWRqqDccnU71FrT6pVYt
eNefAB13L663PcUsdNBNAVyiSsfNJZhnNIcLTZUyBycdFgAKE7aWjPEBhg4AS4cr
owNYmrQEYg3cvZtPkyeCbak9jSgHre4KN1gACON9Ruzz8wEURLYwOL6pPcF2FY0=
=f9pz
-----END PGP SIGNATURE-----

--lIM04rk9QijfsHmFdnB83atsfpV0j1CPS--

