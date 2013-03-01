Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UBKct-0004P7-L7
	for mharc-qemu-trivial@gnu.org; Fri, 01 Mar 2013 02:43:31 -0500
Received: from eggs.gnu.org ([208.118.235.92]:58614)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mprivozn@redhat.com>) id 1UBKcr-0004MI-HY
	for qemu-trivial@nongnu.org; Fri, 01 Mar 2013 02:43:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mprivozn@redhat.com>) id 1UBKcq-0007DV-KQ
	for qemu-trivial@nongnu.org; Fri, 01 Mar 2013 02:43:29 -0500
Received: from mx1.redhat.com ([209.132.183.28]:3269)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mprivozn@redhat.com>)
	id 1UBKco-0007D0-Go; Fri, 01 Mar 2013 02:43:26 -0500
Received: from int-mx02.intmail.prod.int.phx2.redhat.com
	(int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r217hO1X002742
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Fri, 1 Mar 2013 02:43:25 -0500
Received: from bart.redhat.com (vpn-233-233.phx2.redhat.com [10.3.233.233])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r217hN5f013565; Fri, 1 Mar 2013 02:43:24 -0500
From: Michal Privoznik <mprivozn@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri,  1 Mar 2013 08:43:18 +0100
Message-Id: <302ae9628718b0c4ae10528ec97e88a6000b6099.1362123798.git.mprivozn@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.12
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH] configure: Require at least
	spice-protocol-0.12.3
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
X-List-Received-Date: Fri, 01 Mar 2013 07:43:30 -0000

As of 5a49d3e9 we assume SPICE_PORT_EVENT_BREAK to be defined.
However, it is defined not in 0.12.2 what we require now, but in
0.12.3.  Therefore in order to prevent build failure we must
adjust our minimal requirements.
---
 configure | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure b/configure
index 8df7db1..696e84d 100755
--- a/configure
+++ b/configure
@@ -2867,7 +2867,7 @@ EOF
   spice_cflags=$($pkg_config --cflags spice-protocol spice-server 2>/dev/null)
   spice_libs=$($pkg_config --libs spice-protocol spice-server 2>/dev/null)
   if $pkg_config --atleast-version=0.12.0 spice-server >/dev/null 2>&1 && \
-     $pkg_config --atleast-version=0.12.2 spice-protocol > /dev/null 2>&1 && \
+     $pkg_config --atleast-version=0.12.3 spice-protocol > /dev/null 2>&1 && \
      compile_prog "$spice_cflags" "$spice_libs" ; then
     spice="yes"
     libs_softmmu="$libs_softmmu $spice_libs"
-- 
1.8.1.4


