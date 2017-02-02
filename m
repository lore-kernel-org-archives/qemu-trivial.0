Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cZNYK-0007EB-EQ
	for mharc-qemu-trivial@gnu.org; Thu, 02 Feb 2017 15:00:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59801)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1cZNYI-0007DI-QL
	for qemu-trivial@nongnu.org; Thu, 02 Feb 2017 15:00:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1cZNYI-0007al-2s
	for qemu-trivial@nongnu.org; Thu, 02 Feb 2017 15:00:18 -0500
Received: from mx1.redhat.com ([209.132.183.28]:58566)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1cZNYD-0007Xt-G6; Thu, 02 Feb 2017 15:00:13 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7E9C2624D3;
	Thu,  2 Feb 2017 20:00:13 +0000 (UTC)
Received: from [10.10.120.245] (ovpn-120-245.rdu2.redhat.com [10.10.120.245]
	(may be forged))
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v12K087H004805; Thu, 2 Feb 2017 15:00:08 -0500
To: Stefan Weil <sw@weilnetz.de>, Richard Henderson <rth@twiddle.net>
References: <20170202195601.11286-1-sw@weilnetz.de>
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <bdfbc0e6-e630-a1ac-5132-24b6a2dd6122@redhat.com>
Date: Thu, 2 Feb 2017 14:00:06 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.6.0
MIME-Version: 1.0
In-Reply-To: <20170202195601.11286-1-sw@weilnetz.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="ir4hejV0fCl6x3XU3XhwhB8W55HPtKpEs"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Thu, 02 Feb 2017 20:00:13 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] tci: Remove invalid
 assertions
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
X-List-Received-Date: Thu, 02 Feb 2017 20:00:19 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--ir4hejV0fCl6x3XU3XhwhB8W55HPtKpEs
Content-Type: multipart/mixed; boundary="6oLhhBsXGjLgOFJSJoJnQk2GbdPdpBuMs";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: Stefan Weil <sw@weilnetz.de>, Richard Henderson <rth@twiddle.net>
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org
Message-ID: <bdfbc0e6-e630-a1ac-5132-24b6a2dd6122@redhat.com>
Subject: Re: [Qemu-devel] [PATCH] tci: Remove invalid assertions
References: <20170202195601.11286-1-sw@weilnetz.de>
In-Reply-To: <20170202195601.11286-1-sw@weilnetz.de>

--6oLhhBsXGjLgOFJSJoJnQk2GbdPdpBuMs
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 02/02/2017 01:56 PM, Stefan Weil wrote:
> tb_jmp_insn_offset and tb_jmp_reset_offset are pointers
> and cannot be used with ARRAY_SIZE.
>=20
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  tcg/tci/tcg-target.inc.c | 2 --
>  1 file changed, 2 deletions(-)

mst posted an alternative patch:
https://lists.gnu.org/archive/html/qemu-devel/2017-02/msg00551.html

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--6oLhhBsXGjLgOFJSJoJnQk2GbdPdpBuMs--

--ir4hejV0fCl6x3XU3XhwhB8W55HPtKpEs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJYk4/HAAoJEKeha0olJ0Nq0joIAIn6iU8NQPMA8ZKwQAz+BrO4
TGfS61oRHA5fiDeh9un0HH8NtSXDCug2AX7tLprvoam5QaFhtJTP2j02yg7R0/r/
Wtf2tlw5ejX/z/Wa5TSe0m3uxeJ5Q3/gAbwzaqTf0vDNlrw5RfoZp6MEjN+XqHj2
EKUpi+yoi4qafhW0ExZDW31kkUcetvXYCm9jkAxNX2FbqoAuewjrNN3doK0ay96c
p3HF0fdhSKvRZFGtn/UpftvameZce+Ofaeo1FcU2Q3USa5RmbnVxfBqCibJ+76S3
9UH+LT2t8bTxs8nLTFl8LUxns7nToyz7gyuTMOxNtggNf/mwVbAg1OV42QzkraU=
=JT3f
-----END PGP SIGNATURE-----

--ir4hejV0fCl6x3XU3XhwhB8W55HPtKpEs--

