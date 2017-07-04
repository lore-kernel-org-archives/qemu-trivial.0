Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dSJc2-0003GA-AN
	for mharc-qemu-trivial@gnu.org; Tue, 04 Jul 2017 04:55:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45936)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vilanova@ac.upc.edu>) id 1dSJbz-0003Ew-RK
	for qemu-trivial@nongnu.org; Tue, 04 Jul 2017 04:55:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vilanova@ac.upc.edu>) id 1dSJbv-0004b0-G1
	for qemu-trivial@nongnu.org; Tue, 04 Jul 2017 04:55:11 -0400
Received: from roura.ac.upc.es ([147.83.33.10]:36098)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vilanova@ac.upc.edu>)
	id 1dSJbv-0004ZF-2V; Tue, 04 Jul 2017 04:55:07 -0400
Received: from correu-2.ac.upc.es (correu-2.ac.upc.es [147.83.30.92])
	by roura.ac.upc.es (8.13.8/8.13.8) with ESMTP id v648t47F009351;
	Tue, 4 Jul 2017 10:55:04 +0200
Received: from localhost (63.red-83-51-187.dynamicip.rima-tde.net
	[83.51.187.63])
	by correu-2.ac.upc.es (Postfix) with ESMTPSA id 764685D4;
	Tue,  4 Jul 2017 10:54:58 +0200 (CEST)
From: =?utf-8?b?TGx1w61z?= Vilanova <vilanova@ac.upc.edu>
To: qemu-devel@nongnu.org
Cc: "Emilio G. Cota" <cota@braap.org>, Eric Blake <eblake@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
	qemu-trivial@nongnu.org (open list:Trivial patches)
Date: Tue,  4 Jul 2017 10:54:52 +0200
Message-Id: <149915849243.6295.4484103824675839071.stgit@frigg.lan>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <149915701334.6295.1724301929524364123.stgit@frigg.lan>
References: <149915701334.6295.1724301929524364123.stgit@frigg.lan>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by roura.ac.upc.es id
	v648t47F009351
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x [fuzzy]
X-Received-From: 147.83.33.10
Subject: [Qemu-trivial] [PATCH v11 6/6] trace: [trivial] Statically enable
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
X-List-Received-Date: Tue, 04 Jul 2017 08:55:13 -0000

The existing optimizations makes it feasible to have them available on al=
l
builds.

Some quick'n'dirty numbers with 400.perlbench (SPECcpu2006) on the train =
input
(medium size - suns.pl) and the guest_mem_before event:

* vanilla, statically disabled
real    0m2,259s
user    0m2,252s
sys     0m0,004s

* vanilla, statically enabled (overhead: 2.18x)
real    0m4,921s
user    0m4,912s
sys     0m0,008s

* multi-tb, statically disabled (overhead: 0.99x) [within noise range]
real    0m2,228s
user    0m2,216s
sys     0m0,008s

* multi-tb, statically enabled (overhead: 0.99x) [within noise range]
real    0m2,229s
user    0m2,224s
sys     0m0,004s


Now enabling all events when booting an ARM system that immediately shuts=
 down
