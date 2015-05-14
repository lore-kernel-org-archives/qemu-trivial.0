Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Yt0V4-0006PJ-JX
	for mharc-qemu-trivial@gnu.org; Thu, 14 May 2015 17:17:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33840)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1Yt0V1-0006Hs-P0
	for qemu-trivial@nongnu.org; Thu, 14 May 2015 17:17:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1Yt0V0-0003jf-NB
	for qemu-trivial@nongnu.org; Thu, 14 May 2015 17:16:59 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35725)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1Yt0Uv-0003h5-PV; Thu, 14 May 2015 17:16:53 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t4ELGpej020519
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Thu, 14 May 2015 17:16:52 -0400
Received: from [10.3.113.69] (ovpn-113-69.phx2.redhat.com [10.3.113.69])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t4ELGpac023858; Thu, 14 May 2015 17:16:51 -0400
Message-ID: <555510C2.7020507@redhat.com>
Date: Thu, 14 May 2015 15:16:50 -0600
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>, QEMU Trivial <qemu-trivial@nongnu.org>
References: <1431635892-31996-1-git-send-email-sw@weilnetz.de>
	<55550E54.2080405@redhat.com>
In-Reply-To: <55550E54.2080405@redhat.com>
OpenPGP: url=http://people.redhat.com/eblake/eblake.gpg
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="nwsEgIUforXd8RFk80fu97hfgeFfbXdcD"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: QEMU Developer <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] pci: Fix compiler warning
 (MinGW-w64 gcc 4.9)
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
X-List-Received-Date: Thu, 14 May 2015 21:17:01 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--nwsEgIUforXd8RFk80fu97hfgeFfbXdcD
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 05/14/2015 03:06 PM, Eric Blake wrote:
> On 05/14/2015 02:38 PM, Stefan Weil wrote:
>> i686-w64-mingw32-gcc 4.9.1 from Debian Jessie complains:
>>
>> hw/pci/pci.c:938:29: warning:
>>  array subscript is above array bounds [-Warray-bounds]
>>
>> Using g_assert instead of assert fixes this warning.
>=20
> Is that because the mingw headers don't properly mark the expansion of
> the failed branch of assert() as noreturn, whereas g_assert() does, and=

> therefore the compiler has more information about what variables must b=
e
> if the rest of the function is reached?
>=20

>=20
> Meanwhile, you may want to file a bug to the mingw maintainers that
> their header is puny when compared to glibc assert() or to glib's
> g_assert, when it comes to giving gcc decent hints.

Oh, I was right!

glibc /usr/include/assert.h:
extern void __assert_fail (const char *__assertion, const char *__file,
                           unsigned int __line, const char *__function)
     __THROW __attribute__ ((__noreturn__));
# define assert(expr)                                                   \=

  ((expr)                                                               \=

   ? __ASSERT_VOID_CAST (0)                                             \=

   : __assert_fail (__STRING(expr), __FILE__, __LINE__, __ASSERT_FUNCTION=
))

vs mingw /usr/i686-w64-mingw32/sys-root/mingw/include/assert.h:
extern void __cdecl
_assert (const char *_Message, const char *_File, unsigned _Line);
#define assert(_Expression) \
 (void) \
 ((!!(_Expression)) || \
  (_assert(#_Expression,__FILE__,__LINE__),0))

even though mingw has in that same file:
  void __cdecl _Exit(int) __MINGW_ATTRIB_NORETURN;

so it is indeed a bug in the mingw headers that __MINGW_ATTRIB_NORETURN
was not attached to _assert's declaration.


--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--nwsEgIUforXd8RFk80fu97hfgeFfbXdcD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJVVRDDAAoJEKeha0olJ0NqpIoH/AvnCZv9aS2Qfj3k2FVjeN10
RSPcM6cohY9LgeH8rUi5MUvGwxbYm5d6tSuFaFGYirUkXZ16mUAG7xlpmc+dG9a1
p43dGiW6nxBTGxWzLtck/JYlBmsGIL0KCTDVtkyOpG2AgL/Prn4pAtjzUYEa+2f+
M6n7V7qwypugoSVYG/SiH4d8COz3qdQVFeIW/D9XyF5OaBeiz052cXNGyOBUy/Ib
bBUjA8xirb2RCWHsyLvyr+3cdK+sf4a2EEb5TVAJHN5kbvx1Hic258VK+nHXlP90
ibdH28GXHIVIz8dObs5I20ylbMilzWUXm1DdeecsyRpbxAGZgoIaMi+AGGUBtLE=
=YyYR
-----END PGP SIGNATURE-----

--nwsEgIUforXd8RFk80fu97hfgeFfbXdcD--

