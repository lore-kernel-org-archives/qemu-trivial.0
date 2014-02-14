Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WEOWz-0005Vx-Qw
	for mharc-qemu-trivial@gnu.org; Fri, 14 Feb 2014 14:34:37 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34033)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>) id 1WEOWs-0005Ni-NT
	for qemu-trivial@nongnu.org; Fri, 14 Feb 2014 14:34:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>) id 1WEOWm-0007Uj-Gz
	for qemu-trivial@nongnu.org; Fri, 14 Feb 2014 14:34:30 -0500
Received: from mx1.redhat.com ([209.132.183.28]:63522)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>)
	id 1WEOWa-0007BI-9C; Fri, 14 Feb 2014 14:34:12 -0500
Received: from int-mx01.intmail.prod.int.phx2.redhat.com
	(int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s1EJYAnk021140
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Fri, 14 Feb 2014 14:34:10 -0500
Received: from localhost (ovpn-113-139.phx2.redhat.com [10.3.113.139])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id s1EJY9Cn019109; Fri, 14 Feb 2014 14:34:09 -0500
Date: Fri, 14 Feb 2014 14:34:08 -0500
From: Luiz Capitulino <lcapitulino@redhat.com>
To: qemu-devel@nongnu.org
Message-ID: <20140214143408.4b34d2c7@redhat.com>
Organization: Red Hat
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.11
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, ehabkost@redhat.com
Subject: [Qemu-trivial] [PATCH] qemu-options.hx: improve -numa doc
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
X-List-Received-Date: Fri, 14 Feb 2014 19:34:36 -0000

The -numa option documentation in qemu's manpage lacks the command-line
options and some information regarding how it relates to options -m and
-smp. This commit fills in the missing text.

Signed-off-by: Luiz Capitulino <lcapitulino@redhat.com>
---
 qemu-options.hx | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index 56e5fdf..ed1d409 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -97,10 +97,13 @@ ETEXI
 DEF("numa", HAS_ARG, QEMU_OPTION_numa,
     "-numa node[,mem=size][,cpus=cpu[-cpu]][,nodeid=node]\n", QEMU_ARCH_ALL)
 STEXI
-@item -numa @var{opts}
+@item -numa node[,mem=@var{size}][,cpus=@var{cpu[-cpu]}][,nodeid=@var{node}]
 @findex -numa
-Simulate a multi node NUMA system. If mem and cpus are omitted, resources
-are split equally.
+Simulate a multi node NUMA system. If @var{mem} and @var{cpus} are omitted,
+resources are split equally. Also, note that the -@option{numa} option doesn't
+allocate any of the specified resources. That is, it just assigns existing
+resources to NUMA nodes. This means that one still has to use the -@option{m}
+and -@option{smp} options to respectively allocate RAM and vCPUs.
 ETEXI
 
 DEF("add-fd", HAS_ARG, QEMU_OPTION_add_fd,
-- 
1.8.1.4


