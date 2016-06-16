Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bDWMI-0001ge-6l
	for mharc-qemu-trivial@gnu.org; Thu, 16 Jun 2016 08:25:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48619)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1bDWMG-0001ev-4H
	for qemu-trivial@nongnu.org; Thu, 16 Jun 2016 08:25:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1bDWME-0000in-5r
	for qemu-trivial@nongnu.org; Thu, 16 Jun 2016 08:25:15 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50772)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1bDWM7-0000h8-W7; Thu, 16 Jun 2016 08:25:08 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4ECBEC057FAD;
	Thu, 16 Jun 2016 12:25:07 +0000 (UTC)
Received: from donizetti.redhat.com (ovpn-112-58.ams2.redhat.com
	[10.36.112.58])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u5GCP5G7031608; Thu, 16 Jun 2016 08:25:05 -0400
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, stefanb@us.ibm.com
Date: Thu, 16 Jun 2016 14:25:04 +0200
Message-Id: <1466079904-28902-1-git-send-email-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Thu, 16 Jun 2016 12:25:07 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] vl: remove unnecessary duplicate call to
 tpm_cleanup
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
X-List-Received-Date: Thu, 16 Jun 2016 12:25:17 -0000

tpm_cleanup is called from main() and also registered with atexit from
tpm_init.  The function only visits the tpm_backends linked list, and the
atexit registration happens right after tpm_init fills in the list from
-tpmdev options.  Therefore, the direct call is unnecessary.  Remove it.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 vl.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/vl.c b/vl.c
index a7cb3b3..e05ded4 100644
--- a/vl.c
+++ b/vl.c
@@ -4631,9 +4631,6 @@ int main(int argc, char **argv, char **envp)
     bdrv_close_all();
     pause_all_vcpus();
     res_free();
-#ifdef CONFIG_TPM
-    tpm_cleanup();
-#endif
 
     return 0;
 }
-- 
2.5.5


