Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YWfQK-0006Fr-N7
	for mharc-qemu-trivial@gnu.org; Sat, 14 Mar 2015 02:19:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48502)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@linux.vnet.ibm.com>) id 1YWfQG-0006F0-Fw
	for qemu-trivial@nongnu.org; Sat, 14 Mar 2015 02:19:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@linux.vnet.ibm.com>) id 1YWfQC-0004B2-EE
	for qemu-trivial@nongnu.org; Sat, 14 Mar 2015 02:19:44 -0400
Received: from e06smtp17.uk.ibm.com ([195.75.94.113]:48434)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@linux.vnet.ibm.com>) id 1YWfQC-0004Ad-5S
	for qemu-trivial@nongnu.org; Sat, 14 Mar 2015 02:19:40 -0400
Received: from /spool/local
	by e06smtp17.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <thuth@linux.vnet.ibm.com>;
	Sat, 14 Mar 2015 06:19:37 -0000
Received: from d06dlp01.portsmouth.uk.ibm.com (9.149.20.13)
	by e06smtp17.uk.ibm.com (192.168.101.147) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Sat, 14 Mar 2015 06:19:36 -0000
Received: from b06cxnps4075.portsmouth.uk.ibm.com
	(d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
	by d06dlp01.portsmouth.uk.ibm.com (Postfix) with ESMTP id 4504417D8042; 
	Sat, 14 Mar 2015 06:19:59 +0000 (GMT)
Received: from d06av07.portsmouth.uk.ibm.com (d06av07.portsmouth.uk.ibm.com
	[9.149.37.248])
	by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id t2E6JZ7b59900028; Sat, 14 Mar 2015 06:19:36 GMT
Received: from d06av07.portsmouth.uk.ibm.com (localhost [127.0.0.1])
	by d06av07.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with
	ESMTP id t2E6JZk8013382; Sat, 14 Mar 2015 02:19:35 -0400
Received: from oc7435384737.ibm.com (sig-9-84-84-76.evts.de.ibm.com
	[9.84.84.76])
	by d06av07.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with
	ESMTP id t2E6JYkT013361; Sat, 14 Mar 2015 02:19:35 -0400
From: Thomas Huth <thuth@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Sat, 14 Mar 2015 07:19:28 +0100
Message-Id: <1426313974-25607-2-git-send-email-thuth@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1426313974-25607-1-git-send-email-thuth@linux.vnet.ibm.com>
References: <1426313974-25607-1-git-send-email-thuth@linux.vnet.ibm.com>
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 15031406-0029-0000-0000-000003C5BE1C
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 195.75.94.113
Cc: Amit Shah <amit.shah@redhat.com>, Thomas Huth <thuth@linux.vnet.ibm.com>,
	Juan Quintela <quintela@redhat.com>
Subject: [Qemu-trivial] [PATCH v2 1/7] migration: Remove unused functions
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
X-List-Received-Date: Sat, 14 Mar 2015 06:19:46 -0000

migrate_rdma_pin_all(), qsb_clone() and qsb_set_length()
are completely unused and thus can be deleted.

Signed-off-by: Thomas Huth <thuth@linux.vnet.ibm.com>
Cc: Juan Quintela <quintela@redhat.com>
Cc: Amit Shah <amit.shah@redhat.com>
---
 include/migration/migration.h |    1 -
 include/migration/qemu-file.h |    2 -
 migration/migration.c         |    9 -------
 migration/qemu-file-buf.c     |   53 -----------------------------------------
 4 files changed, 0 insertions(+), 65 deletions(-)

diff --git a/include/migration/migration.h b/include/migration/migration.h
index 703b7d7..0a1cea0 100644
--- a/include/migration/migration.h
+++ b/include/migration/migration.h
@@ -139,7 +139,6 @@ void migrate_add_blocker(Error *reason);
  */
 void migrate_del_blocker(Error *reason);
 
-bool migrate_rdma_pin_all(void);
 bool migrate_zero_blocks(void);
 
 bool migrate_auto_converge(void);
diff --git a/include/migration/qemu-file.h b/include/migration/qemu-file.h
index a923cec..45d7f71 100644
--- a/include/migration/qemu-file.h
+++ b/include/migration/qemu-file.h
@@ -133,9 +133,7 @@ bool qemu_file_mode_is_not_valid(const char *mode);
 bool qemu_file_is_writable(QEMUFile *f);
 
 QEMUSizedBuffer *qsb_create(const uint8_t *buffer, size_t len);
-QEMUSizedBuffer *qsb_clone(const QEMUSizedBuffer *);
 void qsb_free(QEMUSizedBuffer *);
-size_t qsb_set_length(QEMUSizedBuffer *qsb, size_t length);
 size_t qsb_get_length(const QEMUSizedBuffer *qsb);
 ssize_t qsb_get_buffer(const QEMUSizedBuffer *, off_t start, size_t count,
                        uint8_t *buf);
diff --git a/migration/migration.c b/migration/migration.c
index b3adbc6..6f1a490 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -540,15 +540,6 @@ void qmp_migrate_set_downtime(double value, Error **errp)
     max_downtime = (uint64_t)value;
 }
 
