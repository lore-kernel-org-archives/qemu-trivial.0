Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hQUEP-0006EC-TN
	for mharc-qemu-trivial@gnu.org; Tue, 14 May 2019 06:00:21 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48941)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <yury-kotov@yandex-team.ru>) id 1hQUEJ-00069p-Fr
	for qemu-trivial@nongnu.org; Tue, 14 May 2019 06:00:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <yury-kotov@yandex-team.ru>) id 1hQUEI-0002Y0-FT
	for qemu-trivial@nongnu.org; Tue, 14 May 2019 06:00:15 -0400
Received: from forwardcorp1j.mail.yandex.net ([2a02:6b8:0:1619::183]:48432)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <yury-kotov@yandex-team.ru>) id 1hQUEI-0002Mf-4U
	for qemu-trivial@nongnu.org; Tue, 14 May 2019 06:00:14 -0400
Received: from mxbackcorp1j.mail.yandex.net (mxbackcorp1j.mail.yandex.net
	[IPv6:2a02:6b8:0:1619::162])
	by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id 4F63A2E0458;
	Tue, 14 May 2019 13:00:10 +0300 (MSK)
Received: from localhost (localhost [::1])
	by mxbackcorp1j.mail.yandex.net (nwsmtp/Yandex) with ESMTP id
	oecYFBmQlz-0AwWdBCp; Tue, 14 May 2019 13:00:10 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
	s=default; 
	t=1557828010; bh=ftmYvnoPgCHtFkmgvj4Ra7kevsKOCfgdQ11lTaPApFA=;
	h=Subject:In-Reply-To:Date:References:To:From:Message-Id;
	b=Vf3mTAdppyHyZgg2Qz68LWRV2+kcxfNH6vtxkj/jzq4xu8HXVbfFPVDBeaTSrtJz5
	nR2p/pqNnysB1KnGbCGQAlnctz/8fiAGnb1PlLi03pWED9z/60AlpVClbl26lP/2FW
	wjqlQHLCIcOyKBBzYb+NNAmBPrJZ2mni6hMt+QBo=
Authentication-Results: mxbackcorp1j.mail.yandex.net;
	dkim=pass header.i=@yandex-team.ru
X-Yandex-Sender-Uid: 1120000000071945
X-Yandex-Avir: 1
Received: from mxbackcorp2j.mail.yandex.net ([::1])
	by mxbackcorp2j.mail.yandex.net with LMTP id yIDGnSTE
	for <yury-kotov@yandex-team.ru>; Tue, 14 May 2019 13:00:05 +0300
Received: by iva6-8a76e93b6298.qloud-c.yandex.net with HTTP;
	Tue, 14 May 2019 13:00:04 +0300
From: Yury Kotov <yury-kotov@yandex-team.ru>
To: Markus Armbruster <armbru@redhat.com>,
	"qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>
In-Reply-To: <20190411174715.31855-1-yury-kotov@yandex-team.ru>
References: <20190411174715.31855-1-yury-kotov@yandex-team.ru>
MIME-Version: 1.0
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Tue, 14 May 2019 13:00:09 +0300
Message-Id: <471871557828004@iva6-8a76e93b6298.qloud-c.yandex.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a02:6b8:0:1619::183
Subject: Re: [Qemu-trivial] [PATCH] monitor: Fix return type of
 monitor_fdset_dup_fd_find
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
X-List-Received-Date: Tue, 14 May 2019 10:00:20 -0000

+ armbru@

Ping
This just fixes the return types because mon_fdset->id is int64_t
Without it, there is a bug when removing fd for fdset id >=3D 2^32

11.04.2019, 20:49, "Yury Kotov" <yury-kotov@yandex-team.ru>:
> Signed-off-by: Yury Kotov <yury-kotov@yandex-team.ru>
> ---
> =C2=A0include/monitor/monitor.h | 2 +-
> =C2=A0monitor.c | 4 ++--
> =C2=A0stubs/fdset.c | 2 +-
> =C2=A03 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/include/monitor/monitor.h b/include/monitor/monitor.h
> index c1b40a9cac..2872621afd 100644
> --- a/include/monitor/monitor.h
> +++ b/include/monitor/monitor.h
> @@ -46,7 +46,7 @@ AddfdInfo *monitor_fdset_add_fd(int fd, bool has_fdse=
t_id, int64_t fdset_id,
> =C2=A0int monitor_fdset_get_fd(int64_t fdset_id, int flags);
> =C2=A0int monitor_fdset_dup_fd_add(int64_t fdset_id, int dup_fd);
> =C2=A0void monitor_fdset_dup_fd_remove(int dup_fd);
> -int monitor_fdset_dup_fd_find(int dup_fd);
> +int64_t monitor_fdset_dup_fd_find(int dup_fd);
>
> =C2=A0void monitor_vfprintf(FILE *stream,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0const c=
har *fmt, va_list ap) GCC_FMT_ATTR(2, 0);
> diff --git a/monitor.c b/monitor.c
> index 4807bbe811..50e6e820d6 100644
> --- a/monitor.c
> +++ b/monitor.c
> @@ -2585,7 +2585,7 @@ err:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return -1;
> =C2=A0}
>
> -static int monitor_fdset_dup_fd_find_remove(int dup_fd, bool remove)
> +static int64_t monitor_fdset_dup_fd_find_remove(int dup_fd, bool remov=
e)
> =C2=A0{
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0MonFdset *mon_fdset;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0MonFdsetFd *mon_fdset_fd_dup;
> @@ -2613,7 +2613,7 @@ err:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return -1;
> =C2=A0}
>
> -int monitor_fdset_dup_fd_find(int dup_fd)
> +int64_t monitor_fdset_dup_fd_find(int dup_fd)
> =C2=A0{
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return monitor_fdset_dup_fd_find_remove(d=
up_fd, false);
> =C2=A0}
> diff --git a/stubs/fdset.c b/stubs/fdset.c
> index 4f3edf2ea4..a1b8f41f62 100644
> --- a/stubs/fdset.c
> +++ b/stubs/fdset.c
> @@ -7,7 +7,7 @@ int monitor_fdset_dup_fd_add(int64_t fdset_id, int dup_=
fd)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return -1;
> =C2=A0}
>
> -int monitor_fdset_dup_fd_find(int dup_fd)
> +int64_t monitor_fdset_dup_fd_find(int dup_fd)
> =C2=A0{
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return -1;
> =C2=A0}
> --
> 2.21.0

Regards,
Yury

