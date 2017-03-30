Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cteGN-00040w-NB
	for mharc-qemu-trivial@gnu.org; Thu, 30 Mar 2017 13:53:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38407)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1cteGL-0003zV-Pr
	for qemu-trivial@nongnu.org; Thu, 30 Mar 2017 13:53:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1cteGK-00032l-SL
	for qemu-trivial@nongnu.org; Thu, 30 Mar 2017 13:53:33 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44562)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1cteGG-0002yp-BT; Thu, 30 Mar 2017 13:53:28 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 189FC67BA8;
	Thu, 30 Mar 2017 17:53:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 189FC67BA8
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eblake@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 189FC67BA8
Received: from [10.10.122.200] (ovpn-122-200.rdu2.redhat.com [10.10.122.200])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 567AD77D53;
	Thu, 30 Mar 2017 17:53:26 +0000 (UTC)
To: minyard@acm.org, qemu-devel@nongnu.org
References: <1490894892-8055-1-git-send-email-minyard@acm.org>
Cc: qemu-trivial@nongnu.org, Ed Maste <emaste@freebsd.org>,
	Corey Minyard <cminyard@mvista.com>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <0715ab2d-f367-03ef-1674-4c1e67756f85@redhat.com>
Date: Thu, 30 Mar 2017 12:53:25 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1490894892-8055-1-git-send-email-minyard@acm.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="3we7cKBIlNE7lTJxsLGGURqiUM892EXcu"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Thu, 30 Mar 2017 17:53:27 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH for-2.9? v2 resend] ipmi: Fix macro issues
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
X-List-Received-Date: Thu, 30 Mar 2017 17:53:34 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--3we7cKBIlNE7lTJxsLGGURqiUM892EXcu
Content-Type: multipart/mixed; boundary="EQF5hLKEqnba6SqsLMBedhGeTgtereso6";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: minyard@acm.org, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Ed Maste <emaste@freebsd.org>,
 Corey Minyard <cminyard@mvista.com>
Message-ID: <0715ab2d-f367-03ef-1674-4c1e67756f85@redhat.com>
Subject: Re: [PATCH for-2.9? v2 resend] ipmi: Fix macro issues
References: <1490894892-8055-1-git-send-email-minyard@acm.org>
In-Reply-To: <1490894892-8055-1-git-send-email-minyard@acm.org>

--EQF5hLKEqnba6SqsLMBedhGeTgtereso6
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 03/30/2017 12:28 PM, minyard@acm.org wrote:
> From: Corey Minyard <cminyard@mvista.com>
>=20
> Macro parameters should almost always have () around them when used.
> llvm reported an error on this.
>=20
> Remove redundant parenthesis and put parenthesis around the entire
> macros with assignments in case they are used in an expression.
>=20
> Remove some unused macros.
>=20
> Reported in https://bugs.launchpad.net/bugs/1651167
>=20
> Signed-off-by: Corey Minyard <cminyard@mvista.com>
> Reviewed-by: Eric Blake <eblake@redhat.com>
> ---
>  hw/ipmi/isa_ipmi_bt.c | 34 ++++++++++++----------------------
>  1 file changed, 12 insertions(+), 22 deletions(-)

Already reviewed by me, so now I'm just adding commentary: Is this still
2.9 material?  It silences a build warning under clang, although I
didn't analyze whether the unpatched code actually caused an observable
behavior bug or just compiler noise.

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--EQF5hLKEqnba6SqsLMBedhGeTgtereso6--

--3we7cKBIlNE7lTJxsLGGURqiUM892EXcu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJY3UYVAAoJEKeha0olJ0Nq3wkIAJppgGGN2nor4ucvEYKfgKfA
nsgbfcHMPCEFrptOqALkiezQlaNyEG/pxYz2k/xDKgXwddIvhcD9TyZxazmDZ+LH
tU4soIJRCetgX2VZFw4taOd7Lx9hYHj72GGsnvfeH8pXQEBQuSPp1/WpV8T9G86q
D8IGXJMhlOeI1q3tnnd8zy6/zQFGN39kxwY6Vsn0K1SN9wKvr5Zqmc4Q+0zrfJns
Er1H3jiF/pET3zJmnwT8GF8WBdkLtpxUaAeIujDCtePtRBYRS/vua6M5c+cJ2H5E
jlyWdeP0J67elNVH0H2pAvoQTxO8XcAe3aJMffo4Hho7ExlpECwk8m+QbFLwndU=
=/xSm
-----END PGP SIGNATURE-----

--3we7cKBIlNE7lTJxsLGGURqiUM892EXcu--

