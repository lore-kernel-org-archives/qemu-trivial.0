Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ycwwu-0002xJ-8q
	for mharc-qemu-trivial@gnu.org; Tue, 31 Mar 2015 10:15:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50336)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1Ycwwo-0002rL-Tz
	for qemu-trivial@nongnu.org; Tue, 31 Mar 2015 10:15:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1Ycwwj-0008Ee-7t
	for qemu-trivial@nongnu.org; Tue, 31 Mar 2015 10:15:18 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56169)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1Ycwwb-00085d-0w; Tue, 31 Mar 2015 10:15:05 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t2VEF26Q015467
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Tue, 31 Mar 2015 10:15:02 -0400
Received: from [10.3.113.77] (ovpn-113-77.phx2.redhat.com [10.3.113.77])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t2VEF17l026218; Tue, 31 Mar 2015 10:15:02 -0400
Message-ID: <551AABE5.1020509@redhat.com>
Date: Tue, 31 Mar 2015 08:15:01 -0600
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Stefan Berger <stefanb@linux.vnet.ibm.com>, qemu-trivial@nongnu.org
References: <1427808437-535644-1-git-send-email-stefanb@linux.vnet.ibm.com>
	<551AAA82.9090608@redhat.com>
In-Reply-To: <551AAA82.9090608@redhat.com>
OpenPGP: url=http://people.redhat.com/eblake/eblake.gpg
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="XbAxFs2MForgD5sfw7LIsOjGJMIpePNgl"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] tpm_tis: fix format for
	64bit variable
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
X-List-Received-Date: Tue, 31 Mar 2015 14:15:23 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--XbAxFs2MForgD5sfw7LIsOjGJMIpePNgl
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 03/31/2015 08:09 AM, Eric Blake wrote:
> On 03/31/2015 07:27 AM, Stefan Berger wrote:
>> Signed-off-by: Stefan Berger <stefanb@linux.vnet.ibm.com>
>> ---
>>  hw/tpm/tpm_tis.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/hw/tpm/tpm_tis.c b/hw/tpm/tpm_tis.c
>> index 815c8ea..52e0148 100644
>> --- a/hw/tpm/tpm_tis.c
>> +++ b/hw/tpm/tpm_tis.c
>> @@ -814,7 +814,7 @@ static void tpm_tis_mmio_write_intern(void *opaque=
, hwaddr addr,
>>              tis->loc[locty].state =3D=3D TPM_TIS_STATE_COMPLETION) {
>>              /* drop the byte */
>>          } else {
>> -            DPRINTF("tpm_tis: Data to send to TPM: %08x (size=3D%d)\n=
",
>> +            DPRINTF("tpm_tis: Data to send to TPM: %08lx (size=3D%d)\=
n",
>=20
> NACK.  When printing uint64_t val, you HAVE to use PRIx64, not lx, for
> the sake of 32-bit platforms.

Furthermore, you could have caught this much sooner if you fix the
definition of DPRINTF.  This file used:

#ifdef DEBUG_TIS
#define DPRINTF(fmt, ...) \
    do { fprintf(stderr, fmt, ## __VA_ARGS__); } while (0)
#else
#define DPRINTF(fmt, ...) \
    do { } while (0)
#endif

which is bad, because the compiler CAN'T see the type mismatch unless
you turn debugging on (alas, we have a LOT of files in the code base
with similar bad patterns).  A better example is hw/display/cg3.c:

/* Change to 1 to enable debugging */
#define DEBUG_CG3 0
=2E..
#define DPRINTF(fmt, ...) do { \
    if (DEBUG_CG3) { \
        printf("CG3: " fmt , ## __VA_ARGS__); \
    } \
} while (0);

where now the compiler can unconditionally do -Wformat checking and
avoid bit-rot, even if debug printing is never turned on, and without
penalizing code size when debugging is off.


--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--XbAxFs2MForgD5sfw7LIsOjGJMIpePNgl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJVGqvlAAoJEKeha0olJ0Nq/EUH/2Tv2Hyk81bbTJUVbG/eTxqx
LBG8333RHn5ajlU/7q3+DHk+hlnsXsMST8snP7xYbQZAaEXdE3wFIB47TTjP2OFJ
6IE0+jaHZM9keGDu6b261V6wGeoauzAeYlLNtyJyDvwtdGAdpsl/RoIqzChHy5ow
SIhg/rv3iIvJ0XZU/GzULkpz2MKpQ+LOFZ8lZjrWopp6rhpKQX/Iy4XXiHfORNgt
Xv52nw0lZQD+ChJAfvPn1FL4695MNe+HgfNOADi7FlBH6E7MPZVbs51H/zmS8Lad
c3sGkW/oOwgsXHqe5MJxPnDNTrrBKNvPzrYBiDg/72u+mk1cbIMBlcnsvy/YYJQ=
=Mqz9
-----END PGP SIGNATURE-----

--XbAxFs2MForgD5sfw7LIsOjGJMIpePNgl--

