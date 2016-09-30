Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bq02J-0002A4-EI
	for mharc-qemu-trivial@gnu.org; Fri, 30 Sep 2016 11:47:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33396)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1bq02H-00027m-Kh
	for qemu-trivial@nongnu.org; Fri, 30 Sep 2016 11:47:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1bq02E-0002B4-0d
	for qemu-trivial@nongnu.org; Fri, 30 Sep 2016 11:47:40 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47320)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1bq025-00024d-PO; Fri, 30 Sep 2016 11:47:30 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D451CA7560;
	Fri, 30 Sep 2016 15:47:27 +0000 (UTC)
Received: from [10.3.116.116] (ovpn-116-116.phx2.redhat.com [10.3.116.116])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u8UFlRbt003354; Fri, 30 Sep 2016 11:47:27 -0400
To: "Daniel P. Berrange" <berrange@redhat.com>, qemu-devel@nongnu.org
References: <1475247721-30670-1-git-send-email-berrange@redhat.com>
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	qemu-stable@nongnu.org
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <3e440431-716c-ca57-0127-72dee9b7b3b2@redhat.com>
Date: Fri, 30 Sep 2016 10:47:26 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <1475247721-30670-1-git-send-email-berrange@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="X2sXqpAUmqhVwubAOFvmjHTI3sP9Kwpdx"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Fri, 30 Sep 2016 15:47:27 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] char: fix missing return in
 error path for chardev TLS init
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
X-List-Received-Date: Fri, 30 Sep 2016 15:47:42 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--X2sXqpAUmqhVwubAOFvmjHTI3sP9Kwpdx
Content-Type: multipart/mixed; boundary="sC2thV36M76NI5Sivm1HEBDF5WQoGTKdf";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: "Daniel P. Berrange" <berrange@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-stable@nongnu.org
Message-ID: <3e440431-716c-ca57-0127-72dee9b7b3b2@redhat.com>
Subject: Re: [Qemu-devel] [PATCH] char: fix missing return in error path for
 chardev TLS init
References: <1475247721-30670-1-git-send-email-berrange@redhat.com>
In-Reply-To: <1475247721-30670-1-git-send-email-berrange@redhat.com>

--sC2thV36M76NI5Sivm1HEBDF5WQoGTKdf
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 09/30/2016 10:02 AM, Daniel P. Berrange wrote:
> If the qio_channel_tls_new_(server|client) methods fail,
> we disconnect the client. Unfortunately a missing return
> means we then go on to try and run the TLS handshake on
> a NULL I/O channel. This gives predictably segfaulty
> results.
>=20
> The main way to trigger this is to request a bogus TLS
> priority string for the TLS credentials. e.g.
>=20
>   -object tls-creds-x509,id=3Dtls0,priority=3Dwibble,...
>=20
> Most other ways appear impossible to trigger except
> perhaps if OOM conditions cause gnutls initialization
> to fail.
>=20
> Signed-off-by: Daniel P. Berrange <berrange@redhat.com>
> ---
>  qemu-char.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Eric Blake <eblake@redhat.com>

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--sC2thV36M76NI5Sivm1HEBDF5WQoGTKdf--

--X2sXqpAUmqhVwubAOFvmjHTI3sP9Kwpdx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJX7okOAAoJEKeha0olJ0NqBsgH/2HQ2mF+YEZd0LulmbQCjpMk
HUtLVRvsBbo3B9QQ3bgO6hZGhMlqezLKjmpQ9DOfgZhXLyIzVvkCIlXzEYYFyklQ
NAFESRm9xUMzU1z4X1yvbpkycLNxyhqfD0ozgKGNnLOZR5ICcjaofHefDLZ0iVZW
S4E7EhKh4/ZaV/sPa+bDYXkJroenjjJu9GcVDw+/n6zfa1VSEKtbsSGV6fuzdODs
6Zf5y2Cfv7corX2S11vmRmlKeeJbegY9/sBIYifU1XrvyNeZGqhnojmDrejgbpLw
EVlDabh2kSMZMWN1vaQa/vOI+1VUnL7XRghjlh4j/fKICokhxRI0NxuoLe3h2kM=
=kjmu
-----END PGP SIGNATURE-----

--X2sXqpAUmqhVwubAOFvmjHTI3sP9Kwpdx--

