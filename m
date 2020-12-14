Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1korDZ-0005XP-CP
	for mharc-qemu-trivial@gnu.org; Mon, 14 Dec 2020 12:01:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1korDS-0005VD-8J
 for qemu-trivial@nongnu.org; Mon, 14 Dec 2020 12:00:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45047)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1korDQ-0004EG-3T
 for qemu-trivial@nongnu.org; Mon, 14 Dec 2020 12:00:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607965250;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UcjPedgFAePbit+LAmaCdyO9dRJ4HW/XwUf+TQtTjTo=;
 b=OEe/nr+yW0KSCX6fofrNYymuLGetXSOH1sBhbs6s/Fvw+GKt+Wq0kQhI07ThPiiVkfCE2m
 AB+fSm5alhgTGK4nzFw8TIPwwG4o3fxjhJZ6wqrG+pq/OKkkEmn/sgFos2oTUX+0GrtR3A
 2L8P6AGrEpO6ZuIJt+i7b8nx5QW6jxE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-158-zWbrVVt0PCWa1TMqbhszCQ-1; Mon, 14 Dec 2020 12:00:48 -0500
X-MC-Unique: zWbrVVt0PCWa1TMqbhszCQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1ECDC1009B67;
 Mon, 14 Dec 2020 17:00:47 +0000 (UTC)
Received: from localhost (ovpn-113-200.ams2.redhat.com [10.36.113.200])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BA3755D9DC;
 Mon, 14 Dec 2020 17:00:46 +0000 (UTC)
Date: Mon, 14 Dec 2020 17:00:45 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Alex Chen <alex.chen@huawei.com>
Cc: dgilbert@redhat.com, qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
 zhang.zhanghailiang@huawei.com
Subject: Re: [PATCH] virtiofsd: Remove useless code about send_notify_iov
Message-ID: <20201214170045.GI620320@stefanha-x1.localdomain>
References: <20201214121615.29967-1-alex.chen@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20201214121615.29967-1-alex.chen@huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="OfrWf2Fun5Ae4m0Y"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Mon, 14 Dec 2020 17:00:56 -0000

--OfrWf2Fun5Ae4m0Y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 14, 2020 at 12:16:15PM +0000, Alex Chen wrote:
> The 'ch' will be NULL in the following stack:
> send_notify_iov()->fuse_send_msg()->virtio_send_msg(), and
> this may lead to NULL pointer dereferenced in virtio_send_msg().
> But send_notify_iov() was never called, so remove the useless code
> about send_notify_iov() to fix this problem.
>=20
> Signed-off-by: Alex Chen <alex.chen@huawei.com>
> ---
>  tools/virtiofsd/fuse_lowlevel.c | 98 ---------------------------------
>  1 file changed, 98 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--OfrWf2Fun5Ae4m0Y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl/Xmj0ACgkQnKSrs4Gr
c8gzbwf/bCUBkfZYOsB6f308r6UMHNN+JKwB5bST///FIRAExhgsjVDEKUDlSSvD
qN8d+2CbJYBqqE3f6M6RRghfKJnT3ZBWyLJH0qhYvAhsFai1AsvRJ1DtZGOeOJVP
YujxXbR9plJibl3gwTaVFcJwD5htuRitFssJvcWfWKPCbMAFw6JPjui6ZEDtbLPr
oZBu9V1eMwcA4muwRwDzKWjUYqntU9qoHnLzwwxjPECaiNmTQtvQOdUk5hLy09jR
nREhDZfQf/o4rwNj+dGc7OAMIPC87f2y9/Utt80bDgApHjmfLiuBKdZWljOhP5s/
8C1jM9l4GZWHjLj2JEsKLFXTL5R2Tw==
=t9Am
-----END PGP SIGNATURE-----

--OfrWf2Fun5Ae4m0Y--


