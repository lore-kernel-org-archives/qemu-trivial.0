Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1alfMy-0008DP-Uk
	for mharc-qemu-trivial@gnu.org; Thu, 31 Mar 2016 12:22:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54037)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1alfMq-00080H-EO
	for qemu-trivial@nongnu.org; Thu, 31 Mar 2016 12:22:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1alfMp-0004uv-Dx
	for qemu-trivial@nongnu.org; Thu, 31 Mar 2016 12:22:44 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39440)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1alfMl-0004tk-3z; Thu, 31 Mar 2016 12:22:39 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C9E3F329B;
	Thu, 31 Mar 2016 16:22:38 +0000 (UTC)
Received: from [10.3.113.124] (ovpn-113-124.phx2.redhat.com [10.3.113.124])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u2VGMc6X001501; Thu, 31 Mar 2016 12:22:38 -0400
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <1459434536-28145-1-git-send-email-pbonzini@redhat.com>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <56FD4ECD.9040703@redhat.com>
Date: Thu, 31 Mar 2016 10:22:37 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.7.1
MIME-Version: 1.0
In-Reply-To: <1459434536-28145-1-git-send-email-pbonzini@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="GQsqmtcwx74RwdXQHKAt8IM32Eqr9Jsde"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, jasowang@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] net: fix OptsVisitor memory
	leak
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
X-List-Received-Date: Thu, 31 Mar 2016 16:22:50 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--GQsqmtcwx74RwdXQHKAt8IM32Eqr9Jsde
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 03/31/2016 08:28 AM, Paolo Bonzini wrote:
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

May want to add: regression introduced in commit 96a1616.

> ---
>  net/net.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Eric Blake <eblake@redhat.com>

>=20
> diff --git a/net/net.c b/net/net.c
> index 594c3b8..3847a13 100644
> --- a/net/net.c
> +++ b/net/net.c
> @@ -1100,6 +1100,7 @@ int net_client_init(QemuOpts *opts, int is_netdev=
, Error **errp)
>      }
> =20
>      error_propagate(errp, err);
> +    opts_visitor_cleanup(ov);
>      return ret;
>  }
> =20
>=20

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--GQsqmtcwx74RwdXQHKAt8IM32Eqr9Jsde
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJW/U7OAAoJEKeha0olJ0NqeOIH/29OylXaMeB63nvu1fumHSNv
MMRM7760K6ImgckmBc9UtLQwMeIB55f23Vf3fEBwya7q6jGnKVgHBAEeVT327sW0
5MnDjA7sRhaIsGIx6DUkuvk7PZo9jan2k3erEJhJitRkM3AmvJHqkbU8jMcTxQci
ez4oF2OhzrH0/ADN+XBd58KnW4kC1RQEXYdEEvSikP65eaB1fy/2R9syIu3waFGG
UTJmdpbUMqmFnnxiWTJDFFmHDlq64+WFEfsijcrrdsi8z2V32dMn3Papma2XVcEb
LObetU2eeS6/aOgqzpvICMycUNLiaB4yKX15cHLr3t/EBFSazh91r3qc3Y6WxcQ=
=ke+N
-----END PGP SIGNATURE-----

--GQsqmtcwx74RwdXQHKAt8IM32Eqr9Jsde--

