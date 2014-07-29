Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XCFne-0000xp-62
	for mharc-qemu-trivial@gnu.org; Tue, 29 Jul 2014 18:23:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44951)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kroosec@gmail.com>) id 1XCFnW-0000o3-J3
	for qemu-trivial@nongnu.org; Tue, 29 Jul 2014 18:23:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kroosec@gmail.com>) id 1XCFnQ-0002fc-Iz
	for qemu-trivial@nongnu.org; Tue, 29 Jul 2014 18:23:06 -0400
Received: from mail-wg0-x22a.google.com ([2a00:1450:400c:c00::22a]:48960)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kroosec@gmail.com>)
	id 1XCFnE-0002ei-3N; Tue, 29 Jul 2014 18:22:48 -0400
Received: by mail-wg0-f42.google.com with SMTP id l18so306801wgh.25
	for <multiple recipients>; Tue, 29 Jul 2014 15:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=cg+I7JPpnZfgARdMtZgsUWNMOiaHBhqKEQK4ZRFECN8=;
	b=fo+dgVxllcowBLzRKPfx8uY5dXlRfpNuzW4sn5wPeIPcAIxs3JxJ7wWnLs4r/RMXJi
	mo7bbUbDCTZn5f2+HEt4L3axxgrtxc/RC1ZDlK3fcBYzwnas0h/yc7WrVE25i77Zcf6R
	foV9wXsgGEjB6xqRVpzns6hNkaXf7Gpg7P/WNsL6WTAK+LKLS1/hp7XzLLChp7BqIY0Q
	/MVMpcr4M2CArkAXyGT3iIfHDzcG1n+iHlfILfQwDT7usGIZPVyad2wE4IixKsWgS3hc
	VvDRjyyfYjJnJUqPPsV1i/1Xuz8HUvnK758TpNkLik1NaaWdqwNjJ9x+cKUB8y9n16Fa
	HYZw==
X-Received: by 10.194.90.4 with SMTP id bs4mr7802171wjb.71.1406672566917;
	Tue, 29 Jul 2014 15:22:46 -0700 (PDT)
Received: from localhost.localdomain ([41.103.28.105])
	by mx.google.com with ESMTPSA id a4sm47980051wie.21.2014.07.29.15.22.45
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 29 Jul 2014 15:22:46 -0700 (PDT)
From: Hani Benhabiles <kroosec@gmail.com>
To: qemu-devel@nongnu.org
Date: Tue, 29 Jul 2014 23:22:40 +0100
Message-Id: <1406672560-21029-1-git-send-email-kroosec@gmail.com>
X-Mailer: git-send-email 1.8.3.2
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c00::22a
Cc: qemu-trivial@nongnu.org, lcapitulino@redhat.com
Subject: [Qemu-trivial] [PATCH] monitor: Remove hardcoded watchdog event
	names
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
X-List-Received-Date: Tue, 29 Jul 2014 22:23:12 -0000

Signed-off-by: Hani Benhabiles <hani@linux.com>
---
 monitor.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/monitor.c b/monitor.c
index 5bc70a6..7465775 100644
--- a/monitor.c
+++ b/monitor.c
@@ -4520,16 +4520,15 @@ void netdev_del_completion(ReadLineState *rs, int nb_args, const char *str)
 
 void watchdog_action_completion(ReadLineState *rs, int nb_args, const char *str)
 {
+    int i;
+
     if (nb_args != 2) {
         return;
     }
     readline_set_completion_index(rs, strlen(str));
-    add_completion_option(rs, str, "reset");
-    add_completion_option(rs, str, "shutdown");
-    add_completion_option(rs, str, "poweroff");
-    add_completion_option(rs, str, "pause");
-    add_completion_option(rs, str, "debug");
-    add_completion_option(rs, str, "none");
+    for (i = 0; WatchdogExpirationAction_lookup[i]; i++) {
+        add_completion_option(rs, str, WatchdogExpirationAction_lookup[i]);
+    }
 }
 
 void migrate_set_capability_completion(ReadLineState *rs, int nb_args,
-- 
1.8.3.2


