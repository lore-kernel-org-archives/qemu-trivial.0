Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UjNQ8-0004Mj-P5
	for mharc-qemu-trivial@gnu.org; Mon, 03 Jun 2013 01:35:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39143)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1UjNQ5-0004Hs-98
	for qemu-trivial@nongnu.org; Mon, 03 Jun 2013 01:35:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1UjNQ1-0008Rh-5r
	for qemu-trivial@nongnu.org; Mon, 03 Jun 2013 01:35:01 -0400
Received: from mail-pb0-x22b.google.com ([2607:f8b0:400e:c01::22b]:58674)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1UjNQ0-0008RU-W5
	for qemu-trivial@nongnu.org; Mon, 03 Jun 2013 01:34:57 -0400
Received: by mail-pb0-f43.google.com with SMTP id ma3so5182860pbc.16
	for <qemu-trivial@nongnu.org>; Sun, 02 Jun 2013 22:34:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:x-gm-message-state;
	bh=Gyx2LuPiXSa9avbH1jlqBTj6kxd3IVwEg3OEU7fIxnM=;
	b=W8LMjhKatCTe7YHq70ix4jUMkpZAgaKX5gzHV/F91D6xx7uVXjdcKIlqUZnSn/E3Ik
	yv4NkLHKgP2byTXd1wvADnZQBOlVKGHf6s9T+s5X1okSJZEoJqrftpDAp1rKwXyo/aDR
	I/I13ATgyv7PFnBPRwKLK0xebcaKwF6+dIAp4C03yRkavkLI4kPagtDhQ0xljdF5NnzB
	qNLbh90yK5cnz2iG5ZDsvnS0WFw1cVVE+8aaCNI9Fx0Gy89Gk0M3sczjVkrgcnfBvo3/
	Nlkg8Y3omW+nFC4DLSjzDYF0QfFRxXh3BzWSxQQ0nABnTThRdFUc64XXE08IaTb9SE2t
	ywUQ==
X-Received: by 10.68.178.129 with SMTP id cy1mr18153659pbc.110.1370237696228; 
	Sun, 02 Jun 2013 22:34:56 -0700 (PDT)
Received: from localhost ([203.126.243.116])
	by mx.google.com with ESMTPSA id sg4sm57518676pbc.7.2013.06.02.22.34.50
	for <multiple recipients>
	(version=TLSv1.1 cipher=RC4-SHA bits=128/128);
	Sun, 02 Jun 2013 22:34:55 -0700 (PDT)
Sender: Peter Crosthwaite <peter.crosthwaite@petalogix.com>
From: peter.crosthwaite@xilinx.com
To: qemu-devel@nongnu.org
Date: Mon,  3 Jun 2013 15:33:29 +1000
Message-Id: <387f0d6784e0e4866e44affa4c4ba153e4b0dcd6.1370237352.git.peter.crosthwaite@xilinx.com>
X-Mailer: git-send-email 1.8.3.rc1.44.gb387c77.dirty
In-Reply-To: <cover.1370237352.git.peter.crosthwaite@xilinx.com>
References: <cover.1370237352.git.peter.crosthwaite@xilinx.com>
X-Gm-Message-State: ALoCoQm9dM0wLl5uw0WAH7vbkVyWw5KvS0ljk7582Oazypoo+IIpDNnaCp15CA513ReWZw8CwthL
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c01::22b
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, edgar.iglesias@gmail.com
Subject: [Qemu-trivial] [PATCH v1 3/3] memory: render_memory_region: factor
	out fr constant setters
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
X-List-Received-Date: Mon, 03 Jun 2013 05:35:02 -0000

From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>

These 4 replicated lines set properties of fr that are constant over
the course of the function. Factor out their repeated setting (and also
guards against them being set multiple times in the loop below).

Signed-off-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
---

 memory.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/memory.c b/memory.c
index 7e710c4..7bdfc58 100644
--- a/memory.c
+++ b/memory.c
@@ -556,6 +556,11 @@ static void render_memory_region(FlatView *view,
     base = clip.start;
     remain = clip.size;
 
+    fr.mr = mr;
+    fr.dirty_log_mask = mr->dirty_log_mask;
+    fr.romd_mode = mr->romd_mode;
+    fr.readonly = readonly;
+
     /* Render the region itself into any gaps left by the current view. */
     for (i = 0; i < view->nr && int128_nz(remain); ++i) {
         if (int128_ge(base, addrrange_end(view->ranges[i].addr))) {
@@ -564,12 +569,8 @@ static void render_memory_region(FlatView *view,
         if (int128_lt(base, view->ranges[i].addr.start)) {
             now = int128_min(remain,
                              int128_sub(view->ranges[i].addr.start, base));
-            fr.mr = mr;
             fr.offset_in_region = offset_in_region;
             fr.addr = addrrange_make(base, now);
-            fr.dirty_log_mask = mr->dirty_log_mask;
-            fr.romd_mode = mr->romd_mode;
-            fr.readonly = readonly;
             flatview_insert(view, i, &fr);
             ++i;
             int128_addto(&base, now);
@@ -584,12 +585,8 @@ static void render_memory_region(FlatView *view,
         int128_subfrom(&remain, now);
     }
     if (int128_nz(remain)) {
-        fr.mr = mr;
         fr.offset_in_region = offset_in_region;
         fr.addr = addrrange_make(base, remain);
-        fr.dirty_log_mask = mr->dirty_log_mask;
-        fr.romd_mode = mr->romd_mode;
-        fr.readonly = readonly;
         flatview_insert(view, i, &fr);
     }
 }
-- 
1.8.3.rc1.44.gb387c77.dirty


