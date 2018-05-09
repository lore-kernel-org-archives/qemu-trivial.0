Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fGGsK-0005wn-Jm
	for mharc-qemu-trivial@gnu.org; Wed, 09 May 2018 00:38:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36869)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fGGsI-0005vi-7r
	for qemu-trivial@nongnu.org; Wed, 09 May 2018 00:38:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fGGsH-0000ex-Cp
	for qemu-trivial@nongnu.org; Wed, 09 May 2018 00:38:46 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:44158 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1fGGsB-0000VZ-9f; Wed, 09 May 2018 00:38:39 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C198440858C3;
	Wed,  9 May 2018 04:38:28 +0000 (UTC)
Received: from thh440s.redhat.com (ovpn-116-83.ams2.redhat.com [10.36.116.83])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E947F10F1BEB;
	Wed,  9 May 2018 04:38:21 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-trivial@nongnu.org
Date: Wed,  9 May 2018 06:38:20 +0200
Message-Id: <1525840700-30635-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Wed, 09 May 2018 04:38:28 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Wed, 09 May 2018 04:38:28 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'thuth@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-trivial] [PATCH] MAINTAINERS: Add trace-events and
 qemu-option-trace.texi to tracing section
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
X-List-Received-Date: Wed, 09 May 2018 04:38:47 -0000

The "trace-events" and "qemu-option-trace.texi" files in the top directory
are currently "unmaintained" according to scripts/get_maintainer.pl. They
obviously belong to the Tracing section, so add an entry for them there.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 459e359..e187b1f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1656,6 +1656,8 @@ Tracing
 M: Stefan Hajnoczi <stefanha@redhat.com>
 S: Maintained
 F: trace/
+F: trace-events
+F: qemu-option-trace.texi
 F: scripts/tracetool.py
 F: scripts/tracetool/
 F: docs/devel/tracing.txt
-- 
1.8.3.1


