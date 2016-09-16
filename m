Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bktki-0000qL-Iw
	for mharc-qemu-trivial@gnu.org; Fri, 16 Sep 2016 10:04:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34884)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1bktkf-0000mh-4Z
	for qemu-trivial@nongnu.org; Fri, 16 Sep 2016 10:04:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1bktkZ-0005qV-2w
	for qemu-trivial@nongnu.org; Fri, 16 Sep 2016 10:04:24 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46308)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>)
	id 1bktkO-0005em-OZ; Fri, 16 Sep 2016 10:04:08 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2CA2A7F7C5;
	Fri, 16 Sep 2016 13:57:13 +0000 (UTC)
Received: from thinkpad.redhat.com (ovpn-112-33.ams2.redhat.com [10.36.112.33])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u8GDuHkS024127; Fri, 16 Sep 2016 09:57:11 -0400
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-trivial@nongnu.org
Cc: qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
	Jason Wang <jasowang@redhat.com>
Date: Fri, 16 Sep 2016 15:56:17 +0200
Message-Id: <1474034177-17663-27-git-send-email-lvivier@redhat.com>
In-Reply-To: <1474034177-17663-1-git-send-email-lvivier@redhat.com>
References: <1474034177-17663-1-git-send-email-lvivier@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Fri, 16 Sep 2016 13:57:13 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH 26/26] net: use exit(EXIT_SUCCESS) and
 exit(EXIT_FAILURE)
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
X-List-Received-Date: Fri, 16 Sep 2016 14:04:26 -0000

This patch is the result of coccinelle script
scripts/coccinelle/exit.cocci

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
CC: Jason Wang <jasowang@redhat.com>
---
 net/net.c    | 4 ++--
 slirp/misc.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/net/net.c b/net/net.c
index d51cb29..0215618 100644
--- a/net/net.c
+++ b/net/net.c
@@ -840,9 +840,9 @@ void qemu_check_nic_model(NICInfo *nd, const char *model)
     models[1] = NULL;
 
     if (qemu_show_nic_models(nd->model, models))
-        exit(0);
+        exit(EXIT_SUCCESS);
     if (qemu_find_nic_model(nd, models, model) < 0)
-        exit(1);
+        exit(EXIT_FAILURE);
 }
 
 int qemu_find_nic_model(NICInfo *nd, const char * const *models,
diff --git a/slirp/misc.c b/slirp/misc.c
index 88e9d94..9ceb822 100644
--- a/slirp/misc.c
+++ b/slirp/misc.c
@@ -172,7 +172,7 @@ fork_exec(struct socket *so, const char *ex, int do_pty)
         fprintf(stderr, "Error: execvp of %s failed: %s\n",
                 argv[0], strerror(errno));
 		close(0); close(1); close(2); /* XXX */
-		exit(1);
+                exit(EXIT_FAILURE);
 
 	 default:
 		qemu_add_child_watch(pid);
-- 
2.5.5


