Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jVZjt-0003B8-T6
	for mharc-qemu-trivial@gnu.org; Mon, 04 May 2020 07:58:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1jVZjr-00033m-9p; Mon, 04 May 2020 07:58:23 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:41055)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1jVZjo-0001zK-VS; Mon, 04 May 2020 07:58:22 -0400
Received: from localhost.localdomain ([82.252.135.106]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MLyzP-1jnW5l0VaD-00HsQV; Mon, 04 May 2020 13:58:04 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, Michael Tokarev <mjt@tls.msk.ru>,
 qemu-trivial@nongnu.org, Chen Qun <kuhn.chenqun@huawei.com>,
 Euler Robot <euler.robot@huawei.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PULL 03/20] timer/exynos4210_mct: Remove redundant statement in
 exynos4210_mct_write()
Date: Mon,  4 May 2020 13:57:41 +0200
Message-Id: <20200504115758.283914-4-laurent@vivier.eu>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200504115758.283914-1-laurent@vivier.eu>
References: <20200504115758.283914-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:rGPmTbt3LS78KZblEyLnOBFOGWdEOJIuW7LeCx9f7iNzdLmp2Lj
 MzlPvWoRUqDr4hftXRpUfCkZ+eu/L8o1FwdUoZIscg4UsGuLngTWEI8luCNcA9ULd8RyMpI
 ESycGUHZjkaBLlzuN0t6tG8TJKAdmFY0yhVhk/K4zwt6GCDOHxVNMdpiJD2JppGFgCN/1hC
 jZjpWN1myU3sPr5drXerg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:oIhUnmCaHA8=:i1Umx/M5mqCude2CXClJ6q
 zhUjfRd7IHXVe4z3jLXwNQ1jk6UOfz/6jpQRFqr8ejnISHO3sODrX4ZQO8qlTrRMJ4hpOQqhw
 KpeLbs4SORsLKtma75BuEt4yU+CXbaDY2UFeDyb+75IFKLobS6bP+PfmqnmlG3yfTCGA9pWXk
 5HTzy+zLin6r1klIhXL5u4XacdP8O/yhLl41lEIl/4SWsh2XefzTWJdjAb1oVIhWlxroSxF98
 Qz34YvvF4qpvHXPnAYBcWqGt8umAT91rNwPxMvej+xcfgopk6mGzhA7IS8FNS/aUHZA4n8ohV
 ViCVTT0u43oMiUXHdnRgBchq9JYtBRC0RgnL+y9swFACaTM1T7KdxNKMj6SJ3h6cGnG/hGwtH
 0OyHBSGRzcbRIv+HhgIBXmpdibogFJz5MfkCiXK/aOgWAkM50xBtssSZ9nBcCaO9Wa8jXTrWn
 7Eeq9ZtfTGPjKXiK1htdyuGt6+VOQ/kgK+09NGctibO6ZULGT5dCdNi4fD7d3y0wXAqA1hKv9
 Sucaz4tDGof8Wd9a5x9OEYtUCq2OQpw6uJor8ogruV2ecoMeWOvbHK0wJeKKZxMYXZOeSSduj
 lGbUYYjxAkuSdRArSZSJgyEOZjRjVRTXc0zmQgEdYaC7UrO3QreSTfh5onc/o6Xe55lLHp3OR
 OlCJvV2uHtyphJGABHMlZwliok04mDBDMAnhD2D0YzXKGUfQHjDotIM1hmXwMZ221DwVCxzbx
 Zt817jB+p/i09Uv2Rtx1hXn9JUJsarLsFItHghBqq+2pJ5ehERtG4F+9yynucmQnQvYLT4t6K
 7X3K7ayZ9xoI+k5v6B8T0zirQ8GBUi3qYQIErnLV3RS3sWAbNp091P4ZGvMf/VZdJwY9Y8j
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/04 07:58:12
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
X-List-Received-Date: Mon, 04 May 2020 11:58:24 -0000

From: Chen Qun <kuhn.chenqun@huawei.com>

Clang static code analyzer show warning:
hw/timer/exynos4210_mct.c:1370:9: warning: Value stored to 'index' is never read
        index = GET_L_TIMER_CNT_REG_IDX(offset, lt_i);
        ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
hw/timer/exynos4210_mct.c:1399:9: warning: Value stored to 'index' is never read
        index = GET_L_TIMER_CNT_REG_IDX(offset, lt_i);
        ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
hw/timer/exynos4210_mct.c:1441:9: warning: Value stored to 'index' is never read
        index = GET_L_TIMER_CNT_REG_IDX(offset, lt_i);
        ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20200325025919.21316-4-kuhn.chenqun@huawei.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/timer/exynos4210_mct.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/hw/timer/exynos4210_mct.c b/hw/timer/exynos4210_mct.c
index 944120aea59c..570cf7075bc5 100644
--- a/hw/timer/exynos4210_mct.c
+++ b/hw/timer/exynos4210_mct.c
@@ -1367,7 +1367,6 @@ static void exynos4210_mct_write(void *opaque, hwaddr offset,
 
     case L0_TCNTB: case L1_TCNTB:
         lt_i = GET_L_TIMER_IDX(offset);
-        index = GET_L_TIMER_CNT_REG_IDX(offset, lt_i);
 
         /*
          * TCNTB is updated to internal register only after CNT expired.
@@ -1396,7 +1395,6 @@ static void exynos4210_mct_write(void *opaque, hwaddr offset,
 
     case L0_ICNTB: case L1_ICNTB:
         lt_i = GET_L_TIMER_IDX(offset);
-        index = GET_L_TIMER_CNT_REG_IDX(offset, lt_i);
 
         s->l_timer[lt_i].reg.wstat |= L_WSTAT_ICNTB_WRITE;
         s->l_timer[lt_i].reg.cnt[L_REG_CNT_ICNTB] = value &
@@ -1438,8 +1436,6 @@ static void exynos4210_mct_write(void *opaque, hwaddr offset,
 
     case L0_FRCNTB: case L1_FRCNTB:
         lt_i = GET_L_TIMER_IDX(offset);
-        index = GET_L_TIMER_CNT_REG_IDX(offset, lt_i);
-
         DPRINTF("local timer[%d] FRCNTB write %llx\n", lt_i, value);
 
         s->l_timer[lt_i].reg.wstat |= L_WSTAT_FRCCNTB_WRITE;
-- 
2.26.2


