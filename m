Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jH2Et-0003S6-LG
	for mharc-qemu-trivial@gnu.org; Wed, 25 Mar 2020 05:22:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52687)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kuhn.chenqun@huawei.com>) id 1jH2Eq-0003Nb-QT
 for qemu-trivial@nongnu.org; Wed, 25 Mar 2020 05:22:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kuhn.chenqun@huawei.com>) id 1jH2Ep-0007xW-Pr
 for qemu-trivial@nongnu.org; Wed, 25 Mar 2020 05:22:16 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:58822 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1jH2En-0007nk-9g; Wed, 25 Mar 2020 05:22:13 -0400
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id D0EA5383E7485E33693D;
 Wed, 25 Mar 2020 17:22:05 +0800 (CST)
Received: from huawei.com (10.133.205.93) by DGGEMS410-HUB.china.huawei.com
 (10.3.19.210) with Microsoft SMTP Server id 14.3.487.0; Wed, 25 Mar 2020
 17:21:59 +0800
From: Chen Qun <kuhn.chenqun@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
CC: <zhang.zhanghailiang@huawei.com>, <laurent@vivier.eu>, Chen Qun
 <kuhn.chenqun@huawei.com>, Euler Robot <euler.robot@huawei.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH 1/3] gdbstub: prevent uninitialized warning
Date: Wed, 25 Mar 2020 17:21:35 +0800
Message-ID: <20200325092137.24020-2-kuhn.chenqun@huawei.com>
X-Mailer: git-send-email 2.21.0.windows.1
In-Reply-To: <20200325092137.24020-1-kuhn.chenqun@huawei.com>
References: <20200325092137.24020-1-kuhn.chenqun@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Wed, 25 Mar 2020 09:22:18 -0000

According to the glib function requirements, we need initialise
     the variable. Otherwise there will be compilation warnings:

qemu/gdbstub.c: In function =E2=80=98handle_query_thread_extra=E2=80=99:
/usr/include/glib-2.0/glib/glib-autocleanups.h:28:3: warning:
 =E2=80=98cpu_name=E2=80=99 may be used uninitialized in this function [-=
Wmaybe-uninitialized]
   g_free (*pp);
   ^~~~~~~~~~~~

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
---
Cc: "Alex Benn=C3=A9e" <alex.bennee@linaro.org>
Cc: "Philippe Mathieu-Daud=C3=A9" <philmd@redhat.com>
---
 gdbstub.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/gdbstub.c b/gdbstub.c
index 013fb1ac0f..171e150950 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -2060,8 +2060,8 @@ static void handle_query_thread_extra(GdbCmdContext=
 *gdb_ctx, void *user_ctx)
         /* Print the CPU model and name in multiprocess mode */
         ObjectClass *oc =3D object_get_class(OBJECT(cpu));
         const char *cpu_model =3D object_class_get_name(oc);
-        g_autofree char *cpu_name;
-        cpu_name  =3D object_get_canonical_path_component(OBJECT(cpu));
+        g_autofree char *cpu_name =3D
+            object_get_canonical_path_component(OBJECT(cpu));
         g_string_printf(rs, "%s %s [%s]", cpu_model, cpu_name,
                         cpu->halted ? "halted " : "running");
     } else {
--=20
2.23.0



