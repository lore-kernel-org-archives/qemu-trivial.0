Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bAe7A-0003a2-Rm
	for mharc-qemu-trivial@gnu.org; Wed, 08 Jun 2016 10:05:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46611)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1bAe78-0003XP-Ku
	for qemu-trivial@nongnu.org; Wed, 08 Jun 2016 10:05:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1bAe73-0006XP-4F
	for qemu-trivial@nongnu.org; Wed, 08 Jun 2016 10:05:45 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40684)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1bAe6r-0006Wu-Mk; Wed, 08 Jun 2016 10:05:29 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2063569A;
	Wed,  8 Jun 2016 14:05:29 +0000 (UTC)
Received: from [10.3.116.88] (ovpn-116-88.phx2.redhat.com [10.3.116.88])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u58E5SFd007867; Wed, 8 Jun 2016 10:05:28 -0400
To: "Maciej W. Rozycki" <macro@imgtec.com>, Stefan Weil <sw@weilnetz.de>
References: <1463404220-5945-1-git-send-email-sw@weilnetz.de>
	<alpine.DEB.2.00.1606081305490.10382@tp.orcam.me.uk>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developer <qemu-devel@nongnu.org>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <57582628.9060306@redhat.com>
Date: Wed, 8 Jun 2016 08:05:28 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.00.1606081305490.10382@tp.orcam.me.uk>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="UPTpQpLd93UBfBP2v4xhhaLeiWaMqUSiN"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Wed, 08 Jun 2016 14:05:29 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] configure: Use $(..)
 instead of deprecated `..`
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
X-List-Received-Date: Wed, 08 Jun 2016 14:05:47 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--UPTpQpLd93UBfBP2v4xhhaLeiWaMqUSiN
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 06/08/2016 06:16 AM, Maciej W. Rozycki wrote:
> On Mon, 16 May 2016, Stefan Weil wrote:
>=20
>> This fixes these warnings from shellcheck:
>>
>>     ^-- SC2006: Use $(..) instead of deprecated `..`
>>
>> Signed-off-by: Stefan Weil <sw@weilnetz.de>
>> ---
>>
>> More warnings from shellcheck for configure and other files
>> will be handled by later patches.
>=20
>  Unlike `..` the $(..) Bourne shell construct is not fully portable, so=
me=20
> implementations do not recognise it.

All POSIX implementations support it. The only shell that doesn't is
from Solaris /bin/sh, and that pre-dates modern OpenSolaris which has
(finally) modernized their shell.  And I don't think we have anyone
actively trying to build qemu for Solaris (we have bug reports for
mingw, BSD, and Mac OS, but I haven't seen anyone complaining about a
failed Solaris build).

>  So what's the technical justification -- beyond shutting up some rando=
m=20
> checker tool -- for making this change?  Does the benefit recognised in=
=20
> making this change outweigh the limitation introduced?  How about handl=
ing=20
> failures properly?

We already have places where we assume a POSIX shell, and $() is cleaner
to use than `` when it comes to nesting quotes.

>  NB given the above, and especially because of the introduced functiona=
l=20
> regression mentioned, I don't think this change qualifies as trivial.

I agree that calling this trivial may be a stretch, but I see no problem
with the patch itself if the commit message is beefed up to provide more
justification than just "silence a lint-like tool".

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--UPTpQpLd93UBfBP2v4xhhaLeiWaMqUSiN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJXWCYoAAoJEKeha0olJ0NqaagH/3Ef/1SrQEx+ZQh7I6tQRI91
02JlrASbNO8WS4PvlVy1P7EL0srNmBZUhPBmiGFrKi9TTVvHsMe4wXGRiHCH+DF4
V06pFEWBNEkq8rUaM/B8hC/jynvM5Wlh4RAc3+0KKHx8GRvSp1loKkNfyJVw8Q3i
4F3RbIg4A3HRuH7nC9o+14qYnJwujZKZ+YNYbQIK8WDfVL2obtl8Qde6U+OUHREK
B+lhR0/x24phVKgrYB3zdrLPo95tCor9Ji2n5EhgnwgY2a2kgMvgYolyYaeKzVRH
nc/vN0xe+VZOX0I0YmZEQsrLMhZ7O0UPm797Mgh/oxoLWCCrnrk24DVlHBaAdEQ=
=a6VW
-----END PGP SIGNATURE-----

--UPTpQpLd93UBfBP2v4xhhaLeiWaMqUSiN--

