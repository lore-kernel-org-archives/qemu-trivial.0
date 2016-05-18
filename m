Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b325A-0000vM-Q9
	for mharc-qemu-trivial@gnu.org; Wed, 18 May 2016 10:04:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32947)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1b3254-0000rW-3Q
	for qemu-trivial@nongnu.org; Wed, 18 May 2016 10:04:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1b3252-0006MG-2G
	for qemu-trivial@nongnu.org; Wed, 18 May 2016 10:04:09 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48396)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1b324s-0006L9-SP; Wed, 18 May 2016 10:03:58 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 42316C04B335;
	Wed, 18 May 2016 14:03:58 +0000 (UTC)
Received: from [10.3.116.47] (ovpn-116-47.phx2.redhat.com [10.3.116.47])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u4IE3vwj002382; Wed, 18 May 2016 10:03:57 -0400
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
References: <1463575700-21007-1-git-send-email-mjt@msgid.tls.msk.ru>
Cc: qemu-trivial@nongnu.org
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <573C764D.1080802@redhat.com>
Date: Wed, 18 May 2016 08:03:57 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1463575700-21007-1-git-send-email-mjt@msgid.tls.msk.ru>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="7UchcJ307ESTmtOlnxHX0mkSS3V0tELI6"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Wed, 18 May 2016 14:03:58 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH trivial] docs: "specify"
 spell fix
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
X-List-Received-Date: Wed, 18 May 2016 14:04:15 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--7UchcJ307ESTmtOlnxHX0mkSS3V0tELI6
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 05/18/2016 06:48 AM, Michael Tokarev wrote:
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> ---
>  docs/qapi-code-gen.txt | 2 +-
>  qemu-options.hx        | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--7UchcJ307ESTmtOlnxHX0mkSS3V0tELI6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJXPHZNAAoJEKeha0olJ0NqJhAH/icrEQVlNrCtTMqb2MLRkWPv
RrYTXVZ9QzRiRIFNTCx7D7jpAosLaEjoRrOVr2Kjc7njh4VsEhhYdJFmR64Rq2/1
+8FNpzX1MvE5wVPEo15DGYEmKlCs8SBfFJ22TfiGGHMXeWLoFupsccUKPhwTPNqa
qvI7K0oIV70EKMU2b+rzDL1W2Y9YWJNKj2Olu+84TpoVpdUFkmBUYrpyDDHpv4dH
xMJZ3ousEz1iv27S9iVQc/ApBWJi9vQjPwlLlE8HE8xhQD6gHrtvA8rl9NxAxa5t
IrdTT4x3TS2hXE7Nw+CPTRi3HeZ/3Y5sxy5+bhrx93PjtkBlV9sPp4IY4Q4uUZY=
=RJaY
-----END PGP SIGNATURE-----

--7UchcJ307ESTmtOlnxHX0mkSS3V0tELI6--

