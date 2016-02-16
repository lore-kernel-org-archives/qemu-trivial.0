Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aViTx-0008LW-Vz
	for mharc-qemu-trivial@gnu.org; Tue, 16 Feb 2016 11:28:10 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40418)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1aViTr-00087o-2G
	for qemu-trivial@nongnu.org; Tue, 16 Feb 2016 11:28:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1aViTl-0005KD-Bh
	for qemu-trivial@nongnu.org; Tue, 16 Feb 2016 11:28:02 -0500
Received: from mx1.redhat.com ([209.132.183.28]:42445)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1aViTf-0005JA-FL; Tue, 16 Feb 2016 11:27:51 -0500
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (Postfix) with ESMTPS id 0F86814AAA;
	Tue, 16 Feb 2016 16:27:51 +0000 (UTC)
Received: from [10.3.113.167] (ovpn-113-167.phx2.redhat.com [10.3.113.167])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u1GGRoMs014669; Tue, 16 Feb 2016 11:27:50 -0500
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <1455638581-5912-1-git-send-email-peter.maydell@linaro.org>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <56C34E06.6050904@redhat.com>
Date: Tue, 16 Feb 2016 09:27:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.0
MIME-Version: 1.0
In-Reply-To: <1455638581-5912-1-git-send-email-peter.maydell@linaro.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="nvLPEFLTCrcmLHiliP9PeIeoADPNJRDwX"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>, patches@linaro.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qemu-options.hx: Improve
 documentation of chardev multiplexing mode
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 16 Feb 2016 16:28:08 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--nvLPEFLTCrcmLHiliP9PeIeoADPNJRDwX
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 02/16/2016 09:03 AM, Peter Maydell wrote:
> The current documentation of chardev mux=3Don is rather brief and opaqu=
e;
> expand it to hopefully be a bit more helpful.
>=20
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> There was some discussion on #qemu yesterday evening about multiplexing=
,
> and "make the docs a bit less confusing" was one suggestion...
> ---
>  qemu-options.hx | 20 +++++++++++++++++++-
>  1 file changed, 19 insertions(+), 1 deletion(-)
>=20

Looks like a strict improvement, so:
Reviewed-by: Eric Blake <eblake@redhat.com>

That said, how does one enter a literal <ctrl-a> to the front end,
instead of getting it interpreted by the mux backend as a signal of
whether to rotate to the next front end?  Is <ctrl-a> an escaping
character, such that sending it twice results in a single instance being
sent to the current guest front end hooked up to the mux?

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--nvLPEFLTCrcmLHiliP9PeIeoADPNJRDwX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJWw04GAAoJEKeha0olJ0NqrHIIAIlfaI01NsEOpT2Ke92ri8dK
Lmx4adbXTgDwQjQ/U9VTIQYm3JGiCh6cnYXLy/JlXM+wdEQmUEZvaUd5abkjogDG
uN2NS8k2O2dJJMq6DcY15oAQKfWATcK3zqx7gykNOu2d6aVris2WDuLv4xYZqn8M
ZaTzm7IRG0RILkTw0cTLgmMNDnylde4EKCFv0P9XohlYLfjrfU1KiM8nB9tO8WLl
wpW1QQOckER0Lg4Im+jcyle5sgCP+4sUqNV9KzH0ZCmKT2VrrYVN2xVv1ICKixSE
HHB1Ddsn9qOjtB/5u6gnHsgAxOlcoO3cm/B0xJ3hm/T9caZtt2RFYAUacQW1y+Q=
=XJvj
-----END PGP SIGNATURE-----

--nvLPEFLTCrcmLHiliP9PeIeoADPNJRDwX--

