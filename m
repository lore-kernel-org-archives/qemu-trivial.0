Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cakFP-00030t-Tv
	for mharc-qemu-trivial@gnu.org; Mon, 06 Feb 2017 09:26:27 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43767)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1cakFN-0002ym-LK
	for qemu-trivial@nongnu.org; Mon, 06 Feb 2017 09:26:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1cakFM-0005lj-R5
	for qemu-trivial@nongnu.org; Mon, 06 Feb 2017 09:26:25 -0500
Received: from mx1.redhat.com ([209.132.183.28]:40142)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>)
	id 1cakF6-0005iQ-1O; Mon, 06 Feb 2017 09:26:08 -0500
Received: from smtp.corp.redhat.com (int-mx16.intmail.prod.int.phx2.redhat.com
	[10.5.11.28])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 33A433B714;
	Mon,  6 Feb 2017 14:26:08 +0000 (UTC)
Received: from nilsson.home.kraxel.org (ovpn-116-97.ams2.redhat.com
	[10.36.116.97])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1E5B174A13;
	Mon,  6 Feb 2017 14:26:06 +0000 (UTC)
Received: by nilsson.home.kraxel.org (Postfix, from userid 500)
	id 0E28D8088D; Mon,  6 Feb 2017 15:26:04 +0100 (CET)
Message-ID: <1486391163.32329.24.camel@redhat.com>
From: Gerd Hoffmann <kraxel@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, "Daniel P. Berrange"
	<berrange@redhat.com>, qemu-stable@nongnu.org
Date: Mon, 06 Feb 2017 15:26:03 +0100
In-Reply-To: <1486115549-9398-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1486115549-9398-1-git-send-email-mjt@msgid.tls.msk.ru>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0
X-Scanned-By: MIMEDefang 2.74 on 10.5.11.28
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Mon, 06 Feb 2017 14:26:08 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH v2] vnc: do not disconnect on EAGAIN
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
X-List-Received-Date: Mon, 06 Feb 2017 14:26:26 -0000

On Fr, 2017-02-03 at 12:52 +0300, Michael Tokarev wrote:
> When qemu vnc server is trying to send large update to clients,
> there might be a situation when system responds with something
> like EAGAIN, indicating that there's no system memory to send
> that much data (depending on the network speed, client and server
> and what is happening).  In this case, something like this happens
> on qemu side (from strace):
>=20
> sendmsg(16, {msg_name(0)=3DNULL,
>         msg_iov(1)=3D[{"\244\"..., 729186}],
>         msg_controllen=3D0, msg_flags=3D0}, 0) =3D 103950
> sendmsg(16, {msg_name(0)=3DNULL,
>         msg_iov(1)=3D[{"lz\346"..., 1559618}],
>         msg_controllen=3D0, msg_flags=3D0}, 0) =3D -1 EAGAIN
> sendmsg(-1, {msg_name(0)=3DNULL,
>         msg_iov(1)=3D[{"lz\346"..., 1559618}],
>         msg_controllen=3D0, msg_flags=3D0}, 0) =3D -1 EBADF
>=20
> qemu closes the socket before the retry, and obviously it gets EBADF
> when trying to send to -1.
>=20
> This is because there WAS a special handling for EAGAIN, but now it doesn=
't
> work anymore, after commit 04d2529da27db512dcbd5e99d0e26d333f16efcc, beca=
use
> now in all error-like cases we initiate vnc disconnect.
>=20
> This change were introduced in qemu 2.6, and caused numerous grief for ma=
ny
> people, resulting in their vnc clients reporting sporadic random disconne=
cts
> from vnc server.
>=20
> Fix that by doing the disconnect only when necessary, i.e. omitting this
> very case of EAGAIN.
>=20
> Hopefully the existing condition (comparing with QIO_CHANNEL_ERR_BLOCK)
> is sufficient, as the original code (before the above commit) were
> checking for other errno values too.
>=20
> Apparently there's another (semi?)bug exist somewhere here, since the
> code tries to write to fd# -1, it probably should check if the connection
> is open before. But this isn't important.
>=20
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> Fixes: 04d2529da27db512dcbd5e99d0e26d333f16efcc
> Cc: Daniel P. Berrange <berrange@redhat.com>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: qemu-stable@nongnu.org

Added to ui patch queue.

thanks,
  Gerd


