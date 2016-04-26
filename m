Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1av4Lx-0005vE-8d
	for mharc-qemu-trivial@gnu.org; Tue, 26 Apr 2016 10:52:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36852)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1av4Lu-0005pG-LF
	for qemu-trivial@nongnu.org; Tue, 26 Apr 2016 10:52:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1av4Lr-0004uO-FH
	for qemu-trivial@nongnu.org; Tue, 26 Apr 2016 10:52:38 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48526)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1av4Li-0004ry-7F; Tue, 26 Apr 2016 10:52:26 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B0DE719F3A9;
	Tue, 26 Apr 2016 14:52:25 +0000 (UTC)
Received: from [10.3.113.21] (ovpn-113-21.phx2.redhat.com [10.3.113.21])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u3QEqOH5027803; Tue, 26 Apr 2016 10:52:25 -0400
To: Wei Jiangang <weijg.fnst@cn.fujitsu.com>, qemu-devel@nongnu.org
References: <1461665601-14908-1-git-send-email-weijg.fnst@cn.fujitsu.com>
Cc: kwolf@redhat.com, qemu-trivial@nongnu.org, qemu-block@nongnu.org,
	mreitz@redhat.com
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <571F80A8.1040802@redhat.com>
Date: Tue, 26 Apr 2016 08:52:24 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1461665601-14908-1-git-send-email-weijg.fnst@cn.fujitsu.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="X9Cl7UJTIdQeU6bPE0iXRfTsQHGj659IM"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] iotests: fix the
 redirection order in 083
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
X-List-Received-Date: Tue, 26 Apr 2016 14:52:39 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--X9Cl7UJTIdQeU6bPE0iXRfTsQHGj659IM
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 04/26/2016 04:13 AM, Wei Jiangang wrote:
> It should redirect stdout to /dev/null first,
> then redirect stderr to whatever stdout currently points at.
>=20
> Signed-off-by: Wei Jiangang <weijg.fnst@cn.fujitsu.com>
> ---
>  tests/qemu-iotests/083 | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--X9Cl7UJTIdQeU6bPE0iXRfTsQHGj659IM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJXH4CoAAoJEKeha0olJ0NqqLUH/3bARiqcyD9KWyG/PpUaP0Ce
Mnn5KCdtVgBWrmPG26Q8kFpAEAIiC6qxRkWoeQcpmdtKm6zfqZ1yhGzkqy6+EbsL
soaYM7nhwevK6Uvsq21rRICCNpjvP2v5vxcLV2TC/5moW9xn1T3wfbhMekn82FVh
FJDGeLAm7ODt47dlYLc9mqhzc8Bqr4KH65B0eE5cRLShUJQ+TcZallA4LsemxoTK
e9Nhpcd9wL07YsYRbV0czmIbs3j+ZeCWtbzr79tfiTkWuoVj8rrdFO+j1dxE/Pcy
vi8tCzGP6bMMTxsW4kPf5DJS7kkaUstc1M/2vY5K0v447I9pW/1jgmOVKjMMveA=
=EyOg
-----END PGP SIGNATURE-----

--X9Cl7UJTIdQeU6bPE0iXRfTsQHGj659IM--

