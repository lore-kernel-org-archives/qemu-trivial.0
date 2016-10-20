Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bxDiR-0001w8-F6
	for mharc-qemu-trivial@gnu.org; Thu, 20 Oct 2016 09:49:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34307)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1bxDiO-0001tw-Us
	for qemu-trivial@nongnu.org; Thu, 20 Oct 2016 09:49:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1bxDiN-0005P9-VJ
	for qemu-trivial@nongnu.org; Thu, 20 Oct 2016 09:49:01 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35120)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1bxDiJ-0005NZ-DV; Thu, 20 Oct 2016 09:48:55 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9E77CA0B5F;
	Thu, 20 Oct 2016 13:48:54 +0000 (UTC)
Received: from [10.3.116.151] (ovpn-116-151.phx2.redhat.com [10.3.116.151])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u9KDmrtb021231; Thu, 20 Oct 2016 09:48:53 -0400
To: Anand J <anand.indukala@gmail.com>, qemu-devel@nongnu.org
References: <1476957133-24382-1-git-send-email-anand.indukala@gmail.com>
Cc: qemu-trivial@nongnu.org, thuth@redhat.com
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <e7cdd33b-15bd-e07d-760d-848fd73bb94e@redhat.com>
Date: Thu, 20 Oct 2016 08:48:53 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1476957133-24382-1-git-send-email-anand.indukala@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="jTEH83tImJRlERaQnf5eEsn49DwqtXuoU"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Thu, 20 Oct 2016 13:48:54 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/2] script/clean-includes:
 added duplicate #include check
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
X-List-Received-Date: Thu, 20 Oct 2016 13:49:02 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--jTEH83tImJRlERaQnf5eEsn49DwqtXuoU
Content-Type: multipart/mixed; boundary="x9mu4rRBW9Fut7CMtsPxqT7iJ92NQTaqL";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: Anand J <anand.indukala@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, thuth@redhat.com
Message-ID: <e7cdd33b-15bd-e07d-760d-848fd73bb94e@redhat.com>
Subject: Re: [Qemu-devel] [PATCH 1/2] script/clean-includes: added duplicate
 #include check
References: <1476957133-24382-1-git-send-email-anand.indukala@gmail.com>
In-Reply-To: <1476957133-24382-1-git-send-email-anand.indukala@gmail.com>

--x9mu4rRBW9Fut7CMtsPxqT7iJ92NQTaqL
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

[meta-comment]

On 10/20/2016 04:52 AM, Anand J wrote:
> Added script to check duplicate #include entries. This check will scan
> and print the files in which duplicate #include entries are present.

This appears to be a v2 patch.  But it is missing a 0/2 cover letter,
and mention of v2 in the subject line.  'git format-patch --cover-letter
-v2' will do what you want (as well as git send-email, which understands
all options accepted by format-patch); it's also possible to automate
git to send a cover letter any time you send more than one patch by
using 'git config format.coverLetter auto'.

More patch submission tips at http://wiki.qemu.org/Contribute/SubmitAPatc=
h

>=20
> Script might output false positive entries as well. Such entries should=

> not be removed. So if it finds any duplicate entries script will
> terminate with an exit status 1. Then each and every file should be
> checked manually and corrected if necessary.
>=20
> In order to enable the check use --check-duphead option with
> script/clean-includes.
>=20
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Anand J <anand.indukala@gmail.com>
> ---
>  scripts/clean-includes | 50 +++++++++++++++++++++++++++++++++++++-----=
--------
>  1 file changed, 37 insertions(+), 13 deletions(-)
>=20

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--x9mu4rRBW9Fut7CMtsPxqT7iJ92NQTaqL--

--jTEH83tImJRlERaQnf5eEsn49DwqtXuoU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJYCMtFAAoJEKeha0olJ0NqK8MH/2xqaClqb9/zr78o2LS8zqvk
+uqj7yPsGtN/ufm6rY7s+RCE3DhKdSn1Eyqt/INzD6ulnAuYCNXBYlRtOEYKnRlx
PaH4ateDPKMgXIr1noJoGlBy/mzUypXs9P1G+Y8X8mZhHWuuNjev+8AFfi2yNuY/
31kzP45HcsyChdF3iwaMglJbKDBMtHN3kIG4t8iIRlFSp++jYT6B0UiJTb2wwSvi
cu2GHzgh9RFdmDdTAxdAkGwEVcVILPpPqWoukyldFp+drX5J3tqvGCCKgpb1rzsb
u1BIrrRssN9vWbEKWkQ2Vn8AwWmR/UsFI2KJ3JMJFrcglemuR6xcQFJG6duWEw0=
=lSUU
-----END PGP SIGNATURE-----

--jTEH83tImJRlERaQnf5eEsn49DwqtXuoU--

