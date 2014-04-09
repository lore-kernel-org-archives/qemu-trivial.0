Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WXvtb-0003Mg-Ug
	for mharc-qemu-trivial@gnu.org; Wed, 09 Apr 2014 13:02:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37989)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1WXvtV-0003BB-IF
	for qemu-trivial@nongnu.org; Wed, 09 Apr 2014 13:02:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1WXvtQ-0005GH-KF
	for qemu-trivial@nongnu.org; Wed, 09 Apr 2014 13:02:37 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53850)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1WXvtG-0005Ek-G1; Wed, 09 Apr 2014 13:02:22 -0400
Received: from int-mx02.intmail.prod.int.phx2.redhat.com
	(int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s39H2JN9007655
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Wed, 9 Apr 2014 13:02:20 -0400
Received: from [10.3.113.140] (ovpn-113-140.phx2.redhat.com [10.3.113.140])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id s39H2ITq026199; Wed, 9 Apr 2014 13:02:18 -0400
Message-ID: <53457D1A.7000602@redhat.com>
Date: Wed, 09 Apr 2014 11:02:18 -0600
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Baojun Wang <wangbj@gmail.com>, qemu-devel@nongnu.org
References: <CAC+a-TYVLK8covhRMwoeAqTJt=Gby2Kf4Jz8z5w=ZLDhNaCdZw@mail.gmail.com>
	<1397062459-4141-1-git-send-email-wangbj@gmail.com>
In-Reply-To: <1397062459-4141-1-git-send-email-wangbj@gmail.com>
X-Enigmail-Version: 1.6
OpenPGP: url=http://people.redhat.com/eblake/eblake.gpg
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="3KiPGrUIQtRhSaM8Ih56Ns5kkMAJHK6jk"
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.12
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH V4 1/1] qmp: add pmemload command
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
X-List-Received-Date: Wed, 09 Apr 2014 17:02:42 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--3KiPGrUIQtRhSaM8Ih56Ns5kkMAJHK6jk
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 04/09/2014 10:54 AM, Baojun Wang wrote:
> Signed-off-by: Baojun Wang <wangbj@gmail.com>

You lost this part of your commit message, which gives more details
about the 'why' (the subject line covers the 'what', but it is often the
'why' that is most needed when reviewing a commit later).  Your earlier
mail had:

I found this could be useful to have qemu-softmmu as a cross debugger
(launch
with -s -S command line option), then if we can have a command to load gu=
est
physical memory, we can use cross gdb to do some target debug which gdb
cannot
do directly.


> =20
> +void qmp_pmemload(int64_t addr, int64_t size, const char *filename,
> +                  Error **errp)
> +{
> +    FILE *f;
> +    uint32_t l;
> +    uint8_t buf[1024];
> +
> +    f =3D fopen(filename, "rb");

I still think that fopen()/fread() is wrong, and that you should be
using qemu_open()/read() - that way, libvirt could pass in a file
descriptor and use qemu's already-existing /dev/fdset/nnn support rather
than forcing qemu to open something from the filesystem.


> +++ b/hmp-commands.hx
> @@ -809,6 +809,19 @@ save to disk physical memory dump starting at @var=
{addr} of size @var{size}.
>  ETEXI
> =20
>      {
> +        .name       =3D "pmemload",
> +        .args_type  =3D "val:l,size:i,filename:s",
> +        .params     =3D "addr size file",
> +        .help       =3D "load from disk physical memory dump starting =
at 'addr' of size 'size'",
> +        .mhandler.cmd =3D hmp_pmemload,

And I still think that you should list filename first, with val and size
optional at the end.

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--3KiPGrUIQtRhSaM8Ih56Ns5kkMAJHK6jk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJTRX0aAAoJEKeha0olJ0Nq3FQH/jja/VQ9JKszXZsVzNxyTeKW
TaJQcQRPjfCF7HdCguXNg7g0gRNpY7JrQTyF8xT8xvXMpBXIHa9H99W0yYRZlqnM
ICM0PBw8KbnkT7nBy7v/xSQ5pnfnwE5r6Xp9jK1uj5Gwaof/8PwXUCoOn8kiAyox
M2v7uUnecWJQ1SUNsaWiWgya0dHA9ykh7aDd+1hDHTAMfZJkQIHf/4UJdvn6zlCa
EJhMrMxnBHt0f0MGDbJU/Z1KRGh9VBzV9jI6YVQy6M00Hekb+4wL1JCsSuFDc2aP
YpkskKZ7kRa9tc3CAvYBqEFkMsmxiR9CiVhoZOSnyXzZ0BwgqkwjMTArjS9SbSg=
=IEUP
-----END PGP SIGNATURE-----

--3KiPGrUIQtRhSaM8Ih56Ns5kkMAJHK6jk--

