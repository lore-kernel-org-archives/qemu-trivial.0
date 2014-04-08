Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WXQ6B-0008R4-5p
	for mharc-qemu-trivial@gnu.org; Tue, 08 Apr 2014 03:05:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47457)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WXQ5m-0007kx-JI
	for qemu-trivial@nongnu.org; Tue, 08 Apr 2014 03:05:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WXQ5h-0001gt-Ln
	for qemu-trivial@nongnu.org; Tue, 08 Apr 2014 03:05:10 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:53222)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WXQ5N-0001Lz-4o; Tue, 08 Apr 2014 03:04:45 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id C66F340E2B;
	Tue,  8 Apr 2014 11:04:12 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id A6F8A673;
	Tue,  8 Apr 2014 11:04:12 +0400 (MSK)
Received: (nullmailer pid 10566 invoked by uid 1000);
	Tue, 08 Apr 2014 07:04:12 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Tue,  8 Apr 2014 11:04:02 +0400
Message-Id: <1396940651-10513-3-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1396940651-10513-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1396940651-10513-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 02/11] qga: trivial fix for unclear
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
X-List-Received-Date: Tue, 08 Apr 2014 07:05:30 -0000

From: Amos Kong <akong@redhat.com>

We mixed the use of "guest time", "system time", "hardware time",
"RTC" in documentation, it's unclear.

This patch just added two remarks of RTC and replace two "guest time"
by "guest's system time".

Signed-off-by: Amos Kong <akong@redhat.com>
Reviewed-by: Michal Privoznik <mprivozn@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 qga/commands-posix.c |    2 +-
 qga/qapi-schema.json |   14 +++++++-------
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
1.7.10.4


