Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kD6zf-0006RC-KH
	for mharc-qemu-trivial@gnu.org; Tue, 01 Sep 2020 10:10:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1kD6zZ-00068F-B5; Tue, 01 Sep 2020 10:10:33 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:50851)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1kD6zW-0003zy-UZ; Tue, 01 Sep 2020 10:10:32 -0400
Received: from localhost.localdomain ([82.252.135.186]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MNbtD-1jxMK82hqd-00P8ha; Tue, 01 Sep 2020 16:10:19 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, qemu-trivial@nongnu.org,
 Chen Qun <kuhn.chenqun@huawei.com>, Euler Robot <euler.robot@huawei.com>,
 Igor Mammedov <imammedo@redhat.com>, Li Qiang <liq3ea@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>
Subject: [PULL 33/44] hw/arm/virt-acpi-build:Remove dead assignment in
 build_madt()
Date: Tue,  1 Sep 2020 16:09:43 +0200
Message-Id: <20200901140954.889743-34-laurent@vivier.eu>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200901140954.889743-1-laurent@vivier.eu>
References: <20200901140954.889743-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:oQPZDAL/Uc7IBntevT0HPBD1FgetWCj+mEEhbF4GaLWE73Ma14e
 YC5dcrZibK7QRywuVad+oaVSniXSvdILlwhqDM6cl1LMGL+r2AHrVf9GJL1wy7Bp5JIeXyu
 yVcEvn8uute6p59xF3hDcdo4AODoMqYDTeSu5t4xilrl95u/a32Lk4FzFbiVmPnddfdyqxv
 VGvzQGj/K+PRP8eDDKn2g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:AwjkbcbUPc4=:MMEFqkK3+JnoHhEcHFlzpK
 yNFJWPYv/ZizOOGcrntedaJoa2ZwJ5lfYvtg4+aDAhdJLj0pEvuWqc9JUNfAbVhiaUHIyLXst
 xout0blgGI177XH3FucHTd+Jg4bh9tkIhflMYfQR8NHAvwJhE5NPhVThz4poRTXeTzLPt2y53
 UueksoYujOeEyFBI8/GFvBx/2880ggFo6AYXvBIw/33P/ws8LathJrs/2E9LmNjIj00O/LM0d
 8IAzk9YWEjOZea+Z+z2oYyjdYnJKwvL413uUHS9Aa9TRQN+t+7+2l8CLpWK2UhyCIM5ncKwbu
 nWi9fbVEkBOLPFS4wzbOrrhHVCrkPbu4iMz/XnTwDWjNXV+WebRg9tc5YzLoOu6ev/AQI3O2e
 sTN9Q6oNeQ1EFkHmB2X3lAgTZQsQkO2liWTqt8om7vTro9V4/8DAVK+l4hDayGzCltMtMjKlE
 MAJB6HNBbBN68LVw9ryEQGV6pWOVwcOu7udqgbhH+7biDiIRQpphDjopu91x1FgkvtPybQ85f
 TW7lRIoHaOdTZ4d0W4nEOe2ftls5w08bDrvKgzNHSmbKGFUHpIh6Kywlu0PmOBusQmEYcK2NV
 PM+4oF5vFgKG5duQvsYniE/1IUMIM2EGjX0B0nVsMrvgocTqdSq5rBqYadCpJaQo8x0iHxNtf
 mDU7DiWuNWZfjU03Rq3ZE7146h9W+2Bj200IbXzH9OOsVGzasbwlReesuwOFTZ2zY8+z8No43
 e4eWUactkOlJQT7yg5L+EqDuVlNVtL1c6FxMEJLoSmMDCKyZsGpUZNJH2cHohawhgZ7IqTJsj
 m+DgmbrRnH9Lv352kYZQBF9GxGI9KsF1GFVoPEOKevWA2jjgU1rbkB8gJgfI9ddUuB+N/Hl
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/01 10:10:07
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
X-List-Received-Date: Tue, 01 Sep 2020 14:10:34 -0000

From: Chen Qun <kuhn.chenqun@huawei.com>

Clang static code analyzer show warning:
hw/arm/virt-acpi-build.c:641:5: warning: Value stored to 'madt' is never read
    madt = acpi_data_push(table_data, sizeof *madt);
    ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Li Qiang <liq3ea@gmail.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Message-Id: <20200827110311.164316-2-kuhn.chenqun@huawei.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/arm/virt-acpi-build.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 0a482ff6f734..9efd7a388150 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -633,12 +633,11 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     int madt_start = table_data->len;
     const MemMapEntry *memmap = vms->memmap;
     const int *irqmap = vms->irqmap;
-    AcpiMultipleApicTable *madt;
     AcpiMadtGenericDistributor *gicd;
     AcpiMadtGenericMsiFrame *gic_msi;
     int i;
 
-    madt = acpi_data_push(table_data, sizeof *madt);
+    acpi_data_push(table_data, sizeof(AcpiMultipleApicTable));
 
     gicd = acpi_data_push(table_data, sizeof *gicd);
     gicd->type = ACPI_APIC_GENERIC_DISTRIBUTOR;
-- 
2.26.2


