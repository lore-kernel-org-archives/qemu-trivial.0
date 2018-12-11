Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gWmOS-0007ZQ-Km
	for mharc-qemu-trivial@gnu.org; Tue, 11 Dec 2018 13:04:28 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42511)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gWmOQ-0007Wa-0L
	for qemu-trivial@nongnu.org; Tue, 11 Dec 2018 13:04:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gWmOL-0006za-6c
	for qemu-trivial@nongnu.org; Tue, 11 Dec 2018 13:04:25 -0500
Received: from mout.kundenserver.de ([212.227.126.130]:47967)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gWmOK-0006yt-SX; Tue, 11 Dec 2018 13:04:21 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1Mf3yk-1h7Syv0X8c-00gbrD; Tue, 11 Dec 2018 19:04:03 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>, Richard Henderson <rth@twiddle.net>,
	Eduardo Habkost <ehabkost@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Date: Tue, 11 Dec 2018 19:03:25 +0100
Message-Id: <20181211180352.19644-4-laurent@vivier.eu>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20181211180352.19644-1-laurent@vivier.eu>
References: <20181211180352.19644-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:+qpl1M+YsLGfeUYVDWbaSn6xqv4VJSgp5uZelStjJov+grGoMoS
	+r3wseYtflmHtYJCPIGSlIHSAuFj5DfhHwLRqWKqvpfNCl+w3kbd6/w9wz2+IOrYvg+Kg0t
	HvSgLgAFg25G2JkTESSOGx26Ra8/F7LWDxRhCeikFbATHlMQ04dM+MMy128bRfWntI6CcoB
	kBxoFdCPxNAgNe1eF2RyQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:7NLkd1l0VWY=:cBcbn2Ez1N3eyGOX+WMEvA
	97I4oROiKXHdx7FnQWdIDc2p6yPpBXbg6PIrV/Ey3ZIuW3J2ptvGaQfhfFLcMmarhyS9nRHS8
	bEDWI58J984BPxB+S4nRUPXoQPHZqJt3DrIW/SNvfmrZPnonm6vopKFGk5SCplrNbMIrXGizD
	V7/WUA30Q7HS6+Re8YZTltKmZapa3eLyPPliBxW+62rShJnrzS3ofmhTvGTPSx5ZgE7mzHokz
	fsfTsMpNzyecUj1yb5lzyFTBE1k3g7NJAVf5ncRpWoOIJ3yd5aQG9AmzYb+b6hatRovSQM4V8
	JzzSyfYhEN0f17/l1ZJu1xRydSQFob5ncYYyMpGDcQ9xzHmoTKLxEctwQD+DyPPnq1xN7WEve
	t4xNsShXtRgh8tF+mPN4hPMJu9Xliv22F1ZL+6mb4yhwSa2zcVn1cWxg1vQ0G/S4VFd+POTTJ
	AOmEs2BT413c8UIolBz/jvgoaaVWYVC0hvtfL2S62NeuMX4uWDQPpygiXD+ZshPa+T8aHdmWu
	sulDxSbkTH1H4p9NTS06JwlrJi3jWfUdLSWV/kgPcz18MH9w5lTNWDmG31elil3nXIAeB73yy
	v2ekyLBj8c3RVu4b+oZAphaeUtbGYmaZahXvXzl7j4eVcKtk5Kf8kxfw1Y24pe6tz9Le9CuOY
	cSNEO52amMbuO5AamEphoUqK9ErRNLb1KQkvMSq2OvU+6OsYcF45JT4HdwghFmsrF6ivaq8A+
	5hr3P8RSskeQUWiInwUGRRMjQtKeHDwVdQjlCbqeZlCRUOkvXyXenioQCfM=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.130
Subject: [Qemu-trivial] [PULL 03/30] misc: fix spelling
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
X-List-Received-Date: Tue, 11 Dec 2018 18:04:27 -0000

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20181105135400.18366-1-marcandre.lureau@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 target/i386/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index f81d35e1f9..748eaf8367 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -4065,7 +4065,7 @@ arch_query_cpu_model_expansion(CpuModelExpansionType type,
         x86_cpu_to_dict_full(xc, props);
     break;
     default:
-        error_setg(&err, "Unsupportted expansion type");
+        error_setg(&err, "Unsupported expansion type");
         goto out;
     }
 
-- 
2.19.2


