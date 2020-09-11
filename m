Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kGoo1-0002wr-8W
	for mharc-qemu-trivial@gnu.org; Fri, 11 Sep 2020 15:33:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1kGonz-0002rF-71; Fri, 11 Sep 2020 15:33:55 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:37531)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1kGonx-0000pt-Fv; Fri, 11 Sep 2020 15:33:54 -0400
Received: from localhost.localdomain ([82.252.129.222]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MlbPO-1kyAJM1Ox0-00ikm8; Fri, 11 Sep 2020 21:33:46 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, qemu-trivial@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PULL 11/18] kconfig: fix comment referring to old Makefiles
Date: Fri, 11 Sep 2020 21:33:23 +0200
Message-Id: <20200911193330.1148942-12-laurent@vivier.eu>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200911193330.1148942-1-laurent@vivier.eu>
References: <20200911193330.1148942-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:JbJE6hEwoNqmKtwsTiUeACjKP1Ty9bABu8wpcMB39zJV4Adg3Zl
 R61wQJXshlbM+sFknRYk2vENeeISaH2LWRgiqFpLxLJHyBQJcGZ0B5e6figS8bv6XGbnQ90
 04dHuzj/dv1JxIs99Dn+E2nUc5MnMvbi5dBz2+qTFZi7aaK787Vv7Sr5GOkQqenXLu5m4jz
 C2jvGwUaK9cigc5Gx0alg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:x3n0pGJDLXE=:/fJJsH/gGymy+uK8sdmUsY
 YMpZ79v9YnR0kWkcBu2z7lxAulZfR5N3sgLTR6tRbT5X8G8caWLJdFlUbwbBl1rborGqywzV/
 HTBNWEAO/r3apyhM2QRiBcFFMFDt8eTIyM7NeROrAe5gIcQgzkeAl+dWwiFFGl0loml2BlGwD
 7U1qQAEydUwHUGNN0Aa6kikNFf2D1DNicdXFjmDux73f8rdp34KbrCFaYQHGI+IiSdrpDroXg
 jBBlDZtEgEw4wOjoI6H8erd7ON03Zlp7ydX8tjNNXrZJ3g06m73rnUsGtg0QYFViYRa2SAm43
 I+In2SOt1FVFaEdMDyOyCkg/P7a7ywzwDcll60GuVpB2C8gQD81b8S0B5N9KFIm4zQ24eyisy
 zXo/FJ0TvDRRZ6WkaTL1IMnKNAjnpBf+AU4i7wJlROYHZSRJ7j7qDjvrhMp4EGSy72FKoKRiU
 ZbOM57YnOrPFS5u/8Q+VZOe+THSdMlPp5ZhL1E2EjcVS/3D0RfN3nfks3FPSBWDRCBmcSvK9S
 yJ2eVK/FfrDapObuaeSb3GpTllRUOMde3Fxtbxvh8gr24w1xnoU3PkZ/CQ60rGzkYnr1Gqydo
 swkePXB98/+tqxtAHhcGOLR1e4FZjw8+g9tRL++lrr38cBykEB98doIkFQY9CFMpbvoLARnEd
 LuvrHmBbPHDO92W8QCW99nyVCu9P643cuKU9NGR1MxmXBK1ndN9ZOoDqHLSGfaFC7Ne7JC/pj
 Wbm1NZA+zSImOVPGqarygZxuHyLC/rfaExUkK41W3dSCZ7hyjALqVLM2mcX8yi3yCIftqBTHd
 zs8QHIIOT6KU4I21w5I2Havluoueh1IcPYjJ0G4cS8+/OKTAh21mT96TVPWW1TQpbzKn9Rn
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/11 15:33:45
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
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
X-List-Received-Date: Fri, 11 Sep 2020 19:33:55 -0000

From: Paolo Bonzini <pbonzini@redhat.com>

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20200908094244.26327-1-pbonzini@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 Kconfig.host | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Kconfig.host b/Kconfig.host
index a6d871c399d0..4af19bf70ef9 100644
--- a/Kconfig.host
+++ b/Kconfig.host
@@ -1,6 +1,6 @@
 # These are "proxy" symbols used to pass config-host.mak values
-# down to Kconfig.  See also MINIKCONF_ARGS in the Makefile:
-# these two need to be kept in sync.
+# down to Kconfig.  See also kconfig_external_symbols in
+# meson.build: these two need to be kept in sync.
 
 config LINUX
     bool
-- 
2.26.2


