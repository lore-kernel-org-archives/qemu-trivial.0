Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fNdpg-0005oi-Gd
	for mharc-qemu-trivial@gnu.org; Tue, 29 May 2018 08:34:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33619)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <tburgessdev@gmail.com>) id 1fNUwx-0007By-En
	for qemu-trivial@nongnu.org; Mon, 28 May 2018 23:05:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <tburgessdev@gmail.com>) id 1fNUww-0003bz-C0
	for qemu-trivial@nongnu.org; Mon, 28 May 2018 23:05:27 -0400
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:40677)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <tburgessdev@gmail.com>)
	id 1fNUwq-0003X9-MB; Mon, 28 May 2018 23:05:20 -0400
Received: by mail-qt0-x241.google.com with SMTP id h2-v6so16971859qtp.7;
	Mon, 28 May 2018 20:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=t6ykDpGRIOZ5vgUjy9sife1smKLOmUTTxZDyhSYoKUg=;
	b=nqAEHKwMUj3v1iyycjuht7OYwD4IfuhPQU5BwrDzzEkwFIA83lJIraESDth8sjGsEB
	s58grgNvP7tOdUbm/IzEYxo7TP07mNCb78PjyEuD3gCXOttyCpk2GSpflq0iayAa/+Bt
	va47F+5GrAyUHK4TfPKEH8KnwPY3PcpPLdrfVtSPwD4L52Ne5bYV41GT4nZ7veFsieRC
	XNaVkHwZQYQDN3lGYO3ouLbfWevQORBy+gFq0v6hL6RFXxRqDKIpVrnwvdDsBonrl3k1
	hv33U31i52e/kmmXqU1nbUjxcfTBJFaKt1X1ugCDfZHm8IbQ5XRgHx93axyg9ZC2eKqs
	I5GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=t6ykDpGRIOZ5vgUjy9sife1smKLOmUTTxZDyhSYoKUg=;
	b=sMRmDlVWMsZOV+7JBJCfcJu7cSZ2RD6GxT0F1N82lHQE8eLUFaeRvjyCRgTssGc3vo
	sgnDZgn2D4zr7BqLKDLc1lgi3VKlYXqH3WlIU0JJFvr7MXVV0asILsr6hRPXq1J/3hH+
	miUY4h5R2OSxhXwzJ2B8WR98gspm0rSHpnO0AjHVPCjg0vf1XVHgOgzDghxNY8Vfz+Om
	6d7YenwTQS2OZG5y8lciHUF7HgBzq3Tg0lx/cbo/sAUFxOAHVlYmFo9MuTLsdLUId+7I
	G77cwrXA8wYBTvefLCfP3aF503jxLXKwvleAmFZbXfUVEsekspNQWz1uLsWtPU8vz/aj
	7AQg==
X-Gm-Message-State: ALKqPwft7491ex08K2Xi0BHwyNOiiXALLnTMYVtwTI45iiMMzafRyLpM
	vEZhaaENzXSj3m3jo0nGBUEksW5knQc=
X-Google-Smtp-Source: ADUXVKJlrJGAzp+kPqEmEETCJOol9JWZDP+tWZgVr7U2uguqJ2mGvoxs/DfAQdlc3W7mw1xZlOENJw==
X-Received: by 2002:ac8:10d:: with SMTP id
	e13-v6mr14082096qtg.403.1527563119901; 
	Mon, 28 May 2018 20:05:19 -0700 (PDT)
Received: from tristan-dev-vm.mshome.net
	(c-73-123-117-162.hsd1.nh.comcast.net. [73.123.117.162])
	by smtp.gmail.com with ESMTPSA id
	f3-v6sm23181422qtb.51.2018.05.28.20.05.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 May 2018 20:05:19 -0700 (PDT)
From: Tristan Burgess <tburgessdev@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, tburgessdev@gmail.com,
	Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 28 May 2018 23:04:45 -0400
Message-Id: <20180529030445.177867-1-tburgessdev@gmail.com>
X-Mailer: git-send-email 2.17.0
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
X-Mailman-Approved-At: Tue, 29 May 2018 08:34:30 -0400
Subject: [Qemu-trivial] [PATCH] memory: bug 1720969: Make operations using
 MemoryRegionIoeventfd struct pass by pointer.
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 29 May 2018 03:05:28 -0000

This changes the functions memory_region_ioeventfd_equal, memory_region_ioeventfd_before, and their callers,
to pass the MemoryRegionIoeventfd struct via pointer, instead of directly passing the struct. This saves on stack space
and is considered safe practice.

Signed-off-by: Tristan Burgess <tburgessdev@gmail.com>
---
 memory.c | 44 ++++++++++++++++++++++----------------------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/memory.c b/memory.c
