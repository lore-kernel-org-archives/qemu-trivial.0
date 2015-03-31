Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Yd29M-0005D2-Ks
	for mharc-qemu-trivial@gnu.org; Tue, 31 Mar 2015 15:48:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41311)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1Yd29J-00058A-RV
	for qemu-trivial@nongnu.org; Tue, 31 Mar 2015 15:48:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1Yd29J-0005Re-1W
	for qemu-trivial@nongnu.org; Tue, 31 Mar 2015 15:48:33 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59735)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1Yd29E-0005Pe-Ix; Tue, 31 Mar 2015 15:48:28 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (Postfix) with ESMTPS id 2082D8EFDE;
	Tue, 31 Mar 2015 19:48:28 +0000 (UTC)
Received: from [10.3.113.77] (ovpn-113-77.phx2.redhat.com [10.3.113.77])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t2VJmRJ8004592; Tue, 31 Mar 2015 15:48:27 -0400
Message-ID: <551AFA0B.3070504@redhat.com>
Date: Tue, 31 Mar 2015 13:48:27 -0600
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Stefan Berger <stefanb@linux.vnet.ibm.com>, qemu-trivial@nongnu.org
References: <1427827750-610946-1-git-send-email-stefanb@linux.vnet.ibm.com>
	<1427827750-610946-2-git-send-email-stefanb@linux.vnet.ibm.com>
In-Reply-To: <1427827750-610946-2-git-send-email-stefanb@linux.vnet.ibm.com>
OpenPGP: url=http://people.redhat.com/eblake/eblake.gpg
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="lLN9bRt0RHDeUTUNKvBJEPnue34B92OMb"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 2/2] tpm: Modify DPRINTF to
 enable -Wformat checking
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
X-List-Received-Date: Tue, 31 Mar 2015 19:48:35 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--lLN9bRt0RHDeUTUNKvBJEPnue34B92OMb
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 03/31/2015 12:49 PM, Stefan Berger wrote:
> Modify DPRINTF to always enable -Wformat checking.
>=20
> Signed-off-by: Stefan Berger <stefanb@linux.vnet.ibm.com>
> ---
>  hw/tpm/tpm_passthrough.c | 16 +++++++---------
>  hw/tpm/tpm_tis.c         | 14 ++++++--------
>  2 files changed, 13 insertions(+), 17 deletions(-)
>=20

Reviewed-by: Eric Blake <eblake@redhat.com>

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--lLN9bRt0RHDeUTUNKvBJEPnue34B92OMb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJVGvoLAAoJEKeha0olJ0NqgDAIAJLzSD0PaQ9/MJc07cpTCinR
ObeqXh1mIKMnd3NJ1Bhj0PnMC/xB60hoF16zPCPrHqAw3AC7orQ88WsGWWoF153j
idR8SYC3G/jAc1NRItf/MK35jLrJkxKLsw+Od2rwrNtQACfvI3cDoTZOool7FKJs
uAVR4uNGlH3ByKkch77yE/q+o8/wQ3scx0LnT3EQrn/YuWACXfY6K2OdBLd5Inu8
iMuzlzIDS01c7p6dHa2tYm+OcJ/4llogufZuc878DOQsiUgVaY7bDM9SJSjs8gI3
psL9quc2Ovp7ktxeBpXzanJ1ZBtCey2VC/aB6QLl2GqW/rBFq0Sv54Yz8IliKVE=
=3Abl
-----END PGP SIGNATURE-----

--lLN9bRt0RHDeUTUNKvBJEPnue34B92OMb--

