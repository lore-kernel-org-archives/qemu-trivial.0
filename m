Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ctxcH-0004zl-8Z
	for mharc-qemu-trivial@gnu.org; Fri, 31 Mar 2017 10:33:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34966)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <tcminyard@gmail.com>) id 1ctxcE-0004xY-Be
	for qemu-trivial@nongnu.org; Fri, 31 Mar 2017 10:33:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <tcminyard@gmail.com>) id 1ctxcC-00033y-Ta
	for qemu-trivial@nongnu.org; Fri, 31 Mar 2017 10:33:26 -0400
Received: from mail-pg0-x244.google.com ([2607:f8b0:400e:c05::244]:34356)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <tcminyard@gmail.com>)
	id 1ctxc7-00030Z-Dq; Fri, 31 Mar 2017 10:33:19 -0400
Received: by mail-pg0-x244.google.com with SMTP id o123so17835859pga.1;
	Fri, 31 Mar 2017 07:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id;
	bh=nwFc9PwYmTbK49hGmVJT1SmibLDC/S0fXcaybeo4PFo=;
	b=OKGk/TTrtyQlAWq+Jk7Beb4z5rEqUo0ZAiot14+lhbmt3OwSM5LLo1UrQ45q7L62xN
	XlSYNZ3VXWMWSG0NcZUoAycGbk7uI7jlsZ1+dXIs7+0spqum1kLCzTsCxo6gdbjjPiX9
	/No1bbKLQ3YeqQG2AgH7wFzHRQ8DH8JVkw4A7wjd16Hn0D6M65hHBpiwxZcsEPfWe2+6
	Y0Nxvdxrh9gXsPa7cKmSuvGrDKIknK4D1pxwBxkqOBfV65b6VrCUN09lcTn+HSwLvvbI
	ruAd/tb/vGqW0dgt1f52Pru1F2sHSSGFZfxwsmuhmcr0klsdPN3Da13m7Lu9CFQvZU9/
	vcJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=nwFc9PwYmTbK49hGmVJT1SmibLDC/S0fXcaybeo4PFo=;
	b=klNZAH7g8MvOgFIzxFDkLE9oqBk+Ylrlh6/XaYSvgeNlpQLPtcklGAwcuku2HwAYh8
	DitfwvFZVvIBTy4nVzgqh4SHSzulJFfmjgmE7ruc+8ywrrUJwPu89f7q80CDvb155DVN
	gins7cvrAtjVMdhtcxbCT9qFIjMPj83SJxMkX0BdGOE6oed2ndVIvOeGnj9HC9sWEn8Z
	wsJ+elymn75gHOmds7+oYPk4uvqrLd2LRqdh6bUpMJn4Hfc6uJxfI4CyWbRPRNQ5zFGZ
	F+gIOmVO9x70p6gwVJ2CxuvetRamm0ioxHcr445aqlrDEy8KhSkvA8pF4mGxzDQDoxay
	7YhQ==
X-Gm-Message-State: AFeK/H3dr6+GgcorWIn1SzErIRat8Q+QBMHt8D3Ht1Fps9b/w+Q91XBsjiD2ZdxAE67x5Q==
X-Received: by 10.98.196.12 with SMTP id y12mr3192762pff.49.1490970798299;
	Fri, 31 Mar 2017 07:33:18 -0700 (PDT)
Received: from serve.minyard.net ([47.184.141.54])
	by smtp.gmail.com with ESMTPSA id
	a21sm11090684pfc.36.2017.03.31.07.33.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 Mar 2017 07:33:17 -0700 (PDT)
Sender: Corey Minyard <tcminyard@gmail.com>
Received: from t430.minyard.net (t430m.minyard.net [192.168.27.3])
	by serve.minyard.net (Postfix) with ESMTPA id 9C408399;
	Fri, 31 Mar 2017 09:33:15 -0500 (CDT)
Received: by t430.minyard.net (Postfix, from userid 1000)
	id 9703830006A; Fri, 31 Mar 2017 09:33:14 -0500 (CDT)
From: minyard@acm.org
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Ed Maste <emaste@freebsd.org>,
	Eric Blake <eblake@redhat.com>, Corey Minyard <cminyard@mvista.com>
Date: Fri, 31 Mar 2017 09:33:03 -0500
Message-Id: <1490970783-29231-1-git-send-email-minyard@acm.org>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c05::244
Subject: [Qemu-trivial] [PATCH v4] ipmi: Fix macro issues
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
X-List-Received-Date: Fri, 31 Mar 2017 14:33:27 -0000

From: Corey Minyard <cminyard@mvista.com>

Macro parameters should almost always have () around them when used.
llvm reported an error on this.

Remove redundant parenthesis and put parenthesis around the entire
macros with assignments in case they are used in an expression.

