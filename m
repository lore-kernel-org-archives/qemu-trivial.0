Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dIi3t-0002OX-Nn
	for mharc-qemu-trivial@gnu.org; Wed, 07 Jun 2017 17:00:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42572)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dIi3r-0002N3-C4
	for qemu-trivial@nongnu.org; Wed, 07 Jun 2017 17:00:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dIi3n-00066M-AD
	for qemu-trivial@nongnu.org; Wed, 07 Jun 2017 17:00:15 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36510)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1dIi3a-0005wn-U7; Wed, 07 Jun 2017 16:59:59 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9804361D12;
	Wed,  7 Jun 2017 20:59:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 9804361D12
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eblake@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 9804361D12
Received: from [10.10.122.114] (ovpn-122-114.rdu2.redhat.com [10.10.122.114])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 01E6017114;
	Wed,  7 Jun 2017 20:59:54 +0000 (UTC)
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <1496862674-23626-1-git-send-email-thuth@redhat.com>
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Fam Zheng <famz@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <df973d1f-cbb1-22c1-5763-f29001a16fd8@redhat.com>
Date: Wed, 7 Jun 2017 15:59:54 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.0
MIME-Version: 1.0
In-Reply-To: <1496862674-23626-1-git-send-email-thuth@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="ptRgMbavdaJ8SU7Rq3x9n5BRAgVMHu4kJ"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Wed, 07 Jun 2017 20:59:57 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Makefile: Do not generate
 files if "configure" has not been run yet
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
X-List-Received-Date: Wed, 07 Jun 2017 21:00:16 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--ptRgMbavdaJ8SU7Rq3x9n5BRAgVMHu4kJ
Content-Type: multipart/mixed; boundary="5Mi2ss4qM6mlw5mI7GXoMBuVJmmdPKFOj";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Fam Zheng <famz@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
Message-ID: <df973d1f-cbb1-22c1-5763-f29001a16fd8@redhat.com>
Subject: Re: [Qemu-devel] [PATCH] Makefile: Do not generate files if
 "configure" has not been run yet
References: <1496862674-23626-1-git-send-email-thuth@redhat.com>
In-Reply-To: <1496862674-23626-1-git-send-email-thuth@redhat.com>

--5Mi2ss4qM6mlw5mI7GXoMBuVJmmdPKFOj
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 06/07/2017 02:11 PM, Thomas Huth wrote:
> When doing a "make -j10" in the vanilla QEMU source tree (without
> running "configure first), the Makefile currently generates two

s/"configure/"configure"/

> files already, qemu-version.h and qemu-options.def. This should not
> happen, so let's make these targets depend on config-host.mak.
> Also the python files can not be executed without $(PYTHON), so
> these scripts should depend on config-host.mak, too.
>=20
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  Makefile | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/Makefile b/Makefile
> index c830d7a..6786dc2 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -286,7 +286,7 @@ endif
> =20
>  all: $(DOCS) $(TOOLS) $(HELPERS-y) recurse-all modules
> =20
> -qemu-version.h: FORCE
> +qemu-version.h: config-host.mak FORCE

This one makes sense.

> @@ -393,6 +394,8 @@ gen-out-type =3D $(subst .,-,$(suffix $@))
> =20
>  qapi-py =3D $(SRC_PATH)/scripts/qapi.py $(SRC_PATH)/scripts/ordereddic=
t.py
> =20
> +$(qapi-py): config-host.mak

But this one is weird. How can a pre-existing file have a dependency?
Remember, $(qapi-py) is not the list of built files, but the list of
files used to build other files.  It seems like you either want
config-host.mak includes in $(qapi-py), or...

> +
>  qga/qapi-generated/qga-qapi-types.c qga/qapi-generated/qga-qapi-types.=
h :\
>  $(SRC_PATH)/qga/qapi-schema.json $(SRC_PATH)/scripts/qapi-types.py $(q=
api-py)

=2E..that THIS should be the rule that depends on config-host.mak in
addition do depending on $(qapi-py).

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


--5Mi2ss4qM6mlw5mI7GXoMBuVJmmdPKFOj--

--ptRgMbavdaJ8SU7Rq3x9n5BRAgVMHu4kJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJZOGlKAAoJEKeha0olJ0NqP7AH/AxXtehObqua8jatCFwoN9r4
f+m/5m8iYJJkIe8gnr9EThzGQnaq9GK4hawIRi5D78Tik/3YwpqWK1WC30ruPUEw
WdonBY5LPuT/AihaiDqqTjhkdzumTI2pj9Tjc6h3Oye2shoh0B3M+LoO4+ZiUlSO
pW4ZnFLgaVVQEvM+lD1kBx2kICRzlfJXJ6rrtDcmhrAeUK8FOx6owDFSNVMml1ou
b2tHcfr7zFckcyyWkflaOMZTnUyQspvUJeRIMhPyLJIVTphGEV/pWxGlHZrZIW47
yvA0xCZ4wFxehgO48Lpf/W6eLUoFkKd1jMx58aAVaSTpqGJZllGmc9Bak6gk1zI=
=BH1V
-----END PGP SIGNATURE-----

--ptRgMbavdaJ8SU7Rq3x9n5BRAgVMHu4kJ--

