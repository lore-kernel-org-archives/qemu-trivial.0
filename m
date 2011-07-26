Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QlYlK-0006Z8-F6
	for mharc-qemu-trivial@gnu.org; Mon, 25 Jul 2011 23:56:54 -0400
Received: from eggs.gnu.org ([140.186.70.92]:46273)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cerbere@gmail.com>) id 1QlYlH-0006Om-JS
	for qemu-trivial@nongnu.org; Mon, 25 Jul 2011 23:56:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cerbere@gmail.com>) id 1QlYlG-0006TL-Ej
	for qemu-trivial@nongnu.org; Mon, 25 Jul 2011 23:56:51 -0400
Received: from mail-qw0-f45.google.com ([209.85.216.45]:54805)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cerbere@gmail.com>)
	id 1QlYlD-0006Pe-FC; Mon, 25 Jul 2011 23:56:47 -0400
Received: by mail-qw0-f45.google.com with SMTP id 8so26458qwj.4
	for <multiple recipients>; Mon, 25 Jul 2011 20:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=QgcTQy/miKGjUjdF7VQLz0xeeDDIkesLGINT9K+F82Q=;
	b=FGpGEsgqp8HJV37BcQkujyg7EzbZ79l1bVB6ei4ip19fuWHSw4WeeF7UOhKwDbuc/I
	5HPC/kUrJvwfdi3ddBSwOTGDnV0tjVwI5SRe0K9Pl2pynHchY+vI4vyh+Xd1tyA5HYaT
	B36DI1I/puKNBimdOX31unNq/AA9Gh6hzSd/E=
Received: by 10.224.31.133 with SMTP id y5mr3232762qac.354.1311652607073;
	Mon, 25 Jul 2011 20:56:47 -0700 (PDT)
Received: from localhost.localdomain (modemcable055.201-23-96.mc.videotron.ca
	[96.23.201.55])
	by mx.google.com with ESMTPS id p15sm62804qct.22.2011.07.25.20.56.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 25 Jul 2011 20:56:46 -0700 (PDT)
From: Alexandre Raymond <cerbere@gmail.com>
To: Qemu Developers <qemu-devel@nongnu.org>
Date: Mon, 25 Jul 2011 23:56:01 -0400
Message-Id: <1311652562-10794-2-git-send-email-cerbere@gmail.com>
X-Mailer: git-send-email 1.7.5
In-Reply-To: <1311652562-10794-1-git-send-email-cerbere@gmail.com>
References: <1311652562-10794-1-git-send-email-cerbere@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.216.45
Cc: qemu-trivial@nongnu.org, Alexandre Raymond <cerbere@gmail.com>
Subject: [Qemu-trivial] [PATCH 1/2] Makefile: distclean should clean all
	possible targets
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
X-List-Received-Date: Tue, 26 Jul 2011 03:56:53 -0000

At the moment, "make distclean" relies on the TARGET_DIRS variable, set by
configure. The problem is that this variable does not always contain all
possible targets.

For example, the following will leave build data in the tree:

./configure && make && ./configure --target-list=i386-softmmu \
&& make distclean

as it will only remove the i386-softmmu build directory, although the
first build created additional directories.

Solution : pass the full list of targets from configure to make via
the DEFAULT_TARGET_LIST variable.

Signed-off-by: Alexandre Raymond <cerbere@gmail.com>
---
 Makefile  |    2 +-
 configure |    1 +
 2 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/Makefile b/Makefile
index 723d41f..878402e 100644
--- a/Makefile
+++ b/Makefile
@@ -225,7 +225,7 @@ distclean: clean
 	rm -f qemu-doc.log qemu-doc.pdf qemu-doc.pg qemu-doc.toc qemu-doc.tp
 	rm -f qemu-doc.vr
 	rm -f qemu-tech.info qemu-tech.aux qemu-tech.cp qemu-tech.dvi qemu-tech.fn qemu-tech.info qemu-tech.ky qemu-tech.log qemu-tech.pdf qemu-tech.pg qemu-tech.toc qemu-tech.tp qemu-tech.vr
-	for d in $(TARGET_DIRS) $(QEMULIBS); do \
+	for d in $(DEFAULT_TARGET_LIST) $(QEMULIBS); do \
 	rm -rf $$d || exit 1 ; \
         done
 
diff --git a/configure b/configure
index 600da9b..83f980a 100755
--- a/configure
+++ b/configure
@@ -2810,6 +2810,7 @@ qemu_version=`head $source_path/VERSION`
 echo "VERSION=$qemu_version" >>$config_host_mak
 echo "PKGVERSION=$pkgversion" >>$config_host_mak
 echo "SRC_PATH=$source_path" >> $config_host_mak
+echo "DEFAULT_TARGET_LIST=$default_target_list" >> $config_host_mak
 echo "TARGET_DIRS=$target_list" >> $config_host_mak
 if [ "$docs" = "yes" ] ; then
   echo "BUILD_DOCS=yes" >> $config_host_mak
-- 
1.7.5


