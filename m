Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VJVOw-00016g-1A
	for mharc-qemu-trivial@gnu.org; Tue, 10 Sep 2013 17:23:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33337)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <damien.millescamps@6wind.com>) id 1VJPmh-0004n7-Ru
	for qemu-trivial@nongnu.org; Tue, 10 Sep 2013 11:23:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <damien.millescamps@6wind.com>) id 1VJPma-0000mg-WD
	for qemu-trivial@nongnu.org; Tue, 10 Sep 2013 11:23:19 -0400
Received: from mail-bk0-f44.google.com ([209.85.214.44]:63012)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <damien.millescamps@6wind.com>) id 1VJPma-0000m8-QJ
	for qemu-trivial@nongnu.org; Tue, 10 Sep 2013 11:23:12 -0400
Received: by mail-bk0-f44.google.com with SMTP id mz10so3016444bkb.17
	for <qemu-trivial@nongnu.org>; Tue, 10 Sep 2013 08:23:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=m9Yw3aj9Nqm2hrzzwS78en1aiC2ySJwHeWXOmmSiYk8=;
	b=lGqph/f+alV4RX8xCvGdpG5YM+Mh/MJomlwm6yhfekxAGg1+hymcI6yA6Kjp0i0AVb
	9uuBhwM8UmUSlgDo90oEubyjQqyfQJXKehwtVtaii/VySOmtBAQwzS2sLMFfQlCEXctH
	j1rfU8QcqmcfXVsGSQLQgS5rE5/l3aJr/urbsZoXLQK8KeMuuVAGLKWkMvKtPdWcru9x
	cWAyw1KY3dQXENg9ZSpeL4XbQqrzfvhLV3q/wNwRMElJRkv20ggsHdIZO9Vo3KUGJsmN
	4QqHQxf18My0JjSj4KiM4nYnBoSjkAv1J6Kqcr2BOiKw2qOpDa0drU9aQtDVVx2NIu5O
	Cs6Q==
X-Gm-Message-State: ALoCoQk883nd9Q8v+QsnCbZ5+RBNZMXS3APLdqnIqEjJ+mSeRe+aku8vrDH4/sw6yOYu7qIfHsOV
X-Received: by 10.205.102.9 with SMTP id dc9mr30761bkc.108.1378826591011;
	Tue, 10 Sep 2013 08:23:11 -0700 (PDT)
Received: from 6wind.com (6wind.net2.nerim.net. [213.41.180.237])
	by mx.google.com with ESMTPSA id zl3sm5753809bkb.4.1969.12.31.16.00.00
	(version=TLSv1.1 cipher=RC4-SHA bits=128/128);
	Tue, 10 Sep 2013 08:23:10 -0700 (PDT)
From: Damien Millescamps <damien.millescamps@6wind.com>
To: qemu-trivial@nongnu.org
Date: Tue, 10 Sep 2013 17:23:04 +0200
Message-Id: <1378826584-28569-1-git-send-email-damien.millescamps@6wind.com>
X-Mailer: git-send-email 1.7.2.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.214.44
X-Mailman-Approved-At: Tue, 10 Sep 2013 17:23:07 -0400
Cc: damien.millescamps@6wind.com
Subject: [Qemu-trivial] [PATCH] ivshmem: allow the sharing of hugepages
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
X-List-Received-Date: Tue, 10 Sep 2013 15:23:26 -0000

According to shm_open specifications:

 A shared memory object should be identified by a name of the form /somename;
 that is, a null-terminated string of up to NAME_MAX (i.e., 255) characters
 consisting of an initial slash, followed by one or more characters, none of
 which are slashes.

This patch permits to share memory areas that do not specifically belong to
/dev/shmem.

A use case for this patch is sharing huge pages available through a
hugetlbfs mountpoint.

Signed-off-by: Damien Millescamps <damien.millescamps@6wind.com>
---
 hw/misc/ivshmem.c |   16 +++++++++++++++-
 1 files changed, 15 insertions(+), 1 deletions(-)

diff --git a/hw/misc/ivshmem.c b/hw/misc/ivshmem.c
index 2838866..9020bb2 100644
--- a/hw/misc/ivshmem.c
+++ b/hw/misc/ivshmem.c
@@ -751,9 +751,23 @@ static int pci_ivshmem_init(PCIDevice *dev)
 
         IVSHMEM_DPRINTF("using shm_open (shm object = %s)\n", s->shmobj);
 
+        /* 
+         * A shared memory object should be identified by a name of the form /somename; 
+         * that is, a null-terminated string of up to NAME_MAX (i.e., 255) characters 
+         * consisting of an initial slash, followed by one or more characters, none of 
+         * which are slashes.
+         */
+        if (s->shmobj && s->shmobj[0] == '/' && strstr(&s->shmobj[1], "/")) {
+            /* This can't be a shared memory object. */
+            fd = open(s->shmobj, O_RDWR);
+            if (fd < 0) {
+                perror("ivshmem - open");
+                exit(-1);
+            }
+        }
         /* try opening with O_EXCL and if it succeeds zero the memory
          * by truncating to 0 */
-        if ((fd = shm_open(s->shmobj, O_CREAT|O_RDWR|O_EXCL,
+        else if ((fd = shm_open(s->shmobj, O_CREAT|O_RDWR|O_EXCL,
                         S_IRWXU|S_IRWXG|S_IRWXO)) > 0) {
            /* truncate file to length PCI device's memory */
             if (ftruncate(fd, s->ivshmem_size) != 0) {
-- 
1.7.2.5


