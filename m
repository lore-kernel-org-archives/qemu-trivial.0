Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YnBM6-0001NG-5c
	for mharc-qemu-trivial@gnu.org; Tue, 28 Apr 2015 15:39:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33771)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1YnBM3-0001Kj-T9
	for qemu-trivial@nongnu.org; Tue, 28 Apr 2015 15:39:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1YnBM3-0006TQ-0b
	for qemu-trivial@nongnu.org; Tue, 28 Apr 2015 15:39:39 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40552)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1YnBLy-0006S2-BA; Tue, 28 Apr 2015 15:39:34 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t3SJdXfj002152
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Tue, 28 Apr 2015 15:39:33 -0400
Received: from [10.3.113.25] (ovpn-113-25.phx2.redhat.com [10.3.113.25])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t3SJdWLZ026796; Tue, 28 Apr 2015 15:39:33 -0400
Message-ID: <553FE1F4.2020403@redhat.com>
Date: Tue, 28 Apr 2015 13:39:32 -0600
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: John Snow <jsnow@redhat.com>, qemu-trivial@nongnu.org
References: <1430248841-26558-1-git-send-email-jsnow@redhat.com>
In-Reply-To: <1430248841-26558-1-git-send-email-jsnow@redhat.com>
OpenPGP: url=http://people.redhat.com/eblake/eblake.gpg
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="5X8sOACIcEGeKkAIGWulCQlMIFRxBa5M1"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qmp-commands: Fix typo
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
X-List-Received-Date: Tue, 28 Apr 2015 19:39:40 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--5X8sOACIcEGeKkAIGWulCQlMIFRxBa5M1
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 04/28/2015 01:20 PM, John Snow wrote:
> Just a trivial patch to correct a QMP example in qmp-commands.hx.
>=20
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  qmp-commands.hx | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--5X8sOACIcEGeKkAIGWulCQlMIFRxBa5M1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJVP+H0AAoJEKeha0olJ0Nq6KkH/innGwZ4H+O83GgK8vBiF4dT
eAHEemQd+QxuhC9rf/mvP/muBrvzr15pTIT7ygX1Wp4ywE3N/zfQN4VH62il5Nn/
70XjVBiajf2bW/uIzDrp3ahiXa5+l1NDl/Ua7A73YFK14k8uatVXy6bzH21wI6i6
uXIJ6CCEoG8P5uVZyu4UV2pHt+jdxyg6DVw/zXipnLtddXndwCq2ftDaiIa/Qy/B
ywRuHVyxrpvsg8sbiCAc+Zh10c31bbaI+krG2JLnXY3/cDtzdxoQTcAO1cMLUoz+
TlXiLNN72siGpKzessjtRZaspJaUi2J/LefSyEHO8kYOBhjl+c/OHkiQ7LuEokg=
=KRNY
-----END PGP SIGNATURE-----

--5X8sOACIcEGeKkAIGWulCQlMIFRxBa5M1--

