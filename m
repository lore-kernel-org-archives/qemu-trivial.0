Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dIwS5-0005ib-OC
	for mharc-qemu-trivial@gnu.org; Thu, 08 Jun 2017 08:22:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54505)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dIwS3-0005gs-E3
	for qemu-trivial@nongnu.org; Thu, 08 Jun 2017 08:22:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dIwS2-00046N-7e
	for qemu-trivial@nongnu.org; Thu, 08 Jun 2017 08:22:11 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39730)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1dIwRw-00044m-PF; Thu, 08 Jun 2017 08:22:04 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B849BC04B951;
	Thu,  8 Jun 2017 12:22:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com B849BC04B951
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eblake@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com B849BC04B951
Received: from [10.10.122.114] (ovpn-122-114.rdu2.redhat.com [10.10.122.114])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 28EAD84849;
	Thu,  8 Jun 2017 12:22:00 +0000 (UTC)
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <1496907604-2393-1-git-send-email-thuth@redhat.com>
Cc: Fam Zheng <famz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <1e50d054-a342-39c1-db69-3b7adf162b79@redhat.com>
Date: Thu, 8 Jun 2017 07:21:59 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.0
MIME-Version: 1.0
In-Reply-To: <1496907604-2393-1-git-send-email-thuth@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="fG2QXQgqrgO2mthQlgF8BxB8wooSnlUWg"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Thu, 08 Jun 2017 12:22:03 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH v2] Makefile: Do not generate files if
 "configure" has not been run yet
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
X-List-Received-Date: Thu, 08 Jun 2017 12:22:12 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--fG2QXQgqrgO2mthQlgF8BxB8wooSnlUWg
Content-Type: multipart/mixed; boundary="DmJL27RPHn2OeMpGVKXxu2I6w2c5PDfOr";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: Fam Zheng <famz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Message-ID: <1e50d054-a342-39c1-db69-3b7adf162b79@redhat.com>
Subject: Re: [PATCH v2] Makefile: Do not generate files if "configure" has not
 been run yet
References: <1496907604-2393-1-git-send-email-thuth@redhat.com>
In-Reply-To: <1496907604-2393-1-git-send-email-thuth@redhat.com>

--DmJL27RPHn2OeMpGVKXxu2I6w2c5PDfOr
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 06/08/2017 02:40 AM, Thomas Huth wrote:
> When doing a "make -j10" in the vanilla QEMU source tree (without
> running "configure first), the Makefile currently generates two
> files already, qemu-version.h and qemu-options.def. This should not
> happen, so let's make these targets depend on config-host.mak.
> Also the targets that use python  can not be executed without the
> $(PYTHON) from config-host.mak, so these should depend on the config-
> host.mak file, too (these targets generate some ugly error messages
> otherwise during "make -j10").
>=20
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  v2:
>  - Add the dependency to the targets that use $(PYTHON) instead of
>    adding it to $(qapi-py)
>=20
> @@ -312,6 +312,7 @@ qemu-version.h: FORCE
> =20
>  config-host.h: config-host.h-timestamp
>  config-host.h-timestamp: config-host.mak
> +qemu-options.def: config-host.mak
>  qemu-options.def: $(SRC_PATH)/qemu-options.hx $(SRC_PATH)/scripts/hxto=
ol
>  	$(call quiet-command,sh $(SRC_PATH)/scripts/hxtool -h < $< > $@,"GEN"=
,"$@")

This works (namely, splitting the dependencies between a no-op rule and
the real rule:

a:b
a:c
	recipe

), but looks unusual compared to having a single rule with all the
dependencies:

a: b c
	recipe

> @@ -394,17 +395,17 @@ gen-out-type =3D $(subst .,-,$(suffix $@))
>  qapi-py =3D $(SRC_PATH)/scripts/qapi.py $(SRC_PATH)/scripts/ordereddic=
t.py
> =20
>  qga/qapi-generated/qga-qapi-types.c qga/qapi-generated/qga-qapi-types.=
h :\
> -$(SRC_PATH)/qga/qapi-schema.json $(SRC_PATH)/scripts/qapi-types.py $(q=
api-py)
> +$(SRC_PATH)/qga/qapi-schema.json $(SRC_PATH)/scripts/qapi-types.py $(q=
api-py) config-host.mak
>  	$(call quiet-command,$(PYTHON) $(SRC_PATH)/scripts/qapi-types.py \

Long line. Let's use \ line-splitting to keep things under 80 columns
(if Fam's suggestion of adding the dependency just once doesn't pan out).=


>  		$(gen-out-type) -o qga/qapi-generated -p "qga-" $<, \
>  		"GEN","$@")
>  qga/qapi-generated/qga-qapi-visit.c qga/qapi-generated/qga-qapi-visit.=
h :\
> -$(SRC_PATH)/qga/qapi-schema.json $(SRC_PATH)/scripts/qapi-visit.py $(q=
api-py)
> +$(SRC_PATH)/qga/qapi-schema.json $(SRC_PATH)/scripts/qapi-visit.py $(q=
api-py) config-host.mak

More long lines ahead.

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


--DmJL27RPHn2OeMpGVKXxu2I6w2c5PDfOr--

--fG2QXQgqrgO2mthQlgF8BxB8wooSnlUWg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJZOUFnAAoJEKeha0olJ0NqrEoH/i1RCOnD6xiZhSJl5v3j44N/
oJWhnrpcwofGiDDED9DFi9Vwec2IKXW41+QTXP+VCXQjafGy3mVpM83q2sXyRtK1
1TCTqUY8zrnZxxrs75Unv6I4sf6Pmd4JidCH+P6elMYAGqvypkfbBP5Jtumw+xbf
mQsBjaicGDQZNlXkMp+9Vcbz0zVahp4KBfnDelkvVqCfZvQJbVo/ORQK0BnPLqJi
pF4x7PxIlNsX+ZhfOhntRpHplIdC8ggYU4G97CPq5ULU4HHn40DBrt4nFjDbZPrM
kwPVQfyc2c+snq+MkMfrXWZM+5Uucvg880FPcNBskWExLCCmi5zXbfAiQneQ3jg=
=wMVC
-----END PGP SIGNATURE-----

--fG2QXQgqrgO2mthQlgF8BxB8wooSnlUWg--

