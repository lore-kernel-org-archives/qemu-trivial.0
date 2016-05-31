Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b7nJx-0007rX-Is
	for mharc-qemu-trivial@gnu.org; Tue, 31 May 2016 13:19:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51132)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1b7nJu-0007qI-KF
	for qemu-trivial@nongnu.org; Tue, 31 May 2016 13:19:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1b7nJp-0006lF-56
	for qemu-trivial@nongnu.org; Tue, 31 May 2016 13:19:09 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51783)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1b7nJZ-0006d9-4j; Tue, 31 May 2016 13:18:49 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D2C7180500;
	Tue, 31 May 2016 17:18:47 +0000 (UTC)
Received: from [10.3.116.22] (ovpn-116-22.phx2.redhat.com [10.3.116.22])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u4VHIkAY027419; Tue, 31 May 2016 13:18:47 -0400
To: Laurent Vivier <lvivier@redhat.com>, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org
References: <1464712565-14857-1-git-send-email-lvivier@redhat.com>
	<1464712565-14857-3-git-send-email-lvivier@redhat.com>
Cc: qemu-block@nongnu.org
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <574DC776.3070203@redhat.com>
Date: Tue, 31 May 2016 11:18:46 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1464712565-14857-3-git-send-email-lvivier@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="xtrExtLeXUMFAEWg9jpMRiMMuCX521cTo"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Tue, 31 May 2016 17:18:48 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 02/16] parallels: Use
 DIV_ROUND_UP
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
X-List-Received-Date: Tue, 31 May 2016 17:19:12 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--xtrExtLeXUMFAEWg9jpMRiMMuCX521cTo
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 05/31/2016 10:35 AM, Laurent Vivier wrote:
> Replace (((n) + (d) - 1) /(d)) by DIV_ROUND_UP(n,d).
>=20
> This patch is the result of coccinelle script
> scripts/coccinelle/round.cocci
>=20
> CC: qemu-block@nongnu.org
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> ---
>  block/parallels.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--xtrExtLeXUMFAEWg9jpMRiMMuCX521cTo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJXTcd2AAoJEKeha0olJ0Nqa+UIAIgHux+mUj4tkO83lUxIsHMR
VL0fO9w8ZTUQ+amj38BnSuIu1fSZCbBeEEIrdT09mVp+m/y3d8jyDDQk5ftYZbtq
f/Kjxz/4enel6ILIPg91YdFiPy7QeacbENsThFp+alq+2ibZ+9MTEPOIWIw6jHSP
Q+Hi8vnTOoURwZK7lWC8F7BEbT4o3F2bq9I2jjx/l9p4M7MbRuaCczPWxVyYuHC4
eoYObdeMzW/aK5N0uWUeglL7q5Q35oMz+048NjX7RI0wIU48o+BQZ+x86YwdKG3I
vTW2sAi+0FNE7acGfI1s17YwFErzzdrJsECSqRJ9X06S+3DTsQgwo1yY+1uONwQ=
=kTPR
-----END PGP SIGNATURE-----

--xtrExtLeXUMFAEWg9jpMRiMMuCX521cTo--

