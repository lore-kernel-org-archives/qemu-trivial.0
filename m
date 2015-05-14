Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Yt0i5-0001qe-2w
	for mharc-qemu-trivial@gnu.org; Thu, 14 May 2015 17:30:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37069)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1Yt0i2-0001ox-FH
	for qemu-trivial@nongnu.org; Thu, 14 May 2015 17:30:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1Yt0i1-00020W-91
	for qemu-trivial@nongnu.org; Thu, 14 May 2015 17:30:26 -0400
Received: from mx1.redhat.com ([209.132.183.28]:32856)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1Yt0hw-0001uh-BS; Thu, 14 May 2015 17:30:20 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t4ELUJ12020063
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Thu, 14 May 2015 17:30:19 -0400
Received: from [10.3.113.69] (ovpn-113-69.phx2.redhat.com [10.3.113.69])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t4ELUIKi004297; Thu, 14 May 2015 17:30:18 -0400
Message-ID: <555513E9.3010601@redhat.com>
Date: Thu, 14 May 2015 15:30:17 -0600
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>, QEMU Trivial <qemu-trivial@nongnu.org>
References: <1431635892-31996-1-git-send-email-sw@weilnetz.de>	<55550E54.2080405@redhat.com>
	<555510C2.7020507@redhat.com>
In-Reply-To: <555510C2.7020507@redhat.com>
OpenPGP: url=http://people.redhat.com/eblake/eblake.gpg
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="IM9tdXlwtUnPfntgDIHIAr2LihrM4505M"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
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
X-List-Received-Date: Thu, 14 May 2015 21:30:27 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--IM9tdXlwtUnPfntgDIHIAr2LihrM4505M
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 05/14/2015 03:16 PM, Eric Blake wrote:
> On 05/14/2015 03:06 PM, Eric Blake wrote:
>> On 05/14/2015 02:38 PM, Stefan Weil wrote:
>>> i686-w64-mingw32-gcc 4.9.1 from Debian Jessie complains:
>>>
>>> hw/pci/pci.c:938:29: warning:
>>>  array subscript is above array bounds [-Warray-bounds]
>>>
>>> Using g_assert instead of assert fixes this warning.
>>
>> Is that because the mingw headers don't properly mark the expansion of=

>> the failed branch of assert() as noreturn, whereas g_assert() does, an=
d
>> therefore the compiler has more information about what variables must =
be
>> if the rest of the function is reached?
>>
>=20
>>
>> Meanwhile, you may want to file a bug to the mingw maintainers that
>> their header is puny when compared to glibc assert() or to glib's
>> g_assert, when it comes to giving gcc decent hints.
>=20
> Oh, I was right!
>=20
> glibc /usr/include/assert.h:

> vs mingw /usr/i686-w64-mingw32/sys-root/mingw/include/assert.h:

and glib's version in /usr/include/glib-2.0/glib/gtestutils.h:
#define g_assert(expr)                  G_STMT_START { \
                                             if G_LIKELY (expr) ; else \
                                               g_assertion_message_expr
(G_LOG_DOMAIN, __FILE__, __LINE__, G_STRFUNC, \

 #expr); \
                                        } G_STMT_END

GLIB_AVAILABLE_IN_ALL
void    g_assertion_message_expr        (const char     *domain,
                                         const char     *file,
                                         int             line,
                                         const char     *func,
                                         const char     *expr)
G_GNUC_NORETURN;


--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--IM9tdXlwtUnPfntgDIHIAr2LihrM4505M
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJVVRPpAAoJEKeha0olJ0Nq05MH/1ao0EUBim9MCWFijLf4BYAU
Oqdim5b3ZQ7T386upKq2Um966j5pQUn0Grdoghn6IjzYbS7a8gTTYJCoMuqI370N
KOYAwATlt1aoRRBqFgpXHXLr8bRr0u+MsHtFU/LtGPuGY1l1JOSetkDrxz8pXGG4
LlXzjjsrAzuZn0sH1pKu+pFTxfXpmuOLIBF7Jxu/xRNmx4U5QkMjegAHPmyJsGCi
d/fgyxICSSLw6ub+ZAoateebhSKVemV1+6udp5u6Blna0HSHrj9nP4zM/+X4CFHD
DQPwHyg8xC+j0DTIzsxx0AXINBhOEJelZuEvHaIUR9urlB3hHqSr/rt4mA5ypSU=
=zIhr
-----END PGP SIGNATURE-----

--IM9tdXlwtUnPfntgDIHIAr2LihrM4505M--

