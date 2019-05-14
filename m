Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hQYu7-00064G-7n
	for mharc-qemu-trivial@gnu.org; Tue, 14 May 2019 10:59:43 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46855)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <yury-kotov@yandex-team.ru>) id 1hQYu5-00062h-7u
	for qemu-trivial@nongnu.org; Tue, 14 May 2019 10:59:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <yury-kotov@yandex-team.ru>) id 1hQYu4-0001wV-3w
	for qemu-trivial@nongnu.org; Tue, 14 May 2019 10:59:41 -0400
Received: from forwardcorp1o.mail.yandex.net ([2a02:6b8:0:1a2d::193]:36092)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <yury-kotov@yandex-team.ru>)
	id 1hQYu1-0001nt-3k; Tue, 14 May 2019 10:59:37 -0400
Received: from mxbackcorp2j.mail.yandex.net (mxbackcorp2j.mail.yandex.net
	[IPv6:2a02:6b8:0:1619::119])
	by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id 7DDC12E1469;
	Tue, 14 May 2019 17:59:32 +0300 (MSK)
Received: from localhost (localhost [::1])
	by mxbackcorp2j.mail.yandex.net (nwsmtp/Yandex) with ESMTP id
	KX4QtR2HlU-xW0ipC42; Tue, 14 May 2019 17:59:32 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
	s=default; 
	t=1557845972; bh=400Lu5OAjR3M4EDM47sl+Ixu4/1gcuZGH7rWaOEQav0=;
	h=Cc:Subject:Date:References:To:From:Message-Id;
	b=1CaNxuZCcvUtP2X0h7rKc1W/w+XZZ4FUSmlC01kzv+Q6rCnVeJHqPPPKy/gIbM93S
	6H+SiGXhKvwXkxlXMv4A1wvzvZgh+NoLcDxUGyTuH69TGs0oj7XOXg0cpLPtS2FFAB
	auxep2hrgt6w39spaWRAZbSML/Dlj7/8q9w4FnHE=
Authentication-Results: mxbackcorp2j.mail.yandex.net;
	dkim=pass header.i=@yandex-team.ru
X-Yandex-Sender-Uid: 1120000000071945
X-Yandex-Avir: 1
Received: from mxbackcorp1o.mail.yandex.net ([::1])
	by mxbackcorp1o.mail.yandex.net with LMTP id hNSLqEfO
	for <yury-kotov@yandex-team.ru>; Tue, 14 May 2019 17:59:27 +0300
Received: by iva6-8a76e93b6298.qloud-c.yandex.net with HTTP;
	Tue, 14 May 2019 17:59:27 +0300
From: Yury Kotov <yury-kotov@yandex-team.ru>
To: Markus Armbruster <armbru@redhat.com>
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Eric Blake <eblake@redhat.com>
References: <20190514131552.15832-1-yury-kotov@yandex-team.ru>
	<8736lhf85o.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Tue, 14 May 2019 17:59:32 +0300
Message-Id: <589121557845967@iva6-8a76e93b6298.qloud-c.yandex.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a02:6b8:0:1a2d::193
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH RESEND] monitor: Fix return
 type of monitor_fdset_dup_fd_find
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
X-List-Received-Date: Tue, 14 May 2019 14:59:42 -0000


14.05.2019, 17:01, "Markus Armbruster" <armbru@redhat.com>:
> Yury Kotov <yury-kotov@yandex-team.ru> writes:
>
>> =C2=A0monitor_fdset_dup_fd_find_remove() and monitor_fdset_dup_fd_find=
()
>> =C2=A0returns mon_fdset->id which is int64_t. Downcast from int64_t to=
 int leads to