(https://lists.gnu.org/archive/html/qemu-devel/2017-06/msg04085.html):

* vanilla, statically disabled
real	0m32,153s
user	0m31,276s
sys	0m0,108s

* vanilla, statically enabled (overhead: 1.35x)
real	0m43,507s
user	0m42,680s
sys	0m0,168s

* multi-tb, statically disabled (overhead: 1.03x)
real	0m32,993s
user	0m32,516s
sys	0m0,104s

* multi-tb, statically enabled (overhead: 1.00x) [within noise range]
real	0m32,110s
user	0m31,176s
sys	0m0,156s


And finally enabling all events using Emilio's dbt-bench
(where orig =3D=3D vanilla, new =3D=3D multi-tb):

                                                        NBench score; hig=
her is better

  180 +-+--------+----------+----------+---------+----------+----------+-=
---------+----------+----------+---------+----------+--------+-+
      |                                                                  =
                                                               |
      |                                      *** $$$$%%                  =
                                                  orig         |
  160 +-+....................................*.*.$..$.%..................=
..........................................orig-enabled       +-+
      |                                      * * $  $ %                  =
                                                   new         |
  140 +-+....................................*.*.$..$.%..................=
..........................................new-disabled.......+-+
      |                                      * * $  $ %                  =
                                                               |
      |                                      * * $  $ %                  =
                                                               |
  120 +-+....................................*.*.$..$.%..................=
.............................................................+-+
      |                                      * * $  $ %                  =
                                                               |
      |                                      * * $  $ %                  =
                                                               |
  100 +-+....................................*.*.$..$.%.....$$$%%%.......=
.............................................................+-+
      |                                      * * $  $ % *** $ $  % *** $$=
$%%                                                            |
   80 +-+....................................*.*.$..$.%.*.*.$.$..%.*.*.$.=
$.%..........................................................+-+
      |                                      * * $  $ % * * $ $  % * * $ =
$ %                                                            |
      |                                      * * $  $ % * * $ $  % * * $ =
$ %                                                            |
   60 +-+.........................***..$$$%%.*.*##..$.%.*.*.$.$..%.*.*.$.=
$.%..***.$$$%%...............................................+-+
      |                **** $$$%% * *  $ $ % * * #  $ % * *## $  % * * $ =
$ %  * * $ $ %                                                 |
      |                *  * $ $ % * *  $ $ % * * #  $ % * * # $  % * *## =
$ %  * * $ $ %                                                 |
   40 +-+..............*..*.$.$.%.*.*..$.$.%.*.*.#..$.%.*.*.#.$..%.*.*.#.=
$.%..*.*.$.$.%...............................................+-+
      |                *  * $ $ % * *  $ $ % * * #  $ % * * # $  % * * # =
$ %  * *## $ %                                  *** $$$%%%     |
   20 +-+....***.$$$%%.*..*##.$.%.*.*###.$.%.*.*.#..$.%.*.*.#.$..%.*.*.#.=
$.%..*.*.#.$.%..................................*.*.$.$..%...+-+
      |      * *## $ % *  * # $ % * *  # $ % * * #  $ % * * # $  % * * # =
$ %  * * # $ %                                  * *## $  %     |
      |      * * # $ % *  * # $ % * *  # $ % * * #  $ % * * # $  % * * # =
$ %  * * # $ %            ***###$$%% ***##$$$%% * * # $  %     |
    0 +-+----***##$$%%-****##$$%%-***###$$%%-***##$$$%%-***##$$%%%-***##$=
$%%--***##$$%%-****##$$%%-***###$$%%-***##$$$%%-***##$$%%%---+-+
     NUMERIC SORTSTRING SORT   BITFIEFP EMULATION ASSIGNMENT       IDEA  =
  HUFFMAN    FOURIER NEURLU DECOMPOSITION      gmean
png: http://imgur.com/a/8XG5S


Signed-off-by: Llu=C3=ADs Vilanova <vilanova@ac.upc.edu>
Reviewed-by: Emilio G. Cota <cota@braap.org>
---
 trace-events |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/trace-events b/trace-events
index bae63fdb1d..f9dbd7f509 100644
--- a/trace-events
+++ b/trace-events
@@ -106,7 +106,7 @@ vcpu guest_cpu_reset(void)
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
@@ -115,7 +115,7 @@ disable vcpu tcg guest_mem_before(TCGv vaddr, uint8_t=
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
@@ -124,4 +124,4 @@ disable vcpu guest_user_syscall(uint64_t num, uint64_=
t arg1, uint64_t arg2, uint
 #
 # Mode: user
 # Targets: TCG(all)
-disable vcpu guest_user_syscall_ret(uint64_t num, uint64_t ret) "num=3D0=
x%016"PRIx64" ret=3D0x%016"PRIx64
+vcpu guest_user_syscall_ret(uint64_t num, uint64_t ret) "num=3D0x%016"PR=
Ix64" ret=3D0x%016"PRIx64


