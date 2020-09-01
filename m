Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kD6zk-0006gD-Ik
	for mharc-qemu-trivial@gnu.org; Tue, 01 Sep 2020 10:10:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1kD6zS-0005ns-Nv; Tue, 01 Sep 2020 10:10:26 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:44715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1kD6zJ-0003qF-Sf; Tue, 01 Sep 2020 10:10:26 -0400
Received: from localhost.localdomain ([82.252.135.186]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1M5wTr-1kF1jc3fVD-007TIE; Tue, 01 Sep 2020 16:10:12 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 22/44] util/vfio-helpers: Fix typo in description
Date: Tue,  1 Sep 2020 16:09:32 +0200
Message-Id: <20200901140954.889743-23-laurent@vivier.eu>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200901140954.889743-1-laurent@vivier.eu>
References: <20200901140954.889743-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:fvs2r8nQPYulppaFIXhHwCIGgOisL/qy2m9RS/M+1rJ4NyO43gZ
 nh0UWjyY88OttrEvUyHl2EQ80u6NM/TQiS3NrUwLIqOwEKEQbQhPGNKt4wKkBAiOA0tHSej
 8c2okxweiXjg9n4vITh65IwjVjxE92CHS2BA+qRWFcs3G4JBWIQdjSwtA/2nCSNGBPlxuTe
 GTF6SurCL6mZc+Ia+Jfvg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:1Lg0SCjDYZQ=:MDPmLqx/8Ug5OmS7PPs/Lh
 kmAjbJUcuQPGnv84pxg3lw5Br7pyaokw0lRUH+kG5SLLSnldAC3JwjQv4dfeb0/yTqJNh0nBG
 t7zhotU0KXtxR5cXrmJTP4fhWjPwLaYnes41NeOuex8qUlukWqwIXlv9NDdJdektd55B59ECh
 Y6Mc6TDc7y7b9nszXFQNNOjXQQ72+DsjoJwB4ane6jxG1/cEVDUCTyYXoPiiPZbnUwEZR1nXI
 KbbHLWFSeiJC7fXdGHQVU0m4sOTXwKBhoPxYxECKXq1sUhOcbSpG2qtggUrrekUXTn+CbrL0C
 fGvOUI7ksDRE4YMuEsVz8wKRLTuGzkQV1hsAsuiY0BS03QfpbqFefytWfQKtPtB8bu0SCLkkk
 jwIkd33uKpuLgaH7lmKLx5otBznPJdlpm6Pt/tND6P3S/v5RbbNHZdacL/JQ6wE3kzLdlJAZ8
 yz4sFyCMUBTpgCawas5Zs3dn1MhaIV6+LA/iZ8sEhBsc05vC+qc5OgMLOpyH90WIKE1ko3xO8
 E/K58+4/jCoQoiPYYRU6vX+2+WKvmIPtA2dReREgtEL58WT3fSIn5Mqql5PvGSVLG8OZi1r3A
 RP3WvGUaP9jXC4QL8Zw15fl0Y0a01G+sFqbrI88UnzXM7XJNwqCM2SRr/mq+q8m3leMve87NF
 SPnmLJgs62b7O3qOUtcuolag41rTwCJzxGPEWeosNqq2onGi77/OYFn16wmxq711BLnnPNWCP
 gQxvobjS1alYY91kZlsK5po4Ihwt8UacTfj8/EJBv/ayLswxCyNPPABONQNd/YYl/Hf3Tjw05
 1NkcdV6dzSED/Wd68BAjq54iHfLezmVj8hvfiyfsVAcXp32BL08Eupw3WZySG9GzpnyuRc5
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/01 10:09:57
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
X-List-Received-Date: Tue, 01 Sep 2020 14:10:27 -0000

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Remove the second 'and' introduced in commit 418026ca43
("util: Introduce vfio helpers").

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Li Qiang <liq3ea@gmail.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20200811151643.21293-4-philmd@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 util/vfio-helpers.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/util/vfio-helpers.c b/util/vfio-helpers.c
index e399e330e26a..583bdfb36fc2 100644
--- a/util/vfio-helpers.c
+++ b/util/vfio-helpers.c
@@ -173,7 +173,7 @@ void qemu_vfio_pci_unmap_bar(QEMUVFIOState *s, int index, void *bar,
 }
 
 /**
- * Initialize device IRQ with @irq_type and and register an event notifier.
+ * Initialize device IRQ with @irq_type and register an event notifier.
  */
 int qemu_vfio_pci_init_irq(QEMUVFIOState *s, EventNotifier *e,
                            int irq_type, Error **errp)
@@ -505,7 +505,7 @@ static IOVAMapping *qemu_vfio_find_mapping(QEMUVFIOState *s, void *host,
 }
 
 /**
- * Allocate IOVA and and create a new mapping record and insert it in @s.
+ * Allocate IOVA and create a new mapping record and insert it in @s.
  */
 static IOVAMapping *qemu_vfio_add_mapping(QEMUVFIOState *s,
                                           void *host, size_t size,
-- 
2.26.2


