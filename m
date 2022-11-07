Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1os8LI-0004Zb-5d
	for mharc-qemu-trivial@gnu.org; Mon, 07 Nov 2022 15:03:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1os8LH-0004W8-3G
 for qemu-trivial@nongnu.org; Mon, 07 Nov 2022 15:03:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1os8LF-0004dN-9n
 for qemu-trivial@nongnu.org; Mon, 07 Nov 2022 15:03:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667851412;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=r8QFEJ32ctNPVM/9A5wTwait9ztGQbLWLh8IxzYx9tE=;
 b=ID+4yFZzp3QwNaCcLTa6t922LJToeFp/OFVJ9+XXqAb+T+o3LLeF9XG+0r586oZlmg490Z
 K2DpVb0Sw2+4HGAB6PidNZHygIih+4/Sm4O1sFze3Xb1AtNIU5mxtRYh2E+orUo1ravDjk
 VTO384UvPQ8W0vZCZ080xp8fV7+1NOE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-459-PU9-6LoYPH-KzlZuYf9NJw-1; Mon, 07 Nov 2022 15:03:30 -0500
X-MC-Unique: PU9-6LoYPH-KzlZuYf9NJw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 18268185A7A9;
 Mon,  7 Nov 2022 20:03:30 +0000 (UTC)
Received: from localhost (unknown [10.39.194.151])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 90EE4492B13;
 Mon,  7 Nov 2022 20:03:28 +0000 (UTC)
Date: Mon, 7 Nov 2022 15:03:27 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Laurent Vivier <laurent@vivier.eu>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PULL 0/7] Trivial branch for 7.2 patches
Message-ID: <Y2lkj8O61xJ0xdKA@fedora>
References: <20221105195227.354769-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="tzMDNuCE65u5dRa5"
Content-Disposition: inline
In-Reply-To: <20221105195227.354769-1-laurent@vivier.eu>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 07 Nov 2022 20:03:35 -0000


--tzMDNuCE65u5dRa5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.2 for any user-visible changes.

--tzMDNuCE65u5dRa5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmNpZI8ACgkQnKSrs4Gr
c8iQzwf+JZjwt3On4jqJ08y/MlUnFYkGqLA7UMAyXKHttKthxUtlFjQ3J8KjVMqE
avUN15ZM9FcDFlpYY7FHkBZZIpGIb1GzzPi5H+GonmUXiuctxKaEUvA4ZVU/uZzo
Q8UVB/E4I3HTYNIsDVH3wjJ9AdDu+juxRSTV14aDjWHrvh48ExkYchJIKNuwAgvJ
A9ewetKbnA9xf1F5R/Y7twsfkapsRQZ5HN81H2brVya8tW6uDeOoxWHfG9LG82pk
gsyjqVcqywZwbUgk98NzaaZcbGofCralBv7TFsPzWqIzqf8VZGA4TCOVsuqCNgIw
lHY/drKRGqJpiAiP2XR36faJUdZlLw==
=9tnz
-----END PGP SIGNATURE-----

--tzMDNuCE65u5dRa5--


