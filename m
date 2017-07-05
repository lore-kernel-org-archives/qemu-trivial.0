Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dSrcw-0001Nk-FD
	for mharc-qemu-trivial@gnu.org; Wed, 05 Jul 2017 17:14:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39970)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dSrcu-0001M6-Je
	for qemu-trivial@nongnu.org; Wed, 05 Jul 2017 17:14:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dSrct-0005EX-I0
	for qemu-trivial@nongnu.org; Wed, 05 Jul 2017 17:14:24 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46930)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1dSrcn-0005BI-FV; Wed, 05 Jul 2017 17:14:17 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CED1E8535D;
	Wed,  5 Jul 2017 21:14:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com CED1E8535D
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eblake@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com CED1E8535D
Received: from [10.10.120.36] (ovpn-120-36.rdu2.redhat.com [10.10.120.36])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 640365D962;
	Wed,  5 Jul 2017 21:14:11 +0000 (UTC)
To: =?UTF-8?Q?Llu=c3=ads_Vilanova?= <vilanova@ac.upc.edu>,
	qemu-devel@nongnu.org
References: <149915701334.6295.1724301929524364123.stgit@frigg.lan>
	<149915849243.6295.4484103824675839071.stgit@frigg.lan>
Cc: "Emilio G. Cota" <cota@braap.org>, Eduardo Habkost <ehabkost@redhat.com>, 
	Stefan Hajnoczi <stefanha@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
	Laurent Vivier <laurent@vivier.eu>,
	"open list:Trivial patches" <qemu-trivial@nongnu.org>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <d1a9d3b0-96a3-60e0-270b-3e9ef82cafac@redhat.com>
Date: Wed, 5 Jul 2017 16:14:10 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <149915849243.6295.4484103824675839071.stgit@frigg.lan>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="3VlR0NJbEIOepVq1vcmSpvCeUJcf9limI"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Wed, 05 Jul 2017 21:14:16 +0000 (UTC)
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
X-List-Received-Date: Wed, 05 Jul 2017 21:14:25 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--3VlR0NJbEIOepVq1vcmSpvCeUJcf9limI
Content-Type: multipart/mixed; boundary="Pa8qkCw332SFxUW7cf1fCNag7C9xDggpB";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: =?UTF-8?Q?Llu=c3=ads_Vilanova?= <vilanova@ac.upc.edu>,
 qemu-devel@nongnu.org
Cc: "Emilio G. Cota" <cota@braap.org>, Eduardo Habkost <ehabkost@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>,
 "open list:Trivial patches" <qemu-trivial@nongnu.org>
Message-ID: <d1a9d3b0-96a3-60e0-270b-3e9ef82cafac@redhat.com>
Subject: Re: [PATCH v11 6/6] trace: [trivial] Statically enable all guest
 events
References: <149915701334.6295.1724301929524364123.stgit@frigg.lan>
 <149915849243.6295.4484103824675839071.stgit@frigg.lan>
In-Reply-To: <149915849243.6295.4484103824675839071.stgit@frigg.lan>

--Pa8qkCw332SFxUW7cf1fCNag7C9xDggpB
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 07/04/2017 03:54 AM, Llu=C3=ADs Vilanova wrote:
> The existing optimizations makes it feasible to have them available on =
all
> builds.

While this change may feel trivial, I think it is a misnomer to include
"[trivial]" in the subject line, and I also think it should not go in
through qemu-trivial.  The ideal trivial patch is one that can be
applied in isolation, but your patch can only be applied as part of a
series that includes the earlier optimizations that made this one possibl=
e.

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


--Pa8qkCw332SFxUW7cf1fCNag7C9xDggpB--

--3VlR0NJbEIOepVq1vcmSpvCeUJcf9limI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJZXVaiAAoJEKeha0olJ0NqVPoH/3qrlg+HTuT56JX1kcYY98CV
w+dw5wGsTdUxe7ew6Qlfk0RFmCvOJC/jtO8v5AT/VUXM+USCpPhxwZo92CQFvf+C
T3yhZBtG9sztXstcoXNOHJQznRa9Vh/mA5FMxFRL5YFCfot+6CXxyQYS0Dt+FvHC
IsIS+ZvYPGW7CFJpKMTi2OgqwB9MDBMS3CrErel1/0ABYmCsxXWtF8SKu+ZEpEO3
sxkvsvcxXvF18aJwZFvj9zLxfvghkUZZ0lEuVvRrh+MM6S68u1UzOhyMhj98wBBJ
01Q51WiUoqIungitMObgFh4M1ehVgsu8vNxhFnsR1YD92EH2x581+1hVeRWKHZ4=
=Ksa2
-----END PGP SIGNATURE-----

--3VlR0NJbEIOepVq1vcmSpvCeUJcf9limI--

