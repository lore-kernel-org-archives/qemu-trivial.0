Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZkIMG-0000xn-Pb
	for mharc-qemu-trivial@gnu.org; Thu, 08 Oct 2015 17:04:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38682)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1ZkIJ7-0008Lj-0t
	for qemu-trivial@nongnu.org; Thu, 08 Oct 2015 17:01:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1ZkIJ1-0003oP-UP
	for qemu-trivial@nongnu.org; Thu, 08 Oct 2015 17:00:56 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60236)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1ZkIIg-0003gW-Aw; Thu, 08 Oct 2015 17:00:30 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (Postfix) with ESMTPS id DADB28EA37;
	Thu,  8 Oct 2015 21:00:29 +0000 (UTC)
Received: from [10.3.113.202] (ovpn-113-202.phx2.redhat.com [10.3.113.202])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t98L0SHx013041; Thu, 8 Oct 2015 17:00:29 -0400
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <1444332916-16476-1-git-send-email-thuth@redhat.com>
	<1444332916-16476-3-git-send-email-thuth@redhat.com>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <5616D96C.70604@redhat.com>
Date: Thu, 8 Oct 2015 15:00:28 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1444332916-16476-3-git-send-email-thuth@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="0ATHR1RVcF8NsVIOMcvHpHMQUPvmtQlNN"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Alexander Graf <agraf@suse.de>, David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 2/5] hw/scsi/spapr_vscsi:
 Remove superfluous memset
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
X-List-Received-Date: Thu, 08 Oct 2015 21:01:01 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--0ATHR1RVcF8NsVIOMcvHpHMQUPvmtQlNN
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 10/08/2015 01:35 PM, Thomas Huth wrote:
> g_malloc0 already clears the memory, so no need for
> the additional memset here.
>=20
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: David Gibson <david@gibson.dropbear.id.au>
> Cc: Alexander Graf <agraf@suse.de>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  hw/scsi/spapr_vscsi.c | 1 -
>  1 file changed, 1 deletion(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--0ATHR1RVcF8NsVIOMcvHpHMQUPvmtQlNN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJWFtlsAAoJEKeha0olJ0NqsM8H/RpcNYo/gSbi/zt8+sROgbIA
qFLLmI+ZF2Nas+5t9gndMH9AZddCIbdMJ+Pzm74Lj16wYSgBFQdziwNP73NDJEss
ZGyiP6D02SUOqGcHptmx/42MshLvbAs4zwul+lLX+vLRAeDsPsjVYckzXeTjagYu
1XYg3Td1FWaLN4MNEva1aJY5dz2bL7yE4i2Ox8btzA54mTaaJyYx7LITL18b0FJv
ZOnq+E8ikfDthgQZ8bEn9py+2mpvyhg7UtDyiVMB/OrsdxQCqIKoZtMizWij9P5R
NI9UObbNh3+6IcZ2XW9BWUqFyLazpPWqJ5nzmwIn6yvb4mXw1rnvIDUjg+ofgek=
=sMEw
-----END PGP SIGNATURE-----

--0ATHR1RVcF8NsVIOMcvHpHMQUPvmtQlNN--

