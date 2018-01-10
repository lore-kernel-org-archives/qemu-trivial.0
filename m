Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eZFcz-0002vs-Uq
	for mharc-qemu-trivial@gnu.org; Wed, 10 Jan 2018 07:37:09 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35349)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1eZFct-0002sA-Hh
	for qemu-trivial@nongnu.org; Wed, 10 Jan 2018 07:37:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1eZFcs-0008Lj-9A
	for qemu-trivial@nongnu.org; Wed, 10 Jan 2018 07:37:03 -0500
Received: from mx1.redhat.com ([209.132.183.28]:43844)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <berrange@redhat.com>)
	id 1eZFcm-0008FI-Ab; Wed, 10 Jan 2018 07:36:56 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3443F2577F;
	Wed, 10 Jan 2018 12:36:55 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.50])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2D2B080DE3;
	Wed, 10 Jan 2018 12:36:53 +0000 (UTC)
Date: Wed, 10 Jan 2018 12:36:51 +0000
From: "Daniel P. Berrange" <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Message-ID: <20180110123651.GJ3205@redhat.com>
Reply-To: "Daniel P. Berrange" <berrange@redhat.com>
References: <1514907465-14530-1-git-send-email-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1514907465-14530-1-git-send-email-thuth@redhat.com>
User-Agent: Mutt/1.9.1 (2017-09-22)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Wed, 10 Jan 2018 12:36:55 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] crypto/ivgen-essiv: Fix problem with
 address sanitizer of Clang
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
X-List-Received-Date: Wed, 10 Jan 2018 12:37:07 -0000

On Tue, Jan 02, 2018 at 04:37:45PM +0100, Thomas Huth wrote:
> When compiling QEMU with clang and -fsanitize=3Daddress, I get the
> following error:
>=20
> =3D=3D9185=3D=3DERROR: AddressSanitizer: stack-buffer-overflow on addre=
ss 0x7ffc7e9adf2f at pc 0x564cba001d88 bp 0x7ffc7e9adeb0 sp 0x7ffc7e9adea=
8
> READ of size 16 at 0x7ffc7e9adf2f thread T0
>     #0 0x564cba001d87 in qcrypto_ivgen_essiv_calculate .../crypto/ivgen=
-essiv.c:83
>     #1 0x564cba001367 in qcrypto_ivgen_calculate .../crypto/ivgen.c:72
>     #2 0x564cb9fec630 in test_ivgen .../tests/test-crypto-ivgen.c:148
>     #3 0x7f98f4224b39 (/lib64/libglib-2.0.so.0+0x6fb39)
>     #4 0x7f98f4224d02 (/lib64/libglib-2.0.so.0+0x6fd02)
>     #5 0x7f98f4224d02 (/lib64/libglib-2.0.so.0+0x6fd02)
>     #6 0x7f98f4224d02 (/lib64/libglib-2.0.so.0+0x6fd02)
>     #7 0x7f98f4224f0d (/lib64/libglib-2.0.so.0+0x6ff0d)
>     #8 0x7f98f4224f30 (/lib64/libglib-2.0.so.0+0x6ff30)
>     #9 0x564cb9fec446 in main .../tests/test-crypto-ivgen.c:173
>     #10 0x7f98f294fc04 in __libc_start_main (/lib64/libc.so.6+0x21c04)
>     #11 0x564cb9fec1ac in _start (.../tests/test-crypto-ivgen+0xdb1ac)
>=20
> Address 0x7ffc7e9adf2f is located in stack of thread T0 at offset 47 in=
 frame
>     #0 0x564cba00192f in qcrypto_ivgen_essiv_calculate .../crypto/ivgen=
-essiv.c:76
>=20
> And indeed, the code is doing a "memcpy(data, (uint8_t *)&sector, ndata=
)"
> here with "sector" being a uint64_t variable and ndata =3D 16.
>=20
> Fix it by limiting the size of the memcpy correctly.
>=20
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  crypto/ivgen-essiv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

FYI, this is a dupe of the same fix posted  Marc-Andr=C3=A9 Lureau last
year with subject "crypto: fix stack-buffer-overflow error", which I
already have queued.

Regards,
Daniel
--=20
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
|: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|

