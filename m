Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j8koP-0007IM-Kb
	for mharc-qemu-trivial@gnu.org; Mon, 02 Mar 2020 08:08:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48739)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kuhn.chenqun@huawei.com>) id 1j8knk-0006GO-MY
 for qemu-trivial@nongnu.org; Mon, 02 Mar 2020 08:08:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kuhn.chenqun@huawei.com>) id 1j8knj-0003No-FB
 for qemu-trivial@nongnu.org; Mon, 02 Mar 2020 08:08:04 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:51536 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1j8kng-0003Ip-Vp; Mon, 02 Mar 2020 08:08:01 -0500
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 30214E7C45B717FB405E;
 Mon,  2 Mar 2020 21:07:53 +0800 (CST)
Received: from huawei.com (10.133.205.93) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.439.0; Mon, 2 Mar 2020
 21:07:45 +0800
From: Chen Qun <kuhn.chenqun@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
CC: <peter.maydell@linaro.org>, <zhang.zhanghailiang@huawei.com>, Chen Qun
 <kuhn.chenqun@huawei.com>, Euler Robot <euler.robot@huawei.com>, John Snow
 <jsnow@redhat.com>, Kevin Wolf <kwolf@redhat.com>, Max Reitz
 <mreitz@redhat.com>
Subject: [PATCH v3 01/12] block/stream: Remove redundant statement in
 stream_run()
Date: Mon, 2 Mar 2020 21:07:04 +0800
Message-ID: <20200302130715.29440-3-kuhn.chenqun@huawei.com>
X-Mailer: git-send-email 2.21.0.windows.1
In-Reply-To: <20200302130715.29440-1-kuhn.chenqun@huawei.com>
References: <20200302130715.29440-1-kuhn.chenqun@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.133.205.93]
X-CFilter-Loop: Reflected
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.32
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
X-List-Received-Date: Mon, 02 Mar 2020 13:08:06 -0000

Clang static code analyzer show warning:
  block/stream.c:186:9: warning: Value stored to 'ret' is never read
        ret =3D 0;
        ^     ~
Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
Reviewed-by: John Snow <jsnow@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
---
Cc: John Snow <jsnow@redhat.com>
Cc: Kevin Wolf <kwolf@redhat.com>
Cc: Max Reitz <mreitz@redhat.com>

v1->v2:move 'ret' declaration to the for() statement(Base on Kevin's comm=
ents).
---
 block/stream.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/block/stream.c b/block/stream.c
index 5562ccbf57..aa2e7af98e 100644
--- a/block/stream.c
+++ b/block/stream.c
@@ -114,7 +114,6 @@ static int coroutine_fn stream_run(Job *job, Error **=
errp)
     int64_t offset =3D 0;
     uint64_t delay_ns =3D 0;
     int error =3D 0;
-    int ret =3D 0;
     int64_t n =3D 0; /* bytes */
=20
     if (bs =3D=3D s->bottom) {
@@ -139,6 +138,7 @@ static int coroutine_fn stream_run(Job *job, Error **=
errp)
=20
     for ( ; offset < len; offset +=3D n) {
         bool copy;
+        int ret;
=20
         /* Note that even when no rate limit is applied we need to yield
          * with no pending I/O here so that bdrv_drain_all() returns.
@@ -183,7 +183,6 @@ static int coroutine_fn stream_run(Job *job, Error **=
errp)
                 break;
             }
         }
-        ret =3D 0;
=20
         /* Publish progress */
         job_progress_update(&s->common.job, n);
--=20
2.23.0



