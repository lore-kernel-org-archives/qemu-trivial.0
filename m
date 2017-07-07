Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dTRWC-0001w3-EC
	for mharc-qemu-trivial@gnu.org; Fri, 07 Jul 2017 07:33:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52060)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dTRW9-0001u1-VT
	for qemu-trivial@nongnu.org; Fri, 07 Jul 2017 07:33:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dTRW9-0000Xv-28
	for qemu-trivial@nongnu.org; Fri, 07 Jul 2017 07:33:49 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53964)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1dTRW4-0000W3-IS; Fri, 07 Jul 2017 07:33:44 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 66B5818E3C7;
	Fri,  7 Jul 2017 11:33:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 66B5818E3C7
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eblake@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 66B5818E3C7
Received: from [10.10.120.204] (ovpn-120-204.rdu2.redhat.com [10.10.120.204])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 58A3060BE1;
	Fri,  7 Jul 2017 11:33:38 +0000 (UTC)
To: qemu-devel@nongnu.org, "Emilio G. Cota" <cota@braap.org>,
	Eduardo Habkost <ehabkost@redhat.com>, Stefan Hajnoczi
	<stefanha@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
	Laurent Vivier <laurent@vivier.eu>,
	"open list:Trivial patches" <qemu-trivial@nongnu.org>
References: <149915701334.6295.1724301929524364123.stgit@frigg.lan>
	<149915849243.6295.4484103824675839071.stgit@frigg.lan>
	<d1a9d3b0-96a3-60e0-270b-3e9ef82cafac@redhat.com>
	<87tw2og0ov.fsf@frigg.lan>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <73eddf81-f124-9668-2920-86e6b4873f63@redhat.com>
Date: Fri, 7 Jul 2017 06:33:37 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <87tw2og0ov.fsf@frigg.lan>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="pocikLA7ArMkC5RqfpIJmMCo7N7gCn2Gj"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Fri, 07 Jul 2017 11:33:43 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH v11 6/6] trace: [trivial] Statically
 enable all guest events
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
X-List-Received-Date: Fri, 07 Jul 2017 11:33:51 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--pocikLA7ArMkC5RqfpIJmMCo7N7gCn2Gj
Content-Type: multipart/mixed; boundary="PUpCTX7jGVLDkqbUSSoOliLmXn31l7Jn7";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org, "Emilio G. Cota" <cota@braap.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>,
 "open list:Trivial patches" <qemu-trivial@nongnu.org>
Message-ID: <73eddf81-f124-9668-2920-86e6b4873f63@redhat.com>
Subject: Re: [PATCH v11 6/6] trace: [trivial] Statically enable all guest
 events
References: <149915701334.6295.1724301929524364123.stgit@frigg.lan>
 <149915849243.6295.4484103824675839071.stgit@frigg.lan>
 <d1a9d3b0-96a3-60e0-270b-3e9ef82cafac@redhat.com> <87tw2og0ov.fsf@frigg.lan>
In-Reply-To: <87tw2og0ov.fsf@frigg.lan>

--PUpCTX7jGVLDkqbUSSoOliLmXn31l7Jn7
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 07/07/2017 02:34 AM, Llu=C3=ADs Vilanova wrote:
> Eric Blake writes:
>=20
>> On 07/04/2017 03:54 AM, Llu=C3=ADs Vilanova wrote:
>>> The existing optimizations makes it feasible to have them available o=
n all
>>> builds.
>=20
>> While this change may feel trivial, I think it is a misnomer to includ=
e
>> "[trivial]" in the subject line, and I also think it should not go in
>> through qemu-trivial.  The ideal trivial patch is one that can be
>> applied in isolation, but your patch can only be applied as part of a
>> series that includes the earlier optimizations that made this one poss=
ible.
>=20
> Ok. Does this mean I should send a new series without the trivial tag?

Probably not worth the effort this time around, unless a maintainer
specifically asks for it.

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


--PUpCTX7jGVLDkqbUSSoOliLmXn31l7Jn7--

--pocikLA7ArMkC5RqfpIJmMCo7N7gCn2Gj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJZX3GRAAoJEKeha0olJ0Nq3WUIALBDdRgU6IhBvkAED4ZNze5b
eLf421D4uMAAzEP6qu+HSYu4ggaxn/seyuqc+bN80VRyfVuN0VnEHhasmmtFsPwC
J/QtQwY2FivDILOALj86CppA5k1UzG3t1ExnDoVH58MH6/QRIqI38OxoIIl3FySp
/bqiWld2HdzDjlGq3rfXtuA0M3/N29ju30SsP1dO7KSXioFAvna8SODgnkRGidwa
Hbc64xkbFLWpEHgGXjRbHSdcgpR8bpjx5eWpKPJ/r8ltZth5AJo7Q/iTNZzLvm5e
WzS4/QxKTXwkTjXZXVhgGdJ2F9/ynb2Ce7rGEneoVAST6Kwq8jOoWt2yv9sl9Tg=
=/CJM
-----END PGP SIGNATURE-----

--pocikLA7ArMkC5RqfpIJmMCo7N7gCn2Gj--

