Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fqrUv-00012j-0m
	for mharc-qemu-trivial@gnu.org; Fri, 17 Aug 2018 23:01:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60408)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fqrUs-00012b-TQ
	for qemu-trivial@nongnu.org; Fri, 17 Aug 2018 23:01:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fqrUn-0004dV-V2
	for qemu-trivial@nongnu.org; Fri, 17 Aug 2018 23:01:50 -0400
Received: from mail-vk0-x244.google.com ([2607:f8b0:400c:c05::244]:46286)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fqrPq-00026Y-W8; Fri, 17 Aug 2018 22:56:39 -0400
Received: by mail-vk0-x244.google.com with SMTP id b14-v6so4108420vke.13;
	Fri, 17 Aug 2018 19:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=mwukKB2k9Hc61r4rHdDPMorA0V40PztPxwhrjrUbbrY=;
	b=jUGL/eClHjzoot+C7tw9sgylwu4h17HubGbV3HD/6j+oybCQhThO4NxbvbqVYF1uOP
	3RqKCSYV4mULcSccBHT56GKWsY06qJJ3C0hApDKugk7gjDvNkXsJw610uzbN5U6gzKdv
	M+jYEq+HB/yDvhuf41cg3DKkWAHLRS24NC/Ev1RYmaAYUSsc69TrmdejGvnl89sGglhs
	WpRVucZXRM3UllgYNRvygadTWTpORabljr6Zu29HXJz1wZ2UIFgsmeSCNYdOPrJ2y8lc
	RjnDF5NK1OkMTyvcukRKq9IozzRNwrCf9PMnuvl4EeINCPWBcTMIYS2vBB5E1Jga9HN+
	y3EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=mwukKB2k9Hc61r4rHdDPMorA0V40PztPxwhrjrUbbrY=;
	b=pq2AjA5yrkBTwrHKRcKkNYybKmNssWUF/yEjRcCPKiRCiGmpVxUtssuavVYsxS/5vo
	57/pVwea8VT7zqgtOSfbDVSMaHfNXsKP1lpTiSbxGfe3hL15Kpn3kP9q0mSeYLPX2wan
	GcmCNmwmQNQJBr5zMX3/PQ/cah17VxHO7vt10TghIegt3FrQ/B3iX7K0PaRQj10qcgW+
	38NmZH6dQAFVsfuDEa7ST4qYBQkV3fzBn9/QJN4GXiFv6Zu5vUsfgOwVpG3pwJb753yR
	O2RKbWCBjhKgau/HgarmD9fwQf+2yGD+dzHZiatDrhV9vttI+ikjqn4LGUEF4a9rth7P
	wQ9g==
X-Gm-Message-State: AOUpUlHVVQIBxor/ZiJIr0cshMN/6AL1aWRaGqbzELym9ZjjOjlbE2gm
	NCsNxMk6vCVTGPn7luybmR4=
X-Google-Smtp-Source: AA+uWPxs+KYkOQPXCKfD9MybeEAk9kocrn3DhRTQLDuuOuvTnhuIHtiWUo+CtBUwV+knvPZDvVc9IA==
X-Received: by 2002:a1f:284:: with SMTP id 126-v6mr302192vkc.14.1534560998236; 
	Fri, 17 Aug 2018 19:56:38 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	p48-v6sm692025uad.7.2018.08.17.19.56.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 17 Aug 2018 19:56:37 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: David Hildenbrand <david@redhat.com>,
	Howard Spoelstra <hsp.cat7@gmail.com>,
	Hitoshi Mitake <mitake.hitoshi@lab.ntt.co.jp>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Liu Yuan <namei.unix@gmail.com>, Jeff Cody <jcody@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>,
	qemu-block@nongnu.org (open list:Sheepdog),
	sheepdog@lists.wpkg.org (open list:Sheepdog)
Date: Fri, 17 Aug 2018 23:56:00 -0300
Message-Id: <20180818025600.21132-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400c:c05::244
Subject: [Qemu-trivial] [PATCH] sheepdog: Replace strncpy() by g_strlcpy()
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
X-List-Received-Date: Sat, 18 Aug 2018 03:01:51 -0000

Fedora 29 comes with GCC 8.1 which added the 'stringop-truncation' checks.

Replace the strncpy() calls by g_strlcpy() to avoid the following warning:

  block/sheepdog.c: In function 'find_vdi_name':
  block/sheepdog.c:1239:5: error: 'strncpy' specified bound 256 equals
  destination size [-Werror=stringop-truncation]
       strncpy(buf + SD_MAX_VDI_LEN, tag, SD_MAX_VDI_TAG_LEN);
       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Reported-by: Howard Spoelstra <hsp.cat7@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
See http://lists.nongnu.org/archive/html/qemu-devel/2018-07/msg03723.html

 block/sheepdog.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/block/sheepdog.c b/block/sheepdog.c
index b229a664d9..5dc3d0c39e 100644
--- a/block/sheepdog.c
+++ b/block/sheepdog.c
@@ -1224,19 +1224,19 @@ static int find_vdi_name(BDRVSheepdogState *s, const char *filename,
     SheepdogVdiReq hdr;
     SheepdogVdiRsp *rsp = (SheepdogVdiRsp *)&hdr;
     unsigned int wlen, rlen = 0;
-    char buf[SD_MAX_VDI_LEN + SD_MAX_VDI_TAG_LEN];
+    /* Ensures that the buffer is zero-filled,
+     * which is desirable since we'll soon be sending those bytes, and
+     * don't want the send_req to read uninitialized data.
+     */
+    char buf[SD_MAX_VDI_LEN + SD_MAX_VDI_TAG_LEN] = { };
 
     fd = connect_to_sdog(s, errp);
     if (fd < 0) {
         return fd;
     }
 
-    /* This pair of strncpy calls ensures that the buffer is zero-filled,
-     * which is desirable since we'll soon be sending those bytes, and
-     * don't want the send_req to read uninitialized data.
-     */
-    strncpy(buf, filename, SD_MAX_VDI_LEN);
-    strncpy(buf + SD_MAX_VDI_LEN, tag, SD_MAX_VDI_TAG_LEN);
+    g_strlcpy(buf, filename, SD_MAX_VDI_LEN);
+    g_strlcpy(buf + SD_MAX_VDI_LEN, tag, SD_MAX_VDI_TAG_LEN);
 
     memset(&hdr, 0, sizeof(hdr));
     if (lock) {
-- 
2.18.0


