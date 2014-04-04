Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WW5zk-0007ho-8L
	for mharc-qemu-trivial@gnu.org; Fri, 04 Apr 2014 11:25:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50378)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <akong@redhat.com>) id 1WW5zd-0007Y1-7O
	for qemu-trivial@nongnu.org; Fri, 04 Apr 2014 11:25:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <akong@redhat.com>) id 1WW5zU-0001Vh-Dh
	for qemu-trivial@nongnu.org; Fri, 04 Apr 2014 11:25:21 -0400
Received: from mx1.redhat.com ([209.132.183.28]:14341)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <akong@redhat.com>)
	id 1WW5zU-0001VP-4u; Fri, 04 Apr 2014 11:25:12 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s34FPBA7002707
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Fri, 4 Apr 2014 11:25:11 -0400
Received: from amosk.info.com (vpn1-113-82.nay.redhat.com [10.66.113.82])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s34FP81F022968; Fri, 4 Apr 2014 11:25:09 -0400
From: Amos Kong <akong@redhat.com>
To: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Date: Fri,  4 Apr 2014 23:25:02 +0800
Message-Id: <1396625102-29034-1-git-send-email-akong@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: mprivozn@redhat.com, mjt@tls.msk.ru, lersek@redhat.com
Subject: [Qemu-trivial] [PATCH v2] qga: trivial fix for unclear
	documentation of guest-set-time
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
X-List-Received-Date: Fri, 04 Apr 2014 15:25:27 -0000

We mixed the use of "guest time", "system time", "hardware time",
"RTC" in documentation, it's unclear.

This patch just added two remarks of RTC and replace two "guest time"
by "guest's system time".

Signed-off-by: Amos Kong <akong@redhat.com>
Reviewed-by: Michal Privoznik <mprivozn@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
V2: improve commitlog (eric)
---
 qga/commands-posix.c |  2 +-
 qga/qapi-schema.json | 14 +++++++-------
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/qga/commands-posix.c b/qga/commands-posix.c
index 6b5f11f..935a4ec 100644
--- a/qga/commands-posix.c
+++ b/qga/commands-posix.c
@@ -171,7 +171,7 @@ void qmp_guest_set_time(bool has_time, int64_t time_ns, Error **errp)
     /* Now, if user has passed a time to set and the system time is set, we
      * just need to synchronize the hardware clock. However, if no time was
      * passed, user is requesting the opposite: set the system time from the
-     * hardware clock. */
+     * hardware clock (RTC). */
     pid = fork();
     if (pid == 0) {
         setsid();
diff --git a/qga/qapi-schema.json b/qga/qapi-schema.json
index 80edca1..a8cdcb3 100644
--- a/qga/qapi-schema.json
+++ b/qga/qapi-schema.json
@@ -96,8 +96,8 @@
 ##
 # @guest-get-time:
 #
-# Get the information about guest time relative to the Epoch
-# of 1970-01-01 in UTC.
+# Get the information about guest's System Time relative to
+# the Epoch of 1970-01-01 in UTC.
 #
 # Returns: Time in nanoseconds.
 #
@@ -117,11 +117,11 @@
 # gap was, NTP might not be able to resynchronize the
 # guest.
 #
-# This command tries to set guest time to the given value,
-# then sets the Hardware Clock to the current System Time.
-# This will make it easier for a guest to resynchronize
-# without waiting for NTP. If no @time is specified, then
-# the time to set is read from RTC.
+# This command tries to set guest's System Time to the
+# given value, then sets the Hardware Clock (RTC) to the
+# current System Time. This will make it easier for a guest
+# to resynchronize without waiting for NTP. If no @time is
+# specified, then the time to set is read from RTC.
 #
 # @time: #optional time of nanoseconds, relative to the Epoch
 #        of 1970-01-01 in UTC.
-- 
1.8.5.3


