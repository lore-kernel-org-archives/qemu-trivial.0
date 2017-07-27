Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dajLl-0003il-Lk
	for mharc-qemu-trivial@gnu.org; Thu, 27 Jul 2017 10:01:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33615)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosa@redhat.com>) id 1dahVk-0004uu-O6
	for qemu-trivial@nongnu.org; Thu, 27 Jul 2017 08:03:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosa@redhat.com>) id 1dahVk-0001rb-02
	for qemu-trivial@nongnu.org; Thu, 27 Jul 2017 08:03:24 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34762)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <crosa@redhat.com>)
	id 1dahVW-0001jp-FD; Thu, 27 Jul 2017 08:03:10 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6089AF6250;
	Thu, 27 Jul 2017 12:03:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 6089AF6250
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=crosa@redhat.com
Received: from localhost.localdomain.com (ovpn-125-5.rdu2.redhat.com
	[10.10.125.5])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4D5A15D72D;
	Thu, 27 Jul 2017 12:03:07 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	Cleber Rosa <crosa@redhat.com>
Date: Thu, 27 Jul 2017 08:02:06 -0400
Message-Id: <20170727120210.6943-2-crosa@redhat.com>
In-Reply-To: <20170727120210.6943-1-crosa@redhat.com>
References: <20170727120210.6943-1-crosa@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Thu, 27 Jul 2017 12:03:09 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
X-Mailman-Approved-At: Thu, 27 Jul 2017 10:01:08 -0400
Subject: [Qemu-trivial] [PATCH 1/5] configure: remove duplicate single
 quotes on config.log header
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
X-List-Received-Date: Thu, 27 Jul 2017 12:03:25 -0000

The generation of the informational header on config.log contains two
pairs of single quotes, which seems unintentional, and looks like
this:

  # QEMU configure log Thu Jul 26 08:17:15 EDT 2017
  # Configured with: './configure' '--target-list=x86_64-softmmu'

With this change, the quotes comprehend the entire command line:

  # QEMU configure log Mon Jul 26 08:17:35 EDT 2017
  # Configured with: './configure --target-list=x86_64-softmmu'

Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 configure | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/configure b/configure
index 987f59b..344d6d2 100755
--- a/configure
+++ b/configure
@@ -35,9 +35,7 @@ rm -f config.log
 
 # Print a helpful header at the top of config.log
 echo "# QEMU configure log $(date)" >> config.log
-printf "# Configured with:" >> config.log
-printf " '%s'" "$0" "$@" >> config.log
-echo >> config.log
+echo "# Configured with: '$0 $@'" >> config.log
 echo "#" >> config.log
 
 print_error() {
-- 
2.9.4


