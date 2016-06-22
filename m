Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bFkEe-0000QS-2J
	for mharc-qemu-trivial@gnu.org; Wed, 22 Jun 2016 11:38:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44405)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1bFkEW-0000J8-Ls
	for qemu-trivial@nongnu.org; Wed, 22 Jun 2016 11:38:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1bFkEU-0007mv-IY
	for qemu-trivial@nongnu.org; Wed, 22 Jun 2016 11:38:27 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39115)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1bFkEQ-0007lG-Sj; Wed, 22 Jun 2016 11:38:23 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6744EC05FBB3;
	Wed, 22 Jun 2016 15:38:22 +0000 (UTC)
Received: from [10.3.116.13] (ovpn-116-13.phx2.redhat.com [10.3.116.13])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u5MFcLHH013919; Wed, 22 Jun 2016 11:38:22 -0400
To: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org
References: <1466609642-17709-1-git-send-email-lvivier@redhat.com>
Cc: Eduardo Habkost <ehabkost@redhat.com>, qemu-trivial@nongnu.org
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <576AB0ED.4070006@redhat.com>
Date: Wed, 22 Jun 2016 09:38:21 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1466609642-17709-1-git-send-email-lvivier@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="Sdf6i4jRKgW6Qmth3nlsNvImOwHsFqCN4"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Wed, 22 Jun 2016 15:38:22 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] trace-event: display "%d" instead of
 "0x%d"
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
X-List-Received-Date: Wed, 22 Jun 2016 15:38:35 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Sdf6i4jRKgW6Qmth3nlsNvImOwHsFqCN4
Content-Type: multipart/mixed; boundary="ihWi58SLefRlTAV5Co7n4o1HipDH6pSrC"
From: Eric Blake <eblake@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org
Cc: Eduardo Habkost <ehabkost@redhat.com>, qemu-trivial@nongnu.org
Message-ID: <576AB0ED.4070006@redhat.com>
Subject: Re: [PATCH] trace-event: display "%d" instead of "0x%d"
References: <1466609642-17709-1-git-send-email-lvivier@redhat.com>
In-Reply-To: <1466609642-17709-1-git-send-email-lvivier@redhat.com>

--ihWi58SLefRlTAV5Co7n4o1HipDH6pSrC
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 06/22/2016 09:34 AM, Laurent Vivier wrote:
> Display the slot number of mhp_pc_dimm_assigned_slot()
> using "%d" without the "0x".
>=20
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> ---
>  hw/i386/trace-events | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

>=20
> diff --git a/hw/i386/trace-events b/hw/i386/trace-events
> index ea77bc2..71fc191 100644
> --- a/hw/i386/trace-events
> +++ b/hw/i386/trace-events
> @@ -8,5 +8,5 @@ xen_pv_mmio_read(uint64_t addr) "WARNING: read from Xen=
 PV Device MMIO space (ad
>  xen_pv_mmio_write(uint64_t addr) "WARNING: write to Xen PV Device MMIO=
 space (address %"PRIx64")"
> =20
>  # hw/i386/pc.c
> -mhp_pc_dimm_assigned_slot(int slot) "0x%d"
> +mhp_pc_dimm_assigned_slot(int slot) "%d"
>  mhp_pc_dimm_assigned_address(uint64_t addr) "0x%"PRIx64
>=20

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--ihWi58SLefRlTAV5Co7n4o1HipDH6pSrC--

--Sdf6i4jRKgW6Qmth3nlsNvImOwHsFqCN4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJXarDtAAoJEKeha0olJ0NqHeoH/3rxy2xSgBnm5nOnKURlw7le
5gCtd5qEfomt/+o9k/7NxOlwThyAoeZO5JTwOh9SjkvoJda6msqn1rToksQMKy+c
3ZcL2KuXWQypNIYHgG9G2Ljl2x8CdqY+wxcZs22q4nVDKT/5D5SYShhKaNwgOt4S
gmobm7AKdTiJhZAzVFgahsYOcgrYvcayPvIxUFh7aeLS/qOpwCI9bgvW0FLd44uR
rZ8q3QTlzbk7SIJumKwKSlBhxHXHIKYdh1a4v4KQxpTZH2hwg2c3UnFtWO3bipNI
3N0OvZORN4O+bbVqThHzN9/D7KbqL7NluO+nsNYVh7/frb5OL7iOa4nOpD9LVPI=
=+khi
-----END PGP SIGNATURE-----

--Sdf6i4jRKgW6Qmth3nlsNvImOwHsFqCN4--

