Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dJLiA-0003fO-92
	for mharc-qemu-trivial@gnu.org; Fri, 09 Jun 2017 11:20:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36944)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dJLi6-0003d4-0y
	for qemu-trivial@nongnu.org; Fri, 09 Jun 2017 11:20:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dJLi5-0006VV-6x
	for qemu-trivial@nongnu.org; Fri, 09 Jun 2017 11:20:26 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48565)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1dJLi0-0006QF-RL; Fri, 09 Jun 2017 11:20:20 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E8CD48A003;
	Fri,  9 Jun 2017 15:20:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com E8CD48A003
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eblake@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com E8CD48A003
Received: from red.redhat.com (ovpn-121-94.rdu2.redhat.com [10.10.121.94])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A438317C28;
	Fri,  9 Jun 2017 15:20:17 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: armbru@redhat.com,
	marcandre.lureau@redhat.com,
	qemu-trivial@nongnu.org
Date: Fri,  9 Jun 2017 10:20:15 -0500
Message-Id: <20170609152017.7286-1-eblake@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Fri, 09 Jun 2017 15:20:20 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH 0/2] qobject coccinelle followups
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
X-List-Received-Date: Fri, 09 Jun 2017 15:20:27 -0000

Inspired by https://lists.gnu.org/archive/html/qemu-devel/2017-06/msg02505.html

Surprisingly, the updated script didn't find any existing longhand
use as candidates for QDECREF() (our last such use was cleaned up
as a side effect, in commit b72fe9e), but it DID find another straggler
missed in commit 579cf1d1.

Eric Blake (2):
  qobject: Update coccinelle script to catch Q{INC,DEC}REF
  qobject: Catch another straggler for use of qdict_put_str()

 qemu-img.c                       | 2 +-
 scripts/coccinelle/qobject.cocci | 6 ++++++
 2 files changed, 7 insertions(+), 1 deletion(-)

-- 
2.9.4


