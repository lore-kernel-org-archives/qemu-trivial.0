Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZfPSq-0001g9-Pp
	for mharc-qemu-trivial@gnu.org; Fri, 25 Sep 2015 05:38:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36101)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1ZfPSn-0001bh-J2
	for qemu-trivial@nongnu.org; Fri, 25 Sep 2015 05:38:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1ZfPSm-000397-6L
	for qemu-trivial@nongnu.org; Fri, 25 Sep 2015 05:38:45 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45446)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>)
	id 1ZfPSg-000375-TT; Fri, 25 Sep 2015 05:38:39 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id 7566C341AF5;
	Fri, 25 Sep 2015 09:38:38 +0000 (UTC)
Received: from thh440s.redhat.com (vpn1-4-5.ams2.redhat.com [10.36.4.5])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t8P9caxp021813; Fri, 25 Sep 2015 05:38:37 -0400
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Fri, 25 Sep 2015 11:38:36 +0200
Message-Id: <1443173916-8895-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: Paolo Bonzini <pbonzini@redhat.com>
Subject: [Qemu-trivial] [PATCH] doc: Refresh URLs in the qemu-tech
	documentation
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
X-List-Received-Date: Fri, 25 Sep 2015 09:38:47 -0000

The TwoOStwo and Willows page seem to have disappeared completely,
and also some of the other links were not pointing to the right
locations anymore.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 qemu-tech.texi | 73 ++++++++++++++++++++++++----------------------------------
 1 file changed, 30 insertions(+), 43 deletions(-)

diff --git a/qemu-tech.texi b/qemu-tech.texi
index b6fcb2d..022017d 100644
--- a/qemu-tech.texi
+++ b/qemu-tech.texi
@@ -320,7 +320,7 @@ SH4
 @node QEMU compared to other emulators
 @section QEMU compared to other emulators
 
-Like bochs [3], QEMU emulates an x86 CPU. But QEMU is much faster than
+Like bochs [1], QEMU emulates an x86 CPU. But QEMU is much faster than
 bochs as it uses dynamic compilation. Bochs is closely tied to x86 PC
 emulation while QEMU can emulate several processors.
 
@@ -333,25 +333,25 @@ than QEMU (in particular it does register allocation) but it is closely
 tied to an x86 host and target and has no support for precise exceptions
 and system emulation.
 
-EM86 [4] is the closest project to user space QEMU (and QEMU still uses
+EM86 [3] is the closest project to user space QEMU (and QEMU still uses
 some of its code, in particular the ELF file loader). EM86 was limited
 to an alpha host and used a proprietary and slow interpreter (the
-interpreter part of the FX!32 Digital Win32 code translator [5]).
+interpreter part of the FX!32 Digital Win32 code translator [4]).
 
-TWIN [6] is a Windows API emulator like Wine. It is less accurate than
-Wine but includes a protected mode x86 interpreter to launch x86 Windows
-executables. Such an approach has greater potential because most of the
-Windows API is executed natively but it is far more difficult to develop
-because all the data structures and function parameters exchanged
+TWIN from Willows Software was a Windows API emulator like Wine. It is less
+accurate than Wine but includes a protected mode x86 interpreter to launch
+x86 Windows executables. Such an approach has greater potential because most
+of the Windows API is executed natively but it is far more difficult to
+develop because all the data structures and function parameters exchanged
 between the API and the x86 code must be converted.
 
-User mode Linux [7] was the only solution before QEMU to launch a
+User mode Linux [5] was the only solution before QEMU to launch a
 Linux kernel as a process while not needing any host kernel
 patches. However, user mode Linux requires heavy kernel patches while
 QEMU accepts unpatched Linux kernels. The price to pay is that QEMU is
 slower.
 
-The Plex86 [8] PC virtualizer is done in the same spirit as the now
+The Plex86 [6] PC virtualizer is done in the same spirit as the now
 obsolete qemu-fast system emulator. It requires a patched Linux kernel
 to work (you cannot launch the same kernel on your PC), but the
 patches are really small. As it is a PC virtualizer (no emulation is
@@ -359,13 +359,13 @@ done except for some privileged instructions), it has the potential of
 being faster than QEMU. The downside is that a complicated (and
 potentially unsafe) host kernel patch is needed.
 
