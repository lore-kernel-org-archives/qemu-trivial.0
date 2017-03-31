Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cty6C-0000zd-23
	for mharc-qemu-trivial@gnu.org; Fri, 31 Mar 2017 11:04:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45311)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1cty69-0000xZ-4Q
	for qemu-trivial@nongnu.org; Fri, 31 Mar 2017 11:04:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1cty68-0004UI-4R
	for qemu-trivial@nongnu.org; Fri, 31 Mar 2017 11:04:21 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53856)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1cty63-0004Oa-HI; Fri, 31 Mar 2017 11:04:15 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 312AB22BA33;
	Fri, 31 Mar 2017 15:04:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 312AB22BA33
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eblake@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 312AB22BA33
Received: from [10.10.122.200] (ovpn-122-200.rdu2.redhat.com [10.10.122.200])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 64F3019CAA;
	Fri, 31 Mar 2017 15:04:13 +0000 (UTC)
To: minyard@acm.org, qemu-devel@nongnu.org
References: <1490970783-29231-1-git-send-email-minyard@acm.org>
Cc: qemu-trivial@nongnu.org, Ed Maste <emaste@freebsd.org>,
	Corey Minyard <cminyard@mvista.com>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <8e26dbca-d2be-01bc-bfa3-a73fcb9d1498@redhat.com>
Date: Fri, 31 Mar 2017 10:04:12 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1490970783-29231-1-git-send-email-minyard@acm.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="uTmtCCX225vnCGM7pBXbCKQswu3Clqlgo"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Fri, 31 Mar 2017 15:04:14 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH for-2.9? v4] ipmi: Fix macro issues
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
X-List-Received-Date: Fri, 31 Mar 2017 15:04:22 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--uTmtCCX225vnCGM7pBXbCKQswu3Clqlgo
Content-Type: multipart/mixed; boundary="9X1RTxap3hNlg4CFeAop6VHEdtcmhJO5l";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: minyard@acm.org, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Ed Maste <emaste@freebsd.org>,
 Corey Minyard <cminyard@mvista.com>
Message-ID: <8e26dbca-d2be-01bc-bfa3-a73fcb9d1498@redhat.com>
Subject: Re: [PATCH for-2.9? v4] ipmi: Fix macro issues
References: <1490970783-29231-1-git-send-email-minyard@acm.org>
In-Reply-To: <1490970783-29231-1-git-send-email-minyard@acm.org>

--9X1RTxap3hNlg4CFeAop6VHEdtcmhJO5l
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 03/31/2017 09:33 AM, minyard@acm.org wrote:
> From: Corey Minyard <cminyard@mvista.com>
>=20
> Macro parameters should almost always have () around them when used.
> llvm reported an error on this.
>=20
> Remove redundant parenthesis and put parenthesis around the entire
> macros with assignments in case they are used in an expression.
>=20
> The macros were doing ((v) & 1) for a binary input, but that only works=

> if v =3D=3D 0 or if v & 1.  Changed to !!(v) so they work for all value=
s.

s/&/=3D=3D/

>=20
> Remove some unused macros.
>=20
> Reported in https://bugs.launchpad.net/bugs/1651167

Might also be worth adding that an audit of the code finds no semantic
change, that this is just cleaning up the compiler warning.

>=20
> Signed-off-by: Corey Minyard <cminyard@mvista.com>
> ---
>=20
> Changes since the last revision:
>=20
>   * Added the !!(v) change
>=20
>  hw/ipmi/isa_ipmi_bt.c | 34 ++++++++++++----------------------
>  1 file changed, 12 insertions(+), 22 deletions(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--9X1RTxap3hNlg4CFeAop6VHEdtcmhJO5l--

--uTmtCCX225vnCGM7pBXbCKQswu3Clqlgo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJY3m/sAAoJEKeha0olJ0NqHEsH/A1EhGfg5W48cAPkdCBq8JVL
M7EA6TxGLS7Mlc1OHrXMtd0HYFAYnFU4yGdCuEWCvblmVzNqMl/WF41eVXwFWGvJ
bxxmIkJ9ELzkBrCqqSUFhq0zf1Ox5ZBu/s5GURTyhFFepWmFa0yuZZC7G24hTuRR
J9eoWsa4x7weXMKSA/ptwWddndqx5U0J6hPb+mfGGStPWVn5NfUfNm5dKEY089Rs
v2mUL0oegLCOjknGz+WRYiIuf2OJnxlmwLGBEON1mQgyCLFizJISittA0qyG3NnC
ARVfd79SigQg6iApFn5f/EMOKlDfnyTr37FIm2n2gIfV1dkQF0dFbtB8vMhjwkY=
=nCq2
-----END PGP SIGNATURE-----

--uTmtCCX225vnCGM7pBXbCKQswu3Clqlgo--

