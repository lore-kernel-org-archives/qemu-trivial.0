Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lXLct-0006xe-13
	for mharc-qemu-trivial@gnu.org; Fri, 16 Apr 2021 06:23:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1lXLcp-0006x0-3y; Fri, 16 Apr 2021 06:23:00 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:33255)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1lXLcm-0002XP-Kv; Fri, 16 Apr 2021 06:22:58 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 5F9134064D;
 Fri, 16 Apr 2021 13:22:44 +0300 (MSK)
Received: from tls.msk.ru (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with SMTP id 4299E8C;
 Fri, 16 Apr 2021 13:22:44 +0300 (MSK)
Received: (nullmailer pid 1293921 invoked by uid 1000);
 Fri, 16 Apr 2021 10:22:44 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 Prasad J Pandit <pjp@fedoraproject.org>, qemu-stable@nongnu.org
Subject: [PATCH] mptsas: remove unused MPTSASState.pending (CVE-2021-3392)
Date: Fri, 16 Apr 2021 13:22:43 +0300
Message-Id: <20210416102243.1293871-1-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 16 Apr 2021 10:23:00 -0000

During previous attempt to fix CVE-2021-3392 it was discovered
that MPTSASState.pending is actually not used. So instead of
fixing the prob, just remove the offending code entirely

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
Cc: Prasad J Pandit <pjp@fedoraproject.org>
Cc: qemu-stable@nongnu.org
---
 hw/scsi/mptsas.c | 4 ----
 hw/scsi/mptsas.h | 1 -
 2 files changed, 5 deletions(-)

diff --git a/hw/scsi/mptsas.c b/hw/scsi/mptsas.c
index 7416e78706..5abbc742aa 100644
--- a/hw/scsi/mptsas.c
+++ b/hw/scsi/mptsas.c
@@ -257,7 +257,6 @@ static void mptsas_free_request(MPTSASRequest *req)
         req->sreq->hba_private = NULL;
         scsi_req_unref(req->sreq);
         req->sreq = NULL;
-        QTAILQ_REMOVE(&s->pending, req, next);
     }
     qemu_sglist_destroy(&req->qsg);
     g_free(req);
@@ -303,7 +302,6 @@ static int mptsas_process_scsi_io_request(MPTSASState *s,
     }
 
     req = g_new0(MPTSASRequest, 1);
-    QTAILQ_INSERT_TAIL(&s->pending, req, next);
     req->scsi_io = *scsi_io;
     req->dev = s;
 
@@ -1319,8 +1317,6 @@ static void mptsas_scsi_realize(PCIDevice *dev, Error **errp)
 
     s->request_bh = qemu_bh_new(mptsas_fetch_requests, s);
 
-    QTAILQ_INIT(&s->pending);
-
     scsi_bus_new(&s->bus, sizeof(s->bus), &dev->qdev, &mptsas_scsi_info, NULL);
 }
 
diff --git a/hw/scsi/mptsas.h b/hw/scsi/mptsas.h
index b85ac1a5fc..c046497db7 100644
--- a/hw/scsi/mptsas.h
+++ b/hw/scsi/mptsas.h
@@ -79,7 +79,6 @@ struct MPTSASState {
     uint16_t reply_frame_size;
 
     SCSIBus bus;
-    QTAILQ_HEAD(, MPTSASRequest) pending;
 };
 
 void mptsas_fix_scsi_io_endianness(MPIMsgSCSIIORequest *req);
-- 
2.30.2


