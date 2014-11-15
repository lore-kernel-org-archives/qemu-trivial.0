Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XpaGc-0006mt-6p
	for mharc-qemu-trivial@gnu.org; Sat, 15 Nov 2014 05:07:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57047)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XpaGU-0006Vx-4r
	for qemu-trivial@nongnu.org; Sat, 15 Nov 2014 05:07:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XpaGM-0003uu-DB
	for qemu-trivial@nongnu.org; Sat, 15 Nov 2014 05:07:34 -0500
Received: from szxga03-in.huawei.com ([119.145.14.66]:53390)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1XpaG4-0003iL-0p; Sat, 15 Nov 2014 05:07:11 -0500
Received: from 172.24.2.119 (EHLO szxeml420-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id AXD50458; Sat, 15 Nov 2014 18:07:03 +0800 (CST)
Received: from localhost (10.177.19.102) by szxeml420-hub.china.huawei.com
	(10.82.67.159) with Microsoft SMTP Server id 14.3.158.1;
	Sat, 15 Nov 2014 18:06:53 +0800
From: <arei.gonglei@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Sat, 15 Nov 2014 18:06:45 +0800
Message-ID: <1416046008-7880-7-git-send-email-arei.gonglei@huawei.com>
X-Mailer: git-send-email 1.7.3.1.msysgit.0
In-Reply-To: <1416046008-7880-1-git-send-email-arei.gonglei@huawei.com>
References: <1416046008-7880-1-git-send-email-arei.gonglei@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020209.546725C7.00E9, ss=1, re=0.001, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 1a2726984256d444d6b859607b430fb9
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Cc: weidong.huang@huawei.com, zhang.zhanghailiang@huawei.com,
	qemu-trivial@nongnu.org, mjt@tls.msk.ru,
	peter.huangpeng@huawei.com, Gonglei <arei.gonglei@huawei.com>,
	pbonzini@redhat.com
Subject: [Qemu-trivial] [PATCH 6/9] acl: fix memory leak
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sat, 15 Nov 2014 10:07:39 -0000

From: Gonglei <arei.gonglei@huawei.com>

If 'i != index' for all acl->entries, variable
entry leaks the storage it points to.

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
---
 util/acl.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/util/acl.c b/util/acl.c
index 938b7ae..571d686 100644
--- a/util/acl.c
+++ b/util/acl.c
@@ -132,7 +132,6 @@ int qemu_acl_insert(qemu_acl *acl,
                     const char *match,
                     int index)
 {
-    qemu_acl_entry *entry;
     qemu_acl_entry *tmp;
     int i = 0;
 
@@ -142,13 +141,14 @@ int qemu_acl_insert(qemu_acl *acl,
         return qemu_acl_append(acl, deny, match);
     }
 
-    entry = g_malloc(sizeof(*entry));
-    entry->match = g_strdup(match);
-    entry->deny = deny;
-
     QTAILQ_FOREACH(tmp, &acl->entries, next) {
         i++;
         if (i == index) {
+            qemu_acl_entry *entry;
+            entry = g_malloc(sizeof(*entry));
+            entry->match = g_strdup(match);
+            entry->deny = deny;
+
             QTAILQ_INSERT_BEFORE(tmp, entry, next);
             acl->nentries++;
             break;
-- 
1.7.12.4



