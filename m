Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XcnI5-0003du-CK
	for mharc-qemu-trivial@gnu.org; Fri, 10 Oct 2014 23:24:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36884)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1XcnHz-0003d9-G9
	for qemu-trivial@nongnu.org; Fri, 10 Oct 2014 23:24:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1XcnHu-00061h-RI
	for qemu-trivial@nongnu.org; Fri, 10 Oct 2014 23:24:15 -0400
Received: from mx1.redhat.com ([209.132.183.28]:2909)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1XcnHu-00061X-Jh; Fri, 10 Oct 2014 23:24:10 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s9B3Nr3u009886
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Fri, 10 Oct 2014 23:23:53 -0400
Received: from [10.3.113.64] (ovpn-113-64.phx2.redhat.com [10.3.113.64])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s9B3Nrn8012693; Fri, 10 Oct 2014 23:23:53 -0400
Message-ID: <5438A2C8.80508@redhat.com>
Date: Fri, 10 Oct 2014 21:23:52 -0600
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.1
MIME-Version: 1.0
To: arei.gonglei@huawei.com, qemu-devel@nongnu.org
References: <1412996048-6384-1-git-send-email-arei.gonglei@huawei.com>
In-Reply-To: <1412996048-6384-1-git-send-email-arei.gonglei@huawei.com>
OpenPGP: url=http://people.redhat.com/eblake/eblake.gpg
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="smi24EXxmAp9TN8o92384g9kKK8PqvLnc"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: kwolf@redhat.com, qemu-trivial@nongnu.org, weidong.huang@huawei.com,
	stefanha@redhat.com, pbonzini@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] oslib-posix: change free to
	g_free
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
X-List-Received-Date: Sat, 11 Oct 2014 03:24:19 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--smi24EXxmAp9TN8o92384g9kKK8PqvLnc
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 10/10/2014 08:54 PM, arei.gonglei@huawei.com wrote:
> From: Gonglei <arei.gonglei@huawei.com>
>=20
> The caller of qemu_vfree() maybe not check whether parameter
> ptr pointer is NULL or not, such as vpc_open().
> Using g_free() is more safe.

NACK.  g_free is only safe for pointers allocated by g_malloc.
qemu_vfree is for use on pointers allocated by qemu_try_memalign and
friends (matching the name valloc which is an older spelling of
posix_memalign), which are NOT allocated by g_malloc.  Furthermore,
free(NULL) is safe.

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--smi24EXxmAp9TN8o92384g9kKK8PqvLnc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg

iQEcBAEBCAAGBQJUOKLIAAoJEKeha0olJ0Nq/dwH/2nVWoQQ/4Jq9NlSb1OOio+v
tS/neUDLrFM8fjGj2t865MCZveVWPTK3/YqCZ0I5KaYQHsXRfFiwzMC01MUiZaKi
DSE4/ZCwZjxo8HptySmmd4tCB2mX+M4UbudQbMoywzcBM6XoG/3dDniBOZj1rtYl
o2eOpL0SaeUE/oi4VR3bG8RkM0Tk/5YdL0IZk3UGHYIVBmSET04WbSP7DAxuRb6k
NSOIQB6NAW6plaEEfegew6e8V5T6EeuehGrH5b5UAu4oeszlzcZcgYd7AfnRoA1O
hBrXB85tigoNth8Fkv5okUCa2tMxphNFlH4hWy8LSfgs5tbD8zGFTofWyg/t+jU=
=Iwkp
-----END PGP SIGNATURE-----

--smi24EXxmAp9TN8o92384g9kKK8PqvLnc--

