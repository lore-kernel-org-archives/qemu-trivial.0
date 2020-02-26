Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j6sM8-0000TC-H0
	for mharc-qemu-trivial@gnu.org; Wed, 26 Feb 2020 03:47:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44557)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kuhn.chenqun@huawei.com>) id 1j6sM5-0000Or-Tu
 for qemu-trivial@nongnu.org; Wed, 26 Feb 2020 03:47:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kuhn.chenqun@huawei.com>) id 1j6sM4-0007Ty-Sh
 for qemu-trivial@nongnu.org; Wed, 26 Feb 2020 03:47:45 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:58664 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1j6sM2-00075o-AO; Wed, 26 Feb 2020 03:47:42 -0500
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 755008786A96DFFF0423;
 Wed, 26 Feb 2020 16:47:37 +0800 (CST)
Received: from huawei.com (10.133.205.93) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.439.0; Wed, 26 Feb 2020
 16:47:30 +0800
From: <kuhn.chenqun@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
CC: <peter.maydell@linaro.org>, <zhang.zhanghailiang@huawei.com>, Chen Qun
 <kuhn.chenqun@huawei.com>, Euler Robot <euler.robot@huawei.com>, John Snow
 <jsnow@redhat.com>, Kevin Wolf <kwolf@redhat.com>, Max Reitz
 <mreitz@redhat.com>
Subject: [PATCH v2 01/13] block/stream: Remove redundant statement in
 stream_run()
Date: Wed, 26 Feb 2020 16:46:35 +0800
Message-ID: <20200226084647.20636-2-kuhn.chenqun@huawei.com>
X-Mailer: git-send-email 2.21.0.windows.1
In-Reply-To: <20200226084647.20636-1-kuhn.chenqun@huawei.com>
References: <20200226084647.20636-1-kuhn.chenqun@huawei.com>
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
X-List-Received-Date: Wed, 26 Feb 2020 08:47:47 -0000

From: Chen Qun <kuhn.chenqun@huawei.com>

Clang static code analyzer show warning:
  block/stream.c:186:9: warning: Value stored to 'ret' is never read
        ret =3D 0;
        ^     ~
Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
Reviewed-by: John Snow <jsnow@redhat.com>
---
Cc: John Snow <jsnow@redhat.com>
Cc: Kevin Wolf <kwolf@redhat.com>
Cc: Max Reitz <mreitz@redhat.com>
---
 block/stream.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/block/stream.c b/block/stream.c
index 5562ccbf57..d78074ac80 100644
--- a/block/stream.c
+++ b/block/stream.c
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



