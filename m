Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dAdZX-0007IB-4A
	for mharc-qemu-trivial@gnu.org; Tue, 16 May 2017 10:35:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48963)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dAdZU-0007Fs-4h
	for qemu-trivial@nongnu.org; Tue, 16 May 2017 10:35:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dAdZT-00052T-4F
	for qemu-trivial@nongnu.org; Tue, 16 May 2017 10:35:32 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58324)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1dAdZN-00051E-Eh; Tue, 16 May 2017 10:35:25 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F3D07448D6B;
	Tue, 16 May 2017 14:35:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com F3D07448D6B
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eblake@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com F3D07448D6B
Received: from [10.10.123.244] (ovpn-123-244.rdu2.redhat.com [10.10.123.244])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 25F1C18C55;
	Tue, 16 May 2017 14:35:07 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Eduardo Habkost <ehabkost@redhat.com>,
	Markus Armbruster <armbru@redhat.com>
References: <20170516001150.11508-1-f4bug@amsat.org>
	<20170516001150.11508-2-f4bug@amsat.org>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <79ae9877-afd9-50a7-c9f2-a12d294ff1ac@redhat.com>
Date: Tue, 16 May 2017 09:35:07 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.0
MIME-Version: 1.0
In-Reply-To: <20170516001150.11508-2-f4bug@amsat.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="2nSjV1s54Lmm76rN8I5d4eB6xc3NSRwup"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Tue, 16 May 2017 14:35:14 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] coccinelle: fix typo in comment
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
X-List-Received-Date: Tue, 16 May 2017 14:35:33 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--2nSjV1s54Lmm76rN8I5d4eB6xc3NSRwup
Content-Type: multipart/mixed; boundary="NF2xGcxJSCFRAgpDg5c2Ge0Rjuabki89x";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>, Markus Armbruster <armbru@redhat.com>
Message-ID: <79ae9877-afd9-50a7-c9f2-a12d294ff1ac@redhat.com>
Subject: Re: [PATCH] coccinelle: fix typo in comment
References: <20170516001150.11508-1-f4bug@amsat.org>
 <20170516001150.11508-2-f4bug@amsat.org>
In-Reply-To: <20170516001150.11508-2-f4bug@amsat.org>

--NF2xGcxJSCFRAgpDg5c2Ge0Rjuabki89x
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 05/15/2017 07:11 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  scripts/coccinelle/return_directly.cocci | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Did you intend for this to be threaded with your other 'oslib: strip
trailing '\n'...' patch? If so, where's the 0/2 cover letter and proper
subject lines?

At any rate,
Reviewed-by: Eric Blake <eblake@redhat.com>

>=20
> diff --git a/scripts/coccinelle/return_directly.cocci b/scripts/coccine=
lle/return_directly.cocci
> index 48680f2c2a..4cf50e75ea 100644
> --- a/scripts/coccinelle/return_directly.cocci
> +++ b/scripts/coccinelle/return_directly.cocci
> @@ -1,4 +1,4 @@
> -// replace 'R =3D X; return R;' with 'return R;'
> +// replace 'R =3D X; return R;' with 'return X;'
>  @@
>  identifier VAR;
>  expression E;
>=20

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


--NF2xGcxJSCFRAgpDg5c2Ge0Rjuabki89x--

--2nSjV1s54Lmm76rN8I5d4eB6xc3NSRwup
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJZGw4bAAoJEKeha0olJ0NqX3MIAJDE3z4GYtwXE7vCUtQeocJ1
H+Xo1vMRW2nuibw8pTQc1tva6LiJK8EbX2M3bDX4t9pjW7xytM1OWNP5TRcGyl3Q
oGn1tFX8ysEXro7xwk1BXIOTc7I5ziyp1QB6uX+H4wvSjrh2RwXivLjVmWiYkfpy
1INmbxZb5wypoDrsaA0BgKT69MAXsY1nUKp9UIJC198Pox64s9S5Z/12wGeRWjU+
rtNw+zEbUQ3kohGk0Vyz2fclyquP/lBMHoX3VYAVHvBUIWSstTYYgwoarF1U90CJ
ZJafwm7RlcUlda5/KMwv7MJV9AIXMy5O63orZ3k8fcc5lezDw016w/hIc1AegTU=
=4LfI
-----END PGP SIGNATURE-----

--2nSjV1s54Lmm76rN8I5d4eB6xc3NSRwup--

