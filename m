Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XJjlR-00085e-EM
	for mharc-qemu-trivial@gnu.org; Tue, 19 Aug 2014 09:47:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55058)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <liming.wang@canonical.com>) id 1XJZ60-0008Ve-DW
	for qemu-trivial@nongnu.org; Mon, 18 Aug 2014 22:24:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <liming.wang@canonical.com>) id 1XJZ5p-0004gS-G8
	for qemu-trivial@nongnu.org; Mon, 18 Aug 2014 22:24:24 -0400
Received: from mail-pd0-f172.google.com ([209.85.192.172]:45539)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <liming.wang@canonical.com>) id 1XJZ5p-0004gB-AP
	for qemu-trivial@nongnu.org; Mon, 18 Aug 2014 22:24:13 -0400
Received: by mail-pd0-f172.google.com with SMTP id y13so8769186pdi.3
	for <qemu-trivial@nongnu.org>; Mon, 18 Aug 2014 19:24:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ABIiL/0EnufwSjUVmJhzzYd6bYkE6cRYw32vIg47cDg=;
	b=dzTi/4OMRU8GBJIzWusxQIbozpNJ3cpX/I+ZGee6C77jMn0TKCIEPEc8X/iTuUPyMh
	V0gfjvMq1mGSYNqLIH9sJF/RJd5JXR4Rm/BuCrRy8V0rFm8zeo9xo9JW2AqpOf3bhKD7
	yqmZ1SmNyKttgUEOKmMgAOKthtlztDE1lw7czzIVOP+hhlE4j9Rfc+DpA7x8alEpQJct
	D+BZi+DlZtlzyKulTOVMTRrkjC0ffNM5ewTHkM6XJtPsHoT/c5+JVPz05TQKpZnr9U80
	v1sawBfO31WUVfVgRbwNlQMNrVPBJpyXdAjWmeen7RDbUGBZVFpeZv4aj1u7cTMWUJlE
	OvQA==
X-Gm-Message-State: ALoCoQlHHM0HZm6kAC8RDprNDsYZx2J1GmYtvHNDwh1VnOb1kVHy1eFiOugssLlopxX3q6HICzFc
X-Received: by 10.68.102.34 with SMTP id fl2mr39373064pbb.2.1408415051513;
	Mon, 18 Aug 2014 19:24:11 -0700 (PDT)
Received: from localhost ([116.213.191.74]) by mx.google.com with ESMTPSA id
	pl10sm17513332pbb.56.2014.08.18.19.24.08 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 18 Aug 2014 19:24:10 -0700 (PDT)
From: Liming Wang <liming.wang@canonical.com>
To: qemu-devel@nongnu.org
Date: Tue, 19 Aug 2014 10:24:05 +0800
Message-Id: <1408415045-24291-1-git-send-email-liming.wang@canonical.com>
X-Mailer: git-send-email 1.9.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.192.172
X-Mailman-Approved-At: Tue, 19 Aug 2014 09:47:51 -0400
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Luiz Capitulino <lcapitulino@redhat.com>
Subject: [Qemu-trivial] [PATCH] configure: no need to mkdir QMP
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
X-List-Received-Date: Tue, 19 Aug 2014 02:24:31 -0000

commit 7537fe04 QMP: QMP/ -> docs/qmp/

Above commit has moved last QMP files to docs/qmp and it's not necessary
to create QMP directory. So remove it from configure.

Signed-off-by: Liming Wang <liming.wang@canonical.com>
---
 configure | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/configure b/configure
index 283c71c..b3000fd 100755
--- a/configure
+++ b/configure
@@ -5335,10 +5335,6 @@ for rom in seabios vgabios ; do
     echo "LD=$ld" >> $config_mak
 done
 
-if test "$docs" = "yes" ; then
-  mkdir -p QMP
-fi
-
 # set up qemu-iotests in this build directory
 iotests_common_env="tests/qemu-iotests/common.env"
 iotests_check="tests/qemu-iotests/check"
-- 
1.9.1


