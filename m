Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QUnBZ-0006yv-52
	for mharc-qemu-trivial@gnu.org; Thu, 09 Jun 2011 17:54:41 -0400
Received: from eggs.gnu.org ([140.186.70.92]:40422)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1QUnBV-0006xn-Ej
	for qemu-trivial@nongnu.org; Thu, 09 Jun 2011 17:54:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1QUnBT-0001rV-Tn
	for qemu-trivial@nongnu.org; Thu, 09 Jun 2011 17:54:37 -0400
Received: from mnementh.archaic.org.uk ([81.2.115.146]:57730)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1QUnBQ-0001qh-9q; Thu, 09 Jun 2011 17:54:32 -0400
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.72)
	(envelope-from <pm215@archaic.org.uk>)
	id 1QUnBN-0007f1-D2; Thu, 09 Jun 2011 22:54:29 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Thu,  9 Jun 2011 22:54:29 +0100
Message-Id: <1307656469-29424-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.2.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 81.2.115.146
Cc: qemu-trivial@nongnu.org, patches@linaro.org
Subject: [Qemu-trivial] [PATCH] configure: Detect and don't try to use older
	libcurl
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
X-List-Received-Date: Thu, 09 Jun 2011 21:54:39 -0000

Older versions of libcurl don't have some of the features we try to
use, in particular curl_multi_setopt(). Check for this in the 'is
libcurl available?' configure test so we disable curl support if the
library is too old.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 configure |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/configure b/configure
index d38b952..03d693a 100755
--- a/configure
+++ b/configure
@@ -1709,7 +1709,7 @@ fi
 if test "$curl" != "no" ; then
   cat > $TMPC << EOF
 #include <curl/curl.h>
-int main(void) { return curl_easy_init(); }
+int main(void) { curl_easy_init(); curl_multi_setopt(0, 0, 0); return 0; }
 EOF
   curl_cflags=`$curlconfig --cflags 2>/dev/null`
   curl_libs=`$curlconfig --libs 2>/dev/null`
-- 
1.7.1


