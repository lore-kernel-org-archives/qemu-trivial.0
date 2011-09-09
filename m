Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1R1rIf-0003D0-P7
	for mharc-qemu-trivial@gnu.org; Thu, 08 Sep 2011 22:58:41 -0400
Received: from eggs.gnu.org ([140.186.70.92]:55495)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <nkunkee42@hotmail.com>) id 1R1rId-00033V-1R
	for qemu-trivial@nongnu.org; Thu, 08 Sep 2011 22:58:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <nkunkee42@hotmail.com>) id 1R1rIc-00068X-3u
	for qemu-trivial@nongnu.org; Thu, 08 Sep 2011 22:58:38 -0400
Received: from blu0-omc2-s14.blu0.hotmail.com ([65.55.111.89]:38225)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <nkunkee42@hotmail.com>)
	id 1R1rIa-000684-8t; Thu, 08 Sep 2011 22:58:36 -0400
Received: from BLU0-SMTP122 ([65.55.111.71]) by blu0-omc2-s14.blu0.hotmail.com
	with Microsoft SMTPSVC(6.0.3790.4675); 
	Thu, 8 Sep 2011 19:58:34 -0700
X-Originating-IP: [71.158.236.7]
X-Originating-Email: [nkunkee42@hotmail.com]
Message-ID: <BLU0-SMTP1229303F26E34F713CF60E3BC010@phx.gbl>
Received: from [192.168.1.67] ([71.158.236.7]) by BLU0-SMTP122.phx.gbl over
	TLS secured channel with Microsoft SMTPSVC(6.0.3790.4675); 
	Thu, 8 Sep 2011 19:58:33 -0700
Date: Thu, 8 Sep 2011 21:58:31 -0500
From: Nathan Kunkee <nkunkee42@hotmail.com>
User-Agent: Mozilla/5.0 (X11; U; SunOS i86pc; en-US;
	rv:1.9.2.9) Gecko/20110425 Lightning/1.0b2 Thunderbird/3.1.4
MIME-Version: 1.0
To: qemu-devel@nongnu.org
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
X-OriginalArrivalTime: 09 Sep 2011 02:58:33.0153 (UTC)
	FILETIME=[5C6D6B10:01CC6E9C]
X-detected-operating-system: by eggs.gnu.org: Windows 2000 SP4, XP SP1+
X-Received-From: 65.55.111.89
Cc: qemu-trivial@nongnu.org, nkunkee42@hotmail.com
Subject: [Qemu-trivial] [PATCH] SPARC: Trivial patch to clean up npc monitor
	output
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
X-List-Received-Date: Fri, 09 Sep 2011 02:58:40 -0000


  This patch fixes the spacing of the PC and NPC output from 'info cpus' 
for SPARC.

Signed-off-by: Nathan Kunkee <nkunkee42@hotmail.com>

diff --git a/monitor.c b/monitor.c
index 1b8ba2c..16cd4c5 100644
--- a/monitor.c
+++ b/monitor.c
@@ -884,9 +884,9 @@ static void print_cpu_iter(QObject *obj, void *opaque)
      monitor_printf(mon, "nip=0x" TARGET_FMT_lx,
                     (target_long) qdict_get_int(cpu, "nip"));
  #elif defined(TARGET_SPARC)
-    monitor_printf(mon, "pc=0x " TARGET_FMT_lx,
+    monitor_printf(mon, "pc=0x" TARGET_FMT_lx,
                     (target_long) qdict_get_int(cpu, "pc"));
-    monitor_printf(mon, "npc=0x" TARGET_FMT_lx,
+    monitor_printf(mon, " npc=0x" TARGET_FMT_lx,
                     (target_long) qdict_get_int(cpu, "npc"));
  #elif defined(TARGET_MIPS)
      monitor_printf(mon, "PC=0x" TARGET_FMT_lx,

