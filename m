Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WUlH9-0003VQ-5T
	for mharc-qemu-trivial@gnu.org; Mon, 31 Mar 2014 19:05:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44661)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kroosec@gmail.com>) id 1WUlH1-0002vx-MR
	for qemu-trivial@nongnu.org; Mon, 31 Mar 2014 19:05:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kroosec@gmail.com>) id 1WUlGv-0007Wu-7S
	for qemu-trivial@nongnu.org; Mon, 31 Mar 2014 19:05:47 -0400
Received: from mail-we0-x230.google.com ([2a00:1450:400c:c03::230]:49367)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kroosec@gmail.com>)
	id 1WUlGi-0007UP-JN; Mon, 31 Mar 2014 19:05:28 -0400
Received: by mail-we0-f176.google.com with SMTP id x48so5320121wes.7
	for <multiple recipients>; Mon, 31 Mar 2014 16:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=k7jcUF3svOEtNhwjkrsTyWJvekI69SgmRLBebfL9RvM=;
	b=PLhqsGsvblz3w4OWrJOo8J0jYtuSXBHy6nA3f+dBaO7Xdku95T3qp3OYaNRTi46ptF
	OtDrNUiJrdUkGpxAXYNdR1Ue7T8522YHP1IrbVOXFQunpYf4iMTdgRWWUswuJJ8ZtDHH
	INXtA+SIdxAPlZp2B9EvKLYEy+BdKoPCmmsRWgpoR1qoCJ9Jv1TE/Sm5RxHl6YCfS4yA
	WAZ9Qzpi72YARWlax+ET9Eg+Jt++2Cw7b3kPT2bVweAYynqG35dPbQj3dnCBQKaem62a
	r60RlM68fYC8e8X5yOJ6M+/KgfkxwzpjtHA+uuuzuNVlDGHThsASHZKHSHWX0aY45dv+
	D9lw==
X-Received: by 10.194.236.9 with SMTP id uq9mr17796202wjc.31.1396307127614;
	Mon, 31 Mar 2014 16:05:27 -0700 (PDT)
Received: from localhost.localdomain ([41.103.75.35])
	by mx.google.com with ESMTPSA id x3sm36246699eep.17.2014.03.31.16.05.26
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 31 Mar 2014 16:05:26 -0700 (PDT)
From: Hani Benhabiles <kroosec@gmail.com>
To: qemu-devel@nongnu.org
Date: Tue,  1 Apr 2014 00:05:14 +0100
Message-Id: <1396307114-4123-1-git-send-email-kroosec@gmail.com>
X-Mailer: git-send-email 1.8.3.2
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c03::230
Cc: qemu-trivial@nongnu.org, stefanha@redhat.com, aliguori@amazon.com
Subject: [Qemu-trivial] [PATCH] net: Report error when device / hub combo is
	not found.
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
X-List-Received-Date: Mon, 31 Mar 2014 23:05:53 -0000

Also convert nearby monitor_printf() call to error_report().

Signed-off-by: Hani Benhabiles <hani@linux.com>
---
 net/net.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/net/net.c b/net/net.c
index e3ef1e4..d319f49 100644
--- a/net/net.c
+++ b/net/net.c
@@ -952,10 +952,12 @@ void net_host_device_remove(Monitor *mon, const QDict *qdict)
 
     nc = net_hub_find_client_by_name(vlan_id, device);
     if (!nc) {
+        error_report("Host network device '%s' on hub '%d' not found",
+                     device, vlan_id);
         return;
     }
     if (!net_host_check_device(nc->model)) {
-        monitor_printf(mon, "invalid host network device %s\n", device);
+        error_report("invalid host network device '%s'", device);
         return;
     }
     qemu_del_net_client(nc);
-- 
1.8.3.2


