Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cePPI-0000AR-O1
	for mharc-qemu-trivial@gnu.org; Thu, 16 Feb 2017 11:59:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36330)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1cePPE-00006L-Kj
	for qemu-trivial@nongnu.org; Thu, 16 Feb 2017 11:59:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1cePPD-0000gB-QZ
	for qemu-trivial@nongnu.org; Thu, 16 Feb 2017 11:59:44 -0500
Received: from mx1.redhat.com ([209.132.183.28]:39946)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1cePP7-0000aY-GU; Thu, 16 Feb 2017 11:59:38 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8FC0483F40;
	Thu, 16 Feb 2017 16:59:37 +0000 (UTC)
Received: from [10.10.123.249] (ovpn-123-249.rdu2.redhat.com [10.10.123.249]
	(may be forged))
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v1GGxagY017093; Thu, 16 Feb 2017 11:59:37 -0500
To: Chad Joan <chadjoan@gmail.com>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
References: <CABHMSTVDnAxAvpp81+z_2fkAFO7tazLJs3cFXpuDuuGQj-Ek-A@mail.gmail.com>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <d80521c7-f548-7ec5-0860-e654125da113@redhat.com>
Date: Thu, 16 Feb 2017 10:59:35 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <CABHMSTVDnAxAvpp81+z_2fkAFO7tazLJs3cFXpuDuuGQj-Ek-A@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="7tK3BcG49XM9tLk5bvaHECPTLGfdtrp3q"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Thu, 16 Feb 2017 16:59:37 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] Fix build break during
 configuration on musl-libc based Linux systems.
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
X-List-Received-Date: Thu, 16 Feb 2017 16:59:45 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--7tK3BcG49XM9tLk5bvaHECPTLGfdtrp3q
Content-Type: multipart/mixed; boundary="Rn13MWctn962mdxrr762aHtH8E8SJenhq";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: Chad Joan <chadjoan@gmail.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
Message-ID: <d80521c7-f548-7ec5-0860-e654125da113@redhat.com>
Subject: Re: [Qemu-devel] Fix build break during configuration on musl-libc
 based Linux systems.
References: <CABHMSTVDnAxAvpp81+z_2fkAFO7tazLJs3cFXpuDuuGQj-Ek-A@mail.gmail.com>
In-Reply-To: <CABHMSTVDnAxAvpp81+z_2fkAFO7tazLJs3cFXpuDuuGQj-Ek-A@mail.gmail.com>

--Rn13MWctn962mdxrr762aHtH8E8SJenhq
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 02/16/2017 10:30 AM, Chad Joan wrote:
> Hello,
>=20
> This is a one-line patch to the configure script that will allow QEMU t=
o be
> built on musl-libc based Linux systems.  This problem is only noticeabl=
e
> when QEMU is built with --enable-curses.
>=20
> Detailed reading material if you want to know where this came from:
> https://bugs.gentoo.org/show_bug.cgi?id=3D609364
>=20
> Hope that helps!
> - Chad
>=20
>=20
> qemu-2.8.0-musl-ncurses.patch
>=20


Thanks for the patch.  However, it is not in the usual format (we prefer
'git send-email's inline format, rather than attachements), and is
missing a Signed-off-by: designation, so it cannot be applied without
that being fixed first.  More information at:

http://wiki.qemu-project.org/Contribute/SubmitAPatch

>=20
> diff --git configure configure
> index 1c9655e..9f83176 100755
> --- configure
> +++ configure
> @@ -682,6 +682,7 @@ Haiku)
>    vhost_net=3D"yes"
>    vhost_scsi=3D"yes"
>    vhost_vsock=3D"yes"
> +  QEMU_CFLAGS=3D"-D_XOPEN_SOURCE=3D500 $QEMU_CFLAGS"
>    QEMU_INCLUDES=3D"-I\$(SRC_PATH)/linux-headers -I$(pwd)/linux-headers=
 $QEMU_INCLUDES"
>  ;;
>  esac
>=20

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--Rn13MWctn962mdxrr762aHtH8E8SJenhq--

--7tK3BcG49XM9tLk5bvaHECPTLGfdtrp3q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJYpdp3AAoJEKeha0olJ0Nqu4gH/iqjD7G2aca0/5eCnV8PdKIk
eofVcU3sUIyLw70JBmEhg4Ach9BfjWTZ+45MI+3mR8fadGKOAG0ZelhMtmG1b0KY
29Uu8YPfYTfFAUEHYIKltm2X4qblhsU9wzYR9EBg1Uy/41VQFK6leV0Xe4qcd1OW
w/fkatfpl4+k/6a01jgbok7nBZKFJGNhbpe4iYeYM9SyX3d1Hs1Rg3JtLeZnQ7eo
a7iFxGzexxdbKmTeqOt5R6a1cUYli8KZp5Go+FzfVXucDO+sBKRi8/7nAoj5m+dv
Ubt4rommwkiXycnzzLse0fyaZNBXqka1jpmddSr65i+bIOg3qw4rO5yqY38P2BI=
=swEo
-----END PGP SIGNATURE-----

--7tK3BcG49XM9tLk5bvaHECPTLGfdtrp3q--

