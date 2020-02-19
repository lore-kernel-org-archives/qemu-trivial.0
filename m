Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j4MQC-0004M0-HS
	for mharc-qemu-trivial@gnu.org; Wed, 19 Feb 2020 05:17:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53603)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1j4MPw-0003jJ-6b
 for qemu-trivial@nongnu.org; Wed, 19 Feb 2020 05:17:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1j4MPu-0005YZ-Vd
 for qemu-trivial@nongnu.org; Wed, 19 Feb 2020 05:17:20 -0500
Received: from mout.kundenserver.de ([217.72.192.73]:43541)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1j4MPu-0005VQ-Iy; Wed, 19 Feb 2020 05:17:18 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1McHM2-1jaONM07IK-00cgh9; Wed, 19 Feb 2020 11:16:52 +0100
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
 Chen Qun <kuhn.chenqun@huawei.com>, Euler Robot <euler.robot@huawei.com>
Subject: [PULL 17/17] hw/xtensa/xtfpga:fix leak of fdevice tree blob
Date: Wed, 19 Feb 2020 11:16:12 +0100
Message-Id: <20200219101612.1033925-18-laurent@vivier.eu>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200219101612.1033925-1-laurent@vivier.eu>
References: <20200219101612.1033925-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:2d2DdnBIT4QzL6xniwXm6iBbRodr9Z9EJgRhZyD11lTxEOZi5ih
 jzkXcdw805ZSlb6qs8qrMskTlO9hiW7BdZveZ84yjog/lIFx1wRSYviWMpcjXcPI0zgAubW
 NXKwC90SodKEbaHPzlw6hOApbQf9VEM90b94R7XuCuiutC24oWen4Tz8gyudsuQGxB/EIfE
 FbJTPSbTwBM0rX0y4XZuA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ARdIMovQ8QM=:/udeQ+opwPyE+3PMD2T7+V
 LV1U6CoLgQ6itRUERxmiE70V3DBGdEpWWaMs9IB3K6bXN4f1/BByhpLE9O+36Ar4pPe1HwvIH
 TOXgnrH/qnnWVCIEUe2rTH/h5wIPATlnj8sdzWb3qJnGHJZ1fRNH4dLx6zppMCTxCYZvpJgOe
 eeV55IDrlwpTr72z5x2LI88zvd0sInaReVNpp89HjCf9P/99WQHaqVEx4viTpHCpes20Fpcmz
 4wm76XRFL//ozV/V+TRQ19ouAd8LfuFNYkXoNkj5Yq8BSsVlRdhruTH2zHfjDJovglTb0OzMZ
 zeo7Lq5T1YgbRPBaO2nPSCQR51p0qEXqEpgsDMvKlj/1gSV5Eza8uHgoZ+KK+guCQcJl3xKs0
 RTUIs7GaNcJsmJo3cxdvpO7MKCX5BNeEtx3SrgwjXIqT3LogOnNGwtU0C1Z9m4jwYEbElEUgV
 zJZeSSJ8nQ+wjcYatF3hE+tJ9PDd3TVFob3RXuGDkZS0mD72NS8RYRhJ8eWXWPUUpNcW71ngP
 f8shO4TBD2W8uoShLtCpe9Bz+f0vMkL1z9/8Aihhy2A3tVFesQi1WzcjgLdGsn8j8gdY593Rk
 PTUKcEhlHnId5M9KkGzPxjXGpLsLFnWCXVIiPu+OasCTE+UTfmQkcB9WIbRBfLMUqAFJWO4Dk
 IIhi8BzCaYWpWqzuwa5955FTb9kYgtchip15rCD4ZxPV2cTKHQ99wOE6H6Utlnvj7osOJsEG9
 5J3rPAECW7z7U6AMb754HNcxu3XmyQuhRV3ujJdcV2iE6tK4S2omcn6b0pE9sopU03yXkm+oF
 ZHND4497IU9FXGHMi6zCtg9ZP+50YP7QCiwPQQPY+4+/yUo1ouO6KBbko3Kj7FFOmaNhqDz
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 217.72.192.73
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
X-List-Received-Date: Wed, 19 Feb 2020 10:17:23 -0000

From: Chen Qun <kuhn.chenqun@huawei.com>

The device tree blob returned by load_device_tree is malloced.
We should free it after cpu_physical_memory_write().

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
Acked-by: Max Filippov <jcmvbkbc@gmail.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20200218091154.21696-4-kuhn.chenqun@huawei.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/xtensa/xtfpga.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/xtensa/xtfpga.c b/hw/xtensa/xtfpga.c
index 8e2dd1327a46..60ccc74f5f1d 100644
--- a/hw/xtensa/xtfpga.c
+++ b/hw/xtensa/xtfpga.c
@@ -380,6 +380,7 @@ static void xtfpga_init(const XtfpgaBoardDesc *board, MachineState *machine)
             cur_tagptr = put_tag(cur_tagptr, BP_TAG_FDT,
                                  sizeof(dtb_addr), &dtb_addr);
             cur_lowmem = QEMU_ALIGN_UP(cur_lowmem + fdt_size, 4 * KiB);
+            g_free(fdt);
         }
 #else
         if (dtb_filename) {
-- 
2.24.1


