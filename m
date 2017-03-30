Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ctgwX-0008AB-MV
	for mharc-qemu-trivial@gnu.org; Thu, 30 Mar 2017 16:45:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59092)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <tcminyard@gmail.com>) id 1ctds0-00015Y-Bn
	for qemu-trivial@nongnu.org; Thu, 30 Mar 2017 13:28:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <tcminyard@gmail.com>) id 1ctdrz-0000wN-5J
	for qemu-trivial@nongnu.org; Thu, 30 Mar 2017 13:28:24 -0400
Received: from mail-oi0-x243.google.com ([2607:f8b0:4003:c06::243]:33828)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <tcminyard@gmail.com>)
	id 1ctdru-0000vg-CX; Thu, 30 Mar 2017 13:28:18 -0400
Received: by mail-oi0-x243.google.com with SMTP id t11so5597425oib.1;
	Thu, 30 Mar 2017 10:28:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id;
	bh=T83YL+pxjCfnd39tZby0YR6/ADHVWNZMzbmjn7WgGvc=;
	b=KDb1P4xckixY6sMVwHarPSYAn1nNJ/FcfGpJZkBYMuXRSqfFKR0sApscYJ85vcW/HP
	C0cwLIL7/MnpQQ29/Gzwo44Cms+njpPDE19L5zSu5fgWEuqsjNFDMDD2PWdK9lksk3hD
	NZF+VZapSGL5qUAE29BAk22hJmcWycOi4lTbjm7LRWxzjtoplTweg5niGo6kkNREq2w+
	StlukfpPRzrO/gbySzsRV5MOnBhqu7S/PS/l80lpiW/EIcsoSU440yjq061bMOROREoE
	l8xCz6V15tG+Nh4fVZDlSfTe2uleZv1jD6aLRKtGFf7bMxHoF+WSLHnlTxM72N6F5q6h
	HCdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=T83YL+pxjCfnd39tZby0YR6/ADHVWNZMzbmjn7WgGvc=;
	b=KcBLfv4HZcaUuXd2D/+XgtTKEoArw446RtAo0nfckle2VhUZCmMBqCdHC3AcsOHmhU
	CGzdhNL0ntdytwXqPWMr0APDra0UKygwO128rj31FD8Rzmns7vfzUbp5nHFP3Z+tJL4f
	lhgfcbDC3hpUOhkkQp2nfk+KsoNx71Ga9bHGLPalbryyguCCKyJNjPXRXZRg4Fw5AUN+
	WMb4nAzv1aklNnt2VEV3X6sjYgGnGJJVJW9qedhtP3Y1w8W7WIH8qq+leRGTVuYUJFo3
	56sXoHIqBVS1yRNxIHVJ//lA7f//9hvWXEeoS/Kr3QrOBdmdLDaMv9V6RJN3PmREVRoJ
	fnOA==
X-Gm-Message-State: AFeK/H01nAxHgxrDvZDr+z8iTy38NY4YPd9gvQSrm4xJt6YyZx1s2eTfNJLfrGCYYH+asw==
X-Received: by 10.157.37.162 with SMTP id q31mr490143ota.255.1490894897482;
	Thu, 30 Mar 2017 10:28:17 -0700 (PDT)
Received: from serve.minyard.net ([47.184.141.54])
	by smtp.gmail.com with ESMTPSA id
	u13sm1265076otu.37.2017.03.30.10.28.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 30 Mar 2017 10:28:16 -0700 (PDT)
Sender: Corey Minyard <tcminyard@gmail.com>
Received: from t430.minyard.net (t430m.minyard.net [192.168.27.3])
	by serve.minyard.net (Postfix) with ESMTPA id 2C83615E;
	Thu, 30 Mar 2017 12:28:15 -0500 (CDT)
Received: by t430.minyard.net (Postfix, from userid 1000)
	id 98B4F30005E; Thu, 30 Mar 2017 12:28:14 -0500 (CDT)
