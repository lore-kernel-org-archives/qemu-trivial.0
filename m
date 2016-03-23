Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aipwT-0001qp-Jd
	for mharc-qemu-trivial@gnu.org; Wed, 23 Mar 2016 17:03:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55430)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1aipwR-0001oB-HO
	for qemu-trivial@nongnu.org; Wed, 23 Mar 2016 17:03:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1aipwQ-0004zg-Jn
	for qemu-trivial@nongnu.org; Wed, 23 Mar 2016 17:03:47 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57668)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1aipwM-0004zE-BV; Wed, 23 Mar 2016 17:03:42 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (Postfix) with ESMTPS id BE91E85542;
	Wed, 23 Mar 2016 21:03:41 +0000 (UTC)
Received: from [10.3.113.112] (ovpn-113-112.phx2.redhat.com [10.3.113.112])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u2NL3eFJ007017; Wed, 23 Mar 2016 17:03:41 -0400
To: Wei Jiangang <weijg.fnst@cn.fujitsu.com>, qemu-devel@nongnu.org
References: <1457949509-4014-1-git-send-email-weijg.fnst@cn.fujitsu.com>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <56F304AC.804@redhat.com>
Date: Wed, 23 Mar 2016 15:03:40 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <1457949509-4014-1-git-send-email-weijg.fnst@cn.fujitsu.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="R1Sb3puuI60QkhEjKIiktS6Fm2mxWIeTf"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, kraxel@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v1] util: fix comment typos
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
X-List-Received-Date: Wed, 23 Mar 2016 21:03:48 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--R1Sb3puuI60QkhEjKIiktS6Fm2mxWIeTf
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 03/14/2016 03:58 AM, Wei Jiangang wrote:
> Signed-off-by: Wei Jiangang <weijg.fnst@cn.fujitsu.com>
> ---
>  util/buffer.c       | 4 ++--
>  util/qemu-sockets.c | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--R1Sb3puuI60QkhEjKIiktS6Fm2mxWIeTf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJW8wSsAAoJEKeha0olJ0NqFu0H/irpAIH4vjMSXYC1VghMJY9U
wpGj/vhh5N2XvXg27wAZgCf31ZnBvtasLuVJKNpL5ajugXWXnKs+m4PTWXdjILUW
VwX08FzhX8C3TX+BDMc8gxVta8ILxoKjgQLUwupDCYB2g9yw87X7e0jQCQqxd/vJ
/xzzCQm7F6p0Ua7t9g1Q/B3OCRirORQ54lMk2eSwW29looluzXyHgcO0FyJQEK1O
4IveAIOeZqf3ZnkN7YvHuTic5w5OftaCHPpBDp3qGH/XkcpkXyqmhTPsonUN6mml
MyG1DEdajs+m7aDR7kvA7TCLTvxDJ+4axRNv3ERqa8RnqKkmqoyt6W1CGBHCihk=
=KdSn
-----END PGP SIGNATURE-----

--R1Sb3puuI60QkhEjKIiktS6Fm2mxWIeTf--