-The commercial PC Virtualizers (VMWare [9], VirtualPC [10], TwoOStwo
-[11]) are faster than QEMU, but they all need specific, proprietary
+The commercial PC Virtualizers (VMWare [7], VirtualPC [8]) are faster
+than QEMU (without virtualization), but they all need specific, proprietary
 and potentially unsafe host drivers. Moreover, they are unable to
 provide cycle exact simulation as an emulator can.
 
-VirtualBox [12], Xen [13] and KVM [14] are based on QEMU. QEMU-SystemC
-[15] uses QEMU to simulate a system where some hardware devices are
+VirtualBox [9], Xen [10] and KVM [11] are based on QEMU. QEMU-SystemC
+[12] uses QEMU to simulate a system where some hardware devices are
 developed in SystemC.
 
 @node Portable dynamic translation
@@ -608,64 +608,51 @@ way, it can be relocated at load time.
 @table @asis
 
 @item [1]
-@url{http://citeseer.nj.nec.com/piumarta98optimizing.html}, Optimizing
-direct threaded code by selective inlining (1998) by Ian Piumarta, Fabio
-Riccardi.
+@url{http://bochs.sourceforge.net/}, the Bochs IA-32 Emulator Project,
+by Kevin Lawton et al.
 
 @item [2]
-@url{http://developer.kde.org/~sewardj/}, Valgrind, an open-source
-memory debugger for x86-GNU/Linux, by Julian Seward.
+@url{http://www.valgrind.org/}, Valgrind, an open-source memory debugger
+for GNU/Linux.
 
 @item [3]
-@url{http://bochs.sourceforge.net/}, the Bochs IA-32 Emulator Project,
-by Kevin Lawton et al.
+@url{http://ftp.dreamtime.org/pub/linux/Linux-Alpha/em86/v0.2/docs/em86.html},
+the EM86 x86 emulator on Alpha-Linux.
 
 @item [4]
-@url{http://www.cs.rose-hulman.edu/~donaldlf/em86/index.html}, the EM86
-x86 emulator on Alpha-Linux.
-
-@item [5]
 @url{http://www.usenix.org/publications/library/proceedings/usenix-nt97/@/full_papers/chernoff/chernoff.pdf},
 DIGITAL FX!32: Running 32-Bit x86 Applications on Alpha NT, by Anton
 Chernoff and Ray Hookway.
 
-@item [6]
-@url{http://www.willows.com/}, Windows API library emulation from
-Willows Software.
-
-@item [7]
+@item [5]
 @url{http://user-mode-linux.sourceforge.net/},
 The User-mode Linux Kernel.
 
-@item [8]
+@item [6]
 @url{http://www.plex86.org/},
 The new Plex86 project.
 
-@item [9]
+@item [7]
 @url{http://www.vmware.com/},
 The VMWare PC virtualizer.
 
-@item [10]
-@url{http://www.microsoft.com/windowsxp/virtualpc/},
+@item [8]
+@url{https://www.microsoft.com/download/details.aspx?id=3702},
 The VirtualPC PC virtualizer.
 
-@item [11]
-@url{http://www.twoostwo.org/},
-The TwoOStwo PC virtualizer.
-
-@item [12]
+@item [9]
 @url{http://virtualbox.org/},
 The VirtualBox PC virtualizer.
 
-@item [13]
+@item [10]
 @url{http://www.xen.org/},
 The Xen hypervisor.
 
-@item [14]
-@url{http://kvm.qumranet.com/kvmwiki/Front_Page},
+@item [11]
+@url{http://www.linux-kvm.org/},
 Kernel Based Virtual Machine (KVM).
 
-@item [15]
+@item [12]
 @url{http://www.greensocs.com/projects/QEMUSystemC},
 QEMU-SystemC, a hardware co-simulator.
 
-- 
1.8.3.1


