Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e0cOQ-0006vy-P2
	for mharc-qemu-trivial@gnu.org; Fri, 06 Oct 2017 19:50:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40526)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cON-0006rU-0O
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:50:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cOM-0004mA-6O
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:50:55 -0400
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:36724)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cOK-0004kv-6u; Fri, 06 Oct 2017 19:50:52 -0400
Received: by mail-qk0-x243.google.com with SMTP id z14so12858900qkg.3;
	Fri, 06 Oct 2017 16:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=pBhRk7wefM0Jo6cp0PZP7qgT8QF9OW/vpm+XVmBMWmY=;
	b=Qxy1IIHCFySqduRHOOVfqOH7/e7fcoOkYIBf+hDgKGH6NouDJn5omHeJWfxzDQ3o76
	+zCJYI2iL6KPqcSF8LjtTnuOhAxnjM50RP5pHZwphAD1nPN0OpIHipxnbBYq7ix0sSwe
	gdNwU04FMz9iazTv3+CFl1XS06cKW4T5vL3jFHYmaUqeZ8rS9aCZj3IV2uauVbiGq0AF
	LSTDMIFrZX2bgDCKKaAYVB0I/5Y/UHhk9S40txZ6u/3ZNPrSC5b/E1T8KDZC5S5V1GoJ
	inJM8RVa+nzcDtjFmJmtFhrFtTKaUdhYfS2Y9WDtgjAQovdc/8mCfbkLNre+G0oM2LbL
	lGNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=pBhRk7wefM0Jo6cp0PZP7qgT8QF9OW/vpm+XVmBMWmY=;
	b=QLswaA1dlWBU+Ko14vPN0IDMxL0rCbPoYq0BBQVTCaDlqx6bDlV8aV2yS7gw0e7kYZ
	VoMAogJH4eqjLxutmWUI5UVrWjzDhSslJtPVqfz8Y/1SptFRN+9UgOuhYv6VHBueKr4B
	xUUVas/YLg32LRws5463U4M9NIEka+yYaY75ZSdVPP4Mvpn9BtsbsckTkz/9gdneqg2/
	mRW6uaJqfl6qTSfYfkbPpFTlWIhqq79jvbOtv1UNYDY15MnENOBh9/l5mhBoKjIGnYk0
	OEVelJMTqHboFZC423fJpORJ7kbfo8NGrFrDTREKs01MH7WzkDySIe+BwP8Is7r/iQM8
	Ge1A==
X-Gm-Message-State: AMCzsaU3XIywPtwrzNlx/CTbG5iLa78bt9QiM0LbW+tfpCuZCwKSYmmi
	i2TzzGSaXkzbjzBOPCHBT0M=
X-Google-Smtp-Source: AOwi7QCr0uacMItXF8w/roZRlW9A34XHKk3ZfyUrCwYMZzinZCAkp/IyoalbAmjLd1uiNRuwbKwWdA==
X-Received: by 10.55.162.7 with SMTP id l7mr759629qke.74.1507333851533;
	Fri, 06 Oct 2017 16:50:51 -0700 (PDT)
Received: from yoga.lan ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id g1sm1705226qta.95.2017.10.06.16.50.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Oct 2017 16:50:51 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>,
	Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	qemu trival <qemu-trivial@nongnu.org>
Date: Fri,  6 Oct 2017 20:49:00 -0300
Message-Id: <20171006235023.11952-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20171006235023.11952-1-f4bug@amsat.org>
References: <20171006235023.11952-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: [Qemu-trivial] [PATCH 05/88] cocci: use g_strfreev()
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
X-List-Received-Date: Fri, 06 Oct 2017 23:50:56 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 scripts/coccinelle/g_new.cocci | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/scripts/coccinelle/g_new.cocci b/scripts/coccinelle/g_new.cocci
index 9643ce3f23..42ab166d04 100644
--- a/scripts/coccinelle/g_new.cocci
+++ b/scripts/coccinelle/g_new.cocci
@@ -173,6 +173,17 @@ expression s, e;
   ... when != p
   *p = e;
 
+// g_strfreev()
+@@
+identifier p, a;
+@@
+-   for (p = a; *p; p++) {
+-       g_free(*p);
+-   }
+    ... when != a
+-    g_free(a);
++    g_strfreev(a);
+
 ////////////////////////////////////////
 //
 // last transformations: cleanups
-- 
2.14.2