-bool migrate_rdma_pin_all(void)
-{
-    MigrationState *s;
-
-    s = migrate_get_current();
-
-    return s->enabled_capabilities[MIGRATION_CAPABILITY_RDMA_PIN_ALL];
-}
-
 bool migrate_auto_converge(void)
 {
     MigrationState *s;
diff --git a/migration/qemu-file-buf.c b/migration/qemu-file-buf.c
index e56a8ad..d075569 100644
--- a/migration/qemu-file-buf.c
+++ b/migration/qemu-file-buf.c
@@ -128,28 +128,6 @@ size_t qsb_get_length(const QEMUSizedBuffer *qsb)
 }
 
 /**
- * Set the length of the buffer; the primary usage of this
- * function is to truncate the number of used bytes in the buffer.
- * The size will not be extended beyond the current number of
- * allocated bytes in the QEMUSizedBuffer.
- *
- * @qsb: A QEMUSizedBuffer
- * @new_len: The new length of bytes in the buffer
- *
- * Returns the number of bytes the buffer was truncated or extended
- * to.
- */
-size_t qsb_set_length(QEMUSizedBuffer *qsb, size_t new_len)
-{
-    if (new_len <= qsb->size) {
-        qsb->used = new_len;
-    } else {
-        qsb->used = qsb->size;
-    }
-    return qsb->used;
-}
-
-/**
  * Get the iovec that holds the data for a given position @pos.
  *
  * @qsb: A QEMUSizedBuffer
@@ -365,37 +343,6 @@ ssize_t qsb_write_at(QEMUSizedBuffer *qsb, const uint8_t *source,
     return count;
 }
 
-/**
- * Create a deep copy of the given QEMUSizedBuffer.
- *
- * @qsb: A QEMUSizedBuffer
- *
- * Returns a clone of @qsb or NULL on allocation failure
- */
-QEMUSizedBuffer *qsb_clone(const QEMUSizedBuffer *qsb)
-{
-    QEMUSizedBuffer *out = qsb_create(NULL, qsb_get_length(qsb));
-    size_t i;
-    ssize_t res;
-    off_t pos = 0;
-
-    if (!out) {
-        return NULL;
-    }
-
-    for (i = 0; i < qsb->n_iov; i++) {
-        res =  qsb_write_at(out, qsb->iov[i].iov_base,
-                            pos, qsb->iov[i].iov_len);
-        if (res < 0) {
-            qsb_free(out);
-            return NULL;
-        }
-        pos += res;
-    }
-
-    return out;
-}
-
 typedef struct QEMUBuffer {
     QEMUSizedBuffer *qsb;
     QEMUFile *file;
-- 
1.7.1


