Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1daxyd-0005W6-RP
	for mharc-qemu-trivial@gnu.org; Fri, 28 Jul 2017 01:38:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49235)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxyb-0005U9-W2
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 01:38:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxyb-00057d-8P
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 01:38:18 -0400
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:37508)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxyW-00050r-Pc; Fri, 28 Jul 2017 01:38:12 -0400
Received: by mail-qk0-x241.google.com with SMTP id x77so5585108qka.4;
	Thu, 27 Jul 2017 22:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=dHwUwup2g/LQRU7Mh5rvMfQvTY0/4ZEdT6huY7HMP7A=;
	b=Xxe0igYUUNopMEqJFvoQ9j5R4Kf+lyQggrLhcSh+ffekLNMG6k7ncLH2I+YVyp3fK5
	ftHYA9GVGDoq6ISB1HxR+5yYBr17vY5sYtKrJKp2yw+MGz1nRgLeD7XclXzuo+1Bw7dY
	g1mwRQijQ9BTxy2Syb8DxLzmCLCZE3n5PXh0A7plpkPWvW8YxK3F62pDq7g7B0Cgi/xD
	CbYKkSFczvr6Wv/2IgSdE42d0fXVY+P1ehkOjtHtoc7iJYT8ZkpX1gqMx0iNpGG0fNjD
	Gn0Qjj6mMKnnju3hoWp4s+DOY/KisHu8ZbilsaYXQ7HW30TBVtcd70UbuOpgfP8yPlyC
	l1+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=dHwUwup2g/LQRU7Mh5rvMfQvTY0/4ZEdT6huY7HMP7A=;
	b=IJtA65254uSd9kJWlglZkxtWl4X16EYoiSEcBggseXDuMrCsRl78XiHsikKhIbAnwu
	TjbmUFVMV/HpCaMimVDbf5BHk2WsAonuhaNAeIiLcOD3Nmh6egmCjPOH2B2KbPnKO5ZP
	gePTGLhPIIUU+T56FNQyjD567sr0u9GE5u/3pZy/TMK78o9hnOY31wTzkfqkTw8+fqZT
	eZGfm4PAeA4+jzQJosjQ7ed2rD8U2Q9D8WYPhnQWJy/qQgEljjRX5OoY6+gMNmNbjUSP
	44YHrrYtjNViei4zXn1J5mTltMamHdF0S/+71Fwhr0n0XhyFMgyCa80bVcJexoTLbaXT
	v1KA==
X-Gm-Message-State: AIVw1127edVAbtwa7RgSMxDXARc7dJF8hcI1GvGs00xyEVxEaekK7Kle
	OZvonqH18QlZaA==
X-Received: by 10.55.103.23 with SMTP id b23mr9338286qkc.55.1501220292304;
	Thu, 27 Jul 2017 22:38:12 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	h41sm12129560qta.45.2017.07.27.22.38.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Jul 2017 22:38:11 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Eric Blake <eblake@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Laurent Vivier <lvivier@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Fri, 28 Jul 2017 02:36:09 -0300
Message-Id: <20170728053610.15770-47-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170728053610.15770-1-f4bug@amsat.org>
References: <20170728053610.15770-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: [Qemu-trivial] [RFC PATCH 46/47] MAINTAINERS: add missing entries
 for Coccinelle scripts
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
X-List-Received-Date: Fri, 28 Jul 2017 05:38:19 -0000

and voluntary myself as reviewer

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---

I'm not a Coccinelle specialist but willing to learn and help!

 MAINTAINERS | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 224890643d..7854792765 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1537,6 +1537,12 @@ Checkpatch
 S: Odd Fixes
 F: scripts/checkpatch.pl
 
+Coccinelle scripts
+R: Philippe Mathieu-Daudé <f4bug@amsat.org>
+S: Orphan
+F: scripts/cocci-macro-file.h
+F: scripts/coccinelle/
+
 Migration
 M: Juan Quintela <quintela@redhat.com>
 M: Dr. David Alan Gilbert <dgilbert@redhat.com>
@@ -1970,4 +1976,3 @@ Build system architecture
 M: Daniel P. Berrange <berrange@redhat.com>
 S: Odd Fixes
 F: docs/devel/build-system.txt
-
-- 
2.13.3


