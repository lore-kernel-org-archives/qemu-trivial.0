Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ldU4y-0003aS-IU
	for mharc-qemu-trivial@gnu.org; Mon, 03 May 2021 04:37:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1ldU4S-0003O1-7t; Mon, 03 May 2021 04:36:52 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:55397)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1ldU4G-0000jC-3y; Mon, 03 May 2021 04:36:52 -0400
Received: from quad ([82.142.20.222]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1Mgebs-1l5Ei83Lci-00h7yH; Mon, 03
 May 2021 10:36:28 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Warner Losh <imp@bsdimp.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 03/23] hw/ide: Add Kconfig dependency MICRODRIVE -> PCMCIA
Date: Mon,  3 May 2021 10:36:03 +0200
Message-Id: <20210503083623.139700-4-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210503083623.139700-1-laurent@vivier.eu>
References: <20210503083623.139700-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:EIdyqqiYgUrrZj2RSmpT0HhtrqZEXYQZqUs+K/GhORXTptMAkv0
 62Vdes5Dj7gcWm8LcQBqra02GZk9lhcUnvH4UDSPpC0UP6spCW1pGMnFRtVo/lRfPv9tUDM
 hwRc+KXovN/UQ8O9tuqHS5t4FoHPBaGuJCuKWnKvxk30WTX+BY6luvx0oskBLUyEcOT6j7O
 M9X/dFgPcMmPDB2NLENWw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:sxh0g8FtvZc=:1IwzSeI/UXY+YMgnY91sJC
 Mc1gj54hjdWHs/xeLPBS4K8QqPOZs9aHfJslpEAS9AvuVyOh02niZyfqP9PlTxKX/xZJFLvSq
 UTkpdz4r1peYxMjuWXKQ8CN4S7h3NHudEN9ZP6n+x7dcyr5zhG1O6Dkx542nxb4R/wlRD38it
 4GNklx7PmoD1Kg097dX1sQm3x0c9AL2LDhKWtEJMgcpQkcRrEl907vTip0FDwMJe6yt2LlD3h
 7rzOC/H1wCksAPE0sxsROYPAWv2+DWcz/wayMuyRjZyMy0W+18LSE4NYjqyLJ9pXsXDBmc/7P
 sbvz6net0AfiaDkci5g6fZS7oMUgGyxuTzEk/usYHAsoJsugEBgsG2V/Yp5vA0gBA9MroP3vh
 LwliBvqfbCelxAFPTUwG/TEf0ORpd+WrV8FF0rekDluLk6GeltBIVmlJX1uoCiwsOfnTjgC/8
 y6mtj2lLQxmBYAybJ2y0vqDG73cZZpTUveXLK4lycoJ5EHOrCqp/L1PLS/eEfzNlr46HI1z9m
 XwTcOZEM4DRAC5cjNFlOHo=
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 03 May 2021 08:36:53 -0000

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

The Microdrive Compact Flash can be plugged on a PCMCIA bus.
Express the dependency using the 'depends on' Kconfig expression.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210424222057.3434459-3-f4bug@amsat.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/ide/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/ide/Kconfig b/hw/ide/Kconfig
index 5d9106b1ac2b..8e2c89345497 100644
--- a/hw/ide/Kconfig
+++ b/hw/ide/Kconfig
@@ -41,6 +41,7 @@ config IDE_VIA
 config MICRODRIVE
     bool
     select IDE_QDEV
+    depends on PCMCIA
 
 config AHCI
     bool
-- 
2.31.1


