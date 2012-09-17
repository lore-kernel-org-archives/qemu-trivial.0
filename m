Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TDXJz-0005fk-2m
	for mharc-qemu-trivial@gnu.org; Mon, 17 Sep 2012 05:08:51 -0400
Received: from eggs.gnu.org ([208.118.235.92]:34753)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1TDXJv-0005WV-NQ
	for qemu-trivial@nongnu.org; Mon, 17 Sep 2012 05:08:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1TDXJu-0003ZG-Qu
	for qemu-trivial@nongnu.org; Mon, 17 Sep 2012 05:08:47 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45517)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>)
	id 1TDXJn-0003YL-Vv; Mon, 17 Sep 2012 05:08:40 -0400
Received: from int-mx02.intmail.prod.int.phx2.redhat.com
	(int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q8H98cqR004179
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 17 Sep 2012 05:08:38 -0400
Received: from lacos-laptop.usersys.redhat.com (vpn1-6-209.ams2.redhat.com
	[10.36.6.209])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id q8H98aY3030811; Mon, 17 Sep 2012 05:08:37 -0400
From: Laszlo Ersek <lersek@redhat.com>
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, armbru@redhat.com,
	lersek@redhat.com
Date: Mon, 17 Sep 2012 11:10:03 +0200
Message-Id: <1347873003-11593-1-git-send-email-lersek@redhat.com>
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.12
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] TextConsole: saturate escape parameter in
	TTY_STATE_CSI
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
X-List-Received-Date: Mon, 17 Sep 2012 09:08:48 -0000

Signed-off-by: Laszlo Ersek <lersek@redhat.com>
---
 Build tested.
 console.c |    7 +++++--
 1 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/console.c b/console.c
index c1ed5e0..67080f4 100644
--- a/console.c
+++ b/console.c
@@ -938,8 +938,11 @@ static void console_putchar(TextConsole *s, int ch)
     case TTY_STATE_CSI: /* handle escape sequence parameters */
         if (ch >= '0' && ch <= '9') {
             if (s->nb_esc_params < MAX_ESC_PARAMS) {
-                s->esc_params[s->nb_esc_params] =
-                    s->esc_params[s->nb_esc_params] * 10 + ch - '0';
+                int *param = &s->esc_params[s->nb_esc_params];
+                int digit = (ch - '0');
+
+                *param = (*param <= (INT_MAX - digit) / 10) ?
+                         *param * 10 + digit : INT_MAX;
             }
         } else {
             if (s->nb_esc_params < MAX_ESC_PARAMS)
-- 
1.7.1


