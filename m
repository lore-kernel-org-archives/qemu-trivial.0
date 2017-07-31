Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dc84g-0006Am-Qy
	for mharc-qemu-trivial@gnu.org; Mon, 31 Jul 2017 06:37:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55921)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dc84c-00065v-B7
	for qemu-trivial@nongnu.org; Mon, 31 Jul 2017 06:37:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dc84b-00071h-IG
	for qemu-trivial@nongnu.org; Mon, 31 Jul 2017 06:37:18 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:50629)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1dc84U-0006vc-7s; Mon, 31 Jul 2017 06:37:10 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 5C5AB42ABE;
	Mon, 31 Jul 2017 13:37:09 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 09638B8A;
	Mon, 31 Jul 2017 13:21:46 +0300 (MSK)
Received: (nullmailer pid 5569 invoked by uid 1000);
	Mon, 31 Jul 2017 10:21:45 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Date: Mon, 31 Jul 2017 13:21:34 +0300
Message-Id: <bc658e4a2e81593f75a3ae34b112be77efbb3e0a.1501496349.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1501496349.git.mjt@msgid.tls.msk.ru>
References: <cover.1501496349.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1501496349.git.mjt@msgid.tls.msk.ru>
References: <cover.1501496349.git.mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 15/25] syscall: fix dereference of undefined
 pointer
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
X-List-Received-Date: Mon, 31 Jul 2017 10:37:19 -0000

From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

linux-user/syscall.c:5581:9: warning: Dereference of undefined pointer va=
lue
    if (*host_rt_dev_ptr !=3D 0) {
        ^~~~~~~~~~~~~~~~

Reported-by: Clang Static Analyzer
Suggested-by: Laurent Vivier <lvivier@redhat.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 linux-user/syscall.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 003943b736..71d45a9963 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -5573,6 +5573,7 @@ static abi_long do_ioctl_rt(const IOCTLEntry *ie, u=
int8_t *buf_temp,
                                     field_types, THUNK_HOST);
     }
     unlock_user(argptr, arg, 0);
+    assert(host_rt_dev_ptr);
=20
     ret =3D get_errno(safe_ioctl(fd, ie->host_cmd, buf_temp));
     if (*host_rt_dev_ptr !=3D 0) {
--=20
2.11.0


