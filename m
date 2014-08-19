Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XJiCF-0001QS-Er
	for mharc-qemu-trivial@gnu.org; Tue, 19 Aug 2014 08:07:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50084)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1XJiC8-0001PN-VM
	for qemu-trivial@nongnu.org; Tue, 19 Aug 2014 08:07:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1XJiBz-0000U8-9f
	for qemu-trivial@nongnu.org; Tue, 19 Aug 2014 08:07:20 -0400
Received: from mx1.redhat.com ([209.132.183.28]:14679)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1XJiBz-0000U4-10; Tue, 19 Aug 2014 08:07:11 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s7JC6v1O007880
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Tue, 19 Aug 2014 08:06:57 -0400
Received: from [10.3.113.148] (ovpn-113-148.phx2.redhat.com [10.3.113.148])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s7JC6ukG023079; Tue, 19 Aug 2014 08:06:56 -0400
Message-ID: <53F33DE0.9040700@redhat.com>
Date: Tue, 19 Aug 2014 06:06:56 -0600
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.7.0
MIME-Version: 1.0
To: Kevin Wolf <kwolf@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>
References: <1408362096-10482-1-git-send-email-mjt@msgid.tls.msk.ru>
	<20140819115823.GD4638@noname.redhat.com>
In-Reply-To: <20140819115823.GD4638@noname.redhat.com>
OpenPGP: url=http://people.redhat.com/eblake/eblake.gpg
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="1IHBT1afbW6BiG1OGxPLP8QIKoqlSQTrK"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Li Liu <john.liuli@huawei.com>,
	qemu-devel@nongnu.org, stefanha@redhat.com,
	zhanghailiang <zhang.zhanghailiang@huawei.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] block/vvfat.c: remove
 debugging code to reinit stderr if NULL
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
X-List-Received-Date: Tue, 19 Aug 2014 12:07:26 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--1IHBT1afbW6BiG1OGxPLP8QIKoqlSQTrK
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 08/19/2014 05:58 AM, Kevin Wolf wrote:
> Am 18.08.2014 um 13:41 hat Michael Tokarev geschrieben:
>> Just log to stderr unconditionally, like other similar code does.
>>

>> =20
>> -DLOG(if (stderr =3D=3D NULL) {
>> -    stderr =3D fopen("vvfat.log", "a");
>> -    setbuf(stderr, NULL);
>> -})
>> -

>=20
> This specific patch isn't as trivial as it might look at the first
> sight (in other words: it's wrong). The part that you probably missed i=
s
> that stderr isn't the real one when DEBUG is set:
>=20
>     #undef stderr
>     #define stderr STDERR
>     FILE* stderr =3D NULL;

Eeek, that's horrible.  I'd rather see code doing freopen("vvfat.log",
"a", stderr) than the current horrid mess of redefining stderr away from
its normal meaning.

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--1IHBT1afbW6BiG1OGxPLP8QIKoqlSQTrK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg

iQEcBAEBCAAGBQJT8z3gAAoJEKeha0olJ0NqdmQIAJqlf++El8Y2+7WwsfjRMRsB
twwum1y9VviBEpuSodJreRK4pIevo/Pq9JqxztNSYL0lZBp4adtGYgTSJhEsK84y
L6y3zqaQ37AEYNGVDtO104se+7mN4x7hor3LI0qZOclhmGGhGQTY+rxW8pv9bEqu
+2HtFktcHwQWXh+71KgZTWNEyK7qwslomk/C9lss/9Igljjvdf3LsjJBA6dHXq1C
o9vVzZ1FaXmQIP76VIg3w9pNey2Fy6NtMNclRwBWgHgxDs1Ttdziv5wzDtGp1/uM
60lzpRgFBUaRLXe+spOBAZ7p8tVrTHp8Y3h2qwsclvKvR4V0V9YCJlYYZMgf+2s=
=o1ra
-----END PGP SIGNATURE-----

--1IHBT1afbW6BiG1OGxPLP8QIKoqlSQTrK--

