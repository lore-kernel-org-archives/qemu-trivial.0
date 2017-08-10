Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dfoGL-0002Fu-O8
	for mharc-qemu-trivial@gnu.org; Thu, 10 Aug 2017 10:16:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33217)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dfoGI-0002DV-Hx
	for qemu-trivial@nongnu.org; Thu, 10 Aug 2017 10:16:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dfoGH-0000ve-83
	for qemu-trivial@nongnu.org; Thu, 10 Aug 2017 10:16:34 -0400
Received: from mx1.redhat.com ([209.132.183.28]:8218)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1dfoGB-0000tL-IP; Thu, 10 Aug 2017 10:16:27 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 46A966DFBC;
	Thu, 10 Aug 2017 14:16:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 46A966DFBC
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=eblake@redhat.com
Received: from [10.10.120.43] (ovpn-120-43.rdu2.redhat.com [10.10.120.43])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F27C57C8AC;
	Thu, 10 Aug 2017 14:16:23 +0000 (UTC)
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
References: <1502365466-19432-1-git-send-email-thuth@redhat.com>
Cc: qemu-trivial@nongnu.org
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <4ef0d855-504c-e68d-d3a8-5c94e1622fb0@redhat.com>
Date: Thu, 10 Aug 2017 09:16:22 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1502365466-19432-1-git-send-email-thuth@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="VCLHMp5RLmBaoL3G74fQTDdjXes19SlmA"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Thu, 10 Aug 2017 14:16:26 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qemu-doc: Fix "-net van"
 typo
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
X-List-Received-Date: Thu, 10 Aug 2017 14:16:36 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--VCLHMp5RLmBaoL3G74fQTDdjXes19SlmA
Content-Type: multipart/mixed; boundary="5hJN9NVmKIfStWbIOgHcBGUDbNAwVHw2V";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-trivial@nongnu.org
Message-ID: <4ef0d855-504c-e68d-d3a8-5c94e1622fb0@redhat.com>
Subject: Re: [Qemu-devel] [PATCH] qemu-doc: Fix "-net van" typo
References: <1502365466-19432-1-git-send-email-thuth@redhat.com>
In-Reply-To: <1502365466-19432-1-git-send-email-thuth@redhat.com>

--5hJN9NVmKIfStWbIOgHcBGUDbNAwVHw2V
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 08/10/2017 06:44 AM, Thomas Huth wrote:
> While Andrew S. Tanenbaum has a point by saying "Never underestimate th=
e
> bandwidth of a station wagon full of tapes hurtling down the highway",
> we don't support that way of transportation in QEMU yet, so replace the=

> typo with the correct word "vlan".
>=20
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  qemu-doc.texi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

(Kudos for a commit message that is 4 times as long, and definitely
funnier, than the patch itself :)

>=20
> diff --git a/qemu-doc.texi b/qemu-doc.texi
> index 92d50f1..9811476 100644
> --- a/qemu-doc.texi
> +++ b/qemu-doc.texi
> @@ -3243,7 +3243,7 @@ the ``-netdev user,guestfwd=3DARGS'' argument ins=
tead.
> =20
>  @subsection -net vlan (since 2.9.0)
> =20
> -The ``-net van=3DNN'' argument is partially replaced with the
> +The ``-net vlan=3DNN'' argument is partially replaced with the
>  new ``-netdev'' argument. The remaining use cases will no
>  longer be directly supported in QEMU.
> =20
>=20

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


--5hJN9NVmKIfStWbIOgHcBGUDbNAwVHw2V--

--VCLHMp5RLmBaoL3G74fQTDdjXes19SlmA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAlmMarYACgkQp6FrSiUn
Q2rXVAf+OrYHpLQnc6H/6xa/7rfwA+W+fwPzf30x9pmGCPCcvmQkbsOhEcpy9J6D
ZUIv2+5lde5plz+180qZJNHzIAHKPsbemIQf9nzHwrqbvektLjmg7Eff8GLZVF+k
XVRXlzPj21pXBXTrI46fWSWn4WLf7jsdUaF346W0zMdja0qIEp19rt3v6KtiorI9
jJfc71+/rbplFOk5OMQ3viJEyrJ2iKOyJmMqTgHPP72r08ymQLC5qywkxaRTWE7d
9iQYbiiIDemgTlSzTNJ0pNe8iQHyeXogA0pGf8hpLQg/IC6/S81I+6DIfPVU2Uvs
CqC47zptyk2j8a9Fg541jUyEPTVXVg==
=tm1u
-----END PGP SIGNATURE-----

--VCLHMp5RLmBaoL3G74fQTDdjXes19SlmA--

