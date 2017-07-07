Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dTVd3-000198-Vg
	for mharc-qemu-trivial@gnu.org; Fri, 07 Jul 2017 11:57:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49510)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dTVd2-00017i-5I
	for qemu-trivial@nongnu.org; Fri, 07 Jul 2017 11:57:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dTVd1-0007Ll-Dr
	for qemu-trivial@nongnu.org; Fri, 07 Jul 2017 11:57:12 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44388)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1dTVcv-0007J1-Hm; Fri, 07 Jul 2017 11:57:05 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 62BFA81236;
	Fri,  7 Jul 2017 15:57:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 62BFA81236
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eblake@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 62BFA81236
Received: from [10.10.120.204] (ovpn-120-204.rdu2.redhat.com [10.10.120.204])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B518F782A5;
	Fri,  7 Jul 2017 15:57:00 +0000 (UTC)
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20170707154646.22230-1-pbonzini@redhat.com>
Cc: qemu-trivial@nongnu.org, marcandre.lureau@redhat.com
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <badd5084-8374-46e9-2e28-f973e7922e3f@redhat.com>
Date: Fri, 7 Jul 2017 10:56:59 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170707154646.22230-1-pbonzini@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="4AD5WsCcattd17hODXx44qmo20r7q6jvw"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Fri, 07 Jul 2017 15:57:04 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] hxtool: remove dead -q
 option
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
X-List-Received-Date: Fri, 07 Jul 2017 15:57:13 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--4AD5WsCcattd17hODXx44qmo20r7q6jvw
Content-Type: multipart/mixed; boundary="Ww4meQX88ixxdNJNOaMPKhkSS5kcj06Tg";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, marcandre.lureau@redhat.com
Message-ID: <badd5084-8374-46e9-2e28-f973e7922e3f@redhat.com>
Subject: Re: [Qemu-devel] [PATCH] hxtool: remove dead -q option
References: <20170707154646.22230-1-pbonzini@redhat.com>
In-Reply-To: <20170707154646.22230-1-pbonzini@redhat.com>

--Ww4meQX88ixxdNJNOaMPKhkSS5kcj06Tg
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 07/07/2017 10:46 AM, Paolo Bonzini wrote:
> This was used to extract .txt documentation for QMP.  This was
> changed to use the QAPI schema instead, so zap it.
>=20
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  scripts/hxtool | 46 +---------------------------------------------
>  1 file changed, 1 insertion(+), 45 deletions(-)

Fun diffstat!

Reviewed-by: Eric Blake <eblake@redhat.com>

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


--Ww4meQX88ixxdNJNOaMPKhkSS5kcj06Tg--

--4AD5WsCcattd17hODXx44qmo20r7q6jvw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJZX69LAAoJEKeha0olJ0NqZOsH/jbhOknXN5CPJHpPvhod83Bp
LCQF9hT2EwSAyorcg7BgtVMgLEsRndYqYG3YCBB9bqcgFRtTsEHJpC0NxDgLL699
uoPDygaQRBvB1z1kreog3Yop1SVxXF3SZTQ9uYPNDuOvT8GTYm/1RXKLCe25EzrT
fnkAohwDDqOfSnxOjj5Mnfu9pEUWu8iBYAYvGwZngInRgLPBU2dP3vVf76LhXw8F
ksFEC8JJvQGLBpNN+j7E3dUvXdqjlpOi49HIneOFOK+5ydaBH9kuya8RSu+elNnT
UEO4PSIPrjkAlyJeIRr2TWS4JFJ46uR7b7pDryF3iICbPpFlsAY+2ge/cWka9dU=
=7av+
-----END PGP SIGNATURE-----

--4AD5WsCcattd17hODXx44qmo20r7q6jvw--