>
> Grammar nits:
>
> =C2=A0=C2=A0=C2=A0=C2=A0s/returns/return/
> =C2=A0=C2=A0=C2=A0=C2=A0s/Downcast/Downcasting/
>
>> =C2=A0a bug with removing fd from fdset which id >=3D 2^32.
>
> s/which/with/
>
>> =C2=A0So, fix return types for these function.
>>
>> =C2=A0Signed-off-by: Yury Kotov <yury-kotov@yandex-team.ru>
>> =C2=A0---
>
> If I feed your message to git-am, I get
>
> =C2=A0=C2=A0=C2=A0=C2=A0Applying: monitor: Fix return type of monitor_f=
dset_dup_fd_find
> =C2=A0=C2=A0=C2=A0=C2=A0error: corrupt patch at line 12
> =C2=A0=C2=A0=C2=A0=C2=A0Patch failed at 0001 monitor: Fix return type o=
f monitor_fdset_dup_fd_find
> =C2=A0=C2=A0=C2=A0=C2=A0[...]
>
> Did you use git-send-email?
>
>> =C2=A0=C2=A0include/monitor/monitor.h | 2 +-
>> =C2=A0=C2=A0monitor.c | 4 ++--
>> =C2=A0=C2=A0stubs/fdset.c | 2 +-
>> =C2=A0=C2=A03 files changed, 4 insertions(+), 4 deletions(-)
>>
>> =C2=A0diff --git a/include/monitor/monitor.h b/include/monitor/monitor=
.h
>> =C2=A0index c1b40a9cac..2872621afd 100644
>> =C2=A0--- a/include/monitor/monitor.h
>> =C2=A0+++ b/include/monitor/monitor.h
>> =C2=A0@@ -46,7 +46,7 @@ AddfdInfo *monitor_fdset_add_fd(int fd, bool h=
as_fdset_=3D
>> =C2=A0id, int64_t fdset_id,
>> =C2=A0=C2=A0int monitor_fdset_get_fd(int64_t fdset_id, int flags);
>> =C2=A0=C2=A0int monitor_fdset_dup_fd_add(int64_t fdset_id, int dup_fd)=
;
>> =C2=A0=C2=A0void monitor_fdset_dup_fd_remove(int dup_fd);
>> =C2=A0-int monitor_fdset_dup_fd_find(int dup_fd);
>> =C2=A0+int64_t monitor_fdset_dup_fd_find(int dup_fd);
>> =C2=A0=3D20
>
> Looks mime-damaged.
>
>> =C2=A0=C2=A0void monitor_vfprintf(FILE *stream,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0c=
onst char *fmt, va_list ap) GCC_FMT_ATTR(2, 0);
>> =C2=A0diff --git a/monitor.c b/monitor.c
>> =C2=A0index 4807bbe811..50e6e820d6 100644
>> =C2=A0--- a/monitor.c
>> =C2=A0+++ b/monitor.c
>> =C2=A0@@ -2585,7 +2585,7 @@ err:
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return -1;
>> =C2=A0=C2=A0}
>> =C2=A0=3D20
>> =C2=A0-static int monitor_fdset_dup_fd_find_remove(int dup_fd, bool re=
move)
>> =C2=A0+static int64_t monitor_fdset_dup_fd_find_remove(int dup_fd, boo=
l remove)
>> =C2=A0=C2=A0{
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0MonFdset *mon_fdset;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0MonFdsetFd *mon_fdset_fd_dup;
>> =C2=A0@@ -2613,7 +2613,7 @@ err:
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return -1;
>> =C2=A0=C2=A0}
>> =C2=A0=3D20
>> =C2=A0-int monitor_fdset_dup_fd_find(int dup_fd)
>> =C2=A0+int64_t monitor_fdset_dup_fd_find(int dup_fd)
>> =C2=A0=C2=A0{
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return monitor_fdset_dup_fd_find_r=
emove(dup_fd, false);
>> =C2=A0=C2=A0}
>> =C2=A0diff --git a/stubs/fdset.c b/stubs/fdset.c
>> =C2=A0index 4f3edf2ea4..a1b8f41f62 100644
>> =C2=A0--- a/stubs/fdset.c
>> =C2=A0+++ b/stubs/fdset.c
>> =C2=A0@@ -7,7 +7,7 @@ int monitor_fdset_dup_fd_add(int64_t fdset_id, i=
nt dup_fd=3D
>> =C2=A0)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return -1;
>> =C2=A0=C2=A0}
>> =C2=A0=3D20
>> =C2=A0-int monitor_fdset_dup_fd_find(int dup_fd)
>> =C2=A0+int64_t monitor_fdset_dup_fd_find(int dup_fd)
>> =C2=A0=C2=A0{
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return -1;
>> =C2=A0=C2=A0}
>> =C2=A0--=3D20
>> =C2=A02.21.0
>
> The patch is complete because:
>
> * monitor_fdset_dup_fd_find_remove() is used only by
> =C2=A0=C2=A0monitor_fdset_dup_fd_find(), which you fix as well, and
> =C2=A0=C2=A0monitor_fdset_dup_fd_remove(), which ignores the return val=
ue.
>
> * monitor_fdset_dup_fd_find() is used only by qemu_close(), which store=
s
> =C2=A0=C2=A0the return value in an int64_t.
>
> Reviewed-by: Markus Armbruster <armbru@redhat.com>

Sorry for corrupted patch, will be more careful next time.
Because of Eric's suggestion, v2 will be completely different, so I think=
 it is
more correct not to keep the "Reviewed-by".

Regards,
Yury

