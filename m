Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RoeQ8-00027t-Qk
	for mharc-qemu-trivial@gnu.org; Sat, 21 Jan 2012 12:08:04 -0500
Received: from eggs.gnu.org ([140.186.70.92]:38903)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@web.de>) id 1RoeQ5-00022x-T1
	for qemu-trivial@nongnu.org; Sat, 21 Jan 2012 12:08:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jan.kiszka@web.de>) id 1RoeQ4-00030D-Dn
	for qemu-trivial@nongnu.org; Sat, 21 Jan 2012 12:08:01 -0500
Received: from fmmailgate02.web.de ([217.72.192.227]:50897)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@web.de>)
	id 1RoeQ1-0002zv-0e; Sat, 21 Jan 2012 12:07:57 -0500
Received: from moweb002.kundenserver.de (moweb002.kundenserver.de
	[172.19.20.108])
	by fmmailgate02.web.de (Postfix) with ESMTP id DD9301C0544B1;
	Sat, 21 Jan 2012 18:07:55 +0100 (CET)
Received: from netbook.home ([92.74.55.47]) by smtp.web.de (mrweb001) with
	ESMTPA (Nemesis) id 0Lcxfc-1SWTXv0qWG-00imcT;
	Sat, 21 Jan 2012 18:07:55 +0100
Message-ID: <4F1AF0E2.8050907@web.de>
Date: Sat, 21 Jan 2012 18:07:46 +0100
From: Jan Kiszka <jan.kiszka@web.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de;
	rv:1.8.1.12) Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12
	Mnenhy/0.7.5.666
MIME-Version: 1.0
To: =?ISO-8859-1?Q?Andreas_F=E4rber?= <afaerber@suse.de>
References: <4F1AC0EB.3050304@web.de> <4F1AE974.2090401@suse.de>
In-Reply-To: <4F1AE974.2090401@suse.de>
X-Enigmail-Version: 1.3.4
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enigDE85DC5722BDC0C40DBD592E"
X-Provags-ID: V02:K0:HKyS7Ax2eRMeiSJ4Ss6hC6zRw+NSCF6yzq5kETM9NSi
	dt3yXR18Kx+BmdtDH0HLU8LE5Od40fIMET/0s1zpaF7UcIEEwR
	WSGaiVmbMw9CVk002B1HvjaGyt/dkh627ODOvLGsSZmi2wUx+n
	WI1LkSE2xVYvSDrhYg+8Zc60IfUPhxVgOd1AWJ9NZRaQE1D+LU
	Bw+L9HXHL8zc2CkWzR7NQ==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4-2.6
X-Received-From: 217.72.192.227
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qdev-property: Make bit
 property parsing stricter
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
X-List-Received-Date: Sat, 21 Jan 2012 17:08:03 -0000

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enigDE85DC5722BDC0C40DBD592E
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 2012-01-21 17:36, Andreas F=E4rber wrote:
> Am 21.01.2012 14:43, schrieb Jan Kiszka:
>> By using strncasecmp, we allow for arbitrary characters after the
>> "on"/"off" string. Fix this by switching to strcasecmp.
>>
>> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
>=20
> Reviewed-by: Andreas F=E4rber <afaerber@suse.de>
>=20
> An alternative might be to increase the char count by one. For a const
> char* parameter I see the responsibility for nul-terminating at the
> caller though, so this seems right. Did you check all callers?

For any normal function that takes a char * string without a maximum
length, the responsibility for terminating is on caller side. Also
because we checks against patterns of different length. So we don't need
to jump through hoops here.

Jan


--------------enigDE85DC5722BDC0C40DBD592E
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAk8a8OgACgkQitSsb3rl5xQqdQCgq+exo0JwIFeNBi0tGG0x6MXZ
2aQAoKx1Dkyfus+Uy9mD0ID4W8o9EBwj
=fisD
-----END PGP SIGNATURE-----

--------------enigDE85DC5722BDC0C40DBD592E--

