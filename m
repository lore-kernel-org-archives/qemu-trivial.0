Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TU2Rm-0005ck-Rk
	for mharc-qemu-trivial@gnu.org; Thu, 01 Nov 2012 17:37:06 -0400
Received: from eggs.gnu.org ([208.118.235.92]:45576)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1TU2Rk-0005VZ-8Q
	for qemu-trivial@nongnu.org; Thu, 01 Nov 2012 17:37:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1TU2Rj-00027P-Al
	for qemu-trivial@nongnu.org; Thu, 01 Nov 2012 17:37:04 -0400
Received: from mail-da0-f45.google.com ([209.85.210.45]:39354)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>)
	id 1TU2Rh-00026p-E3; Thu, 01 Nov 2012 17:37:01 -0400
Received: by mail-da0-f45.google.com with SMTP id n15so1304841dad.4
	for <multiple recipients>; Thu, 01 Nov 2012 14:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=n82b5Ze8QkLAxwCioV4p300kgvtCOfpvrSixs2zOHa4=;
	b=c4nbnPJv5L8QlMyB229SZBRwDSTjM371q1LFUP/2ayrCIpFe/hPxBgoEMpgkS9ps83
	OKETxC/oj9jaIkj44T8s4Fw2N94Vv45v1oMjgVo4nOLMGxw7d0MiGJ6EfCeuY3BM0pFq
	XWMehg2OKHXYwk4P5YdF+oo3CTwxzR39Xk8r4t0i5oMEAyygS3jFRFuhZF9KuSaWkESi
	xZfkqb6mFWSc2A26jAm/NCGm/sxctVg6BTSbwvEhc2grD6B1vYF6HTbDP4dMQZO+9u46
	W77URm96L+YByZXSZeM9XFbIVosmnzLzKXn4y2+E0U1wltZTKM/wRTdsOHthOpGt7A78
	1lww==
Received: by 10.66.84.36 with SMTP id v4mr64120312pay.37.1351805820219;
	Thu, 01 Nov 2012 14:37:00 -0700 (PDT)
Received: from pebble.twiddle.home.com ([1.152.139.87])
	by mx.google.com with ESMTPS id c7sm4534436pay.10.2012.11.01.14.36.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 01 Nov 2012 14:36:59 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
From: Richard Henderson <rth@twiddle.net>
To: qemu-devel@nongnu.org
Date: Fri,  2 Nov 2012 08:36:34 +1100
Message-Id: <1351805797-31899-1-git-send-email-rth@twiddle.net>
X-Mailer: git-send-email 1.7.11.7
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.210.45
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH 0/3] trivial: Remove some pre-TCG
	CPUArchState members
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
X-List-Received-Date: Thu, 01 Nov 2012 21:37:05 -0000

Best I can figure, these temporaries were used by the dyngen
code generator, last seen in qemu 0.9.0.  Certainly there are
no references to these members remaining.

Built x86_64 and i686 hosts.


r~


Richard Henderson (3):
  target-alpha: Remove t0, t1 from CPUAlphaState
  target-m68k: Remove t1 from CPUM68KState
  target-sparc: Remove t0, t1 from CPUSPARCState

 target-alpha/cpu.h | 7 -------
 target-m68k/cpu.h  | 3 ---
 target-sparc/cpu.h | 1 -
 3 files changed, 11 deletions(-)

-- 
1.7.11.7


