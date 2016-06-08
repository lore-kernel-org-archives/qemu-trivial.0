Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bAdfY-0001pc-KN
	for mharc-qemu-trivial@gnu.org; Wed, 08 Jun 2016 09:37:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38751)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1bAdfT-0001kG-Uf
	for qemu-trivial@nongnu.org; Wed, 08 Jun 2016 09:37:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1bAdfS-00073e-0s
	for qemu-trivial@nongnu.org; Wed, 08 Jun 2016 09:37:10 -0400
Received: from mx1.redhat.com ([209.132.183.28]:8656)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1bAdfC-00070C-8l; Wed, 08 Jun 2016 09:36:54 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 914C13DD47;
	Wed,  8 Jun 2016 13:36:53 +0000 (UTC)
Received: from [10.3.116.88] (ovpn-116-88.phx2.redhat.com [10.3.116.88])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u58Dao0j011447; Wed, 8 Jun 2016 09:36:52 -0400
To: Changlong Xie <xiecl.fnst@cn.fujitsu.com>,
	qemu devel <qemu-devel@nongnu.org>, qemu trival <qemu-trivial@nongnu.org>,
	Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <famz@redhat.com>,
	Max Reitz <mreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
	Jeff Cody <jcody@redhat.com>
References: <1465348292-26750-1-git-send-email-xiecl.fnst@cn.fujitsu.com>
Cc: qemu block <qemu-block@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	John Snow <jsnow@redhat.com>, Markus Armbruster <armbru@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Dong Eddie <eddie.dong@intel.com>, Jiang Yunhong <yunhong.jiang@intel.com>,
	zhanghailiang <zhang.zhanghailiang@huawei.com>,
	Gonglei <arei.gonglei@huawei.com>, Wen Congyang <wency@cn.fujitsu.com>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <57581F72.5060101@redhat.com>
Date: Wed, 8 Jun 2016 07:36:50 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1465348292-26750-1-git-send-email-xiecl.fnst@cn.fujitsu.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="Os49efJsevXU4ggh3eEAsoU2IdCtiSc34"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Wed, 08 Jun 2016 13:36:53 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH v20 00/10] Block replication for
 continuous checkpoints
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
X-List-Received-Date: Wed, 08 Jun 2016 13:37:16 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Os49efJsevXU4ggh3eEAsoU2IdCtiSc34
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 06/07/2016 07:11 PM, Changlong Xie wrote:
> Block replication is a very important feature which is used for
> continuous checkpoints(for example: COLO).
>=20

Side note: Including qemu-trivial in CC: on a patch series at v20 feels
wrong.  Obviously it is not trivial to be ten patches with this much chur=
n.

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--Os49efJsevXU4ggh3eEAsoU2IdCtiSc34
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJXWB9yAAoJEKeha0olJ0NqazYH/2y13SZXYmcULFAJcnyX5LMs
IhZiUNk8CvpgSpss27lya/07csMGqRCTfW8kqHD0uh7oaFTn6qUxHH4ZFc5k4X5X
UhRNpA4NK+AGw1GnDMfvbLdHc57S03Gtm3/HxtPTithe3st8HK+a6pIQgZEEEwYD
tLkxxZeFiL9MoEQsHrIRRp0DIFKVPLQKW66wcAMRTdqTgPTvIOYIrf6b+qMSAsiB
FHE/qho1sQHkwB+k2PVRPlq6O9VxOWh7W+QduXW0kUtxHB2pNrNTz4M1fPQVsROj
G7RaBkpvN2QemAGaBeSxeVCoFtYBimZmjQbTzLfTEvyEfnLMydvWEnh76Z9QQQw=
=AMB5
-----END PGP SIGNATURE-----

--Os49efJsevXU4ggh3eEAsoU2IdCtiSc34--

