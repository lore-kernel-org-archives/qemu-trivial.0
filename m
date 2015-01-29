Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YGejr-0004Yr-Ps
	for mharc-qemu-trivial@gnu.org; Wed, 28 Jan 2015 21:21:47 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45219)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1YGejo-0004Uj-3b
	for qemu-trivial@nongnu.org; Wed, 28 Jan 2015 21:21:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1YGejn-0002g5-3I
	for qemu-trivial@nongnu.org; Wed, 28 Jan 2015 21:21:44 -0500
Received: from mx1.redhat.com ([209.132.183.28]:59184)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1YGeji-0002eX-AN; Wed, 28 Jan 2015 21:21:38 -0500
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t0T2LXGO012131
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Wed, 28 Jan 2015 21:21:33 -0500
Received: from [10.3.113.9] ([10.3.113.9])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t0T2LWYq023374; Wed, 28 Jan 2015 21:21:32 -0500
Message-ID: <54C9992C.6070601@redhat.com>
Date: Wed, 28 Jan 2015 19:21:32 -0700
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Gonglei <arei.gonglei@huawei.com>, Markus Armbruster <armbru@redhat.com>
References: <1422376711-31648-1-git-send-email-armbru@redhat.com>	<87k307qho2.fsf@blackfin.pond.sub.org>
	<54C97F4F.1090905@huawei.com>
In-Reply-To: <54C97F4F.1090905@huawei.com>
OpenPGP: url=http://people.redhat.com/eblake/eblake.gpg
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="ILGBl3pfQ9dmmINO526IMmp7WW5RIvgEx"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 0/6] Trivial cleanups around
	g_malloc()
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
X-List-Received-Date: Thu, 29 Jan 2015 02:21:46 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--ILGBl3pfQ9dmmINO526IMmp7WW5RIvgEx
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 01/28/2015 05:31 PM, Gonglei wrote:
> On 2015/1/28 19:16, Markus Armbruster wrote:
>=20
>> I screwed up cc: qemu-trivial, my apologies.
>>

>>> Markus Armbruster (6):
>>>   onenand: g_malloc() can't fail, bury dead error handling
>>>   rtl8139: g_malloc() can't fail, bury dead error handling
>>>   kvm: g_malloc() can't fail, bury dead error handling
>>>   rdma: g_malloc0() can't fail, bury dead error handling
>>>   vnc: g_realloc() can't fail, bury dead error handling
>>>   translate-all: Use g_try_malloc() for dynamic translator buffer
>>>

>>
>=20
> For serials:

s/serials/series/

> Reviewed-by: Gonglei <arei.gonglei@huawei.com>
>=20
> Regards,
> -Gonglei
>=20
>=20
>=20
>=20
>=20

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--ILGBl3pfQ9dmmINO526IMmp7WW5RIvgEx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJUyZksAAoJEKeha0olJ0NqQQEH/ijBKq6qKVyqZWv58IPcoOTu
p1ashWCX9OQnBVQC/9b5LT2WummdvH8AGcNQz7FCExyLZn2zhd7WM2WP2o1WGFD7
VureAv/m5xFItGi/byl8ZpX4Mf80McPQk5kPZPrT4OqwGn6AWK9xe8Ikq+WZRuoc
VnR5NYswP35Qzti1vuNQzp3H7CcFQ+Jfu0z8mUryn51r8tLKxrJx1KSmqKB+b/Sp
ZvczPAjTlnH0jDmI1psHbzEUCST1owAzk8ioA1RNmyilxRtoe4aAVSkYC2E+TCFY
t/kc+ZL6yFNJTTbt6l4WQgyfNkAmq3IFeRgqJ9USIdr7YwpjmkngYX+WrLUqey8=
=gxP5
-----END PGP SIGNATURE-----

--ILGBl3pfQ9dmmINO526IMmp7WW5RIvgEx--

