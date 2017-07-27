Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dahoN-0005bm-KV
	for mharc-qemu-trivial@gnu.org; Thu, 27 Jul 2017 08:22:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47872)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dahoI-0005aw-II
	for qemu-trivial@nongnu.org; Thu, 27 Jul 2017 08:22:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dahoH-0007Mb-Lh
	for qemu-trivial@nongnu.org; Thu, 27 Jul 2017 08:22:34 -0400
Received: from mx1.redhat.com ([209.132.183.28]:24146)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1dahoD-0007KK-8D; Thu, 27 Jul 2017 08:22:29 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3637233459B;
	Thu, 27 Jul 2017 12:22:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 3637233459B
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=eblake@redhat.com
Received: from [10.10.121.48] (ovpn-121-48.rdu2.redhat.com [10.10.121.48])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D5DDD4FA30;
	Thu, 27 Jul 2017 12:22:25 +0000 (UTC)
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org
References: <20170727120210.6943-1-crosa@redhat.com>
	<20170727120210.6943-6-crosa@redhat.com>
Cc: qemu-trivial@nongnu.org
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <c5df31fb-3859-ab7a-9a61-5526360fd0f7@redhat.com>
Date: Thu, 27 Jul 2017 07:22:24 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170727120210.6943-6-crosa@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="3ovhIhU8ivSDFCWE5fS2rDw1Xl8cqCIVq"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Thu, 27 Jul 2017 12:22:28 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 5/5] docs: fix broken paths
 to docs/interop dir
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
X-List-Received-Date: Thu, 27 Jul 2017 12:22:38 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--3ovhIhU8ivSDFCWE5fS2rDw1Xl8cqCIVq
Content-Type: multipart/mixed; boundary="QNwW99FQuSFLf1gpkHmrG0Jv840NNK0iQ";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
Message-ID: <c5df31fb-3859-ab7a-9a61-5526360fd0f7@redhat.com>
Subject: Re: [Qemu-devel] [PATCH 5/5] docs: fix broken paths to docs/interop
 dir
References: <20170727120210.6943-1-crosa@redhat.com>
 <20170727120210.6943-6-crosa@redhat.com>
In-Reply-To: <20170727120210.6943-6-crosa@redhat.com>

--QNwW99FQuSFLf1gpkHmrG0Jv840NNK0iQ
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 07/27/2017 07:02 AM, Cleber Rosa wrote:
> With the move of some docs to docs/interop on d59157e, a couple of
> references where not updated.
>=20
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>  docs/devel/writing-qmp-commands.txt | 2 +-
>  qapi-schema.json                    | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

Safe for 2.10, but also okay if it slips to 2.11

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


--QNwW99FQuSFLf1gpkHmrG0Jv840NNK0iQ--

--3ovhIhU8ivSDFCWE5fS2rDw1Xl8cqCIVq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAll52wAACgkQp6FrSiUn
Q2odMQf/dD93bwSEPNJYqxbUJrvnkl4s8Oe3YVd2U2nyLsCrf38JjcDKbOZAVFqZ
WKrlO1TDkZxh9rI9VihLhMcBy09Wv+zZ84k8AsduzgXVGl8hCdatkb8j4MdX0T+S
uBu6cNwny2GUz6rr2gt58A+GxXEDOFW29XDHsXj/80/BeWIH2yVleDANjPGt1sE1
Ss1j0IKj6KjukUOiH3gufZWHq96Cwx1zvun0XIONGjOuKuGp6m/yoNZtZd87kO78
fyXVLFBj/TtIeHYOrpgo+fC0G3Fhn1qMLqNvxG8s/8ezgVqnpLm81cOAYp+cCgmW
DMuUehoxO3ANwKURJvxdn6SvnNs6Sg==
=G1QP
-----END PGP SIGNATURE-----

--3ovhIhU8ivSDFCWE5fS2rDw1Xl8cqCIVq--

