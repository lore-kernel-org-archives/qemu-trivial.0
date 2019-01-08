Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ggqwg-0000X5-GI
	for mharc-qemu-trivial@gnu.org; Tue, 08 Jan 2019 07:57:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34363)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1ggqwe-0000Tb-AS
	for qemu-trivial@nongnu.org; Tue, 08 Jan 2019 07:57:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1ggqwZ-0007Yv-IB
	for qemu-trivial@nongnu.org; Tue, 08 Jan 2019 07:57:22 -0500
Received: from mx1.redhat.com ([209.132.183.28]:52286)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cohuck@redhat.com>)
	id 1ggqwT-0007IJ-50; Tue, 08 Jan 2019 07:57:13 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1F4DE9B32A;
	Tue,  8 Jan 2019 12:57:11 +0000 (UTC)
Received: from gondolin (dhcp-192-222.str.redhat.com [10.33.192.222])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 270A719C65;
	Tue,  8 Jan 2019 12:56:59 +0000 (UTC)
Date: Tue, 8 Jan 2019 13:56:49 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Eric Blake <eblake@redhat.com>
Cc: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>,
	qemu-devel@nongnu.org, Fam Zheng <fam@euphon.net>, Thomas Huth
	<thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
	qemu-trivial@nongnu.org, Michael Roth <mdroth@linux.vnet.ibm.com>, Markus
	Armbruster <armbru@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org, 
	qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>, David Gibson
	<david@gibson.dropbear.id.au>, Paolo Bonzini <pbonzini@redhat.com>, Stefano
	Garzarella <sgarzare@redhat.com>, Richard Henderson <rth@twiddle.net>
Message-ID: <20190108135649.26458f0e.cohuck@redhat.com>
In-Reply-To: <791f6b8e-c488-7d72-956f-91e9748c74b8@redhat.com>
References: <20190104181208.7809-1-philmd@redhat.com>
	<20190104181208.7809-3-philmd@redhat.com>
	<791f6b8e-c488-7d72-956f-91e9748c74b8@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	boundary="Sig_/5/nSgLPlJvSKPAzDzYohVR2";
	protocol="application/pgp-signature"
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Tue, 08 Jan 2019 12:57:11 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 2/3] util/cutils: Move
 ctype macros to "cutils.h"
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
X-List-Received-Date: Tue, 08 Jan 2019 12:57:25 -0000

--Sig_/5/nSgLPlJvSKPAzDzYohVR2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 4 Jan 2019 14:15:49 -0600
Eric Blake <eblake@redhat.com> wrote:

> On 1/4/19 12:12 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> > Introduced in cd390083ad1, these macros don't need to be in
> > a generic header.
> > Add documentation to justify their use.
> >=20
> > Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
> > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> > --- =20
>=20
> > +++ b/include/qemu/cutils.h
> > @@ -3,6 +3,31 @@
> > =20
> >  #include "qemu/fprintf-fn.h"
> > =20
> > +/**
> > + * unsigned ctype macros:
> > + *
> > + * The standards require that the argument for these functions
> > + * is either EOF or a value that is representable in the type
> > + * unsigned char. If the argument is of type char, it must be
> > + * cast to unsigned char. This is what these macros do,
> > + * avoiding 'signed to unsigned' conversion warnings. =20
>=20
> I would also mention that these macros are ONLY intended for use with
> char arguments (as they CANNOT handle EOF); if you are doing int c =3D
> getchar() or similar, you still want to call the original ctype macro.
>=20
> Otherwise, the move and added comments makes sense to me.
>=20

Agreed on both counts.

--Sig_/5/nSgLPlJvSKPAzDzYohVR2
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEw9DWbcNiT/aowBjO3s9rk8bwL68FAlw0nhEACgkQ3s9rk8bw
L68zFQ//c8WWrngzbsVmQxJMbzAvvGRWIQOp09QmqinaLM7v0a64e67qv7zkDhXW
HGL2e7kNqLZecQsEhP0FHoRhMWljYr8bkBgpaNighAzxT1GsVD2s1ON2a3ihO9zL
6oa0BnvMlSoFkQIrg+CO3rQtzhmXNe6Scnkwo5HP4o/y2CZyDAjTBQXDVmaseZE3
mDGpm/nziD2mMsXSz+OXwR3RABLB4Yf7GidpFNqo3FitumJp0K4Z92AOiQqHmD+q
lzFETntdI5w7L/oIHMcFsB/Shd954EXjVrq1cHH1bfd41FE/elmIPE+Q5i7xbLqO
n3bBfpbHPw99SJvqE9j5ilLS7V8RU4LbtzYRhXCoPKNesMS+zN5zW+G5ueRwS6jS
gRyHO+FvMQA2r+fZ1ux3wBvgn5MX9yUPgLZMBtkS0Eb/dEsZA8+jN2qeQtcAiATM
aJn2FfCuP8wdPclYBRAID6mgejORu89TetuTnuVBCXp1FFPtENPSpkn51VMcuX2g
2u8JAhZO+GmtuQAReIqDrtcHtU2k4WvZwmETRO52qhfejTTSqW/ojMJYBmKiV9+j
cAKkwrSRheQBXDOYBYnKiyndvVCe+FA5x9zGd4QC5iwBVWccyUzSGMPP9InzWKLq
eQGxb8VyRgvwSvbrV2S285vUuDGwuzDh88wV87lIwVEQGIYDBcI=
=SCiS
-----END PGP SIGNATURE-----

--Sig_/5/nSgLPlJvSKPAzDzYohVR2--

