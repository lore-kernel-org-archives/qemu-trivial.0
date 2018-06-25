Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fXQs0-0002vm-1u
	for mharc-qemu-trivial@gnu.org; Mon, 25 Jun 2018 08:45:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55296)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXQrx-0002tI-V5
	for qemu-trivial@nongnu.org; Mon, 25 Jun 2018 08:45:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXQru-0008Pb-0k
	for qemu-trivial@nongnu.org; Mon, 25 Jun 2018 08:45:21 -0400
Received: from mail-qt0-x22d.google.com ([2607:f8b0:400d:c0d::22d]:46350)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXQro-0008NT-UM; Mon, 25 Jun 2018 08:45:12 -0400
Received: by mail-qt0-x22d.google.com with SMTP id h5-v6so11725135qtm.13;
	Mon, 25 Jun 2018 05:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=P/WHvuMNKFdXdZIDHQZCrQXUyyr5st/qS2bWvd+UOMk=;
	b=Evcx+KVLrLycR8XRHHieczSiPgtIbQzvf4YbAG+XDLjqksHBFIPPjYztNrbDpbb0K6
	px9rKrdz2lTiBcjZgA5yja6BGxMVgvW6pgPccq7zr8qtbJnt4oULscm3un3V3D3Qdm0P
	pJyLcE7Nktj4LX8C68HXECPflpZFJvrY4rD2UFsRx+qGJgjrqzdVNsazfar2JeXbqIwi
	OU6DfPUPLbmhS74vAUroHOyhkn5Jee7qH1Sl3m/gKiXgk6HUyN3t55So5FqNJbe5RLiQ
	cW1gDSTXiSyzanr69M1UIaLfOy+/SV9Pgr3Vnp4xM6TaJRCB73XVB7jbsSTSOAZr4rYr
	ejag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=P/WHvuMNKFdXdZIDHQZCrQXUyyr5st/qS2bWvd+UOMk=;
	b=maQ0iS0TI2EVU1+XvzAUcDuWaDBJ8ljP0FNWRY5VPQCpM6ZGeiCLTbeK2JZ5wJtVLb
	Gvc2aKvN8k3nfmeGY+/GBLs9PzleCLtZVZIUHBo6Uf7kb/imOWST2fZtsB3wGKuAyNKC
	SnpI/9DdIUWZlqDY5VJWTI60yTZfsDILbODa77qyo8lVcqFxRjiq2tZ2TRgE7eq4C5t9
	sqcN+EDJnLqf8BMGaL91ckvRw/ghBTqOns8c5XcN2R+aYW/9A/jsQJD4bRBLOCUvf3gQ
	XTskjRQHr/MelSJd8Ghx/8a/xGuKaQWImzS1PUT1Rph8r3x3OnG7AMFfGbyWnmj41i35
	7wwQ==
X-Gm-Message-State: APt69E2BQMTcdomICvRGzJFxGPddcKR8HQAKhVYfvTX4OQck8rExieYG
	VzM82XwCEqKT3WsEijapYSEfgynDXag=
X-Google-Smtp-Source: ADUXVKL+4Ad3kTWKKe7EfWAgCenOh8AjLRmQGntwiaHSUNqU4To2lPG0cgjiabtPCne5oBd44GOVUA==
X-Received: by 2002:aed:24b0:: with SMTP id
	t45-v6mr4474093qtc.86.1529930712379; 
	Mon, 25 Jun 2018 05:45:12 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	m15-v6sm12549562qtm.84.2018.06.25.05.45.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 Jun 2018 05:45:09 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Thomas Huth <thuth@redhat.com>, Stefan Weil <sw@weilnetz.de>,
	Eric Blake <eblake@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Markus Armbruster <armbru@redhat.com>
Date: Mon, 25 Jun 2018 09:42:34 -0300
Message-Id: <20180625124238.25339-43-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180625124238.25339-1-f4bug@amsat.org>
References: <20180625124238.25339-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::22d
Subject: [Qemu-trivial] [PATCH v5 42/46] monitor: Use the IEC binary prefix
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
X-List-Received-Date: Mon, 25 Jun 2018 12:45:23 -0000

It eases code review, unit is explicit.

Patch generated using:

  $ git grep -n '[<>][<>]= ?[1-5]0'

and modified manually.

Suggested-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 monitor.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/monitor.c b/monitor.c
index 0730a27172..ace14195d6 100644
--- a/monitor.c
+++ b/monitor.c
@@ -23,6 +23,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include <dirent.h>
 #include "cpu.h"
 #include "hw/hw.h"
@@ -3286,7 +3287,7 @@ static QDict *monitor_parse_arguments(Monitor *mon,
                         monitor_printf(mon, "enter a positive value\n");
                         goto fail;
                     }
-                    val <<= 20;
+                    val *= MiB;
                 }
                 qdict_put_int(qdict, key, val);
             }
-- 
2.18.0


