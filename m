Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fIDnx-0001Jp-Az
	for mharc-qemu-trivial@gnu.org; Mon, 14 May 2018 09:46:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35620)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mprivozn@redhat.com>) id 1fIDnr-0001Al-Jx
	for qemu-trivial@nongnu.org; Mon, 14 May 2018 09:46:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mprivozn@redhat.com>) id 1fIDnl-0005Jh-QQ
	for qemu-trivial@nongnu.org; Mon, 14 May 2018 09:46:15 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:39792 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mprivozn@redhat.com>)
	id 1fIDng-0005Hx-1b; Mon, 14 May 2018 09:46:04 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 00C6E406F125;
	Mon, 14 May 2018 13:46:03 +0000 (UTC)
Received: from localhost.localdomain (ovpn-204-89.brq.redhat.com
	[10.40.204.89])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 16EEA94584;
	Mon, 14 May 2018 13:46:01 +0000 (UTC)
From: Michal Privoznik <mprivozn@redhat.com>
To: qemu-devel@nongnu.org
Cc: thuth@redhat.com,
	pbonzini@redhat.com,
	qemu-trivial@nongnu.org
Date: Mon, 14 May 2018 15:45:45 +0200
Message-Id: <9dbde2b5d864d126b75d8c0d7bae2011e8cc7e9b.1526305502.git.mprivozn@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Mon, 14 May 2018 13:46:03 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Mon, 14 May 2018 13:46:03 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'mprivozn@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-trivial] [PATCH] qemu-options: Allow -no-user-config again
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
X-List-Received-Date: Mon, 14 May 2018 13:46:19 -0000

After 1217d6ca2bf28c0febe1bd7d5b3fa912bbf6af2a we error out
explicitly if an unknown -option was passed on the command line.
However, we are doing two pass command line option parsing. In
the first pass we just look for -no-user-config or -nodefconfig
being present which determines whether we load user config or
not. Then in the second pass we finally parse everything else
throwing an error if an unsupported -option was found. Problem is
that in the second pass -no-user-config and -nodefconfig are not
handled explicitly which makes us throw the unsupported option
error.

Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
---
 vl.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/vl.c b/vl.c
index b9f6b42779..846cd29d8a 100644
--- a/vl.c
+++ b/vl.c
@@ -4015,6 +4015,10 @@ int main(int argc, char **argv, char **envp)
                     exit(1);
                 }
                 break;
+            case QEMU_OPTION_nodefconfig:
+            case QEMU_OPTION_nouserconfig:
+                /* Nothing to be parsed here. Especially, do not error out below. */
+                break;
             default:
                 if (os_parse_cmd_args(popt->index, optarg)) {
                     error_report("Option not supported in this build");
-- 
2.16.1


