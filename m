Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fXQsA-00038Z-AU
	for mharc-qemu-trivial@gnu.org; Mon, 25 Jun 2018 08:45:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55386)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXQs7-000356-9p
	for qemu-trivial@nongnu.org; Mon, 25 Jun 2018 08:45:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXQs6-00006W-Gh
	for qemu-trivial@nongnu.org; Mon, 25 Jun 2018 08:45:31 -0400
Received: from mail-qt0-x22f.google.com ([2607:f8b0:400d:c0d::22f]:43142)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXQrx-0008RS-BM; Mon, 25 Jun 2018 08:45:21 -0400
Received: by mail-qt0-x22f.google.com with SMTP id y89-v6so11732709qtd.10;
	Mon, 25 Jun 2018 05:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=sxONjbL6XqUn0XE0GloYBwbh60sF/GdBm3p9sx97vPM=;
	b=J9FDbxPkrdTDPmkQh+qyNZrcJ7hPPXiVMC8Io6vojY7eRMDPkqecEHyTRoWPKC98Xo
	l/KhJFFmunRxJHVY7w9gqMHgE+exvoKUPxT8XRH1uiRYP65ADELndgl8PYsqKlvjzyT7
	m84Ta8TOEKRRrfclLgSgvyg9Sa9hm3cc0eAUNtpdKU6/Xwr/pP8YxNbb00vXqYzazkq+
	1ZQ2RtZ7MnhtVu0o9yp+/D6WDFyHIiWT98xryprNfQBoEhOYlY2SnyjTxFLulTBQ9dza
	NzhWXZ3q9S4Ic3zfyTPXcwbNRn4+DXY9MwFcUTP0Ty8mFmCINrl+hp2Nz3p7lcm87tVT
	0s/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=sxONjbL6XqUn0XE0GloYBwbh60sF/GdBm3p9sx97vPM=;
	b=g28p+wd1SnntPTpbYZPjeaqcx5uU8bhFYkRiGHaJy1HrbfmxJJ7VuNB2WmIAa4cxE8
	KitukO44TtcCVsdL7SShYfvh9auvXulpu+P6rsQP6KeFeZBQjgB6Hxmxgy1X5CKW2S+x
	151QU2ZtYwykk/QZKJT3dG//6YlmSt4DjLCvsUTYxivungqR4znGV4HjflnkRvIrDV7u
	0ogasr5MXUPRmnwIt1fuTcEJJ96Q+bSMJHuqESGnXi9h9dCMAH7QH5oadYo/azdIx0mw
	9st+r5ehEabmAIWU5MuhTfloxXRw8SX60PM+JqjASixuyo7tu3X8BpH+izQZBabp0Y9i
	cOUg==
X-Gm-Message-State: APt69E0nCwUfKpEWTY55GlZIM/lJ7mrN8iMKxf5flIj68sK1SZNtvHvo
	myb4LNJG62KiEKHw0gnqctEBSppu3Hk=
X-Google-Smtp-Source: ADUXVKIvFMwYkJTs55J0FkGptk5Fx3yUCErlMKA1lScCRRw+tNwrfLm8F+XDaRdi0Nbc4taDsb1cgQ==
X-Received: by 2002:ac8:4703:: with SMTP id
	f3-v6mr7489063qtp.176.1529930720743; 
	Mon, 25 Jun 2018 05:45:20 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	m15-v6sm12549562qtm.84.2018.06.25.05.45.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 Jun 2018 05:45:20 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Thomas Huth <thuth@redhat.com>, Stefan Weil <sw@weilnetz.de>,
	Eric Blake <eblake@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Riku Voipio <riku.voipio@iki.fi>, Laurent Vivier <laurent@vivier.eu>
Date: Mon, 25 Jun 2018 09:42:37 -0300
Message-Id: <20180625124238.25339-46-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180625124238.25339-1-f4bug@amsat.org>
References: <20180625124238.25339-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::22f
Subject: [Qemu-trivial] [PATCH v5 45/46] linux-user: Use the IEC binary
 prefix definitions
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
X-List-Received-Date: Mon, 25 Jun 2018 12:45:32 -0000

It eases code review, unit is explicit.

Patch generated using:

  $ git grep -n '[<>][<>]= ?[1-5]0'

and modified manually.

Suggested-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 linux-user/main.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/linux-user/main.c b/linux-user/main.c
index 84e9ec9335..52b5a618fe 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -17,6 +17,7 @@
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "qemu-version.h"
 #include <sys/syscall.h>
 #include <sys/resource.h>
@@ -274,9 +275,9 @@ static void handle_arg_stack_size(const char *arg)
     }
 
     if (*p == 'M') {
-        guest_stack_size *= 1024 * 1024;
+        guest_stack_size *= MiB;
     } else if (*p == 'k' || *p == 'K') {
-        guest_stack_size *= 1024;
+        guest_stack_size *= KiB;
     }
 }
 
-- 
2.18.0


