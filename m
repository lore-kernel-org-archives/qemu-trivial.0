Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fWwIw-0004LS-0K
	for mharc-qemu-trivial@gnu.org; Sun, 24 Jun 2018 00:07:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42669)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWwIs-0004IZ-HJ
	for qemu-trivial@nongnu.org; Sun, 24 Jun 2018 00:07:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWwIr-0004Mo-Pp
	for qemu-trivial@nongnu.org; Sun, 24 Jun 2018 00:07:06 -0400
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:37252)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWwIp-0004Ks-PB; Sun, 24 Jun 2018 00:07:03 -0400
Received: by mail-qt0-x244.google.com with SMTP id a18-v6so9352901qtj.4;
	Sat, 23 Jun 2018 21:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=CdRYXCWhsmUMH0swMo21YkdEym9cTZmwH2SpIoP+Acw=;
	b=pJi5+FIQaOnrJ5HEq97TOJtF23p/ZpX6NeRN/98BwA3XCehnup4zeDAC//K+ERpBjy
	hdsM/Kanvwf69ObR6mBH6v9EXQM30SwpJE0E1Ut919QjyakC2Pt2BjDpG6wnYL9MGx0O
	PJG7qXslFri1UL6JXBwLXuQPQX7goxPb3owLRwIyuNnQWn+6n11OuYlnkWAdgLNLqM5z
	lzjrVmYK2zla1zmXHiKMf+k0nFYmDz1jpfTKu8ez88FFMkTZztLV9BrmKMpx0pd4iRNj
	fqTtzXe8IsZN5krkbmSiQHzDmnz5aLAm2TZF3B7BOeaZ9wo7LX/3w2NzWA1yO4okwz7r
	Eu7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=CdRYXCWhsmUMH0swMo21YkdEym9cTZmwH2SpIoP+Acw=;
	b=s7xrSbX6Lid2YMJFKBnyzZDkF5zAOI9pNfT/ARNu3dRXMmVU1NGoDsnCO0lPGktTgG
	WIvbSIiNvep6AFeLEuYeZMjJpBquV81ZVcEeVfIUIm9N+udLvmytkEkKDL7F6FHPV/Nn
	57jg5C79PzcR8+gMp9SG8yWp46ljzOF9udS5ACkUrcpGcY90m5o9g0gBJ9LnmrUvrLho
	7dLBAaQNNHkZq+Mi0IAbAB05ta8rHxdGWdwxrF307Wk/PMG2n6ZAohnJusIquDG6NZ3L
	ODFsIqx8pQfmaS4JQQ8mazziIXsrSm+4AXRuKn7uaT8PlIgG1IXZJZsXEnrarGwVR6Wq
	mmnw==
X-Gm-Message-State: APt69E31aFH8J8ealIdAkcTxT0A5Dri8MCGABgp93zOs4r1Rrx4ZpkOK
	8cvsaczJ2HlcrAgU//VwfJs=
X-Google-Smtp-Source: AAOMgpcfkxPniD86wwFaxx+PSMW0el5QV45gVmxmyseW3tRzPFiXv1kNTJyC6iLvazDY5le28zMikA==
X-Received: by 2002:a0c:e80b:: with SMTP id
	y11-v6mr6819845qvn.10.1529813223376; 
	Sat, 23 Jun 2018 21:07:03 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	d14-v6sm7145313qtn.90.2018.06.23.21.07.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 23 Jun 2018 21:07:02 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org, qemu-arm@nongnu.org,
	Jason Wang <jasowang@redhat.com>
Date: Sun, 24 Jun 2018 01:06:07 -0300
Message-Id: <20180624040609.17572-15-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180624040609.17572-1-f4bug@amsat.org>
References: <20180624040609.17572-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: [Qemu-trivial] [PATCH v3 14/16] hw/net/smc91c111: Use
 qemu_log_mask(UNIMP) instead of fprintf
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
X-List-Received-Date: Sun, 24 Jun 2018 04:07:07 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 hw/net/smc91c111.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/hw/net/smc91c111.c b/hw/net/smc91c111.c
index 9094c0b47c..d2fd2040e8 100644
--- a/hw/net/smc91c111.c
+++ b/hw/net/smc91c111.c
@@ -362,10 +362,14 @@ static void smc91c111_writeb(void *opaque, hwaddr offset,
             SET_HIGH(gpr, value);
             return;
         case 12: /* Control */
-            if (value & 1)
-                fprintf(stderr, "smc91c111:EEPROM store not implemented\n");
-            if (value & 2)
-                fprintf(stderr, "smc91c111:EEPROM reload not implemented\n");
+            if (value & 1) {
+                qemu_log_mask(LOG_UNIMP,
+                              "smc91c111: EEPROM store not implemented\n");
+            }
+            if (value & 2) {
+                qemu_log_mask(LOG_UNIMP,
+                              "smc91c111: EEPROM reload not implemented\n");
+            }
             value &= ~3;
             SET_LOW(ctr, value);
             return;
-- 
2.18.0


