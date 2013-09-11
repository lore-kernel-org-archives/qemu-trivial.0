Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VJkgm-0000lt-06
	for mharc-qemu-trivial@gnu.org; Wed, 11 Sep 2013 09:42:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47327)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gabriel@kerneis.info>) id 1VJkge-0000jh-LG
	for qemu-trivial@nongnu.org; Wed, 11 Sep 2013 09:42:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gabriel@kerneis.info>) id 1VJkgY-0003bt-Hj
	for qemu-trivial@nongnu.org; Wed, 11 Sep 2013 09:42:28 -0400
Received: from wanbli.kerneis.info ([176.31.113.173]:60982)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gabriel@kerneis.info>) id 1VJkgY-0003bl-CN
	for qemu-trivial@nongnu.org; Wed, 11 Sep 2013 09:42:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kerneis.info;
	s=wanbli-rsa1; h=Message-Id:Date:Subject:Cc:To:From;
	bh=U/KCZKo6ejkLWCssoa4bBP1VcxiHz04xWu0NPHZnOSY=; 
	b=SjP2AlAcWrZ6EAWrfSPVoLtpds34XY6nU2LqKKOB8Ngp1lnUMoKAdrh4QTfSiqQBU4PMPflS1XVLvZTxYoqtrD0IHyCXFDH19XNME8bALb89fNw/IOsa4uocI6+dx0hrUCa+YPdFq95ZVLiUYALoaQMm+7bNiZKJ6cnYVBN1HSs=;
Received: from wowasieco.sm.cl.cam.ac.uk ([128.232.60.22] helo=localhost)
	by wanbli.kerneis.info with esmtpsa
	(TLS1.2:DHE_RSA_AES_128_CBC_SHA1:128) (Exim 4.80)
	(envelope-from <gabriel@kerneis.info>)
	id 1VJkgQ-0007s2-Fb; Wed, 11 Sep 2013 13:42:14 +0000
From: Gabriel Kerneis <gabriel@kerneis.info>
To: qemu-devel@nongnu.org
Date: Wed, 11 Sep 2013 14:41:52 +0100
Message-Id: <1378906912-14015-1-git-send-email-gabriel@kerneis.info>
X-Mailer: git-send-email 1.7.10.4
X-SA-Exim-Connect-IP: 128.232.60.22
X-SA-Exim-Mail-From: gabriel@kerneis.info
X-SA-Exim-Scanned: No (on wanbli.kerneis.info); SAEximRunCond expanded to false
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 176.31.113.173
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Subject: [Qemu-trivial] [PATCH] Quote extra_cflags in config-host.mak
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
X-List-Received-Date: Wed, 11 Sep 2013 13:42:34 -0000

The variable extra_cflags needs to be quoted in config-host.mak,
in particular because it might contain parentheses that would
otherwise be interpreted by the shell when reloading the file.

For instance, if one wants to define some attribute with configure:

./configure --extra-cflags="-Dcoroutine_fn='__attribute__((coroutine_fn))'"

A more robust approach would be to escape every variable properly, but
there is no portable equivalent to bash's "printf %q" solution. The
current patch, while not bullet-proof, works well in the common case.

Signed-off-by: Gabriel Kerneis <gabriel@kerneis.info>
---
 configure |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure b/configure
index e989609..23114de 100755
--- a/configure
+++ b/configure
@@ -3681,7 +3681,7 @@ if test "$mingw32" = "no" ; then
   echo "qemu_localstatedir=$local_statedir" >> $config_host_mak
 fi
 echo "qemu_helperdir=$libexecdir" >> $config_host_mak
-echo "extra_cflags=$EXTRA_CFLAGS" >> $config_host_mak
+echo "extra_cflags=\"$EXTRA_CFLAGS\"" >> $config_host_mak
 echo "extra_ldflags=$EXTRA_LDFLAGS" >> $config_host_mak
 echo "qemu_localedir=$qemu_localedir" >> $config_host_mak
 echo "libs_softmmu=$libs_softmmu" >> $config_host_mak
-- 
1.7.10.4


