Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XhHZA-0002Aa-NO
	for mharc-qemu-trivial@gnu.org; Thu, 23 Oct 2014 08:32:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38518)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1XhHZ2-00021B-Ue
	for qemu-trivial@nongnu.org; Thu, 23 Oct 2014 08:32:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1XhHYw-0000eR-P0
	for qemu-trivial@nongnu.org; Thu, 23 Oct 2014 08:32:24 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51653)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>)
	id 1XhHYk-0000KI-41; Thu, 23 Oct 2014 08:32:06 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s9NCW4tS025841
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Thu, 23 Oct 2014 08:32:04 -0400
Received: from localhost (ovpn-113-191.phx2.redhat.com [10.3.113.191])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s9NCW3pX013673; Thu, 23 Oct 2014 08:32:03 -0400
Date: Thu, 23 Oct 2014 10:32:02 -0200
From: Eduardo Habkost <ehabkost@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <20141023123202.GD19316@thinpad.lan.raisama.net>
References: <1411760764-18292-1-git-send-email-ehabkost@redhat.com>
	<5448A1C3.5030703@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5448A1C3.5030703@msgid.tls.msk.ru>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH 0/3] bitops: Header dependency fixes
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
X-List-Received-Date: Thu, 23 Oct 2014 12:32:31 -0000

On Thu, Oct 23, 2014 at 10:35:47AM +0400, Michael Tokarev wrote:
> On 09/26/2014 11:46 PM, Eduardo Habkost wrote:
> > This series adds a missing include, kills a circular header dependency, and
> > avoid including qemu-common.h from a header to avoid new circular dependencies.
> > 
> > Eduardo Habkost (3):
> >   tests: Add missing include to test-bitops.c
> >   bitops.h: Don't include qemu-common.h
> >   bitmap.h: Don't include qemu-common.h
> 
> Applied all 3 to -trivial, _finally_ :)

Thanks!

But applying the series after commit be4d57c1ea7f17b9cadb0150b330efd9b6026972
breaks build, because now bitmap.h needs stdlib.h (for abort()). Can you
squash the following into patch 3/3?

---
 include/qemu/bitmap.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/qemu/bitmap.h b/include/qemu/bitmap.h
index 955627f..f0273c9 100644
--- a/include/qemu/bitmap.h
+++ b/include/qemu/bitmap.h
@@ -14,6 +14,7 @@
 
 #include <glib.h>
 #include <string.h>
+#include <stdlib.h>
 
 #include "qemu/osdep.h"
 #include "qemu/bitops.h"
-- 
1.9.3

