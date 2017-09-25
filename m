Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dwW5T-000420-9Y
	for mharc-qemu-trivial@gnu.org; Mon, 25 Sep 2017 12:18:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51659)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dwW5Q-0003yr-Tc
	for qemu-trivial@nongnu.org; Mon, 25 Sep 2017 12:18:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dwW5P-00079I-Oi
	for qemu-trivial@nongnu.org; Mon, 25 Sep 2017 12:18:24 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45206)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1dwW5L-00077O-5f; Mon, 25 Sep 2017 12:18:19 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3A9757F41E;
	Mon, 25 Sep 2017 16:18:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 3A9757F41E
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=eblake@redhat.com
Received: from [10.10.124.97] (ovpn-124-97.rdu2.redhat.com [10.10.124.97])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A73E56E918;
	Mon, 25 Sep 2017 16:18:15 +0000 (UTC)
To: Daniel Loffgren <daniel@loffgren.org>, qemu-devel@nongnu.org
References: <40DEFE92-410B-4FED-B0A5-56C186627134@loffgren.org>
Cc: qemu-trivial@nongnu.org
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <b99306b2-2e53-7b0f-933c-c549c54b07b7@redhat.com>
Date: Mon, 25 Sep 2017 11:18:14 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <40DEFE92-410B-4FED-B0A5-56C186627134@loffgren.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="wvWmL0C68swImAXnxxFUpqCnxUH6UENSk"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Mon, 25 Sep 2017 16:18:17 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/2] fprintf-fn.h uses
 GCC_FMT, but doesn't include the definition of it
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
X-List-Received-Date: Mon, 25 Sep 2017 16:18:26 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--wvWmL0C68swImAXnxxFUpqCnxUH6UENSk
Content-Type: multipart/mixed; boundary="JtJjUiEOAbCXWRJJr9qxhSohhMJANoeXc";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: Daniel Loffgren <daniel@loffgren.org>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
Message-ID: <b99306b2-2e53-7b0f-933c-c549c54b07b7@redhat.com>
Subject: Re: [Qemu-devel] [PATCH 1/2] fprintf-fn.h uses GCC_FMT, but doesn't
 include the definition of it
References: <40DEFE92-410B-4FED-B0A5-56C186627134@loffgren.org>
In-Reply-To: <40DEFE92-410B-4FED-B0A5-56C186627134@loffgren.org>

--JtJjUiEOAbCXWRJJr9qxhSohhMJANoeXc
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 09/24/2017 08:02 PM, Daniel Loffgren wrote:
>=20
> Signed-off-by: Daniel Loffgren <daniel@loffgren.org>

Hmm - you've identified a file with no listed maintainer.  But
qemu-trivial does seem like the right place to include it.

Generally, we like patches to call out the topic that it is touching;
also, the subject line should focus on the what, while the body focuses
on the why.  So a better commit message might be:

maint: Make fprintf-fn.h self-contained

Include the necessary headers so that GCC_FMT_ATTR is defined regardless
of what client files use fprintf-fn.h.


However, after saying that, I think your patch is not needed.  Per
HACKING, _all_ .c files must include osdep.h first, and osdep.h already
includes compiler.h, therefore, any .c file that uses fprintf-fn.h
already has GCC_FMT_ATTR in scope by the time it gets to the
fprintf_function typedef.  If you ran into a situation where you had a
compile failure, please post more details of what failed for you, in
case the problem was you forgetting to use osdep.h.

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


--JtJjUiEOAbCXWRJJr9qxhSohhMJANoeXc--

--wvWmL0C68swImAXnxxFUpqCnxUH6UENSk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAlnJLEYACgkQp6FrSiUn
Q2q2+wf/S6KNmkFI8dcq9rRmQEOiZ6lR0/7korWHe57Rj4KjM+d8UruSNS+lQ16E
pD0rik9zRZjlyInGUi8hHCH+nMBn/PgDJl+GZuudLG6N4hWXrm6NkAjwvlsj1C+S
L0sD671k8CTZPdnXLT7MA3uTvSa+Dro00EsjcEhKTP+fJu9DvDO7PnXYKXWMDQC8
D9jZfq5fGHVV6ex1wvaNmvhzHtvHkiiReGh/I3SXYywUCkURvDL44YjFVTEeHEfM
H5rJq4CB9M2eLg+Udt0Bxhw37VxrRvKeEHSi1w735Z1wHmAWfKrrwxCC1TMwbOY4
Mpv3FZHMD37/0C78mzExG4PdZGOswQ==
=Q3dV
-----END PGP SIGNATURE-----

--wvWmL0C68swImAXnxxFUpqCnxUH6UENSk--

