Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1f4SxK-0005Wv-2Z
	for mharc-qemu-trivial@gnu.org; Fri, 06 Apr 2018 11:07:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54130)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1f4SxE-0005Tv-Tk
	for qemu-trivial@nongnu.org; Fri, 06 Apr 2018 11:07:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1f4SxD-0003UJ-Rg
	for qemu-trivial@nongnu.org; Fri, 06 Apr 2018 11:07:04 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:33538 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1f4Sx6-0003Q0-AF; Fri, 06 Apr 2018 11:06:56 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 996448160F99;
	Fri,  6 Apr 2018 15:06:51 +0000 (UTC)
Received: from [10.10.123.104] (ovpn-123-104.rdu2.redhat.com [10.10.123.104])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2DAD7AFD6B;
	Fri,  6 Apr 2018 15:06:45 +0000 (UTC)
To: qemu-devel@nongnu.org
References: <20180327202152.1799131-1-eblake@redhat.com>
	<46f09a31-addb-32e0-d9b6-827166690a72@redhat.com>
Cc: qemu-trivial@nongnu.org, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
	<marcandre.lureau@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <82cc73cb-ba8a-be38-496a-5dc66d2c6850@redhat.com>
Date: Fri, 6 Apr 2018 10:06:44 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <46f09a31-addb-32e0-d9b6-827166690a72@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="pxI2nFiyG4AUO5p6qX0ndrHZc9PSxztLI"
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Fri, 06 Apr 2018 15:06:51 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Fri, 06 Apr 2018 15:06:51 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eblake@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH for-2.12] dump: Fix build
 with newer gcc
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
X-List-Received-Date: Fri, 06 Apr 2018 15:07:09 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--pxI2nFiyG4AUO5p6qX0ndrHZc9PSxztLI
Content-Type: multipart/mixed; boundary="KxN1IMbDsVCnV7cz1J97mHMcquLuwghl8";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <82cc73cb-ba8a-be38-496a-5dc66d2c6850@redhat.com>
Subject: Re: [Qemu-devel] [PATCH for-2.12] dump: Fix build with newer gcc
References: <20180327202152.1799131-1-eblake@redhat.com>
 <46f09a31-addb-32e0-d9b6-827166690a72@redhat.com>
In-Reply-To: <46f09a31-addb-32e0-d9b6-827166690a72@redhat.com>

--KxN1IMbDsVCnV7cz1J97mHMcquLuwghl8
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 04/03/2018 01:46 PM, Eric Blake wrote:
> On 03/27/2018 03:21 PM, Eric Blake wrote:
>> gcc 8 on rawhide is picky enough to complain:
>>
>> /home/dummy/qemu/dump.c: In function 'create_header32':
>> /home/dummy/qemu/dump.c:817:5: error: 'strncpy' output truncated befor=
e terminating nul copying 8 bytes from a string of the same length [-Werr=
or=3Dstringop-truncation]
>>      strncpy(dh->signature, KDUMP_SIGNATURE, strlen(KDUMP_SIGNATURE));=

>>      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>
>> But we already have SIG_LEN defined as the right length without needin=
g
>> to do a strlen(), and memcpy() is better than strncpy() when we know
>> we do not want a trailing NUL byte.
>>
>> Signed-off-by: Eric Blake <eblake@redhat.com>
>> ---
>>  dump.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> I'll include this in my qapi+misc pull request for 2.12-rc2

That pull request was abandoned; Paolo, do you want to pick this up in
your misc tree?

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


--KxN1IMbDsVCnV7cz1J97mHMcquLuwghl8--

--pxI2nFiyG4AUO5p6qX0ndrHZc9PSxztLI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAlrHjQQACgkQp6FrSiUn
Q2qceAf7BkHwlDmsvJKVHOEr2c3eD8hMjNhcr9IBDNDSwtZDmqtHODQmsFHt+xtO
Ed8TJfm8kfdl2j1lF7tRXt+9bfPPltBclDOAakk0GS0RdBP/w4IrbSgHIDhafk+f
lD0lr7AkWx8vJ9V8o1GnE2wq4v2I9fOeHd+85k02h3Vu7tee09jCPadztPIUtvlB
2Xc9LSJHSxVBkNPgoIT2V3ceLg2Y19r82KPioHeU7FKxWy0fApa7bOVmiquo6IT7
QLuQavzsk5j4pdcE/hA0XReMkSia4X8kQyq/NWXBzuuQQobIwa3NIReP0/orufah
HSG29b2wi6P7Qqn7Uh06ZWKDIn65vA==
=dsCN
-----END PGP SIGNATURE-----

--pxI2nFiyG4AUO5p6qX0ndrHZc9PSxztLI--

