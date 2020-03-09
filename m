Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jBK3n-0001YI-Pu
	for mharc-qemu-trivial@gnu.org; Mon, 09 Mar 2020 11:11:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34696)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1jBK3g-0001ST-Eu
 for qemu-trivial@nongnu.org; Mon, 09 Mar 2020 11:11:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1jBK3f-0000BU-Bm
 for qemu-trivial@nongnu.org; Mon, 09 Mar 2020 11:11:08 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:40747)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1jBK3S-0008Uo-1s; Mon, 09 Mar 2020 11:10:58 -0400
Received: from localhost.localdomain ([82.252.135.106]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MQeI4-1iwNvb0hB0-00NgXY; Mon, 09 Mar 2020 16:10:01 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Greg Kurz <groug@kaod.org>, qemu-block@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <rth@twiddle.net>, Jason Wang <jasowang@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Michael Tokarev <mjt@tls.msk.ru>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Fam Zheng <fam@euphon.net>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-arm@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Andrzej Zaborowski <balrogg@gmail.com>, Helge Deller <deller@gmx.de>,
 qemu-trivial@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, John Snow <jsnow@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Chen Qun <kuhn.chenqun@huawei.com>,
 Euler Robot <euler.robot@huawei.com>
Subject: [PULL 33/33] monitor/hmp-cmds: Remove redundant statement in
 hmp_rocker_of_dpa_groups()
Date: Mon,  9 Mar 2020 16:08:37 +0100
Message-Id: <20200309150837.3193387-34-laurent@vivier.eu>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200309150837.3193387-1-laurent@vivier.eu>
References: <20200309150837.3193387-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:jfwKfoPjr7zrnq8FDhlW9uePbmxruYIoEt+I+yjPnRYbdFlKkua
 tdXKO9O9BZUFuWiy49PARSmvQ7Ss0HF958+8hy49oWQ8O6i/Ca0rcOKj0n1RcOyMXakt2i+
 LcZ5Ipd227VHf94lDiRP6S524cMLUUbYjBbxZ3quIHQMoz3M9p1K0IxMscsgqI3HRa899dP
 CQAgCBKjnMUNjZ1yyL/jQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:07BCFlNsqHE=:8Fk1VE+ORh94zJl6uqKPXe
 ygq0lfKEHY/cAC+q8CaBGv62XUZ+60PJmsrFL19cYNMlCv8HcMz7jsyfWEDZV5mWsJ67WOd7b
 bLj7iAiTXJPHoCSyD+PmZRJ8r2Vo/cRwQPqdFipX1CvFVPBDrL+zojCiEDImEDxPAooYX74N/
 FZa1ReFgoe+ait/2ifULGjUG3sTj8W2xJ8SY9g6FEKNrJMi9Vl0h2rZGPu31o9+X7DwxmFZ9u
 Mg1GWb8GMEbh2w1uSvgaeiiJ+SmlLfhOR2k6VPw8MDx/+GHhmjNYDEkd6GT75iDT1fXfiyMyR
 OeO1Azq66IwU2OuVx841B78ezZxdbby5Mdtt1U4zxhOIxJ/MYD0e/jF7xEaToaeGrCMCofCuB
 hJV0ATd7TFcExHjtMk+BA4EtIu7Rh7KZ0MriYG3KbzC7imyQ00LEM4Y8FlVzCfLNK5QRARFD8
 OtEF0HC4iwXmwxQe5SDe0mP2BYQmY3jODhv5bUZILYkw4tNDKLtYBk42J8VX9MKVxAqtt+VwE
 4UrrePqXA/HhNBBLxtA6ZbbW/JPp7Xw3OR5orVpLXm0qvT4Sts2r0+yc7QAOCdClbyHtkOae1
 37tkkkOeo8YDs0fmBoItB51qO18n8MNu8CyKSSN71GVuQPR6WlGVI4YCf7714EbffskL8CQ5L
 SI4IndVKoVvTKvAH7aBudUSiAl/vK/5Hy314gfikfQ6frT5DtUFMbgbmops/o02zB0n2HOy14
 gPE2gqucUxjO/2E8r3t29aXExW8GFJuCEd1HlphAi6l6k17LSiUtOpF0OPNO1y7KBl5j6wIt1
 qAOCJDSGo0vEzFB+t1+xA9tRPxgciJqgc9gifOCP/0nWBIKI47Zt6Ea5DHpPinCBAMneVfs
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.24
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
X-List-Received-Date: Mon, 09 Mar 2020 15:11:13 -0000

From: Chen Qun <kuhn.chenqun@huawei.com>

Clang static code analyzer show warning:
monitor/hmp-cmds.c:2867:17: warning: Value stored to 'set' is never read
                set = true;
                ^     ~~~~

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20200302130715.29440-14-kuhn.chenqun@huawei.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 monitor/hmp-cmds.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index fb4c2fd2a875..6fd7aca5007b 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -2842,7 +2842,6 @@ void hmp_rocker_of_dpa_groups(Monitor *mon, const QDict *qdict)
     const char *name = qdict_get_str(qdict, "name");
     uint8_t type = qdict_get_try_int(qdict, "type", 9);
     Error *err = NULL;
-    bool set = false;
 
     list = qmp_query_rocker_of_dpa_groups(name, type != 9, type, &err);
     if (err != NULL) {
@@ -2854,6 +2853,7 @@ void hmp_rocker_of_dpa_groups(Monitor *mon, const QDict *qdict)
 
     for (g = list; g; g = g->next) {
         RockerOfDpaGroup *group = g->value;
+        bool set = false;
 
         monitor_printf(mon, "0x%08x", group->id);
 
@@ -2898,14 +2898,11 @@ void hmp_rocker_of_dpa_groups(Monitor *mon, const QDict *qdict)
 
         if (group->has_set_eth_dst) {
             if (!set) {
-                set = true;
                 monitor_printf(mon, " set");
             }
             monitor_printf(mon, " dst %s", group->set_eth_dst);
         }
 
-        set = false;
-
         if (group->has_ttl_check && group->ttl_check) {
             monitor_printf(mon, " check TTL");
         }
-- 
2.24.1


