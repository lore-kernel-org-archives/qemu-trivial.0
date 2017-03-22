Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cqiTa-0003j4-R6
	for mharc-qemu-trivial@gnu.org; Wed, 22 Mar 2017 11:47:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57954)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vfeenstr@redhat.com>) id 1cqiTV-0003hW-TN
	for qemu-trivial@nongnu.org; Wed, 22 Mar 2017 11:47:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vfeenstr@redhat.com>) id 1cqiTU-0001QL-Pg
	for qemu-trivial@nongnu.org; Wed, 22 Mar 2017 11:47:01 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60742)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <vfeenstr@redhat.com>)
	id 1cqiTP-0001P6-Jp; Wed, 22 Mar 2017 11:46:55 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1CA104DD7C;
	Wed, 22 Mar 2017 15:46:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 1CA104DD7C
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=vfeenstr@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 1CA104DD7C
Received: from evilvm.brq.redhat.com (dhcp131-51.brq.redhat.com [10.34.131.51])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1CFA27E626;
	Wed, 22 Mar 2017 15:46:53 +0000 (UTC)
From: Vinzenz 'evilissimo' Feenstra <vfeenstr@redhat.com>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, qemu-trivial@nongnu.org,
	Vinzenz Feenstra <vfeenstr@redhat.com>
Date: Wed, 22 Mar 2017 16:46:49 +0100
Message-Id: <20170322154649.6947-1-vfeenstr@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Wed, 22 Mar 2017 15:46:55 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] qga: Add `guest-get-timezone` command
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
X-List-Received-Date: Wed, 22 Mar 2017 15:47:03 -0000

From: Vinzenz Feenstra <vfeenstr@redhat.com>

Adds a new command `guest-get-timezone` reporting the currently
configured timezone on the system. The information on what timezone is
currently is configured is useful in case of Windows VMs where the
offset of the hardware clock is required to have the same offset. This
can be used for management systems like `oVirt` to detect the timezone
difference and warn administrators of the misconfiguration.

Signed-off-by: Vinzenz Feenstra <vfeenstr@redhat.com>
---
 qga/commands.c       | 19 +++++++++++++++++++
 qga/qapi-schema.json | 25 +++++++++++++++++++++++++
 2 files changed, 44 insertions(+)

diff --git a/qga/commands.c b/qga/commands.c
index 4d92946..83d7f99 100644
--- a/qga/commands.c
+++ b/qga/commands.c
@@ -499,3 +499,22 @@ int ga_parse_whence(GuestFileWhence *whence, Error **errp)
     error_setg(errp, "invalid whence code %"PRId64, whence->u.value);
     return -1;
 }
+
+GuestTimezone *qmp_guest_get_timezone(Error **errp)
+{
+    GuestTimezone *info = g_new0(GuestTimezone, 1);
+    GTimeZone *tz = g_time_zone_new_local();
+    gint32 interval = g_time_zone_find_interval(tz, G_TIME_TYPE_STANDARD, 0);
+    gchar const *name = g_time_zone_get_abbreviation(tz, interval);
+    if (name != NULL) {
+        info->offset = g_time_zone_get_offset(tz, interval) / 60;
+        info->zone = g_strdup(name);
+    } else {
+        error_setg(errp, "Timezone lookup failed");
+        g_free(info);
+        info = NULL;
+    }
+    g_time_zone_unref(tz);
+    return info;
+}
+
diff --git a/qga/qapi-schema.json b/qga/qapi-schema.json
index a02dbf2..6683aae 100644
--- a/qga/qapi-schema.json
+++ b/qga/qapi-schema.json
@@ -1042,3 +1042,28 @@
   'data':    { 'path': 'str', '*arg': ['str'], '*env': ['str'],
                '*input-data': 'str', '*capture-output': 'bool' },
   'returns': 'GuestExec' }
+
+
+##
+# @GuestTimezone:
+#
+# @zone:    Timezone name
+# @offset:  Offset to UTC in minutes
+#
+# Since: 2.10
+##
+{ 'struct': 'GuestTimezone',
+  'data':   { 'zone': 'str', 'offset': 'int' } }
+
+
+##
+# @guest-get-timezone:
+#
+# Retrieves the timezone information from the guest.
+#
+# Returns: The guest timezone GuestTimezone information on success.
+#
+# Since: 2.10
+##
+{ 'command': 'guest-get-timezone',
+  'returns': 'GuestTimezone' }
-- 
2.9.3


