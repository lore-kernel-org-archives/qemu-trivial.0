Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lK6eG-0003SW-Hd
	for mharc-qemu-trivial@gnu.org; Wed, 10 Mar 2021 16:45:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lK6dz-0003Ax-FZ; Wed, 10 Mar 2021 16:45:29 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:54553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lK6dw-0004Qw-BU; Wed, 10 Mar 2021 16:45:27 -0500
Received: from localhost.localdomain ([82.142.6.26]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MZT2u-1lHN3y3g7q-00WZCQ; Wed, 10 Mar 2021 22:45:17 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>, qemu-trivial@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Alexander Bulekov <alxndr@bu.edu>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PULL 09/22] fuzz-test: remove unneccessary debugging flags
Date: Wed, 10 Mar 2021 22:44:51 +0100
Message-Id: <20210310214504.1183162-10-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210310214504.1183162-1-laurent@vivier.eu>
References: <20210310214504.1183162-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:nXAHKnyD6SEU07yBox29oftFF+awKGYOyZC4cuEaHH0+zp++TcV
 Rk4gRbUo438rwpyC3WXRMZNsGUJCstY4/juB9tDw2IktVY0iNAU88pqrpOtGFfbIwEhwIrY
 8L1PQ/AFdxGYotzLPYxHFHP08VUCCXwBVtP/RAAu4xrGk0ZqIYc9goRMEg0vpd1L6cY9l/4
 WGABnHOPrH7N53w62HHgw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:OOOn84DPlhA=:h8ErCYu/jL3USHetXGL4dH
 nA8BL/AK58OHEv14bPaEXlTwdZTJNru8uSEZwnoAr3+eo27dRUAw47pugOOBs+xkpOvkag3t2
 wUyZwg5DUGTD2U0xpqXbEieobCe5SkpkOlMFQEBETyaPXaqMIxeY8mnA3y9OK4MmVXWEignKq
 AGl+a5Hz6TAMsmwfaI3l+Bo9NYTqRjkm28N57yZTb+XAO1N2eNTk25hEjKW+mWjNunXKbgfSG
 2sKymrRlRC0qm1qrJVhkcK9mCGthoFAndxSWdKB63x+iKZwjyeBqdhhbdJFB63+NcHN8Yz1ns
 OLJPAPV89kZwIn2kWX9s5ezcE+i6pKOf52kz2U9v+eFCURhYNmbIsIiB3vbaRFYWCBipTWpmB
 rsCuSAiwy5hfgyI4zngr/c0ewL9rwqcwoRbuJ0rUOmClctVVMoVAZ4rKlXMMp786cp0t3D1V8
 myUbwQBCyQ==
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
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
X-List-Received-Date: Wed, 10 Mar 2021 21:45:38 -0000

From: Alexander Bulekov <alxndr@bu.edu>

These flags cause the output to look strange for 'make check', and
they aren't needed to reproduce bugs, if they reappear.

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210216181316.794276-1-alxndr@bu.edu>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 tests/qtest/fuzz-test.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tests/qtest/fuzz-test.c b/tests/qtest/fuzz-test.c
index cdb1100a0b81..6f161c93be71 100644
--- a/tests/qtest/fuzz-test.c
+++ b/tests/qtest/fuzz-test.c
@@ -39,8 +39,7 @@ static void test_lp1878642_pci_bus_get_irq_level_assert(void)
     QTestState *s;
 
     s = qtest_init("-M pc-q35-5.0 "
-                   "-nographic -monitor none -serial none "
-                   "-d guest_errors -trace pci*");
+                   "-nographic -monitor none -serial none");
 
     qtest_outl(s, 0xcf8, 0x8400f841);
     qtest_outl(s, 0xcfc, 0xebed205d);
-- 
2.29.2


