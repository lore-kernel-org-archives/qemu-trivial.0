Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1botSU-0007HI-Uq
	for mharc-qemu-trivial@gnu.org; Tue, 27 Sep 2016 10:34:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47744)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1botSP-0007D4-FO
	for qemu-trivial@nongnu.org; Tue, 27 Sep 2016 10:34:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1botSL-0005ba-If
	for qemu-trivial@nongnu.org; Tue, 27 Sep 2016 10:34:05 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46074)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>)
	id 1botSA-0005XX-Eo; Tue, 27 Sep 2016 10:33:50 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EC40C3F1E3;
	Tue, 27 Sep 2016 14:33:49 +0000 (UTC)
Received: from thh440s.redhat.com (ovpn-116-40.ams2.redhat.com [10.36.116.40])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id u8REXlnX031391; Tue, 27 Sep 2016 10:33:48 -0400
From: Thomas Huth <thuth@redhat.com>
To: Jiri Pirko <jiri@resnulli.us>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
Date: Tue, 27 Sep 2016 16:33:46 +0200
Message-Id: <1474986826-2987-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Tue, 27 Sep 2016 14:33:50 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] MAINTAINERS: Add some more rocker related
 files
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
X-List-Received-Date: Tue, 27 Sep 2016 14:34:09 -0000

The files in tests/rocker/ and docs/specs/rocker.txt
should be listed in the Rocker section of MAINTAINERS.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index a5dec30..048a944 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1019,6 +1019,8 @@ Rocker
 M: Jiri Pirko <jiri@resnulli.us>
 S: Maintained
 F: hw/net/rocker/
+F: tests/rocker/
+F: docs/specs/rocker.txt
 
 NVDIMM
 M: Xiao Guangrong <guangrong.xiao@linux.intel.com>
-- 
1.8.3.1


