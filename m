Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eA1Sx-0000pz-Ox
	for mharc-qemu-trivial@gnu.org; Wed, 01 Nov 2017 18:26:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36715)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <domen.puncer@gmail.com>) id 1eA077-0002Jx-Bo
	for qemu-trivial@nongnu.org; Wed, 01 Nov 2017 16:59:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <domen.puncer@gmail.com>) id 1eA076-00036m-Ee
	for qemu-trivial@nongnu.org; Wed, 01 Nov 2017 16:59:53 -0400
Received: from mail-pg0-x243.google.com ([2607:f8b0:400e:c05::243]:54036)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <domen.puncer@gmail.com>)
	id 1eA076-00032H-8V
	for qemu-trivial@nongnu.org; Wed, 01 Nov 2017 16:59:52 -0400
Received: by mail-pg0-x243.google.com with SMTP id s2so3119178pge.10
	for <qemu-trivial@nongnu.org>; Wed, 01 Nov 2017 13:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:from:date:message-id:subject:to;
	bh=3dMX57kiLhLdpnOeIVaJo1U4COgmD42jY0ESV/33XcU=;
	b=uqEVFM8qZaJeNB8O0QNSY8G3naSksRzzOjh+wQ76JdBQ9WXcAMjC02g4YhKjAL1V5R
	BBaq0jLUHgChAr5z47yWwaziQZ0p7bAD1hSsrM2NKlxhmtQpK4VndpIKIOd1s73ytkZr
	zzFbdcb5fkVAT0rkEjqsfUqXiX9NH7uTxwU1SvRReXOdo+xhSg89CzbiTvaNlON8oSsl
	JqT1QYSciSZEcHsFEaPa0Amtb23jR2mfWXUDvnlSppHZXug8SoVcHVmZL5XYy/LACCBZ
	uK2OMcVpFSuNkb14vwLvSZJI0rR8z7cmzjKM4NXRquPq044QxUm5p5Sfl4U0R57xsrDs
	vHtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
	:to; bh=3dMX57kiLhLdpnOeIVaJo1U4COgmD42jY0ESV/33XcU=;
	b=b2tH2mpOd/Ws7U7Uz0MkbJaRKbSXJWQALe6uPNLnqIR1XkXqOd0h3mpk2JeC/yuNzG
	HgyX5UKEhp+600USvZ9XH3BC2JLo++LqHrbslHBl2KedRZgntDFoomm+bhj3F79LNpiK
	1TiggoXZ9MSB8avVavzAQCJavibsSZb2OfYUCShquvC4QY05HVYFsDUiNY1TZSf8kdX5
	Ak6J+QkqpbU+WzWxPXfi4FdIwm2NRC48ku8llMwnjAxDXKpC5yVbVgclSNNo2gtIKLoQ
	LSySLdQvBWXeHgxVsAVu685aCMTrS8513QwcrsXU4Y1+wC6/Del5PZRpm+4xzL+6+5DX
	0U3g==
X-Gm-Message-State: AMCzsaUkQ4eim0Vs5CzJcVnUHDSSEmRJqToJF7Y2KNs1GkocM+IPqHWj
	zZf5M2/cVRoCzNK8iMqes/9XFqJ/4ksjpWRBLipypvEE
X-Google-Smtp-Source: ABhQp+QNEB8Hmnnf8tfgmO/jwXxcgGJUfJ9fjHu7Wgz1hRVDDLm4MS8SS5qRThbhPwl33HUc/pML6i1OUf4RG1fV9/o=
X-Received: by 10.99.94.198 with SMTP id s189mr1166708pgb.32.1509569990345;
	Wed, 01 Nov 2017 13:59:50 -0700 (PDT)
MIME-Version: 1.0
Sender: domen.puncer@gmail.com
Received: by 10.100.164.97 with HTTP; Wed, 1 Nov 2017 13:59:49 -0700 (PDT)
From: Domen Puncer Kugler <domen@cba.si>
Date: Wed, 1 Nov 2017 20:59:49 +0000
X-Google-Sender-Auth: ijJmce_cbkKINTf8RBWGjVZLDFU
Message-ID: <CAB1b2sgGrJbpC5vDMJ2D2kPms_4cGmyfMjpcww4nj6rfNZaF9Q@mail.gmail.com>
To: qemu-trivial@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::243
X-Mailman-Approved-At: Wed, 01 Nov 2017 18:26:30 -0400
Subject: [Qemu-trivial] =?utf-8?q?=5BPATCH=5D_hw/timer/armv7m=5Fsystick=3A?=
	=?utf-8?q?_Fix_default_system=5Fclock=5Fscale=2E_Resolves_SIGFPE_d?=
	=?utf-8?b?aXZpZGUgYnkgemVyby7vv7w=?=
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
X-List-Received-Date: Wed, 01 Nov 2017 20:59:54 -0000

Fix default system_clock_scale. Resolves SIGFPE divide by zero.

Netduino platform code does not provide a way to set
system_clock_scale, so it remains 0.
This causes a divide by zero, when emulated code asks systick for
current timer value:
    (s->tick - (t + 1)) / systick_scale(s)) + 1;
Patch fixes this by providing a default value.

Also replaces a magic number an with already defined constant:
    #define SYSTICK_SCALE 1000ULL


Signed-off-by: Domen Puncer Kugler <domen@cba.si>
---

diff --git a/hw/timer/armv7m_systick.c b/hw/timer/armv7m_systick.c
index df8d2804b3..651f8030a8 100644
--- a/hw/timer/armv7m_systick.c
+++ b/hw/timer/armv7m_systick.c
@@ -25,15 +25,15 @@
 #define SYSTICK_CLKSOURCE (1 << 2)
 #define SYSTICK_COUNTFLAG (1 << 16)

-int system_clock_scale;
+uint64_t system_clock_scale = SYSTICK_SCALE;

 /* Conversion factor from qemu timer to SysTick frequencies.  */
-static inline int64_t systick_scale(SysTickState *s)
+static inline uint64_t systick_scale(SysTickState *s)
 {
     if (s->control & SYSTICK_CLKSOURCE) {
         return system_clock_scale;
     } else {
-        return 1000;
+        return SYSTICK_SCALE;
     }
 }

