Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dHtKv-0004Cz-1J
	for mharc-qemu-trivial@gnu.org; Mon, 05 Jun 2017 10:50:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47934)
	by lists.gnu.org with esmtp (Exim 4.71) (envelope-from <n54@gmx.com>)
	id 1dHtKs-0004BT-Q1
	for qemu-trivial@nongnu.org; Mon, 05 Jun 2017 10:50:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <n54@gmx.com>) id 1dHtKr-0007FR-To
	for qemu-trivial@nongnu.org; Mon, 05 Jun 2017 10:50:26 -0400
Received: from mout.gmx.net ([212.227.17.20]:61043)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <n54@gmx.com>)
	id 1dHtKn-00077l-DR; Mon, 05 Jun 2017 10:50:21 -0400
Received: from [192.168.1.3] ([185.58.161.191]) by mail.gmx.com (mrgmx101
	[212.227.17.174]) with ESMTPSA (Nemesis) id 0M7kwW-1e4NFo1DVY-00vLJb;
	Mon, 05 Jun 2017 16:50:08 +0200
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-trivial@nongnu.org
References: <20170531120049.14111-1-n54@gmx.com>
	<26b48c35-b6cc-708d-c4d2-b26a9382e10a@msgid.tls.msk.ru>
Cc: armbru@redhat.com, f4bug@amsat.org, qemu-devel@nongnu.org,
	marcandre.lureau@gmail.com, peter.maydell@redhat.com, eblake@redhat.com
