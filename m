Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1swknb-0002ZU-Ju
	for mharc-qemu-trivial@gnu.org; Fri, 04 Oct 2024 12:04:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1swknW-0002Uu-SB; Fri, 04 Oct 2024 12:04:54 -0400
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1swknV-0001f8-Cl; Fri, 04 Oct 2024 12:04:54 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id AE31C95576;
 Fri,  4 Oct 2024 19:03:30 +0300 (MSK)
Received: from tls.msk.ru (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with SMTP id E81F514D984;
 Fri,  4 Oct 2024 19:03:32 +0300 (MSK)
Received: (nullmailer pid 1282557 invoked by uid 1000);
 Fri, 04 Oct 2024 16:03:32 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: "Dr. David Alan Gilbert" <dave@treblig.org>, qemu-trivial@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>
Subject: [PULL 17/23] hw/net/rocker: Remove unused rocker_fp_ports
Date: Fri,  4 Oct 2024 19:03:25 +0300
Message-Id: <20241004160331.1282441-18-mjt@tls.msk.ru>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241004160331.1282441-1-mjt@tls.msk.ru>
References: <20241004160331.1282441-1-mjt@tls.msk.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 04 Oct 2024 16:04:57 -0000

From: "Dr. David Alan Gilbert" <dave@treblig.org>

rocker_fp_ports hasn't been used since it was added back in 2015.
Remove it.

Signed-off-by: Dr. David Alan Gilbert <dave@treblig.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Michael Tokarev <mjt@tls.msk.ru>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/net/rocker/rocker.c | 5 -----
 hw/net/rocker/rocker.h | 1 -
 2 files changed, 6 deletions(-)

diff --git a/hw/net/rocker/rocker.c b/hw/net/rocker/rocker.c
index 1ab5852113..5e74acc969 100644
--- a/hw/net/rocker/rocker.c
+++ b/hw/net/rocker/rocker.c
@@ -134,11 +134,6 @@ RockerPortList *qmp_query_rocker_ports(const char *name, Error **errp)
     return list;
 }
 
-uint32_t rocker_fp_ports(Rocker *r)
-{
-    return r->fp_ports;
-}
-
 static uint32_t rocker_get_pport_by_tx_ring(Rocker *r,
                                             DescRing *ring)
 {
diff --git a/hw/net/rocker/rocker.h b/hw/net/rocker/rocker.h
index f85354d9d1..6e0962f47a 100644
--- a/hw/net/rocker/rocker.h
+++ b/hw/net/rocker/rocker.h
@@ -72,7 +72,6 @@ DECLARE_INSTANCE_CHECKER(Rocker, ROCKER,
                          TYPE_ROCKER)
 
 Rocker *rocker_find(const char *name);
-uint32_t rocker_fp_ports(Rocker *r);
 int rocker_event_link_changed(Rocker *r, uint32_t pport, bool link_up);
 int rocker_event_mac_vlan_seen(Rocker *r, uint32_t pport, uint8_t *addr,
                                uint16_t vlan_id);
-- 
2.39.5


