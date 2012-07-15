Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SqUd7-0000fp-N9
	for mharc-qemu-trivial@gnu.org; Sun, 15 Jul 2012 15:37:21 -0400
Received: from eggs.gnu.org ([208.118.235.92]:33549)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1SqUd5-0000Zf-6O
	for qemu-trivial@nongnu.org; Sun, 15 Jul 2012 15:37:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1SqUd4-0003GU-FH
	for qemu-trivial@nongnu.org; Sun, 15 Jul 2012 15:37:19 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35693)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>)
	id 1SqUd2-0003GD-9u; Sun, 15 Jul 2012 15:37:16 -0400
Received: from int-mx02.intmail.prod.int.phx2.redhat.com
	(int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q6FJbEjb013716
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Sun, 15 Jul 2012 15:37:15 -0400
Received: from lacos-laptop.usersys.redhat.com (vpn1-6-12.ams2.redhat.com
	[10.36.6.12])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id q6FJbDxm014834; Sun, 15 Jul 2012 15:37:13 -0400
From: Laszlo Ersek <lersek@redhat.com>
To: agraf@suse.de, qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	lersek@redhat.com
Date: Sun, 15 Jul 2012 21:38:25 +0200
Message-Id: <1342381105-20395-1-git-send-email-lersek@redhat.com>
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.12
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] configure: adapt vde test to -Werror
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
X-List-Received-Date: Sun, 15 Jul 2012 19:37:20 -0000

... after commit 417c9d72 ("configure: add -Werror to QEMU_CFLAGS early")

Signed-off-by: Laszlo Ersek <lersek@redhat.com>
---
 configure |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/configure b/configure
index 0a3896e..8a1b902 100755
--- a/configure
+++ b/configure
@@ -1819,7 +1819,7 @@ if test "$vde" != "no" ; then
 int main(void)
 {
     struct vde_open_args a = {0, 0, 0};
-    vde_open("", "", &a);
+    vde_open((char *)"", (char *)"", &a);
     return 0;
 }
 EOF
-- 
1.7.1


