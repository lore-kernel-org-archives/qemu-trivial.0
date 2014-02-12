Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WDxg8-0001it-Ni
	for mharc-qemu-trivial@gnu.org; Thu, 13 Feb 2014 09:54:16 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41912)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1WDdOh-0007Qq-0n
	for qemu-trivial@nongnu.org; Wed, 12 Feb 2014 12:15:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1WDdOb-0001Mn-2G
	for qemu-trivial@nongnu.org; Wed, 12 Feb 2014 12:14:54 -0500
Received: from mx1.redhat.com ([209.132.183.28]:33204)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>)
	id 1WDdOO-00015C-IG; Wed, 12 Feb 2014 12:14:36 -0500
Received: from int-mx12.intmail.prod.int.phx2.redhat.com
	(int-mx12.intmail.prod.int.phx2.redhat.com [10.5.11.25])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s1CHEZKk015221
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Wed, 12 Feb 2014 12:14:35 -0500
Received: from dgilbert-t530.home.treblig.org (vpn1-7-49.ams2.redhat.com
	[10.36.7.49])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s1CHEYqu031453; Wed, 12 Feb 2014 12:14:34 -0500
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 12 Feb 2014 17:14:33 +0000
Message-Id: <1392225273-32540-1-git-send-email-dgilbert@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.25
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
X-Mailman-Approved-At: Thu, 13 Feb 2014 09:54:15 -0500
Cc: qemu-trivial@nongnu.org, rth@twiddle.net
Subject: [Qemu-trivial] [PATCH 1/1] Trivial typo: ctz->cto
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
X-List-Received-Date: Wed, 12 Feb 2014 17:15:01 -0000

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 include/qemu/host-utils.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/qemu/host-utils.h b/include/qemu/host-utils.h
index de85d28..285c5fb 100644
--- a/include/qemu/host-utils.h
+++ b/include/qemu/host-utils.h
@@ -217,7 +217,7 @@ static inline int ctz64(uint64_t val)
 }
 
 /**
- * ctz64 - count trailing ones in a 64-bit value.
+ * cto64 - count trailing ones in a 64-bit value.
  * @val: The value to search
  *
  * Returns 64 if the value is -1.
-- 
1.8.5.3


