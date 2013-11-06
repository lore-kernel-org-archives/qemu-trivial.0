Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VduW6-000678-Ks
	for mharc-qemu-trivial@gnu.org; Tue, 05 Nov 2013 23:14:54 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58846)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <whitearchey@gmail.com>) id 1VdsJb-0007R3-VO
	for qemu-trivial@nongnu.org; Tue, 05 Nov 2013 20:54:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <whitearchey@gmail.com>) id 1VdsJT-0007jk-GI
	for qemu-trivial@nongnu.org; Tue, 05 Nov 2013 20:53:51 -0500
Received: from mail-la0-x22d.google.com ([2a00:1450:4010:c03::22d]:40775)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <whitearchey@gmail.com>) id 1VdsJT-0007je-8g
	for qemu-trivial@nongnu.org; Tue, 05 Nov 2013 20:53:43 -0500
Received: by mail-la0-f45.google.com with SMTP id el20so1225154lab.32
	for <qemu-trivial@nongnu.org>; Tue, 05 Nov 2013 17:53:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:date:subject:cc:to:mime-version
	:content-transfer-encoding:from:message-id:user-agent;
	bh=TTItgtycK5Z/cXZmPBEOhHqB5VjuR7lD2LyhvrOz6NQ=;
	b=E8lFrtXsh5Wr+t5onIy+SSnyiqwpx+D1d/KlQZyuU4Dppbt9hpw+Z0VVlN7c7sZm2B
	u64qRElpAxsje0srJOiKcvVKvVM+lnZNweFG7q6pXxUA87avWyE2v1lSfvwx1t7bB9Om
	sZWQomGiJ9MC9Mrt0/ShkZJAVg5szxgVf2ZIiSrPmzRIOfEG5lnxsZR4Lc28w/3GKUAp
	jF0I8lVLXIySAfZqyNwlsixgJzZTbEWTv89jXtxWjG1qT3wNCSpg9/1ge/rGaAbY5uws
	5m6PWjPOeSjr1eiLFuh6MZUefM/HU+//B/WKTw/5No68OWHwSKqsaevF/qviOeLjVjlw
	vz/A==
X-Received: by 10.152.5.162 with SMTP id t2mr392409lat.1.1383702821536;
	Tue, 05 Nov 2013 17:53:41 -0800 (PST)
Received: from whitewind-arch ([193.169.1.2])
	by mx.google.com with ESMTPSA id e4sm22239638lba.15.2013.11.05.17.53.39
	for <multiple recipients>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Tue, 05 Nov 2013 17:53:40 -0800 (PST)
Content-Type: text/plain; charset=utf-8; format=flowed; delsp=yes
Date: Wed, 06 Nov 2013 10:54:04 +0900
To: qemu-trivial@nongnu.org
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: whitearchey <whitearchey@gmail.com>
Message-ID: <op.w53t8fe2cb68cn@whitewind-arch>
User-Agent: Opera Mail/12.16 (Linux)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4010:c03::22d
X-Mailman-Approved-At: Tue, 05 Nov 2013 23:14:53 -0500
Subject: [Qemu-trivial] [PATCH] qga: Fix shutdown command of guest agent to
	work with SysV
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
X-List-Received-Date: Wed, 06 Nov 2013 01:54:00 -0000

For now guest agent uses following command to shutdown system:
shutdown -P +0 "blabla"
but this syntax works only with shutdown command from systemd or upstart,
because SysV shutdown requires -h switch.

Following patch changes the command so it works with systemd, upstart and SysV

Signed-off-by: Michael Avdienko <whitearchey@gmail.com>
---
  qga/commands-posix.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qga/commands-posix.c b/qga/commands-posix.c
index f453132..10682f5 100644
--- a/qga/commands-posix.c
+++ b/qga/commands-posix.c
@@ -99,7 +99,7 @@ void qmp_guest_shutdown(bool has_mode, const char *mode, Error **err)
          reopen_fd_to_null(1);
          reopen_fd_to_null(2);

-        execle("/sbin/shutdown", "shutdown", shutdown_flag, "+0",
+        execle("/sbin/shutdown", "shutdown", "-h", shutdown_flag, "+0",
                 "hypervisor initiated shutdown", (char*)NULL, environ);
          _exit(EXIT_FAILURE);
      } else if (pid < 0) {
-- 
1.8.4.2

