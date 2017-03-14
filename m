Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cnnco-0000Kj-Pe
	for mharc-qemu-trivial@gnu.org; Tue, 14 Mar 2017 10:40:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52936)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andreas@grapentin.org>) id 1cnjYT-00027d-IW
	for qemu-trivial@nongnu.org; Tue, 14 Mar 2017 06:19:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andreas@grapentin.org>) id 1cnjYQ-0004cj-HX
	for qemu-trivial@nongnu.org; Tue, 14 Mar 2017 06:19:49 -0400
Received: from www145.your-server.de ([78.47.15.66]:60015)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <andreas@grapentin.org>)
	id 1cnjYQ-0004cH-Aq; Tue, 14 Mar 2017 06:19:46 -0400
Received: from [88.198.220.132] (helo=sslproxy03.your-server.de)
	by www145.your-server.de with esmtpsa
	(TLSv1.2:DHE-RSA-AES256-GCM-SHA384:256) (Exim 4.85_2)
	(envelope-from <andreas@grapentin.org>)
	id 1cnjYM-0007js-QE; Tue, 14 Mar 2017 11:19:42 +0100
Received: from [141.89.226.146] (helo=parabola-pocket.hpi.uni-potsdam.de)
	by sslproxy03.your-server.de with esmtpsa
	(TLSv1.2:DHE-RSA-AES128-GCM-SHA256:128) (Exim 4.84_2)
	(envelope-from <andreas@grapentin.org>)
	id 1cnjYK-0002Qi-Uv; Tue, 14 Mar 2017 11:19:41 +0100
From: Andreas Grapentin <andreas@grapentin.org>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	Andreas Grapentin <andreas@grapentin.org>
Date: Tue, 14 Mar 2017 11:19:24 +0100
Message-Id: <20170314101925.16792-1-andreas@grapentin.org>
X-Mailer: git-send-email 2.12.0
X-Authenticated-Sender: andreas@grapentin.org
X-Virus-Scanned: Clear (ClamAV 0.99.2/23202/Tue Mar 14 05:13:46 2017)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic] [fuzzy]
X-Received-From: 78.47.15.66
X-Mailman-Approved-At: Tue, 14 Mar 2017 10:40:33 -0400
Subject: [Qemu-trivial] [PATCH 0/1] major / minor macros are to be included
 from <sys/sysmacros.h>
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
X-List-Received-Date: Tue, 14 Mar 2017 10:19:50 -0000

Building qemu fails with glibc-2.25 and gcc-6.3.1:

> qemu/qga/commands-posix.c:656:13: error: In the GNU C Library, "major" is defined
>  by <sys/sysmacros.h>. For historical compatibility, it is
>  currently defined by <sys/types.h> as well, but we plan to
>  remove this soon. To use "major", include <sys/sysmacros.h>
>  directly. If you did not intend to use a system-defined macro
>  "major", you should undefine it after including <sys/types.h>. [-Werror]
>          *devmajor = major(st.st_rdev);
>              ^~~~~~~~~~~~~~~~~~~~~~~~~~

A trivial fix is to #include <sys/sysmacros.h> in the respective files.


Andreas Grapentin (1):
  major / minor macros are to be included from <sys/sysmacros.h>

 hw/9pfs/9p.c         | 1 +
 qga/commands-posix.c | 1 +
 2 files changed, 2 insertions(+)

-- 
2.12.0


