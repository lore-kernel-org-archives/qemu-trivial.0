Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jVdWO-0001rg-VD
	for mharc-qemu-trivial@gnu.org; Mon, 04 May 2020 12:00:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1jVdWC-0001ZQ-FV; Mon, 04 May 2020 12:00:32 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:45005)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1jVdW4-0005vt-CF; Mon, 04 May 2020 12:00:30 -0400
Received: from localhost.localdomain ([82.252.135.106]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1M6DnM-1jTPWT0W6a-006j4Z; Mon, 04 May 2020 18:00:17 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>, qemu-trivial@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v2 18/19] hw/timer/stm32f2xx_timer: Remove dead assignment
Date: Mon,  4 May 2020 17:59:55 +0200
Message-Id: <20200504155956.380695-19-laurent@vivier.eu>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200504155956.380695-1-laurent@vivier.eu>
References: <20200504155956.380695-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:qxdoGuaJgcZVXFMomeoMipdxOGTmfRSKzrzZ1+ElAkoow+kUJ83
 u8od6N6H5ai8BOX1hN9KMddULnYP4insHijJG6CkRSw+xhEO7zs0AfMIjHu6q1q3zLon1uV
 iUhPOeshATsMc3vRBaou2OlM8jJnTNUXGoHHfkQO6/5OJssIJkLuNVOpTb0yuccM9TfcCRo
 2BqepeuXLSb/FVAglxl4w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:L5QC1KieNE4=:BOwao/wXgbG5vjRfiqbkCo
 pnDCpd0wOj2sXIdKAL0yDgJ+sgwfEKQEUs35OJ6uoOO3rujEnQlDaxODQpS7GQ/bDUxIE8cX7
 zJYA7IhAkeHOdyAZdvAFkOOym+pepR+k9Eaa/pOW0VgJxN+UKehkbZuxBoeSTwxGEK/+Hh5Nw
 5hNscS7h47/hGJ2p5ZE0yg3fCP3mGv8ppFk90xPhadHw0q2PKJo4R1PCkbYrgyXoI4IhQilXO
 3o2zhs1pIc/mVa4l6SpdsXMKHg6GKHxB2ZDZ/R/LOuNek5Fx6FWDNrJUezjq+1LJwF8sqXssx
 FoCmgctiVDKxh16ipZ4HtbrGFZkb29O6fvXf2+xWp959LdCIQ5l1MLu0ZGI3y0OFW07rgGhDX
 crt0Xu0UbEkDyFNo40/m8xO5LmsYQ6MqB1bs664d3/xkGn5fs6Yz3J7wyghYm9Qx4MMnSxmQY
 4jjK6pMWxu27VXy1TDMMZA+djTdEPVvw2f17x9lwAD6/7wSSBm+j0r1hZJUkXMxD/RqEW8U5C
 c62MXpzdinOXUNmaBDt15KhMGr25UIsxlbnsqBSLT6DcOM+pl3M377wzKLOGQF7oYQuWuE5uB
 5X6k/hx0dr53at3PaZrhNO6Gl7/ORQ1xm4Y/gR6CiUPU4Cs+QF9/A/Oz/c2UkBhYP+/YkJ9zS
 MOcr8duDlXLEGkgThtqV1X3006g8bJLcJ8RFiSABaMnDktySh8huYW/HtUuM2nQuJqjgAqAms
 uNlF2OUdjNgPG0SFdlLyAOHixxe0beOroXKi2ESMHUnppLDXOHH0gu7Qc+Cx5zmLAzchAt1kb
 oMJbEUirqm1VdCTnAB9ewn41+7/ovtiPELzRX6lDPATayCcH0LaxNVHvFW0/eiOGkYNuSIB
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/04 12:00:20
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
X-List-Received-Date: Mon, 04 May 2020 16:00:34 -0000

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Fix warning reported by Clang static code analyzer:

    CC      hw/timer/stm32f2xx_timer.o
  hw/timer/stm32f2xx_timer.c:225:9: warning: Value stored to 'value' is never read
          value = timer_val;
          ^       ~~~~~~~~~

Reported-by: Clang Static Analyzer
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20200422133152.16770-9-philmd@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/timer/stm32f2xx_timer.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/timer/stm32f2xx_timer.c b/hw/timer/stm32f2xx_timer.c
index 06ec8a02c250..ba8694dcd349 100644
--- a/hw/timer/stm32f2xx_timer.c
+++ b/hw/timer/stm32f2xx_timer.c
@@ -222,7 +222,6 @@ static void stm32f2xx_timer_write(void *opaque, hwaddr offset,
     case TIM_PSC:
         timer_val = stm32f2xx_ns_to_ticks(s, now) - s->tick_offset;
         s->tim_psc = value & 0xFFFF;
-        value = timer_val;
         break;
     case TIM_CNT:
         timer_val = value;
-- 
2.26.2


