Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e2vjM-0003mi-2o
	for mharc-qemu-trivial@gnu.org; Fri, 13 Oct 2017 04:54:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34590)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1e2vjK-0003lP-8S
	for qemu-trivial@nongnu.org; Fri, 13 Oct 2017 04:54:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1e2vjJ-0000dL-Kk
	for qemu-trivial@nongnu.org; Fri, 13 Oct 2017 04:54:06 -0400
Received: from mx1.redhat.com ([209.132.183.28]:29610)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <famz@redhat.com>)
	id 1e2vjE-0000U7-Lm; Fri, 13 Oct 2017 04:54:00 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 579BC81DE3;
	Fri, 13 Oct 2017 08:53:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 579BC81DE3
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=famz@redhat.com
Received: from lemon.redhat.com (ovpn-12-113.pek2.redhat.com [10.72.12.113])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 337C760841;
	Fri, 13 Oct 2017 08:53:56 +0000 (UTC)
From: Fam Zheng <famz@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Date: Fri, 13 Oct 2017 16:53:52 +0800
Message-Id: <20171013085355.7563-1-famz@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Fri, 13 Oct 2017 08:53:59 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH v2 0/3] MAINTAINERS: Small fixes
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
X-List-Received-Date: Fri, 13 Oct 2017 08:54:07 -0000

v2: Adopt Thomas' suggestions.

Fam Zheng (3):
  MAINTAINERS: Clean up SCSI device section
  MAINTAINERS: Fix Sun4v file
  MAINTAINERS: Track default-configs/pci.mak

 MAINTAINERS | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

-- 
2.13.5