index fc7f9b782b..a2b9bb88f3 100644
--- a/memory.c
+++ b/memory.c
@@ -173,38 +173,38 @@ struct MemoryRegionIoeventfd {
     EventNotifier *e;
 };
 
-static bool memory_region_ioeventfd_before(MemoryRegionIoeventfd a,
-                                           MemoryRegionIoeventfd b)
+static bool memory_region_ioeventfd_before(MemoryRegionIoeventfd *a,
+                                           MemoryRegionIoeventfd *b)
 {
-    if (int128_lt(a.addr.start, b.addr.start)) {
+    if (int128_lt(a->addr.start, b->addr.start)) {
         return true;
-    } else if (int128_gt(a.addr.start, b.addr.start)) {
+    } else if (int128_gt(a->addr.start, b->addr.start)) {
         return false;
-    } else if (int128_lt(a.addr.size, b.addr.size)) {
+    } else if (int128_lt(a->addr.size, b->addr.size)) {
         return true;
-    } else if (int128_gt(a.addr.size, b.addr.size)) {
+    } else if (int128_gt(a->addr.size, b->addr.size)) {
         return false;
-    } else if (a.match_data < b.match_data) {
+    } else if (a->match_data < b->match_data) {
         return true;
-    } else  if (a.match_data > b.match_data) {
+    } else  if (a->match_data > b->match_data) {
         return false;
-    } else if (a.match_data) {
-        if (a.data < b.data) {
+    } else if (a->match_data) {
+        if (a->data < b->data) {
             return true;
-        } else if (a.data > b.data) {
+        } else if (a->data > b->data) {
             return false;
         }
     }
-    if (a.e < b.e) {
+    if (a->e < b->e) {
         return true;
-    } else if (a.e > b.e) {
+    } else if (a->e > b->e) {
         return false;
     }
     return false;
 }
 
-static bool memory_region_ioeventfd_equal(MemoryRegionIoeventfd a,
-                                          MemoryRegionIoeventfd b)
+static bool memory_region_ioeventfd_equal(MemoryRegionIoeventfd *a,
+                                          MemoryRegionIoeventfd *b)
 {
     return !memory_region_ioeventfd_before(a, b)
         && !memory_region_ioeventfd_before(b, a);
@@ -791,8 +791,8 @@ static void address_space_add_del_ioeventfds(AddressSpace *as,
     while (iold < fds_old_nb || inew < fds_new_nb) {
         if (iold < fds_old_nb
             && (inew == fds_new_nb
-                || memory_region_ioeventfd_before(fds_old[iold],
-                                                  fds_new[inew]))) {
+                || memory_region_ioeventfd_before(&fds_old[iold],
+                                                  &fds_new[inew]))) {
             fd = &fds_old[iold];
             section = (MemoryRegionSection) {
                 .fv = address_space_to_flatview(as),
@@ -804,8 +804,8 @@ static void address_space_add_del_ioeventfds(AddressSpace *as,
             ++iold;
         } else if (inew < fds_new_nb
                    && (iold == fds_old_nb
-                       || memory_region_ioeventfd_before(fds_new[inew],
-                                                         fds_old[iold]))) {
+                       || memory_region_ioeventfd_before(&fds_new[inew],
+                                                         &fds_old[iold]))) {
             fd = &fds_new[inew];
             section = (MemoryRegionSection) {
                 .fv = address_space_to_flatview(as),
@@ -1443,7 +1443,7 @@ static bool memory_region_dispatch_write_eventfds(MemoryRegion *mr,
         ioeventfd.match_data = mr->ioeventfds[i].match_data;
         ioeventfd.e = mr->ioeventfds[i].e;
 
-        if (memory_region_ioeventfd_equal(ioeventfd, mr->ioeventfds[i])) {
+        if (memory_region_ioeventfd_equal(&ioeventfd, &mr->ioeventfds[i])) {
             event_notifier_set(ioeventfd.e);
             return true;
         }
@@ -2213,7 +2213,7 @@ void memory_region_add_eventfd(MemoryRegion *mr,
     }
     memory_region_transaction_begin();
     for (i = 0; i < mr->ioeventfd_nb; ++i) {
-        if (memory_region_ioeventfd_before(mrfd, mr->ioeventfds[i])) {
+        if (memory_region_ioeventfd_before(&mrfd, &mr->ioeventfds[i])) {
             break;
         }
     }
@@ -2248,7 +2248,7 @@ void memory_region_del_eventfd(MemoryRegion *mr,
     }
     memory_region_transaction_begin();
     for (i = 0; i < mr->ioeventfd_nb; ++i) {
-        if (memory_region_ioeventfd_equal(mrfd, mr->ioeventfds[i])) {
+        if (memory_region_ioeventfd_equal(&mrfd, &mr->ioeventfds[i])) {
             break;
         }
     }
-- 
2.17.0