From: minyard@acm.org
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Ed Maste <emaste@freebsd.org>,
	Eric Blake <eblake@redhat.com>, Corey Minyard <cminyard@mvista.com>
Date: Thu, 30 Mar 2017 12:28:12 -0500
Message-Id: <1490894892-8055-1-git-send-email-minyard@acm.org>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c06::243
X-Mailman-Approved-At: Thu, 30 Mar 2017 16:45:16 -0400
Subject: [Qemu-trivial] [PATCH v2 resend] ipmi: Fix macro issues
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
X-List-Received-Date: Thu, 30 Mar 2017 17:28:25 -0000

From: Corey Minyard <cminyard@mvista.com>

Macro parameters should almost always have () around them when used.
llvm reported an error on this.

Remove redundant parenthesis and put parenthesis around the entire
macros with assignments in case they are used in an expression.

Remove some unused macros.

Reported in https://bugs.launchpad.net/bugs/1651167

Signed-off-by: Corey Minyard <cminyard@mvista.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 hw/ipmi/isa_ipmi_bt.c | 34 ++++++++++++----------------------
 1 file changed, 12 insertions(+), 22 deletions(-)

diff --git a/hw/ipmi/isa_ipmi_bt.c b/hw/ipmi/isa_ipmi_bt.c
index 1c69cb3..2fcc3d2 100644
--- a/hw/ipmi/isa_ipmi_bt.c
+++ b/hw/ipmi/isa_ipmi_bt.c
@@ -37,40 +37,30 @@
 #define IPMI_BT_HBUSY_BIT          6
 #define IPMI_BT_BBUSY_BIT          7
 
-#define IPMI_BT_CLR_WR_MASK        (1 << IPMI_BT_CLR_WR_BIT)
 #define IPMI_BT_GET_CLR_WR(d)      (((d) >> IPMI_BT_CLR_WR_BIT) & 0x1)
-#define IPMI_BT_SET_CLR_WR(d, v)   (d) = (((d) & ~IPMI_BT_CLR_WR_MASK) | \
-                                       (((v & 1) << IPMI_BT_CLR_WR_BIT)))
 
-#define IPMI_BT_CLR_RD_MASK        (1 << IPMI_BT_CLR_RD_BIT)
 #define IPMI_BT_GET_CLR_RD(d)      (((d) >> IPMI_BT_CLR_RD_BIT) & 0x1)
-#define IPMI_BT_SET_CLR_RD(d, v)   (d) = (((d) & ~IPMI_BT_CLR_RD_MASK) | \
-                                       (((v & 1) << IPMI_BT_CLR_RD_BIT)))
 
-#define IPMI_BT_H2B_ATN_MASK       (1 << IPMI_BT_H2B_ATN_BIT)
 #define IPMI_BT_GET_H2B_ATN(d)     (((d) >> IPMI_BT_H2B_ATN_BIT) & 0x1)
-#define IPMI_BT_SET_H2B_ATN(d, v)  (d) = (((d) & ~IPMI_BT_H2B_ATN_MASK) | \
-                                        (((v & 1) << IPMI_BT_H2B_ATN_BIT)))
 
 #define IPMI_BT_B2H_ATN_MASK       (1 << IPMI_BT_B2H_ATN_BIT)
 #define IPMI_BT_GET_B2H_ATN(d)     (((d) >> IPMI_BT_B2H_ATN_BIT) & 0x1)
-#define IPMI_BT_SET_B2H_ATN(d, v)  (d) = (((d) & ~IPMI_BT_B2H_ATN_MASK) | \
-                                        (((v & 1) << IPMI_BT_B2H_ATN_BIT)))
+#define IPMI_BT_SET_B2H_ATN(d, v)  ((d) = (((d) & ~IPMI_BT_B2H_ATN_MASK) | \
+                                        (((v) & 1) << IPMI_BT_B2H_ATN_BIT)))
 
 #define IPMI_BT_SMS_ATN_MASK       (1 << IPMI_BT_SMS_ATN_BIT)
 #define IPMI_BT_GET_SMS_ATN(d)     (((d) >> IPMI_BT_SMS_ATN_BIT) & 0x1)
