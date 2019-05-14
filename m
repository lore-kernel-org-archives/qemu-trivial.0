Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hQU7v-0000lo-9v
	for mharc-qemu-trivial@gnu.org; Tue, 14 May 2019 05:53:39 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46102)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <yury-kotov@yandex-team.ru>) id 1hQU7t-0000g8-8O
	for qemu-trivial@nongnu.org; Tue, 14 May 2019 05:53:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <yury-kotov@yandex-team.ru>) id 1hQU7j-0002rP-4L
	for qemu-trivial@nongnu.org; Tue, 14 May 2019 05:53:28 -0400
Received: from forwardcorp1j.mail.yandex.net ([5.45.199.163]:42008)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <yury-kotov@yandex-team.ru>) id 1hQU7i-0002jd-EO
	for qemu-trivial@nongnu.org; Tue, 14 May 2019 05:53:27 -0400
Received: from mxbackcorp2j.mail.yandex.net (mxbackcorp2j.mail.yandex.net
	[IPv6:2a02:6b8:0:1619::119])
	by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id 46D662E14BA;
	Tue, 14 May 2019 12:53:21 +0300 (MSK)
Received: from localhost (localhost [::1])
	by mxbackcorp2j.mail.yandex.net (nwsmtp/Yandex) with ESMTP id
	LVXlDPH0iY-rL04Amb1; Tue, 14 May 2019 12:53:21 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
	s=default; 
	t=1557827601; bh=zGZrqdFaoBBs8nCq6Vqzm1Nbd9hEPjtjDhsWp1QJ/gQ=;
	h=Subject:In-Reply-To:Date:References:To:From:Message-Id;
	b=KghPQlFgHKeHiT++7ZuSZyuqCAIdubCFs2nSeslO/cr7N9ktNyfYnOjuDXp9PEj4x
	GmewCjzLyo7FGhQdT4oYYytABOgId+A7CNaVJjYktXer91dOFXcDGpn735D/xxh0GT
	imp3m3ihOmfYB+8ooPTNxk+0+vLiRpAJ+GgFtzVQ=
Authentication-Results: mxbackcorp2j.mail.yandex.net;
	dkim=pass header.i=@yandex-team.ru
X-Yandex-Sender-Uid: 1120000000071945
X-Yandex-Avir: 1
Received: from mxbackcorp1g.mail.yandex.net ([::1])
	by mxbackcorp1g.mail.yandex.net with LMTP id Ejk8iEfx
	for <yury-kotov@yandex-team.ru>; Tue, 14 May 2019 12:53:16 +0300
Received: by vla1-9d3c37294942.qloud-c.yandex.net with HTTP;
	Tue, 14 May 2019 12:53:16 +0300
From: Yury Kotov <yury-kotov@yandex-team.ru>
To: Paolo Bonzini <pbonzini@redhat.com>,
	"qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>
In-Reply-To: <20190411174345.31579-1-yury-kotov@yandex-team.ru>
References: <20190411174345.31579-1-yury-kotov@yandex-team.ru>
MIME-Version: 1.0
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Tue, 14 May 2019 12:53:21 +0300
Message-Id: <352511557827596@vla1-9d3c37294942.qloud-c.yandex.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 5.45.199.163
Subject: Re: [Qemu-trivial] [PATCH] kvm-all: Add/update fprintf's for
 kvm_*_ioeventfd_del
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
X-List-Received-Date: Tue, 14 May 2019 09:53:38 -0000

+ pbonzini@

Ping
This is a simple patch that adds some printfs, was useful in analyzing a =
bug.
In our case abort() hit without any friendly errors in stdout/stderr.

11.04.2019, 20:49, "Yury Kotov" <yury-kotov@yandex-team.ru>:
> Signed-off-by: Yury Kotov <yury-kotov@yandex-team.ru>
> ---
> =C2=A0accel/kvm/kvm-all.c | 12 ++++++++----
> =C2=A01 file changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
> index 241db496c3..41586daf4c 100644
> --- a/accel/kvm/kvm-all.c
> +++ b/accel/kvm/kvm-all.c
> @@ -864,8 +864,8 @@ static void kvm_mem_ioeventfd_add(MemoryListener *l=
istener,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0data, true, int128_get64(sec=
tion->size),
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0match_data);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (r < 0) {
> - fprintf(stderr, "%s: error adding ioeventfd: %s\n",
> - __func__, strerror(-r));
> + fprintf(stderr, "%s: error adding ioeventfd: %s (%d)\n",
> + __func__, strerror(-r), -r);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0abort();
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> =C2=A0}
> @@ -882,6 +882,8 @@ static void kvm_mem_ioeventfd_del(MemoryListener *l=
istener,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0data, false, int128_get64(se=
ction->size),
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0match_data);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (r < 0) {
> + fprintf(stderr, "%s: error deleting ioeventfd: %s (%d)\n",
> + __func__, strerror(-r), -r);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0abort();
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> =C2=A0}
> @@ -898,8 +900,8 @@ static void kvm_io_ioeventfd_add(MemoryListener *li=
stener,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0data, true, int128_get64(section->=
size),
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0match_data);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (r < 0) {
> - fprintf(stderr, "%s: error adding ioeventfd: %s\n",
> - __func__, strerror(-r));
> + fprintf(stderr, "%s: error adding ioeventfd: %s (%d)\n",
> + __func__, strerror(-r), -r);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0abort();
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> =C2=A0}
> @@ -917,6 +919,8 @@ static void kvm_io_ioeventfd_del(MemoryListener *li=
stener,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0data, false, int128_get64(section-=
>size),
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0match_data);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (r < 0) {
> + fprintf(stderr, "%s: error deleting ioeventfd: %s (%d)\n",
> + __func__, strerror(-r), -r);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0abort();
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> =C2=A0}
> --
> 2.21.0

Regards,
Yury

