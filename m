Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dIx36-0005b6-Ok
	for mharc-qemu-trivial@gnu.org; Thu, 08 Jun 2017 09:00:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36320)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dIx31-0005YK-FD
	for qemu-trivial@nongnu.org; Thu, 08 Jun 2017 09:00:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dIx2x-0004CL-KF
	for qemu-trivial@nongnu.org; Thu, 08 Jun 2017 09:00:23 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55990)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1dIx2o-00046W-J9; Thu, 08 Jun 2017 09:00:10 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7AFB080503;
	Thu,  8 Jun 2017 13:00:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 7AFB080503
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=thuth@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 7AFB080503
Received: from thh440s.redhat.com (ovpn-116-59.ams2.redhat.com [10.36.116.59])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 54C437F1CC;
	Thu,  8 Jun 2017 13:00:00 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: Fam Zheng <famz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Eric Blake <eblake@redhat.com>
Date: Thu,  8 Jun 2017 14:59:59 +0200
Message-Id: <1496926799-13040-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Thu, 08 Jun 2017 13:00:09 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH v3] Makefile: Do not generate files if
 "configure" has not been run yet
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
X-List-Received-Date: Thu, 08 Jun 2017 13:00:27 -0000

When doing a "make -j10" in the vanilla QEMU source tree (without
running "configure" first), the Makefile currently generates two
files already, qemu-version.h and qemu-options.def. This should not
happen, so let's only build the generated files if config-host.mak
is available (i.e. "configure" has been run already).

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 v3:
 - Check for config-host.mak at the place where we add the dependencies
   for $(GENERATED_FILES) instead of adding single dependencies all over
   the place

 Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Makefile b/Makefile
index c830d7a..32d4441 100644
--- a/Makefile
+++ b/Makefile
@@ -791,9 +791,11 @@ endif # CONFIG_WIN
 
 # Add a dependency on the generated files, so that they are always
 # rebuilt before other object files
+ifneq ($(wildcard config-host.mak),)
 ifneq ($(filter-out $(UNCHECKED_GOALS),$(MAKECMDGOALS)),$(if $(MAKECMDGOALS),,fail))
 Makefile: $(GENERATED_FILES)
 endif
+endif
 
 .SECONDARY: $(TRACE_HEADERS) $(TRACE_HEADERS:%=%-timestamp) \
 	$(TRACE_SOURCES) $(TRACE_SOURCES:%=%-timestamp) \
-- 
1.8.3.1


