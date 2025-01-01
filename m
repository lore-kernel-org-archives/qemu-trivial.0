Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tT8MA-0006cX-89
	for mharc-qemu-trivial@gnu.org; Wed, 01 Jan 2025 18:42:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1tT8M7-0006c2-Nd
 for qemu-trivial@nongnu.org; Wed, 01 Jan 2025 18:42:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1tT8M6-0001OA-4w
 for qemu-trivial@nongnu.org; Wed, 01 Jan 2025 18:42:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1735774945;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=n8Dv21GZlypQzWDS1AJDDNMYbYHT7Edmli0UgMVSb4A=;
 b=BHTI/hTaHKGYuIMw+OcRrB2UPYVHP/9+kKQXpF3lLgdXGFrDZ8KxocAbxh01f4qLZIIgsg
 iJCjYZMZdzqCmZ49QYnGbJMQ15uNBXvUtoLCrySddgAB1sCFHYM75rU75aV1PIC3oSDjAx
 lrv8Bn5g+i2eq1Q21i0vBvwlu2net4g=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-679-QnBNiyB0PYOWm-aj8RENeA-1; Wed,
 01 Jan 2025 18:42:21 -0500
X-MC-Unique: QnBNiyB0PYOWm-aj8RENeA-1
X-Mimecast-MFC-AGG-ID: QnBNiyB0PYOWm-aj8RENeA
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id D8C73195608C; Wed,  1 Jan 2025 23:42:13 +0000 (UTC)
Received: from localhost (unknown [10.2.16.27])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 466CB1956086; Wed,  1 Jan 2025 23:42:11 +0000 (UTC)
Date: Wed, 1 Jan 2025 18:41:50 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: qemu-devel@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 qemu-trivial@nongnu.org
Subject: Re: [PULL 0/1] Trivial patches for 2024-12-31
Message-ID: <20250101234150.GA1197536@fedora>
References: <20241231152324.3307386-1-mjt@tls.msk.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="qN7YFZd3V6PsFZmd"
Content-Disposition: inline
In-Reply-To: <20241231152324.3307386-1-mjt@tls.msk.ru>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.186,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 01 Jan 2025 23:42:28 -0000


--qN7YFZd3V6PsFZmd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/10.0 for any user-visible changes.

--qN7YFZd3V6PsFZmd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmd10r4ACgkQnKSrs4Gr
c8jeeQf/cuWXWqHBZ08H+7ogY37BkL95Y9C43uPbdsm7XcP7aBCwR4BtI0lN5q4l
u2R3jCjllFeRQsm50h5NXtgMHp+w4+DeOCwoyY8VET/BbAx+II1n/l2CPm6helXV
YDnvyc8uJ1i3ejdleWWkABfgyNggwgNtz2tWyEmSKaJc4lbYdqLq6primxvgscsH
2uSdWaZALku9D0uHF7gI7dj0x00oa/HiPSqYNjTbZOhPYU2clZAYnoUfYNJi5IMK
FdbaBMH134o+ZSnOhBH9dYlTcYFgwqdIjSHYPUlZxST2+VD12lBu+ell77tsnkZ5
fnSt6dqn1MUMUZak3nFH8Fovsn4rJw==
=NTNJ
-----END PGP SIGNATURE-----

--qN7YFZd3V6PsFZmd--


