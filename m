Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dXdPJ-0002Mh-V1
	for mharc-qemu-trivial@gnu.org; Tue, 18 Jul 2017 21:04:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58553)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dXdPH-0002L9-EN
	for qemu-trivial@nongnu.org; Tue, 18 Jul 2017 21:04:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dXdPG-0007Um-4F
	for qemu-trivial@nongnu.org; Tue, 18 Jul 2017 21:04:03 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56352)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1dXdPA-0007Lp-El; Tue, 18 Jul 2017 21:03:56 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 05341C0587C3;
	Wed, 19 Jul 2017 01:03:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 05341C0587C3
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eblake@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 05341C0587C3
Received: from [10.10.121.28] (ovpn-121-28.rdu2.redhat.com [10.10.121.28])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 37CE277D59;
	Wed, 19 Jul 2017 01:03:52 +0000 (UTC)
To: Nathaniel McCallum <npmccallum@redhat.com>, qemu-devel@nongnu.org
References: <CAOASepMWrxm0OxvuzeujfVK8JN-UzKCXtaz2vJRgGno=8CSMqQ@mail.gmail.com>
Cc: qemu-trivial@nongnu.org, raj.khem@gmail.com
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <5e542ce6-4192-4590-163e-de54002d74dd@redhat.com>
Date: Tue, 18 Jul 2017 20:03:51 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <CAOASepMWrxm0OxvuzeujfVK8JN-UzKCXtaz2vJRgGno=8CSMqQ@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="eA8elaO5C5QDSp6f9fr7oCGNji8FQOdEV"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Wed, 19 Jul 2017 01:03:55 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Update references of
 "struct ucontext" to "ucontext_t"
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
X-List-Received-Date: Wed, 19 Jul 2017 01:04:04 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--eA8elaO5C5QDSp6f9fr7oCGNji8FQOdEV
Content-Type: multipart/mixed; boundary="X4P4U3LeRbuGWe3HJ4O1XPqCbMicOpkg9";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: Nathaniel McCallum <npmccallum@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, raj.khem@gmail.com
Message-ID: <5e542ce6-4192-4590-163e-de54002d74dd@redhat.com>
Subject: Re: [Qemu-devel] [PATCH] Update references of "struct ucontext" to
 "ucontext_t"
References: <CAOASepMWrxm0OxvuzeujfVK8JN-UzKCXtaz2vJRgGno=8CSMqQ@mail.gmail.com>
In-Reply-To: <CAOASepMWrxm0OxvuzeujfVK8JN-UzKCXtaz2vJRgGno=8CSMqQ@mail.gmail.com>

--X4P4U3LeRbuGWe3HJ4O1XPqCbMicOpkg9
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 07/18/2017 07:58 PM, Nathaniel McCallum wrote:
> Glibc used to have:
>=20
>    typedef struct ucontext { ... } ucontext_t;
>=20
> Glibc now has:
>=20
>    typedef struct ucontext_t { ... } ucontext_t;
>=20
> However, Qemu used "struct ucontext" in declarations. This is a
> private name and compatiblity cannot be guaranteed. This patch
> updates Qemu to only use the standardized type name.
>=20
> Signed-off-by: Nathaniel McCallum <npmccallum@redhat.com>
> ---

Looks like this duplicates:
https://lists.gnu.org/archive/html/qemu-devel/2017-06/msg06508.html

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


--X4P4U3LeRbuGWe3HJ4O1XPqCbMicOpkg9--

--eA8elaO5C5QDSp6f9fr7oCGNji8FQOdEV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAllur/cACgkQp6FrSiUn
Q2rZsQgAoMAVDlZtgCeHp9/KKP8dHOzclxhWz13oOdW0F16pQP+pAIxbVTbTmWYP
xhZK3ukxSL99a5uPHt0P73UkMMlMrmsZb6scLkOe9NKgDbC067HRVzoQWEF+db3A
1KOczTJuCjfFL9q+ngd6fxCmbmicyNC+PKKPy4eeFYV6CKnVCfWa4nhqthKa6Eg4
5rQUFVut8QIHWEgDxXqtH1K6y+SHgRr8bYIMy+ZfgJ1fT5FvCcp9ylW4U42ffsaY
dw1NFHhdaj7zjZfgNdqeXk7JqTlYC6Y8htWoP3E4d2P7veWd2PKlGWOEpKJzP1W2
IJBYDkUuHk0hwYAbkdBgSErRaNVZDw==
=/6Wj
-----END PGP SIGNATURE-----

--eA8elaO5C5QDSp6f9fr7oCGNji8FQOdEV--

