Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jBedY-0007zF-MM
	for mharc-qemu-trivial@gnu.org; Tue, 10 Mar 2020 09:09:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49121)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kuhn.chenqun@huawei.com>) id 1jBedW-0007uT-FE
 for qemu-trivial@nongnu.org; Tue, 10 Mar 2020 09:09:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kuhn.chenqun@huawei.com>) id 1jBedV-0007fa-Dr
 for qemu-trivial@nongnu.org; Tue, 10 Mar 2020 09:09:30 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:3195 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1jBedQ-0007A7-Jp; Tue, 10 Mar 2020 09:09:24 -0400
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 8E56AFBD1529C551D146;
 Tue, 10 Mar 2020 21:09:13 +0800 (CST)
Received: from huawei.com (10.133.205.93) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.487.0; Tue, 10 Mar 2020
 21:09:07 +0800
From: Chen Qun <kuhn.chenqun@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
CC: <zhang.zhanghailiang@huawei.com>, Chen Qun <kuhn.chenqun@huawei.com>,
 Euler Robot <euler.robot@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Fam Zheng <fam@euphon.net>, Hannes Reinecke <hare@suse.com>,
 <qemu-block@nongnu.org>
Subject: [PATCH] hw/scsi/megasas:Clean up some redundant code fix Clang
 warnings
Date: Tue, 10 Mar 2020 21:08:44 +0800
Message-ID: <20200310130844.30076-1-kuhn.chenqun@huawei.com>
X-Mailer: git-send-email 2.21.0.windows.1
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
X-List-Received-Date: Tue, 10 Mar 2020 13:09:31 -0000

Here are some redundant statements, we can clean them up.
Clang static code analyzer show warning:
hw/scsi/megasas.c:1175:32: warning: Value stored to 'max_ld_disks' during=
 its initialization is never read
    uint32_t num_ld_disks =3D 0, max_ld_disks =3D s->fw_luns;
                               ^~~~~~~~~~~~   ~~~~~~~~~~
hw/scsi/megasas.c:1183:9: warning: Value stored to 'max_ld_disks' is neve=
r read
        max_ld_disks =3D 0;
        ^              ~

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
---
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Fam Zheng <fam@euphon.net>
Cc: Hannes Reinecke <hare@suse.com>
Cc: qemu-block@nongnu.org
---
 hw/scsi/megasas.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/scsi/megasas.c b/hw/scsi/megasas.c
index af18c88b65..3f982e1d3b 100644
--- a/hw/scsi/megasas.c
+++ b/hw/scsi/megasas.c
@@ -1172,7 +1172,7 @@ static int megasas_dcmd_ld_list_query(MegasasState =
*s, MegasasCmd *cmd)
     uint16_t flags;
     struct mfi_ld_targetid_list info;
     size_t dcmd_size =3D sizeof(info), resid;
-    uint32_t num_ld_disks =3D 0, max_ld_disks =3D s->fw_luns;
+    uint32_t num_ld_disks =3D 0, max_ld_disks;
     BusChild *kid;
=20
     /* mbox0 contains flags */
@@ -1180,7 +1180,6 @@ static int megasas_dcmd_ld_list_query(MegasasState =
*s, MegasasCmd *cmd)
     trace_megasas_dcmd_ld_list_query(cmd->index, flags);
     if (flags !=3D MR_LD_QUERY_TYPE_ALL &&
         flags !=3D MR_LD_QUERY_TYPE_EXPOSED_TO_HOST) {
-        max_ld_disks =3D 0;
     }
=20
     memset(&info, 0, dcmd_size);
--=20
2.23.0



