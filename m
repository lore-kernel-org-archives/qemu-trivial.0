Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TDbsT-0000WB-Ga
	for mharc-qemu-trivial@gnu.org; Mon, 17 Sep 2012 10:00:45 -0400
Received: from eggs.gnu.org ([208.118.235.92]:59651)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <don@cloudswitch.com>) id 1TDbsQ-0000Uy-Ef
	for qemu-trivial@nongnu.org; Mon, 17 Sep 2012 10:00:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <don@cloudswitch.com>) id 1TDbsK-0003Q7-5t
	for qemu-trivial@nongnu.org; Mon, 17 Sep 2012 10:00:42 -0400
Received: from hub021-nj-8.exch021.serverdata.net ([206.225.164.233]:62495)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <don@cloudswitch.com>)
	id 1TDbsK-0003Pq-1w; Mon, 17 Sep 2012 10:00:36 -0400
Received: from localhost.localdomain (131.239.15.22) by
	east.exch021.serverdata.net (10.240.4.118) with Microsoft SMTP Server
	(TLS) id 14.2.309.2; Mon, 17 Sep 2012 07:00:34 -0700
From: Don Slutz <Don@CloudSwitch.com>
To: <qemu-devel@nongnu.org>, <mtosatti@redhat.com>, <ehabkost@redhat.com>,
	<imammedo@redhat.com>, <avi@redhat.com>, <afaerber@suse.de>,
	<peter.maydell@linaro.org>, <kvm@vger.kernel.org>,
	<anthony@codemonkey.ws>, <qemu-devel@nongnu.org>, <blauwirbel@gmail.com>
Date: Mon, 17 Sep 2012 10:00:25 -0400
Message-ID: <1347890425-9696-1-git-send-email-Don@CloudSwitch.com>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
Content-Type: text/plain
X-detected-operating-system: by eggs.gnu.org: Windows XP/2000 (RFC1323+, w+,
	tstamp-)
X-Received-From: 206.225.164.233
Cc: qemu-trivial@nongnu.org, Don Slutz <Don@CloudSwitch.com>
Subject: [Qemu-trivial] [PATCH v2] target-i386: Report on error during
	cpu_x86_register().
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 17 Sep 2012 14:00:43 -0000

Send it to stderr before free of the details.

Signed-off-by: Don Slutz <Don@CloudSwitch.com>
---
v2: Change __FUNCTION__ to __func__

 target-i386/cpu.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/target-i386/cpu.c b/target-i386/cpu.c
index 57c064f..760cca4 100644
--- a/target-i386/cpu.c
+++ b/target-i386/cpu.c
@@ -1352,6 +1352,7 @@ int cpu_x86_register(X86CPU *cpu, const char *cpu_model)
     }
     object_property_set_str(OBJECT(cpu), def->model_id, "model-id", &error);
     if (error_is_set(&error)) {
+        fprintf(stderr, "%s: %s\n", __func__, error_get_pretty(error));
         error_free(error);
         return -1;
     }
-- 
1.7.1


