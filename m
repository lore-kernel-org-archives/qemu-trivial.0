Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TvXRz-0005Kp-Eq
	for mharc-qemu-trivial@gnu.org; Wed, 16 Jan 2013 13:10:59 -0500
Received: from eggs.gnu.org ([208.118.235.92]:38120)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1TvXRw-0005DV-QC
	for qemu-trivial@nongnu.org; Wed, 16 Jan 2013 13:10:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1TvXRv-0003jQ-Qy
	for qemu-trivial@nongnu.org; Wed, 16 Jan 2013 13:10:56 -0500
Received: from mx1.redhat.com ([209.132.183.28]:28262)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1TvXRt-0003iw-CI; Wed, 16 Jan 2013 13:10:53 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r0GIAo0a029475
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Wed, 16 Jan 2013 13:10:52 -0500
Received: from [10.3.113.75] (ovpn-113-75.phx2.redhat.com [10.3.113.75])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r0GIAYOI013124; Wed, 16 Jan 2013 13:10:42 -0500
Message-ID: <50F6ED1A.20608@redhat.com>
Date: Wed, 16 Jan 2013 11:10:34 -0700
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130110 Thunderbird/17.0.2
MIME-Version: 1.0
To: Markus Armbruster <armbru@redhat.com>
References: <1358357540-29862-1-git-send-email-armbru@redhat.com>
	<1358357540-29862-9-git-send-email-armbru@redhat.com>
In-Reply-To: <1358357540-29862-9-git-send-email-armbru@redhat.com>
X-Enigmail-Version: 1.5.0
OpenPGP: url=http://people.redhat.com/eblake/eblake.gpg
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="----enig2CLDBCJQCNONIUGJMMLUO"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH v2 08/11] qemu-log: Plug trivial memory
	leak in cpu_set_log_filename()
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 16 Jan 2013 18:10:57 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
------enig2CLDBCJQCNONIUGJMMLUO
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 01/16/2013 10:32 AM, Markus Armbruster wrote:
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  qemu-log.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


------enig2CLDBCJQCNONIUGJMMLUO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.13 (GNU/Linux)
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJQ9u0aAAoJEKeha0olJ0Nq59EIAIKFAmVhKHK1F99gBmrMAY2e
gH+dFouxD7qDR3Occfw9ss9eF7Wdlhm0DJ17vfTDEiuvVim3OfsoIAht2pc5yjwu
/8PxeXMFEsbR7S1ONbkLSJcHGqaNp93KVh4aJr7nfC6f2SnYD/duPJ17vWe0dKBa
Xkcb4u/xFnbXCGZvkDpZh1WWw+aPEA2/2pyPszfs3epgdPolElLyX8x4QG9BCEob
7F8kqg/S3sEAgUMnTyk2KYDUbj+KTFYpucxbo3WRzYApvWZg9WWqgC1q4RpCzE6a
mnfiAFliLylpsnKvVSUG8WTTaLT46rTZ1wjnSQH4sJF0g2jT/6Yu5eA6CIRLROo=
=jpX5
-----END PGP SIGNATURE-----

------enig2CLDBCJQCNONIUGJMMLUO--

