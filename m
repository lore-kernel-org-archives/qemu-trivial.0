Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jGwGi-0001Ba-F9
	for mharc-qemu-trivial@gnu.org; Tue, 24 Mar 2020 22:59:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45491)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kuhn.chenqun@huawei.com>) id 1jGwGf-00014X-Q7
 for qemu-trivial@nongnu.org; Tue, 24 Mar 2020 22:59:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kuhn.chenqun@huawei.com>) id 1jGwGe-000513-MW
 for qemu-trivial@nongnu.org; Tue, 24 Mar 2020 22:59:45 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:3213 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1jGwGc-0004x2-92; Tue, 24 Mar 2020 22:59:42 -0400
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 9D30A52F1980FDBAAC69;
 Wed, 25 Mar 2020 10:59:37 +0800 (CST)
Received: from huawei.com (10.133.205.93) by DGGEMS403-HUB.china.huawei.com
 (10.3.19.203) with Microsoft SMTP Server id 14.3.487.0; Wed, 25 Mar 2020
 10:59:27 +0800
From: Chen Qun <kuhn.chenqun@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
CC: <zhang.zhanghailiang@huawei.com>, <laurent@vivier.eu>,
 <philmd@redhat.com>, Chen Qun <kuhn.chenqun@huawei.com>, Euler Robot
 <euler.robot@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v5 1/3] scsi/esp-pci: add g_assert() for fix clang analyzer
 warning in esp_pci_io_write()
Date: Wed, 25 Mar 2020 10:59:17 +0800
Message-ID: <20200325025919.21316-2-kuhn.chenqun@huawei.com>
X-Mailer: git-send-email 2.21.0.windows.1
In-Reply-To: <20200325025919.21316-1-kuhn.chenqun@huawei.com>
References: <20200325025919.21316-1-kuhn.chenqun@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.133.205.93]
X-CFilter-Loop: Reflected
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.190
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
X-List-Received-Date: Wed, 25 Mar 2020 02:59:47 -0000

Clang static code analyzer show warning:
  hw/scsi/esp-pci.c:198:9: warning: Value stored to 'size' is never read
        size =3D 4;
        ^      ~

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
---
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc:Fam Zheng <fam@euphon.net>

v1->v2:
keep ' size =3D 4'  and  add 'g_assert(size >=3D 4)' after if() statement=
.
(Base on Laurent's comments)
---
 hw/scsi/esp-pci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/scsi/esp-pci.c b/hw/scsi/esp-pci.c
index d5a1f9e017..497a8d5901 100644
--- a/hw/scsi/esp-pci.c
+++ b/hw/scsi/esp-pci.c
@@ -197,6 +197,7 @@ static void esp_pci_io_write(void *opaque, hwaddr add=
r,
         addr &=3D ~3;
         size =3D 4;
     }
+    g_assert(size >=3D 4);
=20
     if (addr < 0x40) {
         /* SCSI core reg */
--=20
2.23.0



