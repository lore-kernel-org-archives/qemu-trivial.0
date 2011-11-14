Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RQ4g0-0000wD-My
	for mharc-qemu-trivial@gnu.org; Mon, 14 Nov 2011 17:06:52 -0500
Received: from eggs.gnu.org ([140.186.70.92]:56657)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vagrant@freegeek.org>) id 1RQ4fx-0000vy-O4
	for qemu-trivial@nongnu.org; Mon, 14 Nov 2011 17:06:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vagrant@freegeek.org>) id 1RQ4fw-00020H-Jb
	for qemu-trivial@nongnu.org; Mon, 14 Nov 2011 17:06:49 -0500
Received: from mail.freegeek.org ([67.51.72.37]:43243 helo=george.freegeek.org)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vagrant@freegeek.org>) id 1RQ4fw-0001xC-BV
	for qemu-trivial@nongnu.org; Mon, 14 Nov 2011 17:06:48 -0500
Received: from localhost (localhost [127.0.0.1])
	by george.freegeek.org (Postfix) with ESMTP id 620C4497E3
	for <qemu-trivial@nongnu.org>; Mon, 14 Nov 2011 14:06:24 -0800 (PST)
X-Virus-Scanned: Debian amavisd-new at george.fglan
Received: from george.freegeek.org ([127.0.0.1])
	by localhost (george.fglan [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DUaXI9-1DMtp for <qemu-trivial@nongnu.org>;
	Mon, 14 Nov 2011 14:06:24 -0800 (PST)
Received: from talon.fglan (unknown [192.168.3.45])
	by george.freegeek.org (Postfix) with ESMTPS id C88AD48504
	for <qemu-trivial@nongnu.org>; Mon, 14 Nov 2011 14:06:23 -0800 (PST)
Received: from vagrant by talon.fglan with local (Exim 4.72)
	(envelope-from <vagrant@talon.fglan>) id 1RQ4fX-0001Cu-MJ
	for qemu-trivial@nongnu.org; Mon, 14 Nov 2011 14:06:23 -0800
Date: Mon, 14 Nov 2011 14:06:23 -0800
From: Vagrant Cascadian <vagrant@freegeek.org>
To: qemu-trivial@nongnu.org
Message-ID: <20111114220623.GJ26987@talon.fglan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.20 (2009-06-14)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 67.51.72.37
Subject: [Qemu-trivial] Patch: fix typo: runnning -> running
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
X-List-Received-Date: Mon, 14 Nov 2011 22:06:50 -0000

One n too many for running, need we say more.

Signed-Off-By: Vagrant Cascadian <vagrant@freegeek.org>

Index: qemu/target-i386/kvm.c
===================================================================
--- qemu.orig/target-i386/kvm.c	2011-07-02 21:25:10.000000000 -0700
+++ qemu/target-i386/kvm.c	2011-07-02 21:25:20.000000000 -0700
@@ -1537,7 +1537,7 @@
                 code);
         if (host_supports_vmx() && code == VMX_INVALID_GUEST_STATE) {
             fprintf(stderr,
-                    "\nIf you're runnning a guest on an Intel machine without "
+                    "\nIf you're running a guest on an Intel machine without "
                         "unrestricted mode\n"
                     "support, the failure can be most likely due to the guest "
                         "entering an invalid\n"


live well,
  vagrant

