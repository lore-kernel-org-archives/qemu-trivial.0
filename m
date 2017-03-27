Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1csXv3-0008Mg-GG
	for mharc-qemu-trivial@gnu.org; Mon, 27 Mar 2017 12:55:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42785)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1csXv0-0008Kl-Py
	for qemu-trivial@nongnu.org; Mon, 27 Mar 2017 12:55:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1csXuz-0002Vv-Pk
	for qemu-trivial@nongnu.org; Mon, 27 Mar 2017 12:54:58 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57960)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1csXut-0002JF-8s; Mon, 27 Mar 2017 12:54:51 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2D6F961D2D;
	Mon, 27 Mar 2017 16:54:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 2D6F961D2D
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eblake@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 2D6F961D2D
Received: from [10.10.122.200] (ovpn-122-200.rdu2.redhat.com [10.10.122.200])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7DD8F1882A;
	Mon, 27 Mar 2017 16:54:43 +0000 (UTC)
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20170327165005.22038-1-stefanha@redhat.com>
Cc: Ronnie Sahlberg <ronniesahlberg@gmail.com>, qemu-block@nongnu.org,
	qemu-trivial@nongnu.org, Peter Lieven <pl@kamp.de>,
	Paolo Bonzini <pbonzini@redhat.com>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <3aa0768c-8378-99b3-2c2c-1188773a3a3b@redhat.com>
Date: Mon, 27 Mar 2017 11:54:42 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170327165005.22038-1-stefanha@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="qV6vq7Fi9CMJIoMwXhdDfPx3RKKffmpvg"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Mon, 27 Mar 2017 16:54:50 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] iscsi: drop unused
 IscsiAIOCB.qiov field
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
X-List-Received-Date: Mon, 27 Mar 2017 16:55:00 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--qV6vq7Fi9CMJIoMwXhdDfPx3RKKffmpvg
Content-Type: multipart/mixed; boundary="skIKAPNFggXrC479c5sQN4u8bpOIMhuDh";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Cc: Ronnie Sahlberg <ronniesahlberg@gmail.com>, qemu-block@nongnu.org,
 qemu-trivial@nongnu.org, Peter Lieven <pl@kamp.de>,
 Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <3aa0768c-8378-99b3-2c2c-1188773a3a3b@redhat.com>
Subject: Re: [Qemu-devel] [PATCH] iscsi: drop unused IscsiAIOCB.qiov field
References: <20170327165005.22038-1-stefanha@redhat.com>
In-Reply-To: <20170327165005.22038-1-stefanha@redhat.com>

--skIKAPNFggXrC479c5sQN4u8bpOIMhuDh
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 03/27/2017 11:50 AM, Stefan Hajnoczi wrote:
> The IscsiAIOCB.qiov field has been unused since commit
> 063c3378a9e3c25cc0afac3c72e4823d0621e352 ("block/iscsi: introduce
> bdrv_co_{readv, writev, flush_to_disk}") back in 2013.
>=20
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  block/iscsi.c | 1 -
>  1 file changed, 1 deletion(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

>=20
> diff --git a/block/iscsi.c b/block/iscsi.c
> index 75d8905..716e74a 100644
> --- a/block/iscsi.c
> +++ b/block/iscsi.c
> @@ -103,7 +103,6 @@ typedef struct IscsiTask {
> =20
>  typedef struct IscsiAIOCB {
>      BlockAIOCB common;
> -    QEMUIOVector *qiov;
>      QEMUBH *bh;
>      IscsiLun *iscsilun;
>      struct scsi_task *task;
>=20

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--skIKAPNFggXrC479c5sQN4u8bpOIMhuDh--

--qV6vq7Fi9CMJIoMwXhdDfPx3RKKffmpvg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJY2UPSAAoJEKeha0olJ0NqR0UIAIqvvhKMxzh3ewbNbQS21EFe
4XiFXrT+YOOBN4V2FUY33aRUyjNJsSWrzCKAgDVHPxvgb+t6U95bnSSYPOYsSzZr
q2prKmFv/OK+l+CKXaHKukZFPEbtRGCMP9qocOUI4bijqsDXy0awvmy23UauU+zq
9Hf9h6qW2iYfcVco0HERTt0n6C/8/vk5w/ebucE4k+uDOSgDWrFkhRgnjDSPNZjC
hoWaqmFOTvaAjhKvkAvUcYDzIeYMPqgZaRLeLJUQD0WZc2tsr9/kNT6UvkIDl6bE
YtRIwj+hmsCrADyqX3esCa6lZQyyGMGJdm0lV5oT5K9sUACZyUs/yEHgMugmEZY=
=RWpf
-----END PGP SIGNATURE-----

--qV6vq7Fi9CMJIoMwXhdDfPx3RKKffmpvg--

