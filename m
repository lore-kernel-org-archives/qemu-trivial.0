Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dG2Ra-0000j8-Qo
	for mharc-qemu-trivial@gnu.org; Wed, 31 May 2017 08:09:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47651)
	by lists.gnu.org with esmtp (Exim 4.71) (envelope-from <n54@gmx.com>)
	id 1dG2RY-0000ik-9N
	for qemu-trivial@nongnu.org; Wed, 31 May 2017 08:09:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <n54@gmx.com>) id 1dG2RV-00010K-3c
	for qemu-trivial@nongnu.org; Wed, 31 May 2017 08:09:40 -0400
Received: from mout.gmx.net ([212.227.15.18]:58415)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <n54@gmx.com>)
	id 1dG2RU-0000zw-Pa; Wed, 31 May 2017 08:09:37 -0400
Received: from localhost.localdomain ([185.58.161.191]) by mail.gmx.com
	(mrgmx001 [212.227.17.184]) with ESMTPSA (Nemesis) id
	0M8m7Q-1d3uwt3d6q-00C7n7; Wed, 31 May 2017 14:09:28 +0200
From: Kamil Rytarowski <n54@gmx.com>
To: qemu-trivial@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, peter.maydell@redhat.com,
	marcandre.lureau@gmail.com, f4bug@amsat.org, armbru@redhat.com,
	Kamil Rytarowski <n54@gmx.com>
Date: Wed, 31 May 2017 14:00:49 +0200
Message-Id: <20170531120049.14111-1-n54@gmx.com>
X-Mailer: git-send-email 2.13.0
X-Provags-ID: V03:K0:QiGPUSskd38NBAyIo6F07Tc4SS/ak4Y0AAEjzGD4mWFnRwdXYYU
	IwaS1hTCrTisTdjJV6aVbZbEl2ysQ/XZK4/cP10vtmlGCbpiCDmziuFkyGZaINOW+Lvg2ue
	p26wUyEg29oAccb8Nq6H3cQ6P2F0eQoT4QlCaAxj+gcgJ30SclTyRP3I8BSGC/dZiAIvmi/
	63AvwxN0mF5PQlmiS58Dg==
X-UI-Out-Filterresults: notjunk:1;V01:K0:SOi3F2Dpo/4=:cbY/tvBHUqeeka7lCMR0Hx
	rMgTvj6v9p+YXKwGUyIfynZXkZUbrusOIqM3bqlLdbcuFwH7ZpopQzpB0NpT5itfqPyNzTh6y
	l0ibWTOhIkurNKChLTCi0Qz9QMl/Ac8O8bnUc5pvhOOf3I3BeiY1PyXfMFN+Xoqu1Upvi5pSU
	QochUwJ7urNWtXRb3UgT8qlQOoXQJ/65qzPy1NGL4LSvB42ZIFEVc6duSxd9nLc6gz7Vad899
	fc+e6q39/pWIXjWSiUyPcvBBjL0Eiw83o/QaiDJZ7QcOCU3AT7SiNDFGwZ6qaDNyiMIgIT8nV
	JbFto0xKZAOHouL3qg2lJIm/B0bji18tD8xejB7kk9rvV37rUfbk2qYwi6f3gYF2VdYcHhWdx
	P/StJcsiyLWTGnTiyTGVlQbTAJJh9fbO9dDOoXAJDCH32FJJTpmUFt8JyspLPcA/GuL0ODzRs
	exnWKyu9rC8+d6qWiGkvOT6hJiDpx1gUuH3XjeBwxnqQDCZpzuATiMUsGJHBDZNR3+iwYU8Nn
	eo9+nE1RaTyNGO3wBEWSJP55Up80zgJyCweWDDTEeBuqWS+UYPV7Dn1gG06gh3moPf3Y7FZdZ
	BCs9iuHK6I81hIEprBAmdnV5k3P0cyj7awlXF3NT2paopu9X8PUCc8BTycXKMSE3iwu3pO/s2
	PZa4/OT3B5B5JRoyKgIgIU1qcSu9nZobKN4wvj/G7E+aV1I2idWve2ipfLVV2QBTfqt99HrwQ
	4H6TCZQzLt0Q9EB/MiSYG+AcnnvRZyoxNPRUZPhMMr5UvvZqudEapIvwnpg=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 212.227.15.18
Subject: [Qemu-trivial] [PATCH v3] ivshmem-server: ivshmem-client: Build
 when eventfd() is available
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
X-List-Received-Date: Wed, 31 May 2017 12:09:41 -0000

Currently ivshmem requires eventfd() which is Linux specific.
Do not and build it unconditionally on every Linux/BSD/Solaris.

This patch indirectly fixes build failure on NetBSD, where these tools
additionally require -lrt for shm_open(3). In future there should be
added support for NetBSD and the linking addressed appropriately.

Signed-off-by: Kamil Rytarowski <n54@gmx.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
---
 configure                            | 2 ++
 contrib/ivshmem-client/Makefile.objs | 2 +-
 contrib/ivshmem-server/Makefile.objs | 2 +-
 3 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/configure b/configure
index 1a5ee4b909..483307be53 100755
--- a/configure
+++ b/configure
@@ -4928,6 +4928,8 @@ if test "$want_tools" = "yes" ; then
   tools="qemu-img\$(EXESUF) qemu-io\$(EXESUF) $tools"
   if [ "$linux" = "yes" -o "$bsd" = "yes" -o "$solaris" = "yes" ] ; then
     tools="qemu-nbd\$(EXESUF) $tools"
+  fi
+  if [ "$eventfd" = "yes" ]; then
     tools="ivshmem-client\$(EXESUF) ivshmem-server\$(EXESUF) $tools"
   fi
 fi
diff --git a/contrib/ivshmem-client/Makefile.objs b/contrib/ivshmem-client/Makefile.objs
index bfab2d20dd..13d864082d 100644
--- a/contrib/ivshmem-client/Makefile.objs
+++ b/contrib/ivshmem-client/Makefile.objs
@@ -1 +1 @@
-ivshmem-client-obj-y = ivshmem-client.o main.o
+ivshmem-client-obj-$(CONFIG_IVSHMEM) = ivshmem-client.o main.o
diff --git a/contrib/ivshmem-server/Makefile.objs b/contrib/ivshmem-server/Makefile.objs
index c060dd3698..d9469fd777 100644
--- a/contrib/ivshmem-server/Makefile.objs
+++ b/contrib/ivshmem-server/Makefile.objs
@@ -1 +1 @@
-ivshmem-server-obj-y = ivshmem-server.o main.o
+ivshmem-server-obj-$(CONFIG_IVSHMEM) = ivshmem-server.o main.o
-- 
2.13.0


