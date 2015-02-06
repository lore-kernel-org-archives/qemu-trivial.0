Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YJqgf-0006SS-Vu
	for mharc-qemu-trivial@gnu.org; Fri, 06 Feb 2015 16:43:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44385)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@bib.uni-mannheim.de>) id 1YJqgd-0006OD-Uq
	for qemu-trivial@nongnu.org; Fri, 06 Feb 2015 16:43:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@bib.uni-mannheim.de>) id 1YJqgd-0006ww-8j
	for qemu-trivial@nongnu.org; Fri, 06 Feb 2015 16:43:39 -0500
Received: from p54ac902a.dip0.t-ipconnect.de ([84.172.144.42]:46019 helo=edv32)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@bib.uni-mannheim.de>) id 1YJqgc-0006vf-EL
	for qemu-trivial@nongnu.org; Fri, 06 Feb 2015 16:43:39 -0500
Received: from stefan by edv32 with local (Exim 4.84)
	(envelope-from <stefan@bib.uni-mannheim.de>)
	id 1YJqgY-00084r-UL; Fri, 06 Feb 2015 22:43:34 +0100
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Date: Fri,  6 Feb 2015 22:43:14 +0100
Message-Id: <1423258997-30957-8-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1423258997-30957-1-git-send-email-sw@weilnetz.de>
References: <1423258997-30957-1-git-send-email-sw@weilnetz.de>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 84.172.144.42
Cc: Stefan Weil <sw@weilnetz.de>
Subject: [Qemu-trivial] [PATCH 07/10] spice: Add missing 'static' attribute
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
X-List-Received-Date: Fri, 06 Feb 2015 21:43:41 -0000

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 spice-qemu-char.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/spice-qemu-char.c b/spice-qemu-char.c
index 7e0d300..a4f4e57 100644
--- a/spice-qemu-char.c
+++ b/spice-qemu-char.c
@@ -158,7 +158,7 @@ static gboolean spice_char_source_dispatch(GSource *source,
     return func(NULL, G_IO_OUT, user_data);
 }
 
-GSourceFuncs SpiceCharSourceFuncs = {
+static GSourceFuncs SpiceCharSourceFuncs = {
     .prepare  = spice_char_source_prepare,
     .check    = spice_char_source_check,
     .dispatch = spice_char_source_dispatch,
-- 
2.1.4


