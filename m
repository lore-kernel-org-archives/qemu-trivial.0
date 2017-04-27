Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1d3qNj-0005RN-NR
	for mharc-qemu-trivial@gnu.org; Thu, 27 Apr 2017 16:51:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54559)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1d3qNh-0005Pf-CM
	for qemu-trivial@nongnu.org; Thu, 27 Apr 2017 16:51:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1d3qNg-0004Kj-Sm
	for qemu-trivial@nongnu.org; Thu, 27 Apr 2017 16:51:17 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42736)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <jsnow@redhat.com>)
	id 1d3qNc-0004G9-9L; Thu, 27 Apr 2017 16:51:12 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 609DF7F7AE;
	Thu, 27 Apr 2017 20:51:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 609DF7F7AE
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=jsnow@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 609DF7F7AE
Received: from scv.usersys.redhat.com (dhcp-17-221.bos.redhat.com
	[10.18.17.221])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1CADA19178;
	Thu, 27 Apr 2017 20:51:03 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, kwolf@redhat.com, eblake@redhat.com,
	mreitz@redhat.com, John Snow <jsnow@redhat.com>
Date: Thu, 27 Apr 2017 16:50:58 -0400
Message-Id: <20170427205100.9505-1-jsnow@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Thu, 27 Apr 2017 20:51:09 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH 0/2] iotests: trivial fixups
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
X-List-Received-Date: Thu, 27 Apr 2017 20:51:18 -0000

Excised from an old patchset from 2015, just a couple of touchups.

John Snow (2):
  iotests: clarify help text
  iotests: fix exclusion option

 tests/qemu-iotests/common | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

-- 
2.9.3


