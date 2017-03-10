Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cmTGE-000239-5n
	for mharc-qemu-trivial@gnu.org; Fri, 10 Mar 2017 17:43:46 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46416)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <krzk@kernel.org>) id 1cmQnp-0008CT-C0
	for qemu-trivial@nongnu.org; Fri, 10 Mar 2017 15:06:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <krzk@kernel.org>) id 1cmQnj-0002Ry-Q9
	for qemu-trivial@nongnu.org; Fri, 10 Mar 2017 15:06:17 -0500
Received: from mail.kernel.org ([198.145.29.136]:32782)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <krzk@kernel.org>)
	id 1cmQne-0002Pa-Gk; Fri, 10 Mar 2017 15:06:06 -0500
Received: from mail.kernel.org (localhost [127.0.0.1])
	by mail.kernel.org (Postfix) with ESMTP id 7265E204D2;
	Fri, 10 Mar 2017 20:06:03 +0000 (UTC)
Received: from localhost.localdomain (bzq-109-67-52-244.red.bezeqint.net
	[109.67.52.244])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 2686F20595;
	Fri, 10 Mar 2017 20:06:00 +0000 (UTC)
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Eduardo Habkost <ehabkost@redhat.com>,
	qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-trivial@nongnu.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Date: Fri, 10 Mar 2017 22:05:48 +0200
Message-Id: <20170310200550.13313-1-krzk@kernel.org>
X-Mailer: git-send-email 2.9.3
X-Virus-Scanned: ClamAV using ClamSMTP
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 198.145.29.136
X-Mailman-Approved-At: Fri, 10 Mar 2017 17:43:44 -0500
Subject: [Qemu-trivial] [PATCH v2 0/2] qdev: Minor const improvements
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
X-List-Received-Date: Fri, 10 Mar 2017 20:06:21 -0000

Hi,

Minor improvements.

Changes since v1:
1. Follow suggestions from v1 discussion - drop other consts.

Best regards,
Krzysztof


Krzysztof Kozlowski (2):
  qdev: Constify value passed to qdev_prop_set_macaddr
  qdev: Constify local variable returned by blk_bs

 hw/core/qdev-properties-system.c | 2 +-
 hw/core/qdev-properties.c        | 3 ++-
 include/hw/qdev-properties.h     | 3 ++-
 3 files changed, 5 insertions(+), 3 deletions(-)

-- 
2.9.3