-#define IPMI_BT_SET_SMS_ATN(d, v)  (d) = (((d) & ~IPMI_BT_SMS_ATN_MASK) | \
-                                        (((v & 1) << IPMI_BT_SMS_ATN_BIT)))
+#define IPMI_BT_SET_SMS_ATN(d, v)  ((d) = (((d) & ~IPMI_BT_SMS_ATN_MASK) | \
+                                        (((v) & 1) << IPMI_BT_SMS_ATN_BIT)))
 
 #define IPMI_BT_HBUSY_MASK         (1 << IPMI_BT_HBUSY_BIT)
 #define IPMI_BT_GET_HBUSY(d)       (((d) >> IPMI_BT_HBUSY_BIT) & 0x1)
-#define IPMI_BT_SET_HBUSY(d, v)    (d) = (((d) & ~IPMI_BT_HBUSY_MASK) | \
-                                       (((v & 1) << IPMI_BT_HBUSY_BIT)))
+#define IPMI_BT_SET_HBUSY(d, v)    ((d) = (((d) & ~IPMI_BT_HBUSY_MASK) | \
+                                       (((v) & 1) << IPMI_BT_HBUSY_BIT)))
 
 #define IPMI_BT_BBUSY_MASK         (1 << IPMI_BT_BBUSY_BIT)
-#define IPMI_BT_GET_BBUSY(d)       (((d) >> IPMI_BT_BBUSY_BIT) & 0x1)
-#define IPMI_BT_SET_BBUSY(d, v)    (d) = (((d) & ~IPMI_BT_BBUSY_MASK) | \
-                                       (((v & 1) << IPMI_BT_BBUSY_BIT)))
+#define IPMI_BT_SET_BBUSY(d, v)    ((d) = (((d) & ~IPMI_BT_BBUSY_MASK) | \
+                                       (((v) & 1) << IPMI_BT_BBUSY_BIT)))
 
 
 /* Mask register */
@@ -79,13 +69,13 @@
 
 #define IPMI_BT_B2H_IRQ_EN_MASK      (1 << IPMI_BT_B2H_IRQ_EN_BIT)
 #define IPMI_BT_GET_B2H_IRQ_EN(d)    (((d) >> IPMI_BT_B2H_IRQ_EN_BIT) & 0x1)
-#define IPMI_BT_SET_B2H_IRQ_EN(d, v) (d) = (((d) & ~IPMI_BT_B2H_IRQ_EN_MASK) | \
-                                        (((v & 1) << IPMI_BT_B2H_IRQ_EN_BIT)))
+#define IPMI_BT_SET_B2H_IRQ_EN(d, v) ((d) = (((d) & ~IPMI_BT_B2H_IRQ_EN_MASK) |\
+                                        (((v) & 1) << IPMI_BT_B2H_IRQ_EN_BIT)))
 
 #define IPMI_BT_B2H_IRQ_MASK         (1 << IPMI_BT_B2H_IRQ_BIT)
 #define IPMI_BT_GET_B2H_IRQ(d)       (((d) >> IPMI_BT_B2H_IRQ_BIT) & 0x1)
-#define IPMI_BT_SET_B2H_IRQ(d, v)    (d) = (((d) & ~IPMI_BT_B2H_IRQ_MASK) | \
-                                        (((v & 1) << IPMI_BT_B2H_IRQ_BIT)))
+#define IPMI_BT_SET_B2H_IRQ(d, v)    ((d) = (((d) & ~IPMI_BT_B2H_IRQ_MASK) | \
+                                        (((v) & 1) << IPMI_BT_B2H_IRQ_BIT)))
 
 typedef struct IPMIBT {
     IPMIBmc *bmc;
-- 
2.7.4


