Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YSqSv-0000ie-J7
	for mharc-qemu-trivial@gnu.org; Tue, 03 Mar 2015 12:18:41 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55715)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1YSqSt-0000dv-2R
	for qemu-trivial@nongnu.org; Tue, 03 Mar 2015 12:18:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1YSqSr-0002Mr-F5
	for qemu-trivial@nongnu.org; Tue, 03 Mar 2015 12:18:38 -0500
Received: from mx1.redhat.com ([209.132.183.28]:38534)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1YSqSm-0002Lu-Aj; Tue, 03 Mar 2015 12:18:32 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t23HIRUn023202
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Tue, 3 Mar 2015 12:18:27 -0500
Received: from [10.3.113.191] (ovpn-113-191.phx2.redhat.com [10.3.113.191])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t23HIQOi015402; Tue, 3 Mar 2015 12:18:27 -0500
Message-ID: <54F5ECE2.80603@redhat.com>
Date: Tue, 03 Mar 2015 10:18:26 -0700
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: zhanghailiang <zhang.zhanghailiang@huawei.com>, qemu-trivial@nongnu.org
References: <1425376508-12632-1-git-send-email-zhang.zhanghailiang@huawei.com>
In-Reply-To: <1425376508-12632-1-git-send-email-zhang.zhanghailiang@huawei.com>
OpenPGP: url=http://people.redhat.com/eblake/eblake.gpg
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="BBbPaLmIr8B7EM8c9HkamlS6RiX0Q10xt"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-devel@nongnu.org, peter.huangpeng@huawei.com, armbru@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] error: Replace
 error_report() & error_free() with error_report_err()
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
X-List-Received-Date: Tue, 03 Mar 2015 17:18:40 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--BBbPaLmIr8B7EM8c9HkamlS6RiX0Q10xt
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 03/03/2015 02:55 AM, zhanghailiang wrote:
> Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
> ---

Might have been nice to mention this was a continuation of the work
started in commit 565f65d27.

>  hw/arm/virt.c | 2 +-
>  savevm.c      | 3 +--
>  2 files changed, 2 insertions(+), 3 deletions(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--BBbPaLmIr8B7EM8c9HkamlS6RiX0Q10xt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJU9eziAAoJEKeha0olJ0Nqrs4H/23wb2ZTePsbiebMC0Yl0JZo
iFX94VDu/KINQ8Qo6sOx8urwzci9LFuZdgcvqMZqly/x8xD43/zOxoyWybmiG+Pp
Dd8wEcpntApz1lo/9gSvSzWSupfDDiPYIMDg5e7kORICbaYKcbvC2raPUzr3ICFJ
+EyKbpPMQga0gpCnIEPqAxCUE20LvXUeZSvCe4IOX2FAJ3snGZQx/kEOZ6yKQNrp
Oo85mFTJfz1pIllOmkH0pnmuykONhNXbaJXT63R97TQQwa+yRpj07TbT8Q4bNb9e
L0TlRTdNC0TOg272ds8rD/FQQGgOtpajUc5YP2FMvs+0ukRa55d7JoEtuh8sbdY=
=/D5J
-----END PGP SIGNATURE-----

--BBbPaLmIr8B7EM8c9HkamlS6RiX0Q10xt--

