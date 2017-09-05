Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dpEaa-0005fm-JI
	for mharc-qemu-trivial@gnu.org; Tue, 05 Sep 2017 10:12:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42836)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dpEaR-0005aS-Br
	for qemu-trivial@nongnu.org; Tue, 05 Sep 2017 10:12:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dpEaM-0003Ih-JC
	for qemu-trivial@nongnu.org; Tue, 05 Sep 2017 10:12:19 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52516)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1dpEa4-00033e-TF; Tue, 05 Sep 2017 10:11:57 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A311644BF4;
	Tue,  5 Sep 2017 14:11:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com A311644BF4
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=eblake@redhat.com
Received: from [10.10.120.228] (ovpn-120-228.rdu2.redhat.com [10.10.120.228])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B569D675C0;
	Tue,  5 Sep 2017 14:11:54 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
References: <1504613972-15847-1-git-send-email-peter.maydell@linaro.org>
Cc: patches@linaro.org
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <f1f3dc26-8499-02ba-9dfc-a2e96e766b79@redhat.com>
Date: Tue, 5 Sep 2017 09:11:53 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1504613972-15847-1-git-send-email-peter.maydell@linaro.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="bJOmNbG3DJNkxbMDHbKugOLHhIM41Gw89"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Tue, 05 Sep 2017 14:11:55 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] util/qemu-thread-posix.c:
 Replace OS ifdefs with CONFIG_HAVE_SEM_TIMEDWAIT
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
X-List-Received-Date: Tue, 05 Sep 2017 14:12:27 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--bJOmNbG3DJNkxbMDHbKugOLHhIM41Gw89
Content-Type: multipart/mixed; boundary="XoxObjAs0djFEb0kI87gG2trqEifnaqoW";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
Cc: patches@linaro.org
Message-ID: <f1f3dc26-8499-02ba-9dfc-a2e96e766b79@redhat.com>
Subject: Re: [Qemu-devel] [PATCH] util/qemu-thread-posix.c: Replace OS ifdefs
 with CONFIG_HAVE_SEM_TIMEDWAIT
References: <1504613972-15847-1-git-send-email-peter.maydell@linaro.org>
In-Reply-To: <1504613972-15847-1-git-send-email-peter.maydell@linaro.org>

--XoxObjAs0djFEb0kI87gG2trqEifnaqoW
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 09/05/2017 07:19 AM, Peter Maydell wrote:
> In qemu-thread-posix.c we have two implementations of the
> various qemu_sem_* functions, one of which uses native POSIX
> sem_* and the other of which emulates them with pthread conditions.
> This is necessary because not all our host OSes support
> sem_timedwait().
>=20
> Instead of a hard-coded list of OSes which don't implement
> sem_timedwait(), which gets out of date, make configure
> test for the presence of the function and set a new
> CONFIG_HAVE_SEM_TIMEDWAIT appropriately.
>=20
> In particular, newer NetBSDs have sem_timedwait(), so this
> commit will switch them over to using it. OSX still does
> not have an implementation.
>=20
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> It would be nice to gradually reduce the number of places
> we do per-OS ifdeffery in favour of checking for the specific
> feature we care about in each case...

Yes, that's always been autoconf's philosophy: feature tests trump
platform tests every time, because platforms can add features over time,
and because an ifdef on a single feature test is easier to read than a
list of platform names.

> Tested on Linux, NetBSD, OSX.
>=20

Reviewed-by: Eric Blake <eblake@redhat.com>

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


--XoxObjAs0djFEb0kI87gG2trqEifnaqoW--

--bJOmNbG3DJNkxbMDHbKugOLHhIM41Gw89
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAlmusKkACgkQp6FrSiUn
Q2oUFgf+I8JiApI4P+Pzxykrl5lVGjzQTMaXmA9pJ+DupHiRyATf3S5zygEUMkZU
Xn85Sniqt/WZNtJ0yMzo8onplqD6aYgCTev4EUs4ci9tHfUyot9SKXBJeJpwXoCX
0PKrMnvU6nOAieUHad8xo8H46l1sv1WwYT31leCdj4r3KpMY4PbmPFo4wmhYg10Q
aqGn4qjnG2FKUkIQM/Asm/xlYMY13HmY4tl32FuiTiH6SxAfanW5/t8hztZA2Oht
IYxvSLuNaBQJjdkTfLdJC/G65TPBoLSw3OhbCBNyaspB8dw71FjgNoAIYJ9XzvgZ
YgBR1dsVrXHczm12/ml6RZ+QWhwImQ==
=SA8i
-----END PGP SIGNATURE-----

--bJOmNbG3DJNkxbMDHbKugOLHhIM41Gw89--

