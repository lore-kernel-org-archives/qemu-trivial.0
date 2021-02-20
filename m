Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lDRUM-0007KO-Ov
	for mharc-qemu-trivial@gnu.org; Sat, 20 Feb 2021 07:35:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lDRUI-00078f-M8; Sat, 20 Feb 2021 07:35:54 -0500
Received: from mout.kundenserver.de ([212.227.17.24]:58925)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lDRUF-0003OS-Fq; Sat, 20 Feb 2021 07:35:54 -0500
Received: from localhost.localdomain ([82.252.134.158]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MAgMY-1l6syp2FGS-00B4mZ; Sat, 20 Feb 2021 13:35:39 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>, qemu-trivial@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 11/12] target/avr/cpu: Use device_class_set_parent_realize()
Date: Sat, 20 Feb 2021 13:35:24 +0100
Message-Id: <20210220123525.1353731-12-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210220123525.1353731-1-laurent@vivier.eu>
References: <20210220123525.1353731-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:c0W/25rmJIeB4TfIxifESZLNBhGhOtPboFTZ7G5fnG0jbvOQNkY
 pwqVNui3ND8HrMLEzBwCtted6K9cBumI9uRVbBsKZUWTAxgYHWqxx6dOqiR46fRe5Z4ZT9D
 2a3bsIKNUi850yALLesh1gg1rucGhWaFATxQuScWnQtYukcQ/vVZo9MAdNlQ2Vcn392mQ+F
 5V5ICP/4+unBReVHgi4ag==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ueHF+mkdbmI=:Q8Whg/FnZs/rRMFQ9RhrFz
 3ls9epWzlMKmUIaIUnjGZyWaArVQQpD4ffZqtgh94f99yjEou6wxYiZ7N/xtxTXNNutLFr5s7
 F09FY0UplqydV9vU1tHRD1YDCQSTkCsAAAZ6QA4qTZTBZBrvXTNKrXGyzFKLp2vaS3Bt72Fpd
 yTR/GiQt03C8McLYVNls3NwixcXXH1LfMLpabA8DiKQIfNufWwRvDUbJgO+iL59stNcIhpJKI
 IDBagfWnY8A4KKWRYjAOgMJdpWXq2eb8281U0qQGdiWP2+NBKNATEDt4DY8+RGXc/W4EJBh0S
 Val/9fxuGrafoJ9OuerKDGBVlsznwotcWY6/4RbPwHDeJWQyvoTOGdWEPiSIMp6XsvQCLHy2y
 vbSyK+BAiUT04cBiaAhUuKOvsVh6CW0jgteLU7gPn0U6b84YriAwArx1N2sk4SoGbrksU9Yp3
 o1ekgV4Brw==
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
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
X-List-Received-Date: Sat, 20 Feb 2021 12:35:55 -0000

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Change generated automatically using the Coccinelle
patch included in commit bf853881690 ("qdev: use
device_class_set_parent_realize/unrealize/reset()")

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210201080348.438095-1-f4bug@amsat.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 target/avr/cpu.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/target/avr/cpu.c b/target/avr/cpu.c
index fa0f8e0e80e8..0f4596932baf 100644
--- a/target/avr/cpu.c
+++ b/target/avr/cpu.c
@@ -203,9 +203,7 @@ static void avr_cpu_class_init(ObjectClass *oc, void *data)
     CPUClass *cc = CPU_CLASS(oc);
     AVRCPUClass *mcc = AVR_CPU_CLASS(oc);
 
-    mcc->parent_realize = dc->realize;
-    dc->realize = avr_cpu_realizefn;
-
+    device_class_set_parent_realize(dc, avr_cpu_realizefn, &mcc->parent_realize);
     device_class_set_parent_reset(dc, avr_cpu_reset, &mcc->parent_reset);
 
     cc->class_by_name = avr_cpu_class_by_name;
-- 
2.29.2


