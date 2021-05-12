Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lgrCA-0001O7-4F
	for mharc-qemu-trivial@gnu.org; Wed, 12 May 2021 11:54:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lgrC6-0001L0-TA
 for qemu-trivial@nongnu.org; Wed, 12 May 2021 11:54:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21789)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lgrC2-0005YC-CF
 for qemu-trivial@nongnu.org; Wed, 12 May 2021 11:54:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620834877;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1tRQr4eGMFBC8FpU5wWR6ca7KPUlkomsukZgJWDbW8I=;
 b=Huog//r18hEEpl4mGqVtHOjVdBILmv4TKtQsjn9cVdFm67gh2uhprf6ul6X0gzamGlu4Xy
 3rM4weWsRQdmSjzOM+4XOpzCKT28OAFVUHEh0DFAECevFs+YwdZT03Bfq6SserCbIUUW9n
 6jT2lSZIDfziUpJIQ5mODcTvHObtaAg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-548-ywgs9rAPN9OJOjThgQwoZQ-1; Wed, 12 May 2021 11:54:35 -0400
X-MC-Unique: ywgs9rAPN9OJOjThgQwoZQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 28702800D62;
 Wed, 12 May 2021 15:54:34 +0000 (UTC)
Received: from localhost (ovpn-115-51.ams2.redhat.com [10.36.115.51])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 56B395C232;
 Wed, 12 May 2021 15:54:30 +0000 (UTC)
Date: Wed, 12 May 2021 16:54:29 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Jason Wang <jasowang@redhat.com>,
 qemu-trivial@nongnu.org
Subject: Re: [PATCH 0/3] hw/virtio: Constify VirtIOFeature
Message-ID: <YJv6NV2T62naWuAo@stefanha-x1.localdomain>
References: <20210511104157.2880306-1-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210511104157.2880306-1-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="7MgSMe2+oIs6E1F1"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 12 May 2021 15:54:43 -0000

--7MgSMe2+oIs6E1F1
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 11, 2021 at 12:41:54PM +0200, Philippe Mathieu-Daud=E9 wrote:
> Trivial patches to keep VirtIOFeature arrays read-only
> (better safe than sorry).
>=20
> Philippe Mathieu-Daud=E9 (3):
>   hw/virtio: Pass virtio_feature_get_config_size() a const argument
>   virtio-blk: Constify VirtIOFeature feature_sizes[]
>   virtio-net: Constify VirtIOFeature feature_sizes[]
>=20
>  include/hw/virtio/virtio.h | 2 +-
>  hw/block/virtio-blk.c      | 2 +-
>  hw/net/virtio-net.c        | 2 +-
>  hw/virtio/virtio.c         | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
>=20
> --=20
> 2.26.3
>=20
>=20

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--7MgSMe2+oIs6E1F1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEyBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmCb+jUACgkQnKSrs4Gr
c8gYdAf4iZc1kiurdTm42HmCH5liuEh83XHCJ4WdBo4lPAxs2zKtf0ek3zGlq0+X
gnO9y1AUWROSJ9oWnN4k7NO0qugRJ+/cdiScxxMYrMHb8NKByT38yzdvJ75qSBng
OB8R2G3lZoG8MlMY/NElUeterZGqhoZpeCgNdSFNUn5cx+ljPjUuUvhRhOBGI4S2
wZtxnO63N2B80IzXMTlPo41F/xmUN6UO2EQcjkg7sU7x0sWwpPkKRj6IENTWbeZs
34/tpK5XfchAf+Z5BA5NuqZi5hmzLMRYdLcz8kpFUvJZdlNmJNFpc9undPlr+4vf
NcX5nIrpZXla1Mm/ClCImC2w+bPQ
=0oU7
-----END PGP SIGNATURE-----

--7MgSMe2+oIs6E1F1--


