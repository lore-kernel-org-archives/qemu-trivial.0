Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lDRUJ-0007BC-Kc
	for mharc-qemu-trivial@gnu.org; Sat, 20 Feb 2021 07:35:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lDRUH-00075Q-Fg; Sat, 20 Feb 2021 07:35:53 -0500
Received: from mout.kundenserver.de ([212.227.17.24]:35919)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lDRUE-0003Mc-8H; Sat, 20 Feb 2021 07:35:53 -0500
Received: from localhost.localdomain ([82.252.134.158]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1N8X9L-1lr1a43V2H-014QU6; Sat, 20 Feb 2021 13:35:38 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>, qemu-trivial@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Gan Qixin <ganqixin@huawei.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Subject: [PULL 08/12] tpm: put some tpm devices into the correct category
Date: Sat, 20 Feb 2021 13:35:21 +0100
Message-Id: <20210220123525.1353731-9-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210220123525.1353731-1-laurent@vivier.eu>
References: <20210220123525.1353731-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:315G45u9ruNXWIg974Ogb+dqNU0/iZuh/lNtZGUGALgrUUuE4dJ
 1R7NiR75M5NtB2A97tRIYT2bG1Uz9iSpt3khW8IqwCNfrqzTPpMijDEHudRQO85ZuxzCqPD
 46IwYUKW63rxrHbhwb3VZbiUDsO81+LGgFBqIX305ovWJWS60LtMOvFzBT2bvXEQBWxH1Bv
 H7mXVfHCyL8U9gGzcI3JQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:V7XhFQZ8/zg=:yzI2+eRklNvXMURMipUpP9
 XUHujTQ8fPxFy/NvbNvIanF7fAuRlJg4mEodk8UJzXq/b071hG9/f7Ad1MalSQzjiqcT5Ar2z
 3HKUYvPome/Okw3DkyRno34Axh1mwyh2OyC5dWsqmDKec2ib23zz39OtcvMLm7m1sju73AXBH
 LkSbX7BAZlOfmEbKHliCof8Rbrf9G1Nee5IttTUo4MOyBORG0H3QnLMcntYHURK91YxY4GzfX
 Hx2iNN1Qq0OZJF4BoXQY4o8gLEiKyrpfXAXya4oQ4zJ2KxVs2gmK9N70MwPvG6/kBhkMHFLD0
 p0KTCyBDGpmwxizSatqou6BJnk4QkQht3kLVQjIFOXtQ9XmfyB0evaiBWyJQdD2FnmY+/CwDR
 wTQbPJSY3qByImmnD48W6142ZC2DXjzcRXhFccvlxruo8FNgpax7KaTzC2UgkMKeSbv7G779y
 s1G1wvzE+Q==
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
X-List-Received-Date: Sat, 20 Feb 2021 12:35:54 -0000

From: Gan Qixin <ganqixin@huawei.com>

Some tpm devices have no category, put them into the correct category.

Signed-off-by: Gan Qixin <ganqixin@huawei.com>
Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
Message-Id: <20201130083630.2520597-8-ganqixin@huawei.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/tpm/tpm_tis_isa.c    | 1 +
 hw/tpm/tpm_tis_sysbus.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/hw/tpm/tpm_tis_isa.c b/hw/tpm/tpm_tis_isa.c
index 6fd876eebf14..10d8a14f19f6 100644
--- a/hw/tpm/tpm_tis_isa.c
+++ b/hw/tpm/tpm_tis_isa.c
@@ -150,6 +150,7 @@ static void tpm_tis_isa_class_init(ObjectClass *klass, void *data)
     dc->reset = tpm_tis_isa_reset;
     tc->request_completed = tpm_tis_isa_request_completed;
     tc->get_version = tpm_tis_isa_get_tpm_version;
+    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
 }
 
 static const TypeInfo tpm_tis_isa_info = {
diff --git a/hw/tpm/tpm_tis_sysbus.c b/hw/tpm/tpm_tis_sysbus.c
index 2c32aa709934..45e63efd6374 100644
--- a/hw/tpm/tpm_tis_sysbus.c
+++ b/hw/tpm/tpm_tis_sysbus.c
@@ -139,6 +139,7 @@ static void tpm_tis_sysbus_class_init(ObjectClass *klass, void *data)
     dc->reset = tpm_tis_sysbus_reset;
     tc->request_completed = tpm_tis_sysbus_request_completed;
     tc->get_version = tpm_tis_sysbus_get_tpm_version;
+    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
 }
 
 static const TypeInfo tpm_tis_sysbus_info = {
-- 
2.29.2


