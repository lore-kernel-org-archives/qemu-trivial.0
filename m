Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QQ0md-0000mk-3o
	for mharc-qemu-trivial@gnu.org; Fri, 27 May 2011 13:25:11 -0400
Received: from eggs.gnu.org ([140.186.70.92]:33157)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cerbere@gmail.com>) id 1QQ0mb-0000ha-A4
	for qemu-trivial@nongnu.org; Fri, 27 May 2011 13:25:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cerbere@gmail.com>) id 1QQ0ma-0003gQ-MI
	for qemu-trivial@nongnu.org; Fri, 27 May 2011 13:25:09 -0400
Received: from mail-qw0-f45.google.com ([209.85.216.45]:45883)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cerbere@gmail.com>)
	id 1QQ0mZ-0003aF-DT; Fri, 27 May 2011 13:25:07 -0400
Received: by mail-qw0-f45.google.com with SMTP id 8so1166413qwj.4
	for <multiple recipients>; Fri, 27 May 2011 10:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=SUw6V+5osLCYMU+kS9PJpNRu+8iWFh+6dnsiZ3imDF0=;
	b=qAFOSxsnhX2xXm8IE0LzO1cRUsolwMxwu1B1ubjlaJDGBFR4jFI+5R1F1KHhsH8UI4
	9l0CKYO9TdEKK+70t5APtnEz3Nc6o7on/A+D+gkRGfX8FI+A9/ssi3q7+meifNCcS8nn
	NSfIYTXXiiMl2h+ikCN35ZBUNysZtlRSpcPzs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=B37MxxE1zNbIU0ERQuQDB4XxwJwFeQgLjiAJ+zaQg4ir+kk6Qbd+1dmHoZDycLeBWR
	ZPSnCSgTqzN8fkfHX6HYqndcliw/wn9DeXN5sJFEwfZuU83lfbMQrqsi01zO6Z4YhPij
	JZB3oR5tzZJtUCCj5apl3smF6UF0PgXRGZ4Z0=
Received: by 10.224.189.9 with SMTP id dc9mr1818325qab.11.1306517107261;
	Fri, 27 May 2011 10:25:07 -0700 (PDT)
Received: from localhost.localdomain (modemcable055.201-23-96.mc.videotron.ca
	[96.23.201.55])
	by mx.google.com with ESMTPS id e28sm1198569qck.30.2011.05.27.10.25.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 27 May 2011 10:25:06 -0700 (PDT)
From: Alexandre Raymond <cerbere@gmail.com>
To: qemu-devel@nongnu.org
Date: Fri, 27 May 2011 13:22:27 -0400
Message-Id: <1306516951-31105-3-git-send-email-cerbere@gmail.com>
X-Mailer: git-send-email 1.7.5
In-Reply-To: <1306516951-31105-1-git-send-email-cerbere@gmail.com>
References: <1306516951-31105-1-git-send-email-cerbere@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.216.45
Cc: qemu-trivial@nongnu.org, Alexandre Raymond <cerbere@gmail.com>
Subject: [Qemu-trivial] [PATCH 2/6] Cocoa: avoid displaying window when
	command-line contains '-h'
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
X-List-Received-Date: Fri, 27 May 2011 17:25:10 -0000

There was already a check in place to avoid displaying a window
in certain modes such as vnc, nographic or curses.

Add a check for '-h' to avoid displaying a window for a split-
second before showing the usage information.

Signed-off-by: Alexandre Raymond <cerbere@gmail.com>
---
 ui/cocoa.m |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/ui/cocoa.m b/ui/cocoa.m
index 20f91bc..7fb8d96 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -865,7 +865,8 @@ int main (int argc, const char * argv[]) {
 
     /* In case we don't need to display a window, let's not do that */
     for (i = 1; i < argc; i++) {
-        if (!strcmp(argv[i], "-vnc") ||
+        if (!strcmp(argv[i], "-h") ||
+            !strcmp(argv[i], "-vnc") ||
             !strcmp(argv[i], "-nographic") ||
             !strcmp(argv[i], "-curses")) {
                 return qemu_main(gArgc, gArgv);
-- 
1.7.5


