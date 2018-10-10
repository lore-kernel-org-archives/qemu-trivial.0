Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gAF9b-0006IE-4m
	for mharc-qemu-trivial@gnu.org; Wed, 10 Oct 2018 10:07:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46735)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1gAF9Y-0006GH-MW
	for qemu-trivial@nongnu.org; Wed, 10 Oct 2018 10:07:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1gAF9W-0002Cz-Pn
	for qemu-trivial@nongnu.org; Wed, 10 Oct 2018 10:07:56 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41546)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <stefanha@redhat.com>)
	id 1gAF9P-00029B-0S; Wed, 10 Oct 2018 10:07:47 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DE8B43097074;
	Wed, 10 Oct 2018 14:07:42 +0000 (UTC)
Received: from localhost (ovpn-117-100.ams2.redhat.com [10.36.117.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9E72181867;
	Wed, 10 Oct 2018 14:07:39 +0000 (UTC)
Date: Wed, 10 Oct 2018 15:07:38 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Li Qiang <liq3ea@gmail.com>
Cc: famz@redhat.com, qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Message-ID: <20181010140738.GC13076@stefanha-x1.localdomain>
References: <1538964972-3223-1-git-send-email-liq3ea@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ctP54qlpMx3WjD+/"
Content-Disposition: inline
In-Reply-To: <1538964972-3223-1-git-send-email-liq3ea@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Wed, 10 Oct 2018 14:07:42 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] util: aio-posix: fix a typo
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
X-List-Received-Date: Wed, 10 Oct 2018 14:07:57 -0000


--ctP54qlpMx3WjD+/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Oct 07, 2018 at 07:16:12PM -0700, Li Qiang wrote:
> Cc: qemu-trivial@nongnu.org
> Signed-off-by: Li Qiang <liq3ea@gmail.com>
> ---
>  util/aio-posix.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Thanks, applied to my block tree:
https://github.com/stefanha/qemu/commits/block

Stefan

--ctP54qlpMx3WjD+/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJbvgeqAAoJEJykq7OBq3PIJUcIAMlhO1E0I3+IfafC+WI11Ynu
ZmsCTxfEfPxtDNZ62E60XRzOuo3XiOASwQdcYCxBGNYL0z/KHyc6I33n8Z4W4qLm
Mbw63+NvWbIisIyzQMfqTtjyVB5BITdyQnnfYHp7n6CYUIzX647oRCTH+/zIJfOt
6ILKzXusSIyIaVe9gn5QFgzIRVlFOf1f0AkOG5crND3KpAjAlErmjbvFHLM4BM1Y
qINuFGdm/E7YsQBmH1e6XXMlG1EmDxpqo+yb6hSCG+3TGeF01smtdC0ywMnbC+oO
3lQAi4ji8y0r71gx5sSYICs2rPu9IRB7f5mcmOAF/CKAV0Ina2jWS0w1xgG+lPs=
=w8zO
-----END PGP SIGNATURE-----

--ctP54qlpMx3WjD+/--

