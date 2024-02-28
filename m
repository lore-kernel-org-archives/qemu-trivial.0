Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rfOtO-0003v2-Q5
	for mharc-qemu-trivial@gnu.org; Wed, 28 Feb 2024 13:42:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1rfOtN-0003tE-Bs
 for qemu-trivial@nongnu.org; Wed, 28 Feb 2024 13:42:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1rfOtM-0003ex-05
 for qemu-trivial@nongnu.org; Wed, 28 Feb 2024 13:42:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709145775;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ET1NgOdeWneMQ1PHl0KDPLtXl24Onf2QtZInGOrabPs=;
 b=Bx1pjUJlkn/6jZKCxi2F3y4Z9TkmFf2IyGp/ze2qdHNI3Yw0vpkO/Gf0ulW9ZigjJOOpOB
 Dj0gPgduH30N/a7wmlvzTa5wy5utjXacUhbZGF+t2l2TZtdOHsr7BQpai1wQDugmsmmQp2
 8KX8FtIi6HT1Vws82QvXAykp02dk4ss=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-46-PbvAgWdJMO-MtJy9oiqYLA-1; Wed,
 28 Feb 2024 13:42:51 -0500
X-MC-Unique: PbvAgWdJMO-MtJy9oiqYLA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 269583C23FC8;
 Wed, 28 Feb 2024 18:42:51 +0000 (UTC)
Received: from localhost (unknown [10.39.192.165])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 544F7C185C0;
 Wed, 28 Feb 2024 18:42:50 +0000 (UTC)
Date: Wed, 28 Feb 2024 13:42:49 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Zhao Liu <zhao1.liu@linux.intel.com>
Cc: Markus Armbruster <armbru@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Michael Tokarev <mjt@tls.msk.ru>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
 Zhao Liu <zhao1.liu@intel.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH 13/16] block/virtio-blk: Fix missing ERRP_GUARD() for
 error_prepend()
Message-ID: <20240228184249.GD641417@fedora>
References: <20240228163723.1775791-1-zhao1.liu@linux.intel.com>
 <20240228163723.1775791-14-zhao1.liu@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Fv5HQytso+iiyk1p"
Content-Disposition: inline
In-Reply-To: <20240228163723.1775791-14-zhao1.liu@linux.intel.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.102,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 28 Feb 2024 18:42:57 -0000


--Fv5HQytso+iiyk1p
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 29, 2024 at 12:37:20AM +0800, Zhao Liu wrote:
> From: Zhao Liu <zhao1.liu@intel.com>
>=20
> As the comment in qapi/error, passing @errp to error_prepend() requires
> ERRP_GUARD():
>=20
> * =3D Why, when and how to use ERRP_GUARD() =3D
> *
> * Without ERRP_GUARD(), use of the @errp parameter is restricted:
> ...
> * - It should not be passed to error_prepend(), error_vprepend() or
> *   error_append_hint(), because that doesn't work with &error_fatal.
> * ERRP_GUARD() lifts these restrictions.
> *
> * To use ERRP_GUARD(), add it right at the beginning of the function.
> * @errp can then be used without worrying about the argument being
> * NULL or &error_fatal.
>=20
> ERRP_GUARD() could avoid the case when @errp is the pointer of
> error_fatal, the user can't see this additional information, because
> exit() happens in error_setg earlier than information is added [1].
>=20
> The virtio_blk_vq_aio_context_init() passes @errp to error_prepend().
>=20
> Though its @errp points its caller's local @err variable, to follow the
> requirement of @errp, add missing ERRP_GUARD() at the beginning of
> virtio_blk_vq_aio_context_init().
>=20
> [1]: Issue description in the commit message of commit ae7c80a7bd73
>      ("error: New macro ERRP_GUARD()").
>=20
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Stefan Hajnoczi <stefanha@redhat.com>
> Cc: Kevin Wolf <kwolf@redhat.com>
> Cc: Hanna Reitz <hreitz@redhat.com>
> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> ---
>  hw/block/virtio-blk.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--Fv5HQytso+iiyk1p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmXffqkACgkQnKSrs4Gr
c8gfEggAlUYjhE50HdIX3OGx77Ec191xZuNw9mzbb+qzrqEQ9VmO3t/GJgTNMN4N
ifRdnd4X5rrptndDIMcb1qxO643jKkH74LOkH/WyK0MgcSd6LjbhFiI/O2wMfQ+0
JGuIDXf8F+xJ7JqDMKKucLlHkerm1L0Oqkp39tsLZjdYT+8E2EsHImInAiswjmaR
2XC5kdhFZ0RednaNXoOJk9ubQiDIf/YAUrAYa1bdlZTqEEVw7c8+zW9CUErs8x3o
DLv6fsgjGKX6c+xET0FISggIiRc4oyjUeZ6Brl5bnm4yDq+DxWU7SjmV1sg9LARm
+0PkUAS2Sj5GhPrMr/1T/eWM7U+zug==
=Jqmz
-----END PGP SIGNATURE-----

--Fv5HQytso+iiyk1p--