From: Kamil Rytarowski <n54@gmx.com>
Message-ID: <df623a80-4017-2e79-6bf3-7c402f24b275@gmx.com>
Date: Mon, 5 Jun 2017 16:52:16 +0200
User-Agent: Mozilla/5.0 (X11; NetBSD amd64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <26b48c35-b6cc-708d-c4d2-b26a9382e10a@msgid.tls.msk.ru>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="Hwcuq86D6G3os0PEdbb6VHo1983bIkMBk"
X-Provags-ID: V03:K0:vck+wfAg7GIbkYA9NRVyDkRv32MGBc/xJS8jS7o6jnE65ZHnbAE
	3dry+GiNdf8XrCitkAJuan8S4vpyS3dCo/D3hIkhtnJUh4IBUyEclNfdBdALhaMuo9kBF3k
	lJ6JhcmhOT4OyKMgnotvpIUbxpsDz601N3iEFY0zGqGmHPtk7ACMQfQ50QfUo0wktRWb/8d
	s1TI4/nn7e4FmXJrVljcA==
X-UI-Out-Filterresults: notjunk:1;V01:K0:dW+SVAqiAaE=:/9WZ+QAYeIBlejxSNZDYxY
	Y6W8QtG5EVMSRujin3/njLe1rujGSQpWIAATG2D2Py9QEJTYoHYw+vkJK/pLPqZWKGqo/8pF2
	DmcJwZXjYuOMXRqrjuEdF404vc7GLOvPMdSbR/c6vg62xj/03UFahMGxuonBB74uKAGsHa1dX
	FyV3Dj8Yjen3enlYAFjLxsojnt//VkD15I7XSxgP6Dm0scUR9qrKTPiJLXzOf0bbRyins1vYv
	F3xPACCe/+ARYpDbtht9Sg5SC57OX37fPTJXTcQDNouzxodeMh/o4Ws5Vs3Mwwa2RAFzPXy/9
	go2xkrK2rs3hI2EKJI+Tsqp5gW6uyiOn/UXYcUljJvkoBxcVTGC0HBZ8ilveGM4w/jwiDjcYp
	emqYiC3bmEX4Cc4OUl+N7FBRjirlz2rYkdxEB9EIAiYaHWjG108W3yIecP5hkoyzuoAoVjIEl
	jReCyiKNpmw4osS0BfWvfTs1Pl3HceNMQ3yvXb34FDuSpRY+axD+V3jA7GDkAmg+ARYcxlivg
	WcV8d5QImLuN9vqZv4xIa2CHW9NUX0ZkEjW7ITrgkZ2karBky/zA4EhQy/eBdPOWR56KmlDfk
	TkkqQ7eZfcw06pO4xKxGTEkopkNEVtl1UYh4+87QgeLAf3Cm/HXuL98yeETag5FqZn9j/vBS7
	+dnMpZo6L884l3HRfdB3Iz7tK8bMYuGu+D0kKOoM5JKdmSCd2/TpxeD3nQj2yvBnxYVHFiOED
	H+t9j+AYaJZOFJS6NnHkA4O5e/SEvtwW1OdpgdxIhKDol5oNB2R4PA6gZCQ=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 212.227.17.20
Subject: Re: [Qemu-trivial] [PATCH v3] ivshmem-server: ivshmem-client: Build
 when eventfd() is available
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
X-List-Received-Date: Mon, 05 Jun 2017 14:50:27 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Hwcuq86D6G3os0PEdbb6VHo1983bIkMBk
Content-Type: multipart/mixed; boundary="FCpDODnkR4Ta9wj3GF7BV52QN9Ou6DAwQ";
 protected-headers="v1"
From: Kamil Rytarowski <n54@gmx.com>
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-trivial@nongnu.org
Cc: armbru@redhat.com, f4bug@amsat.org, qemu-devel@nongnu.org,
 marcandre.lureau@gmail.com, peter.maydell@redhat.com, eblake@redhat.com
Message-ID: <df623a80-4017-2e79-6bf3-7c402f24b275@gmx.com>
Subject: Re: [Qemu-trivial] [PATCH v3] ivshmem-server: ivshmem-client: Build
 when eventfd() is available
References: <20170531120049.14111-1-n54@gmx.com>
 <26b48c35-b6cc-708d-c4d2-b26a9382e10a@msgid.tls.msk.ru>
In-Reply-To: <26b48c35-b6cc-708d-c4d2-b26a9382e10a@msgid.tls.msk.ru>

--FCpDODnkR4Ta9wj3GF7BV52QN9Ou6DAwQ
Content-Type: text/plain; charset=windows-1251
Content-Transfer-Encoding: quoted-printable

On 05.06.2017 16:29, Michael Tokarev wrote:
> 31.05.2017 15:00, Kamil Rytarowski wrote:
>> Currently ivshmem requires eventfd() which is Linux specific.
>> Do not and build it unconditionally on every Linux/BSD/Solaris.
>>
>> This patch indirectly fixes build failure on NetBSD, where these tools=

>> additionally require -lrt for shm_open(3). In future there should be
>> added support for NetBSD and the linking addressed appropriately.
>=20
> Unfortunately this breaks static build.
>=20
> $ ../configure --disable-system --disable-linux-user --static
> $ make V=3D1
> ...
> c++ -I/usr/include/pixman-1  -Werror -pthread -I/usr/include/glib-2.0 -=
I/usr/lib/x86_64-linux-gnu/glib-2.0/include -m64 -mcx16 -D_GNU_SOURCE
> -D_FILE_OFFSET_BITS=3D64 -D_LARGEFILE_SOURCE -Wstrict-prototypes -Wredu=
ndant-decls -Wall -Wundef -Wwrite-strings -Wmissing-prototypes
> -fno-strict-aliasing -fno-common -fwrapv  -Wendif-labels -Wno-shift-neg=
ative-value -Wno-missing-include-dirs -Wempty-body -Wnested-externs
> -Wformat-security -Wformat-y2k -Winit-self -Wignored-qualifiers -Wold-s=
tyle-declaration -Wold-style-definition -Wtype-limits -fstack-protector-s=
trong
> -I/usr/include/libpng16 -I/build/qemu/git/tests -O2 -U_FORTIFY_SOURCE -=
D_FORTIFY_SOURCE=3D2 -g  -Wl,--warn-common -m64 -static -g  -o ivshmem-se=
rver
> libqemuutil.a libqemustub.a   -lm -lgthread-2.0 -pthread -lglib-2.0 -pt=
hread -lpcre -pthread  -lz -lrt -lz -lnettle  -lutil
> /usr/lib/gcc/x86_64-linux-gnu/6/../../../x86_64-linux-gnu/crt1.o: In fu=
nction `_start':
> (.text+0x20): undefined reference to `main'
> collect2: error: ld returned 1 exit status
> Makefile:475: error building =ABivshmem-server=BB
> $ _
>=20
> I'll take a look at this later. reverting it for now.
>=20
> Thanks,
>=20
> /mjt
>=20

I will try to reproduce it locally.


--FCpDODnkR4Ta9wj3GF7BV52QN9Ou6DAwQ--

--Hwcuq86D6G3os0PEdbb6VHo1983bIkMBk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJZNXAmAAoJEEuzCOmwLnZsqEYQAIVffEFP1ugN3TYUZ7QXylJO
hCQpZWLGVgHCjdIfWWCAiOwt72Gqc04U5mYxXOqAP+mDcq55cFyccNOMPWb5moAG
1rXWAD59VnN9N9agzeKQChnLQXZftKUViubKn5SvxnCtYPkVDIvuU2jgfXjGsozY
hHt0XFMMMZT9PRB+PjKEXVoruTbdcU2/fzqIBMovCFAlWAnJUNdhH1ecK92Ioc39
jYCT4N17iN11so5yu+eavpHAqaLCftIh6wLeT8LrroTHe6VxmB/1pCFANpFT92kw
zDkMOlh80A7lwhZBPzg8sIITxbxJslBSnnpq598/MXy8KvJOAQ4RDEvDSXOoG1hF
4TLQj8S8wd4q/fqCIsbdLZQmWmBZ8YaywnIbmJrr6cg3+C+qpsrQ1b5CuW7tlmfc
TqHd1ebxiDeYeHo++ijcslaunIkjUFzqPWuDQrBHole3K3cea4HpMsYRyLaWv8uI
xkM2WH9KQ+2I3KuHIO7y5L+zEgyAluPh/H+7XS96yBzLNmMhDet7livfLBkzol72
wTu+i6/EKVXJp+BBNda7PNE8ecJrf1wVUSF7m3SXzyihW+jCXezVPkAHf9dbHLye
DgUOyCwp6GBfoBM8NvuX9mrkQ/O7QT6kYj3FUDgVUsIagsmLv88ef9SEbVL7KKPK
AsqBm6c1NA5EYNJrYohy
=piD9
-----END PGP SIGNATURE-----

--Hwcuq86D6G3os0PEdbb6VHo1983bIkMBk--

