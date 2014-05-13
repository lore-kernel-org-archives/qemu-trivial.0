Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Wk6rl-0005Fu-15
	for mharc-qemu-trivial@gnu.org; Tue, 13 May 2014 03:11:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54032)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhen-hual@hp.com>) id 1Wk6ra-0004uk-UW
	for qemu-trivial@nongnu.org; Tue, 13 May 2014 03:11:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhen-hual@hp.com>) id 1Wk6rR-0003L1-Kh
	for qemu-trivial@nongnu.org; Tue, 13 May 2014 03:10:58 -0400
Received: from g2t2352.austin.hp.com ([15.217.128.51]:15660)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhen-hual@hp.com>)
	id 1Wk6qu-0002qQ-9Q; Tue, 13 May 2014 03:10:16 -0400
Received: from g2t2360.austin.hp.com (g2t2360.austin.hp.com [16.197.8.247])
	by g2t2352.austin.hp.com (Postfix) with ESMTP id BE8EE152;
	Tue, 13 May 2014 07:10:08 +0000 (UTC)
Received: from piepie.asiapacific.hpqcorp.net (piepie.asiapacific.hpqcorp.net
	[16.187.245.80])
	by g2t2360.austin.hp.com (Postfix) with ESMTP id 581DA49;
	Tue, 13 May 2014 07:10:06 +0000 (UTC)
From: "Li, Zhen-Hua" <zhen-hual@hp.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>,
	<qemu-stable@nongnu.org>
Date: Tue, 13 May 2014 15:09:10 +0800
Message-Id: <1399964954-10842-1-git-send-email-zhen-hual@hp.com>
X-Mailer: git-send-email 2.0.0-rc0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 15.217.128.51
Cc: "Li, ZhenHua" <zhen-hual@hp.com>
Subject: [Qemu-trivial] [PATCH 0/4] Support more than 255 cpus
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
X-List-Received-Date: Tue, 13 May 2014 07:11:07 -0000

From: "Li, ZhenHua" <zhen-hual@hp.com>

These series patches are trying to make Qemu support more than 255 CPUs. 
The max cpu number changed to 4096.

 Support more than 255 cpus: ACPI and APIC defines
 Support more than 255 cpus: max_cpus to 4096
 Support more than 255 cpus: max cpumask bit to 4096
 Support more than 255 cpus: runtime chec

 include/hw/acpi/cpu_hotplug_defs.h | 4 ++--
 include/hw/i386/apic_internal.h    | 2 +-
 include/hw/i386/pc.h | 2 +-
 include/sysemu/sysemu.h | 2 +-
 hw/i386/acpi-build.c | 8 ++++----

