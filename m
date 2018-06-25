Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fXQs9-00037O-4C
	for mharc-qemu-trivial@gnu.org; Mon, 25 Jun 2018 08:45:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55371)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXQs6-00033t-A3
	for qemu-trivial@nongnu.org; Mon, 25 Jun 2018 08:45:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXQs3-00005n-6z
	for qemu-trivial@nongnu.org; Mon, 25 Jun 2018 08:45:30 -0400
Received: from mail-qt0-x22e.google.com ([2607:f8b0:400d:c0d::22e]:46352)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXQrz-0008UV-R7; Mon, 25 Jun 2018 08:45:23 -0400
Received: by mail-qt0-x22e.google.com with SMTP id h5-v6so11725688qtm.13;
	Mon, 25 Jun 2018 05:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=OyYRKrBznhLkhc7aKyMdUTaMXJsj7r+u/HQ8VQcDDck=;
	b=Vqw+czh1s1N9GOv7qEacj+z3v4ba2gUGO4vr4XdDOgux1XW9vt7xEbIYklsGYO3pop
	IO5g9KTgkYIfZNOxXrudK5mHKhbZE4GhYfkLIjGKmtJPqCUgm4zPI3i+gs7fhaGyxfd0
	khskMIP4f3+c0O/9rB56ytBRgstzIBZxG7iQVlwldC+m1zWox/S4WR5EdNnMiTSJyANn
	EGoacmvt51D3bv9UM4TWhiUhSFcC1K+rgkBXDAMyfwEHm0ZTAYHtzCRzMRcIyXciliJQ
	BBAkjVcg2tqzIUvaG85i8bra27+/rMxCB2E8F5GEjMinSg/Il2P3IRAM0t34D2Ttx/xX
	ktxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=OyYRKrBznhLkhc7aKyMdUTaMXJsj7r+u/HQ8VQcDDck=;
	b=iVVJfRg75LWyt1rCnLuwt0z+1/vh8/KCJeEEXZWtZi1tc2ZIGz2Q8F4zA0dBBS/pkm
	vNJQDT98oZV20hKjq/ZxbJrfa8PCCWliBTcwVILoltgo0D2AV4SVoRswAzGwh8rOw2j4
	uWgs+a1aL2r0q8Mw3P5OzeAUk4KZ6LZWOZ+WvWJzxvsgpfoa/Le1KlhXMHkuu/tUIC3r
	vZLiXXKwjraXZ2WlKlHg/QWobMb1r9R88PzU+NXTXnMA893pp9Gnbb17mSTd8l4OG2Z3
	26N94fA2eHucESXWGbMY7ig2Rv41RfBdizT8+nou1SJDcAcgCZoyCKLfrO2ioPCuePp5
	B6Dg==
X-Gm-Message-State: APt69E0PvJvjaakEDQ3X2LyJl5bNIX31GNN/RcirJWudagG4lU0zEhBP
	6SUlkVqYFdR/II3eNrz2KM0=
X-Google-Smtp-Source: ADUXVKLjKdq3cv3ruVgYgF4HkIxJYhbPhh3RXw2ir6RGZRqJVB/p8hGSdMRoO1MB7Pv9mc9eLl/PjQ==
X-Received: by 2002:aed:39a1:: with SMTP id
	m30-v6mr10100984qte.328.1529930723203; 
	Mon, 25 Jun 2018 05:45:23 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	m15-v6sm12549562qtm.84.2018.06.25.05.45.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 Jun 2018 05:45:22 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Thomas Huth <thuth@redhat.com>, Stefan Weil <sw@weilnetz.de>,
	Eric Blake <eblake@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Mon, 25 Jun 2018 09:42:38 -0300
Message-Id: <20180625124238.25339-47-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180625124238.25339-1-f4bug@amsat.org>
References: <20180625124238.25339-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::22e
Subject: [Qemu-trivial] [PATCH v5 46/46] bsd-user: Use the IEC binary prefix
 definitions
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
X-List-Received-Date: Mon, 25 Jun 2018 12:45:31 -0000

It eases code review, unit is explicit.

Patch generated using:

  $ git grep -n '[<>][<>]= ?[1-5]0'

and modified manually.

Suggested-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 bsd-user/main.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/bsd-user/main.c b/bsd-user/main.c
index da3b833975..0d3156974c 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -17,6 +17,7 @@
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "qemu-version.h"
 #include <machine/trap.h>
 
@@ -795,9 +796,9 @@ int main(int argc, char **argv)
             if (x86_stack_size <= 0)
                 usage();
             if (*r == 'M')
-                x86_stack_size *= 1024 * 1024;
+                x86_stack_size *= MiB;
             else if (*r == 'k' || *r == 'K')
-                x86_stack_size *= 1024;
+                x86_stack_size *= KiB;
         } else if (!strcmp(r, "L")) {
             interp_prefix = argv[optind++];
         } else if (!strcmp(r, "p")) {
-- 
2.18.0


