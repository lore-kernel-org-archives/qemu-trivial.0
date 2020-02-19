Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j4MQ8-00048U-1n
	for mharc-qemu-trivial@gnu.org; Wed, 19 Feb 2020 05:17:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53368)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1j4MPl-0003dP-Ii
 for qemu-trivial@nongnu.org; Wed, 19 Feb 2020 05:17:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1j4MPk-0005Fe-Ek
 for qemu-trivial@nongnu.org; Wed, 19 Feb 2020 05:17:09 -0500
Received: from mout.kundenserver.de ([212.227.17.13]:37851)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1j4MPa-00050Z-Pg; Wed, 19 Feb 2020 05:16:59 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MHnZQ-1jH4062Uz8-00ErOT; Wed, 19 Feb 2020 11:16:40 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Marek Vasut <marex@denx.de>,
 Thomas Huth <thuth@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Jiri Pirko <jiri@resnulli.us>, qemu-arm@nongnu.org,
 Alistair Francis <alistair@alistair23.me>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <rth@twiddle.net>,
 Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 qemu-trivial@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Thomas Huth <huth@tuxfamily.org>,
 qemu-block@nongnu.org, Chris Wulff <crwulff@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>, Max Reitz <mreitz@redhat.com>,
 Fam Zheng <fam@euphon.net>, Paolo Bonzini <pbonzini@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Subject: [PULL 11/17] tests/qtest/libqos/qgraph: Remove superfluous semicolons
Date: Wed, 19 Feb 2020 11:16:06 +0100
Message-Id: <20200219101612.1033925-12-laurent@vivier.eu>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200219101612.1033925-1-laurent@vivier.eu>
References: <20200219101612.1033925-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:JpUVUNN+S0+cpEQ7Ukn+HanppYJnz1MOzhIPtY9bWWbtdRnlNeW
 fjmIzxWyibl5/aaGjt/3Edg+TX35x3OMfs9jkkp0lWrOWeKWGYYZEV71XfZUHhO+kXj5IpG
 RsVNYTu7vEFqBSZVfY0U66m6UasYctRfJOKM5sGpObgMNIORDVcSsWjUhqWHysEREbhwSrf
 0lynHRHLcq1aaZsVnYy1w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:6VzeMLdb83I=:dcixetq2v7BjSE39LhHLZb
 SlPSv938kldCjaw+Xl59xA+Rm9aVV5LXOfkqnNkyCd87DhhVd3KamGTTd+g2dEpgzO9te7K9n
 hVRXu6w+f0cSHsZ3GwaA33nYwh/AEMzvONqlzTfvHoNpSdCEXOSM/Vaf3Ce9JoDCiOyN/wRVE
 BdOLErc7SNcstp0jMxWpHcjjJzztxbdLclwsavzuN1q2Q4y11QzMsNipswGU4RnOxjFj9j1aI
 QzX4V8v1oUHkwn5cqAoPiElHcbQfiM6VLRSucLIcBD8oz8y6yv5WNQKbCk6Fk49bc1cIreuEn
 GPFrCXvgSUwe97hka79PZPYsy+TsX3EBiwIm02KbsgeO9j+GKDf+fzCk39BIJeT9tl2vVR8N9
 eNs9Uajobg3xnXyZE+ZtDvnJIRygUK5uoM0zeh3UALO5HiMxRdg6IirDfSTPb5WfTcP4FaM7j
 o1/mG70nIXVB4Wcy7muuUGYgA0fBLR62JY4X5AsRZSxKUCR62XcTZj3eiouOSFGuugGL/50It
 ZPekopFAG5wSLpaBg4rYHO/usOnN4lwujP7tyQiauBwoW8twayiYIoFftGoCt9oN6dH/M8vj2
 07/7nr1sicikV0dFEk/YIRoMx36A5wByLNe4WYgtqqewoh4AY/paHJJQxQZDeuDwGxh+qIRnC
 +pmkzVmKVRgSDy9qGDYeqBCw/ZVy5Wqwc1PnbOmho8/T+qui8Z7t+DI8VutZ45Q+MJVb7HqoM
 Uv38HchWPngc6lP05zNTVvcfXShsesjscX0EcalDZBNrCkz6fn1Y18hFZPkP3tJFqGvoXpRfy
 nV8h3JikpueruaW4d7qFy1gsgqyhIUGNZmgAh5psE9B0iwJoV93UHcDYcYqqixG/zvG7zLP
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.13
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
X-List-Received-Date: Wed, 19 Feb 2020 10:17:15 -0000

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Fixes: fc281c80202
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Message-Id: <20200218094402.26625-13-philmd@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 tests/qtest/libqos/qgraph.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/qtest/libqos/qgraph.c b/tests/qtest/libqos/qgraph.c
index 7a7ae2a19edc..ca01de07437b 100644
--- a/tests/qtest/libqos/qgraph.c
+++ b/tests/qtest/libqos/qgraph.c
@@ -474,7 +474,7 @@ QOSEdgeType qos_graph_edge_get_type(QOSGraphEdge *edge)
     if (!edge) {
         return -1;
     }
-    return edge->type;;
+    return edge->type;
 }
 
 char *qos_graph_edge_get_dest(QOSGraphEdge *edge)
@@ -590,7 +590,7 @@ void qos_add_test(const char *name, const char *interface,
                   QOSTestFunc test_func, QOSGraphTestOptions *opts)
 {
     QOSGraphNode *node;
-    char *test_name = g_strdup_printf("%s-tests/%s", interface, name);;
+    char *test_name = g_strdup_printf("%s-tests/%s", interface, name);
     QOSGraphTestOptions def_opts = { };
 
     if (!opts) {
-- 
2.24.1


