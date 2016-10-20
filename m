Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bxFpa-0003B0-1M
	for mharc-qemu-trivial@gnu.org; Thu, 20 Oct 2016 12:04:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46075)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1bxFpW-000382-Ht
	for qemu-trivial@nongnu.org; Thu, 20 Oct 2016 12:04:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1bxFpV-0004lA-F8
	for qemu-trivial@nongnu.org; Thu, 20 Oct 2016 12:04:30 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39778)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1bxFpP-0004j1-O1; Thu, 20 Oct 2016 12:04:23 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CAC444DB15;
	Thu, 20 Oct 2016 16:04:22 +0000 (UTC)
Received: from [10.3.116.151] (ovpn-116-151.phx2.redhat.com [10.3.116.151])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u9KG4MXM018896; Thu, 20 Oct 2016 12:04:22 -0400
To: Anand J <anand.indukala@gmail.com>, qemu-devel@nongnu.org
References: <1476978482-13108-1-git-send-email-anand.indukala@gmail.com>
	<1476978482-13108-2-git-send-email-anand.indukala@gmail.com>
Cc: qemu-trivial@nongnu.org, thuth@redhat.com
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <bf11b091-8705-e96b-cfab-028dcb5c719b@redhat.com>
Date: Thu, 20 Oct 2016 11:04:21 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1476978482-13108-2-git-send-email-anand.indukala@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="8gGm2U6saOVMfh0lPOuFph4WALirsS9ee"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Thu, 20 Oct 2016 16:04:22 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v3 1/2]
 scripts/clean-includes: added duplicate #include check
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
X-List-Received-Date: Thu, 20 Oct 2016 16:04:32 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--8gGm2U6saOVMfh0lPOuFph4WALirsS9ee
Content-Type: multipart/mixed; boundary="tXBFbn08KNDghMPlVqWiWoP78DQi4LqRx";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: Anand J <anand.indukala@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, thuth@redhat.com
Message-ID: <bf11b091-8705-e96b-cfab-028dcb5c719b@redhat.com>
Subject: Re: [Qemu-devel] [PATCH v3 1/2] scripts/clean-includes: added
 duplicate #include check
References: <1476978482-13108-1-git-send-email-anand.indukala@gmail.com>
 <1476978482-13108-2-git-send-email-anand.indukala@gmail.com>
In-Reply-To: <1476978482-13108-2-git-send-email-anand.indukala@gmail.com>

--tXBFbn08KNDghMPlVqWiWoP78DQi4LqRx
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 10/20/2016 10:48 AM, Anand J wrote:
> Added script to check duplicate #include entries. This check will scan

You didn't actually add a script, but enhanced an existing one.  Also,
"Added" is past tense, but commit messages are best written in
imperative tense.  Better might be:

Enhance the clean-includes script to optionally check for duplicate
#include entries.

(But be careful of line wraps; git eats lines starting with # if the
wrap happens at the wrong place while editing your message)

> and print the files in which duplicate #include entries are present.
>=20
> Script might output false positive entries as well. Such entries should=

> not be removed. So if it finds any duplicate entries script will
> terminate with an exit status 1. Then each and every file should be
> checked manually and corrected if necessary.
>=20
> In order to enable the check use --check-dup-head option with
> scripts/clean-includes.
>=20
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Anand J <anand.indukala@gmail.com>
> ---
>  scripts/clean-includes | 54 ++++++++++++++++++++++++++++++++++++++----=
--------
>  1 file changed, 41 insertions(+), 13 deletions(-)
>=20

> +if [ "$DUPHEAD" =3D "yes" ]; then
> +    grep "^#include" "$@" | sort | uniq -c | awk '{if ($1 > 1) print $=
0}'

Includes can be indented.  It is valid to write:
 #include ...
or
# include ...
or even
 # include ...

(of those three, we most commonly use the style:
# include ...
to delineate includes inside an #if conditional).

So a better expression might be grep "# *include" "$@", which may in
turn find more duplicates; on the other hand, those duplicates are more
likely to be conditionals where the duplication is necessary (see for
exampel include/qemu/bswap.h vs. <sys/endian.h>).  Then again, if you
allow whitespace in your grep, you have to remove that whitespace before
passing things to sort and uniq, if you want a fair comparison that
finds two duplicate includes that differ only by whitespace.

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--tXBFbn08KNDghMPlVqWiWoP78DQi4LqRx--

--8gGm2U6saOVMfh0lPOuFph4WALirsS9ee
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJYCOsFAAoJEKeha0olJ0NqXzgH/jq0fM+l5kcYW0cy1QEJbmn3
ldF+xBJQcu+SyxsiXDgawkpaqR5TEbzXwbSyJ97KohXfZFHXtIwAbDZVHG2Trrle
6iSI9zqHSE0zAovnb6qcjz2fE9zvNCZ87HQcjjFpLSC+0uvvn4+ed4eTRavSh9oO
Lv8ZMLAFY/chtof+jEGPgXxkLZOEvqsifhl05TY27VZ5oLI6UEKVpe01UGcE79ZH
HApBvTxMME47i/+L3xsr3pnlQauoGHi82rAgX9FZNE70mB212ZgNuPLihdpZHyFg
MXSzJ0slXhiK/q8BuJ1tNGT1xpFkgm+jZAjoEcEBev6WaHVEmLlkGtMykK8RoPg=
=1+gk
-----END PGP SIGNATURE-----

--8gGm2U6saOVMfh0lPOuFph4WALirsS9ee--

