Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cMDGG-0003fv-0I
	for mharc-qemu-trivial@gnu.org; Wed, 28 Dec 2016 07:23:16 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59033)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vilanova@ac.upc.edu>) id 1cMDG9-0003aK-Fd
	for qemu-trivial@nongnu.org; Wed, 28 Dec 2016 07:23:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vilanova@ac.upc.edu>) id 1cMDG8-00029B-I4
	for qemu-trivial@nongnu.org; Wed, 28 Dec 2016 07:23:09 -0500
Received: from roura.ac.upc.edu ([147.83.33.10]:48978 helo=roura.ac.upc.es)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vilanova@ac.upc.edu>)
	id 1cMDG8-000296-61; Wed, 28 Dec 2016 07:23:08 -0500
Received: from gw-3.ac.upc.es (gw-3.ac.upc.es [147.83.30.9])
	by roura.ac.upc.es (8.13.8/8.13.8) with ESMTP id uBSCN7Tq006014;
	Wed, 28 Dec 2016 13:23:07 +0100
Received: from localhost (unknown [84.88.51.85])
	by gw-3.ac.upc.es (Postfix) with ESMTPSA id 53BA1AA;
	Wed, 28 Dec 2016 13:23:07 +0100 (CET)
From: =?utf-8?b?TGx1w61z?= Vilanova <vilanova@ac.upc.edu>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
	qemu-trivial@nongnu.org (open list:Trivial patches)
Date: Wed, 28 Dec 2016 13:23:07 +0100
Message-Id: <148292778707.380.16754332646128307704.stgit@fimbulvetr.bsc.es>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <148292774946.380.3638349228328753405.stgit@fimbulvetr.bsc.es>
References: <148292774946.380.3638349228328753405.stgit@fimbulvetr.bsc.es>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by roura.ac.upc.es id
	uBSCN7Tq006014
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x [fuzzy]
X-Received-From: 147.83.33.10
Subject: [Qemu-trivial] [PATCH v4 7/7] trace: [trivial] Statically enable
 all guest events
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
X-List-Received-Date: Wed, 28 Dec 2016 12:23:14 -0000

The optimizations of this series makes it feasible to have them
available on all builds.

Signed-off-by: Llu=C3=ADs Vilanova <vilanova@ac.upc.edu>
---
 trace-events |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/trace-events b/trace-events
index f74e1d3d22..0a0f4d9cd6 100644
--- a/trace-events
+++ b/trace-events
@@ -159,7 +159,7 @@ vcpu guest_cpu_reset(void)
 #
 # Mode: user, softmmu
 # Targets: TCG(all)
-disable vcpu tcg guest_mem_before(TCGv vaddr, uint8_t info) "info=3D%d",=
 "vaddr=3D0x%016"PRIx64" info=3D%d"
+vcpu tcg guest_mem_before(TCGv vaddr, uint8_t info) "info=3D%d", "vaddr=3D=
0x%016"PRIx64" info=3D%d"
=20
 # @num: System call number.
 # @arg*: System call argument value.
@@ -168,7 +168,7 @@ disable vcpu tcg guest_mem_before(TCGv vaddr, uint8_t=
 info) "info=3D%d", "vaddr=3D0x
 #
 # Mode: user
 # Targets: TCG(all)
-disable vcpu guest_user_syscall(uint64_t num, uint64_t arg1, uint64_t ar=
g2, uint64_t arg3, uint64_t arg4, uint64_t arg5, uint64_t arg6, uint64_t =
arg7, uint64_t arg8) "num=3D0x%016"PRIx64" arg1=3D0x%016"PRIx64" arg2=3D0=
x%016"PRIx64" arg3=3D0x%016"PRIx64" arg4=3D0x%016"PRIx64" arg5=3D0x%016"P=
RIx64" arg6=3D0x%016"PRIx64" arg7=3D0x%016"PRIx64" arg8=3D0x%016"PRIx64
+vcpu guest_user_syscall(uint64_t num, uint64_t arg1, uint64_t arg2, uint=
64_t arg3, uint64_t arg4, uint64_t arg5, uint64_t arg6, uint64_t arg7, ui=
nt64_t arg8) "num=3D0x%016"PRIx64" arg1=3D0x%016"PRIx64" arg2=3D0x%016"PR=
Ix64" arg3=3D0x%016"PRIx64" arg4=3D0x%016"PRIx64" arg5=3D0x%016"PRIx64" a=
rg6=3D0x%016"PRIx64" arg7=3D0x%016"PRIx64" arg8=3D0x%016"PRIx64
=20
 # @num: System call number.
 # @ret: System call result value.
@@ -177,4 +177,4 @@ disable vcpu guest_user_syscall(uint64_t num, uint64_=
t arg1, uint64_t arg2, uint
 #
 # Mode: user
 # Targets: TCG(all)
-disable vcpu guest_user_syscall_ret(uint64_t num, uint64_t ret) "num=3D0=
x%016"PRIx64" ret=3D0x%016"PRIx64
+vcpu guest_user_syscall_ret(uint64_t num, uint64_t ret) "num=3D0x%016"PR=
Ix64" ret=3D0x%016"PRIx64


