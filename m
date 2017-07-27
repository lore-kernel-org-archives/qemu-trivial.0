Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dajLh-0003dc-Kp
	for mharc-qemu-trivial@gnu.org; Thu, 27 Jul 2017 10:01:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33234)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosa@redhat.com>) id 1dahVQ-0004jx-N8
	for qemu-trivial@nongnu.org; Thu, 27 Jul 2017 08:03:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosa@redhat.com>) id 1dahVQ-0001f7-2Y
	for qemu-trivial@nongnu.org; Thu, 27 Jul 2017 08:03:04 -0400
Received: from mx1.redhat.com ([209.132.183.28]:1563)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <crosa@redhat.com>)
	id 1dahVL-0001aT-8R; Thu, 27 Jul 2017 08:02:59 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 13F941F59E;
	Thu, 27 Jul 2017 12:02:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 13F941F59E
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=crosa@redhat.com
Received: from localhost.localdomain.com (ovpn-125-5.rdu2.redhat.com
	[10.10.125.5])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9DC364FA25;
	Thu, 27 Jul 2017 12:02:57 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
Date: Thu, 27 Jul 2017 08:02:05 -0400
Message-Id: <20170727120210.6943-1-crosa@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Thu, 27 Jul 2017 12:02:58 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
X-Mailman-Approved-At: Thu, 27 Jul 2017 10:01:08 -0400
Subject: [Qemu-trivial] [PATCH 0/5] Trivial fixes and cleanups
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
X-List-Received-Date: Thu, 27 Jul 2017 12:03:05 -0000

This is a collection of trivial fixes and cleanups.  The only expected
behavior change is in the output on config.log, as per the first
patch.

Cleber Rosa(5):
  configure: remove duplicate single quotes on config.log
  qemu-iotests: get rid of _full_imgproto_details()
  qemu-iotests: remove commented out variables
  qemu-iotests: remove comment about root privileges
  docs: fix broken paths to docs/interop dir

 configure                           |  4 +---
 docs/devel/writing-qmp-commands.txt |  2 +-
 qapi-schema.json                    |  2 +-
 tests/qemu-iotests/check            | 13 +------------
 tests/qemu-iotests/common.rc        |  5 -----
 5 files changed, 4 insertions(+), 22 deletions(-)