The macros were doing ((v) & 1) for a binary input, but that only works
if v == 0 or if v & 1.  Changed to !!(v) so they work for all values.

Remove some unused macros.

Reported in https://bugs.launchpad.net/bugs/1651167

Signed-off-by: Corey Minyard <cminyard@mvista.com>
---

Changes since the last revision:

  * Added the !!(v) change

 hw/ipmi/isa_ipmi_bt.c | 34 ++++++++++++----------------------
 1 file changed, 12 insertions(+), 22 deletions(-)

diff --git a/hw/ipmi/isa_ipmi_bt.c b/hw/ipmi/isa_ipmi_bt.c
index 1c69cb3..13a8c09 100644
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
+                                        (!!(v) << IPMI_BT_B2H_ATN_BIT)))
 
 #define IPMI_BT_SMS_ATN_MASK       (1 << IPMI_BT_SMS_ATN_BIT)
 #define IPMI_BT_GET_SMS_ATN(d)     (((d) >> IPMI_BT_SMS_ATN_BIT) & 0x1)
-#define IPMI_BT_SET_SMS_ATN(d, v)  (d) = (((d) & ~IPMI_BT_SMS_ATN_MASK) | \
-                                        (((v & 1) << IPMI_BT_SMS_ATN_BIT)))
+#define IPMI_BT_SET_SMS_ATN(d, v)  ((d) = (((d) & ~IPMI_BT_SMS_ATN_MASK) | \
+                                        (!!(v) << IPMI_BT_SMS_ATN_BIT)))
 
 #define IPMI_BT_HBUSY_MASK         (1 << IPMI_BT_HBUSY_BIT)
 #define IPMI_BT_GET_HBUSY(d)       (((d) >> IPMI_BT_HBUSY_BIT) & 0x1)
-#define IPMI_BT_SET_HBUSY(d, v)    (d) = (((d) & ~IPMI_BT_HBUSY_MASK) | \
-                                       (((v & 1) << IPMI_BT_HBUSY_BIT)))
+#define IPMI_BT_SET_HBUSY(d, v)    ((d) = (((d) & ~IPMI_BT_HBUSY_MASK) | \
+                                       (!!(v) << IPMI_BT_HBUSY_BIT)))
 
 #define IPMI_BT_BBUSY_MASK         (1 << IPMI_BT_BBUSY_BIT)
-#define IPMI_BT_GET_BBUSY(d)       (((d) >> IPMI_BT_BBUSY_BIT) & 0x1)
-#define IPMI_BT_SET_BBUSY(d, v)    (d) = (((d) & ~IPMI_BT_BBUSY_MASK) | \
-                                       (((v & 1) << IPMI_BT_BBUSY_BIT)))
+#define IPMI_BT_SET_BBUSY(d, v)    ((d) = (((d) & ~IPMI_BT_BBUSY_MASK) | \
+                                       (!!(v) << IPMI_BT_BBUSY_BIT)))
 
 
 /* Mask register */
@@ -79,13 +69,13 @@
 
 #define IPMI_BT_B2H_IRQ_EN_MASK      (1 << IPMI_BT_B2H_IRQ_EN_BIT)
 #define IPMI_BT_GET_B2H_IRQ_EN(d)    (((d) >> IPMI_BT_B2H_IRQ_EN_BIT) & 0x1)
-#define IPMI_BT_SET_B2H_IRQ_EN(d, v) (d) = (((d) & ~IPMI_BT_B2H_IRQ_EN_MASK) | \
-                                        (((v & 1) << IPMI_BT_B2H_IRQ_EN_BIT)))
+#define IPMI_BT_SET_B2H_IRQ_EN(d, v) ((d) = (((d) & ~IPMI_BT_B2H_IRQ_EN_MASK) |\
+                                        (!!(v) << IPMI_BT_B2H_IRQ_EN_BIT)))
 
 #define IPMI_BT_B2H_IRQ_MASK         (1 << IPMI_BT_B2H_IRQ_BIT)
 #define IPMI_BT_GET_B2H_IRQ(d)       (((d) >> IPMI_BT_B2H_IRQ_BIT) & 0x1)
-#define IPMI_BT_SET_B2H_IRQ(d, v)    (d) = (((d) & ~IPMI_BT_B2H_IRQ_MASK) | \
-                                        (((v & 1) << IPMI_BT_B2H_IRQ_BIT)))
+#define IPMI_BT_SET_B2H_IRQ(d, v)    ((d) = (((d) & ~IPMI_BT_B2H_IRQ_MASK) | \
+                                        (!!(v) << IPMI_BT_B2H_IRQ_BIT)))
 
 typedef struct IPMIBT {
     IPMIBmc *bmc;
-- 
2.7.4


