Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UjNOa-0001vr-S8
	for mharc-qemu-trivial@gnu.org; Mon, 03 Jun 2013 01:33:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38730)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1UjNOX-0001qg-2D
	for qemu-trivial@nongnu.org; Mon, 03 Jun 2013 01:33:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1UjNOW-0007pc-4n
	for qemu-trivial@nongnu.org; Mon, 03 Jun 2013 01:33:25 -0400
Received: from mail-pd0-f174.google.com ([209.85.192.174]:49172)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1UjNOV-0007pO-Ur
	for qemu-trivial@nongnu.org; Mon, 03 Jun 2013 01:33:24 -0400
Received: by mail-pd0-f174.google.com with SMTP id 3so5086837pdj.5
	for <qemu-trivial@nongnu.org>; Sun, 02 Jun 2013 22:33:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:x-gm-message-state;
	bh=DCKpDJ7vTnX/jYEFanNoML4ePYMGuHDwouCk1JGgt0A=;
	b=E2uYt0SHDAj2ETcm+CeaqUsS6WT2rXp6jnBA0CO9Kz+nyyYTK6xl99ZXBU0RhSDedg
	ngTGfAo3TK3XYrqQy5i7oso88emqvcjDi+s+DQ/tjA3jDpF/1MgG8d3vXGf1ieTKL42x
	bJNPcs/gA7Wj4feJf8LUUUrGDenvGXdkvjk2dPEPwT7djdJZpOvGre3j1PuOH6sZkudV
	Y8Ak+EUxv0A1ecqCBLUF66cwH3SXbpqnVa+Bs1QeuBdxNSh5+EOmL+VuI0jLV0U9hfMT
	JbjZtRh4r8VkwsSfvFAj5OPjJcS0GH1BWgd+c22QxP5v5NDjD55N6OLAmNX7edUL5VK2
	0PRA==
X-Received: by 10.66.141.232 with SMTP id rr8mr13679279pab.204.1370237603191; 
	Sun, 02 Jun 2013 22:33:23 -0700 (PDT)
Received: from localhost ([203.126.243.116])
	by mx.google.com with ESMTPSA id b7sm57454655pba.39.2013.06.02.22.33.17
	for <multiple recipients>
	(version=TLSv1.1 cipher=RC4-SHA bits=128/128);
	Sun, 02 Jun 2013 22:33:22 -0700 (PDT)
Sender: Peter Crosthwaite <peter.crosthwaite@petalogix.com>
From: peter.crosthwaite@xilinx.com
To: qemu-devel@nongnu.org
Date: Mon,  3 Jun 2013 15:31:56 +1000
Message-Id: <f70586fffb8725cf218593a0632217fe91280b50.1370237352.git.peter.crosthwaite@xilinx.com>
X-Mailer: git-send-email 1.8.3.rc1.44.gb387c77.dirty
In-Reply-To: <cover.1370237352.git.peter.crosthwaite@xilinx.com>
References: <cover.1370237352.git.peter.crosthwaite@xilinx.com>
X-Gm-Message-State: ALoCoQluGAn2Sjh7SJe6u+Cs/wLPLQ+eiX4wu6YWCOtXIuLzRcYpBhbn5KUlKJKUk6MwYYrbiN1h
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.192.174
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, edgar.iglesias@gmail.com
Subject: [Qemu-trivial] [PATCH v1 1/3] memory: Fix comment typo
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
X-List-Received-Date: Mon, 03 Jun 2013 05:33:27 -0000

From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>

s/ajacent/adjacent

Signed-off-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
---

 memory.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/memory.c b/memory.c
index 5cb8f4a..60e033b 100644
--- a/memory.c
+++ b/memory.c
@@ -282,7 +282,7 @@ static bool can_merge(FlatRange *r1, FlatRange *r2)
         && r1->readonly == r2->readonly;
 }
 
-/* Attempt to simplify a view by merging ajacent ranges */
+/* Attempt to simplify a view by merging adjacent ranges */
 static void flatview_simplify(FlatView *view)
 {
     unsigned i, j;
-- 
1.8.3.rc1.44.gb387c77.dirty


