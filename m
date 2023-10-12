Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qrKBu-0005Eg-5Y
	for mharc-qemu-trivial@gnu.org; Fri, 13 Oct 2023 11:35:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1qrKBi-00058R-4D
 for qemu-trivial@nongnu.org; Fri, 13 Oct 2023 11:34:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1qrKBd-0003Vd-SA
 for qemu-trivial@nongnu.org; Fri, 13 Oct 2023 11:34:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697211288;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=32b8gor4TnQIvUDJYYK021jI0Ekhn6qtdJR/9nHFCQQ=;
 b=In2iNnG4LwERbyi7YrRunOxl9X3oc/YkBr+NvKCjGgalKdXYZ72op5lmFDiF7pkMhc0/Z4
 PIQawQL35NAmq04YaZRbUe2Oaq9mApUEJZshawusCeK2MvB/DWWd+lmzFkCamRzIilxehd
 SrlZmDWtlxnEUAy/sGP5NLSQrHoh5N0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-63-J8kuY86pNa2JAFe-wLGrhw-1; Fri, 13 Oct 2023 11:34:41 -0400
X-MC-Unique: J8kuY86pNa2JAFe-wLGrhw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4AA4D858294;
 Fri, 13 Oct 2023 15:34:41 +0000 (UTC)
Received: from localhost (unknown [10.39.192.122])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D291EC15BBC;
 Fri, 13 Oct 2023 15:34:39 +0000 (UTC)
Date: Thu, 12 Oct 2023 14:51:26 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: qemu-devel@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 qemu-trivial@nongnu.org
Subject: Re: [PULL v2 00/12] Trivial patches for 2023-10-11
Message-ID: <20231012185126.GA370860@fedora>
References: <20231011214059.20142-1-mjt@tls.msk.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="UuzJ5arCDAOH8EK5"
Content-Disposition: inline
In-Reply-To: <20231011214059.20142-1-mjt@tls.msk.ru>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_12_24=1.049,
 DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Fri, 13 Oct 2023 15:35:00 -0000


--UuzJ5arCDAOH8EK5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.2 for any user-visible changes.

--UuzJ5arCDAOH8EK5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmUoQC4ACgkQnKSrs4Gr
c8jlGgf/Q6yTc6ldtdUaOz4WaRkbBmE4jk3AswAUx6Ewq7pQi4p8w2cTa8G4nJBG
+V9tfangTaxAzNH+CUgOSseYQ8XaPnSOFZfwR7ug2hw0SmZJ+AseITkGl4LjzMbC
loBYKse6F2d9ibI6VqsO14QNssPCiSHcG4XmZ8+Oaam1WRd/jKYOep4MCu/YdQnl
nLZMI/57vV90mgj5CFpHhTZVsZjkL4m1AwG6qKAR6yCKdvzZz73A+2/GtBaDmI8C
2mvqtlq/UO9JsDXyCO34iXSxMmViO5tNEo4WdXCmNptGRYqTVHmClW23rkPTBntb
uDRQDk2AKntvb4BQJj7TluK3NAU5JQ==
=tfpD
-----END PGP SIGNATURE-----

--UuzJ5arCDAOH8EK5--


