Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1g86Ll-0005w7-0E
	for mharc-qemu-trivial@gnu.org; Thu, 04 Oct 2018 12:19:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46556)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosa@redhat.com>) id 1g86Le-0005rw-Bk
	for qemu-trivial@nongnu.org; Thu, 04 Oct 2018 12:19:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosa@redhat.com>) id 1g86Lb-0002fQ-1y
	for qemu-trivial@nongnu.org; Thu, 04 Oct 2018 12:19:33 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36284)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <crosa@redhat.com>)
	id 1g86LB-0002U5-Ty; Thu, 04 Oct 2018 12:19:07 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9A65C811AC;
	Thu,  4 Oct 2018 16:19:03 +0000 (UTC)
Received: from dhcp-17-10.bos.redhat.com (dhcp-17-10.bos.redhat.com
	[10.18.17.10])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7484377BFE;
	Thu,  4 Oct 2018 16:19:02 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org
Cc: Riku Voipio <riku.voipio@iki.fi>, Eduardo Habkost <ehabkost@redhat.com>,
	qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
	Cleber Rosa <crosa@redhat.com>, qemu-trivial@nongnu.org,
	Max Reitz <mreitz@redhat.com>
Date: Thu,  4 Oct 2018 12:18:49 -0400
Message-Id: <20181004161852.11673-8-crosa@redhat.com>
In-Reply-To: <20181004161852.11673-1-crosa@redhat.com>
References: <20181004161852.11673-1-crosa@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Thu, 04 Oct 2018 16:19:03 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH 07/10] scripts/decodetree.py: remove unused
 imports
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
X-List-Received-Date: Thu, 04 Oct 2018 16:19:38 -0000

Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 scripts/decodetree.py | 2 --
 1 file changed, 2 deletions(-)

diff --git a/scripts/decodetree.py b/scripts/decodetree.py
index 277f9a9bba..457cffea90 100755
--- a/scripts/decodetree.py
+++ b/scripts/decodetree.py
@@ -149,12 +149,10 @@
 #   trans_addl_i(ctx, &arg_opi, insn)
 #
 
-import io
 import os
 import re
 import sys
 import getopt
-import pdb
 
 insnwidth = 32
 insnmask = 0xffffffff
-- 
2.17.1


