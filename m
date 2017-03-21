Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cqL0G-0003NR-Ni
	for mharc-qemu-trivial@gnu.org; Tue, 21 Mar 2017 10:43:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39984)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1cqL0D-0003Lb-8M
	for qemu-trivial@nongnu.org; Tue, 21 Mar 2017 10:43:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1cqL0C-0007BE-Dh
	for qemu-trivial@nongnu.org; Tue, 21 Mar 2017 10:43:13 -0400
Received: from mx1.redhat.com ([209.132.183.28]:30262)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1cqL06-00079P-EL; Tue, 21 Mar 2017 10:43:06 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 636EC7F342;
	Tue, 21 Mar 2017 14:43:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 636EC7F342
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eblake@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 636EC7F342
Received: from [10.10.121.124] (ovpn-121-124.rdu2.redhat.com [10.10.121.124])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 51D3B60A99;
	Tue, 21 Mar 2017 14:43:03 +0000 (UTC)
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	qemu-devel@nongnu.org
References: <20170311132256.22951-1-marcandre.lureau@redhat.com>
	<20170311132256.22951-4-marcandre.lureau@redhat.com>
Cc: qemu-trivial@nongnu.org, mdroth@linux.vnet.ibm.com, armbru@redhat.com,
	anderson@redhat.com, pbonzini@redhat.com, lersek@redhat.com
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <8a7b0c94-b274-d8c2-a551-dec86814e96c@redhat.com>
Date: Tue, 21 Mar 2017 09:43:01 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170311132256.22951-4-marcandre.lureau@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="dtECbAkD433BILTFNiKU1MF72Nv9BPkN7"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Tue, 21 Mar 2017 14:43:06 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 03/21] object: fix potential
 leak in getters
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
X-List-Received-Date: Tue, 21 Mar 2017 14:43:14 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--dtECbAkD433BILTFNiKU1MF72Nv9BPkN7
Content-Type: multipart/mixed; boundary="8AaNXrdLT3cJGcu3ICkEq8CsjoTDbo5M3";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, mdroth@linux.vnet.ibm.com, armbru@redhat.com,
 anderson@redhat.com, pbonzini@redhat.com, lersek@redhat.com
Message-ID: <8a7b0c94-b274-d8c2-a551-dec86814e96c@redhat.com>
Subject: Re: [Qemu-devel] [PATCH 03/21] object: fix potential leak in getters
References: <20170311132256.22951-1-marcandre.lureau@redhat.com>
 <20170311132256.22951-4-marcandre.lureau@redhat.com>
In-Reply-To: <20170311132256.22951-4-marcandre.lureau@redhat.com>

--8AaNXrdLT3cJGcu3ICkEq8CsjoTDbo5M3
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 03/11/2017 07:22 AM, Marc-Andr=C3=A9 Lureau wrote:
> If the property is not of the requested type, the getters will leak a
> QObject.
>=20
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> Cc: qemu-trivial@nongnu.org
> ---
>  qom/object.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

This one should be safe for 2.9.

Reviewed-by: Eric Blake <eblake@redhat.com>

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--8AaNXrdLT3cJGcu3ICkEq8CsjoTDbo5M3--

--dtECbAkD433BILTFNiKU1MF72Nv9BPkN7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJY0Tv1AAoJEKeha0olJ0NqZIsIAJf7Rm/f5wOVa3LLMK87kC2l
/J9T5hrfDAwHy5dOKFqyi20+ZzCLvVcsZzMMeJfQfWnjD6McXFyjeamZQ3t0tniZ
C/7Tb8T3vlRYaL6vOhTY1OyTGDxgGH1YDkTB3JM20g6aGBxbJ1xa9p9HfokjGK5/
51sTZLMH1TgWk9cNetqV5IoYHyfi/3oF6ckUa1kZClOVTeiTv0yunRV790lMl/gl
VUwj+Ezq/FXZA6JpMcHtILpusUyWw8RDZzG3u2ng1J36Lp+u2/LiDa6Vg6q7L93r
Yd26Ae5pxk50YM9A7ZelhMoVPFc6StNRhfFZql4ahNjwZyFrPU+GDcJ15igrHOY=
=fIBw
-----END PGP SIGNATURE-----

--dtECbAkD433BILTFNiKU1MF72Nv9BPkN7--

