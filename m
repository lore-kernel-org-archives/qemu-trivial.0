Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WLIW3-0008HV-0l
	for mharc-qemu-trivial@gnu.org; Wed, 05 Mar 2014 15:34:11 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56314)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1WLIVw-000872-0d
	for qemu-trivial@nongnu.org; Wed, 05 Mar 2014 15:34:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1WLIVr-0006JI-Fb
	for qemu-trivial@nongnu.org; Wed, 05 Mar 2014 15:34:03 -0500
Received: from mx1.redhat.com ([209.132.183.28]:24503)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1WLIVi-0006Gu-Bp; Wed, 05 Mar 2014 15:33:50 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s25KXkIL019937
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Wed, 5 Mar 2014 15:33:46 -0500
Received: from [10.3.113.4] ([10.3.113.4])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s25KXiIo025126; Wed, 5 Mar 2014 15:33:44 -0500
Message-ID: <53178A27.1050103@redhat.com>
Date: Wed, 05 Mar 2014 13:33:43 -0700
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
References: <1394035840-1584-1-git-send-email-imammedo@redhat.com>
	<1394035840-1584-3-git-send-email-imammedo@redhat.com>
In-Reply-To: <1394035840-1584-3-git-send-email-imammedo@redhat.com>
X-Enigmail-Version: 1.6
OpenPGP: url=http://people.redhat.com/eblake/eblake.gpg
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="BCGnoucBdqqh6Wvp7PAFuJtx2fglo4g9o"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: kwolf@redhat.com, aliguori@amazon.com, qemu-trivial@nongnu.org,
	coreyb@linux.vnet.ibm.com, mjt@tls.msk.ru, mreitz@redhat.com,
	stefanha@redhat.com, lcapitulino@redhat.com, pbonzini@redhat.com,
	lersek@redhat.com, afaerber@suse.de
Subject: Re: [Qemu-trivial] [PATCH v3 2/2] vl: convert -m to QemuOpts
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
X-List-Received-Date: Wed, 05 Mar 2014 20:34:08 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--BCGnoucBdqqh6Wvp7PAFuJtx2fglo4g9o
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 03/05/2014 09:10 AM, Igor Mammedov wrote:
> Adds option to -m
>  "size" - startup memory amount
>=20
> For compatibility with legacy CLI if suffix-less number is passed,
> it assumes amount in Mb.
>=20
> Otherwise user is free to use suffixed number using suffixes b,k/K,M,G
>=20
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> Reviewed-by: Eric Blake <eblake@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
> v2:
>  - suggested by Andreas F=C3=A4rber <afaerber@suse.de>
>     * s/fprintf/error_report/
>     * rename 'mem' option to 'size'
>  - fix conflict with missing numa QemuOpts

Given the amount of rework in v2, it may have been smarter to drop my
R-b tag.  But beyond Andreas' findings of missing s/mem/size/ instances,
I'm not spotting any problems, so if that's the only fix you make for
v4, you can keep my R-b.

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--BCGnoucBdqqh6Wvp7PAFuJtx2fglo4g9o
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJTF4onAAoJEKeha0olJ0Nqbk0H+QF4Zk3pGNmb6ikRpKgr/Xwk
EiYdTFQt+uip8JxT8W4sdQLQQIpe2Od0IUSYfuQjAlDPqxuW2MZ+b9F7I8OCaGCL
82ZWvloz8QM3jtR5wNDEZCBt05LNt77h80v/C+TY0cDO9VPTyrZQuRla62Om+G8V
XRaaH15e7V0Cn6GXEgjp47S90qEekkP8DcTVAAB9ua7Mxh+HcJ5yEOM1oQBm+nls
dtGSnJIV1X2FKCCgaya3qtfpDmwYm4AEcviW+9JDxBkcrDbTz4arSWXHV3iS/mxy
zWQIwv1Y7XtlBXxHN9BxKKd0Wu5033v4J4auyw8gPXT3ny9bu85I58d1/pqO+K4=
=LmtF
-----END PGP SIGNATURE-----

--BCGnoucBdqqh6Wvp7PAFuJtx2fglo4g9o--

