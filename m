Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kpvCl-0003Ny-5u
	for mharc-qemu-trivial@gnu.org; Thu, 17 Dec 2020 10:28:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kpvCj-0003KB-I5
 for qemu-trivial@nongnu.org; Thu, 17 Dec 2020 10:28:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:22589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kpvCh-0005yB-8R
 for qemu-trivial@nongnu.org; Thu, 17 Dec 2020 10:28:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608218910;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BTQyBU2bx65y2imo//estOit4JLjzGaDQszoxinPR8I=;
 b=FlbYF+5aNjhO/oeVvFXPAHTReXCbU6WtD+n33FS6L3SLkd+DWy4H9fEiRMp6tbXpID7WjN
 8oimgKifwYoPJUHyFCf35QZSyu9Eb1TN48diTwYA4ZTTGw9qaYdFy/FOHVJlmtCGMTAZnW
 wxJ//fATQQKiyV2cvKLLcFAMjgaQadY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-202-toqOdtalMRanVsH52mqNyQ-1; Thu, 17 Dec 2020 10:28:28 -0500
X-MC-Unique: toqOdtalMRanVsH52mqNyQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C1390835B61;
 Thu, 17 Dec 2020 15:28:19 +0000 (UTC)
Received: from localhost (ovpn-115-250.ams2.redhat.com [10.36.115.250])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 740276ACE1;
 Thu, 17 Dec 2020 15:28:17 +0000 (UTC)
Date: Thu, 17 Dec 2020 09:47:35 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Alex Chen <alex.chen@huawei.com>
Cc: mjt@tls.msk.ru, qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
 zhang.zhanghailiang@huawei.com
Subject: Re: [PATCH] readline: Fix possible array index out of bounds in
 readline_hist_add()
Message-ID: <20201217094735.GC4338@stefanha-x1.localdomain>
References: <20201203135043.117072-1-alex.chen@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20201203135043.117072-1-alex.chen@huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="vOmOzSkFvhd7u8Ms"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_03_06=1.592,
 DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Thu, 17 Dec 2020 15:28:33 -0000

--vOmOzSkFvhd7u8Ms
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 03, 2020 at 01:50:43PM +0000, Alex Chen wrote:
> When the 'cmdline' is the last entry in 'rs->history' array, there is
> no need to put this entry to the end of the array, partly because it is
> the last entry, and partly because the next operition will lead to array
> index out of bounds.
>=20
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Alex Chen <alex.chen@huawei.com>
> ---
>  util/readline.c | 3 +++
>  1 file changed, 3 insertions(+)

Thanks, applied to my block tree:
https://gitlab.com/stefanha/qemu/commits/block

Stefan

--vOmOzSkFvhd7u8Ms
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl/bKTcACgkQnKSrs4Gr
c8iVhAf+IJzjhu/Crk8dMJrX7s4rVEJN3GS2V45V2967kIbCwuN5TsFtyzdOrj7D
ZzjoGI5ndkHtfUQ6BGz5GWD00w+xGDNkSOs8ldl7eCjHmq6kv9YCVGeIMwHQhQFb
x+MJoM6pYrBg2Ko9sHq2wyBWLw/N2D5E6XIll4IU4vFb1ybhAFZch13vQYz8XFe+
eNZkIM0oZFOq2TUT67hcF3rGjgnujbYeX3rlPhQPfAwJF09HoeLRHPSHBeF11OEW
Jm3Gk1xKy5Nfxw17qeK9SSn81HSiH6je27ujQtQ8ofNUof15Pt7TfRi0aDK3P/hS
mMl2InXz+BxVSu/IR0loRnICgovIlg==
=FfCr
-----END PGP SIGNATURE-----

--vOmOzSkFvhd7u8Ms--


