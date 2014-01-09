Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1W1KrS-0000Dw-7s
	for mharc-qemu-trivial@gnu.org; Thu, 09 Jan 2014 14:01:46 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57977)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kroosec@gmail.com>) id 1W1KRi-0005oj-E4
	for qemu-trivial@nongnu.org; Thu, 09 Jan 2014 13:35:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kroosec@gmail.com>) id 1W1KRa-0002iH-0M
	for qemu-trivial@nongnu.org; Thu, 09 Jan 2014 13:35:10 -0500
Received: from mail-ee0-x229.google.com ([2a00:1450:4013:c00::229]:61822)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kroosec@gmail.com>)
	id 1W1KRI-0002eF-UP; Thu, 09 Jan 2014 13:34:45 -0500
Received: by mail-ee0-f41.google.com with SMTP id e53so438353eek.0
	for <multiple recipients>; Thu, 09 Jan 2014 10:34:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=FrqqK05gYujCjhtSROgcoLUas5ea9EHg+eKmQ3b2Je8=;
	b=elRzSuokoTDrqcWLiFIC4tu+9dLGIybNDzf4xQUC38RwpB0ugjjeeU2vvpr8v9wWKy
	+1Ornb4WRaXbdo4dEOjKzYL8hvcTE6tc6IphZTu4LHuR+9UvOQyM5J1hKWhz99pVAgHc
	PewOMH9LhVG2pNxr0PtBtTheOsbMH8FM/huQ9PTMb0MiTpfju3jkP/5lmWS5xKHrpj1o
	XKgIdTvF+10/v0qT2j0lBIkaqTvskcyHlPktNVcUSbIb+/IT7BmH+CNFcbUFbPGWsTvF
	RRplZadjkGZaxno/HQoB3Wk+/Uk3pLgavZbugjdelaof8/804iGq5TLo/k23e+yG88Su
	rCDA==
X-Received: by 10.15.44.193 with SMTP id z41mr144807eev.115.1389292482081;
	Thu, 09 Jan 2014 10:34:42 -0800 (PST)
Received: from localhost.localdomain ([41.103.77.117])
	by mx.google.com with ESMTPSA id 1sm7836643eeg.4.2014.01.09.10.34.40
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 09 Jan 2014 10:34:41 -0800 (PST)
From: Hani Benhabiles <kroosec@gmail.com>
To: qemu-devel@nongnu.org
Date: Thu,  9 Jan 2014 19:34:27 +0100
Message-Id: <1389292467-5570-1-git-send-email-kroosec@gmail.com>
X-Mailer: git-send-email 1.8.3.2
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4013:c00::229
X-Mailman-Approved-At: Thu, 09 Jan 2014 14:01:44 -0500
Cc: qemu-trivial@nongnu.org, stefanha@redhat.com, aliguori@amazon.com
Subject: [Qemu-trivial] [PATCH] net: Use g_strdup_printf instead of snprintf.
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
X-List-Received-Date: Thu, 09 Jan 2014 18:35:18 -0000

assign_name() in net/net.c is using snprintf + g_strdup to get the same
result as g_strdup_printf.

Signed-off-by: Hani Benhabiles <kroosec@gmail.com>
---
 net/net.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/net/net.c b/net/net.c
index 9db88cc..9363b35 100644
--- a/net/net.c
+++ b/net/net.c
@@ -164,7 +164,6 @@ void qemu_macaddr_default_if_unset(MACAddr *macaddr)
 static char *assign_name(NetClientState *nc1, const char *model)
 {
     NetClientState *nc;
-    char buf[256];
     int id = 0;
 
     QTAILQ_FOREACH(nc, &net_clients, next) {
@@ -176,9 +175,7 @@ static char *assign_name(NetClientState *nc1, const char *model)
         }
     }
 
-    snprintf(buf, sizeof(buf), "%s.%d", model, id);
-
-    return g_strdup(buf);
+    return g_strdup_printf("%s.%d", model, id);
 }
 
 static void qemu_net_client_destructor(NetClientState *nc)
-- 
1.8.3.2


