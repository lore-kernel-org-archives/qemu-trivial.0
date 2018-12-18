Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gZGNA-0000rQ-HB
	for mharc-qemu-trivial@gnu.org; Tue, 18 Dec 2018 09:29:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35835)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gZGN6-0000nY-Tc
	for qemu-trivial@nongnu.org; Tue, 18 Dec 2018 09:29:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gZGN6-0000wv-5P
	for qemu-trivial@nongnu.org; Tue, 18 Dec 2018 09:29:20 -0500
Received: from mout.kundenserver.de ([212.227.126.130]:54937)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gZGMz-0000sB-K4; Tue, 18 Dec 2018 09:29:13 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue009 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1MJm8H-1goSvs1WeX-00K6Hg; Tue, 18 Dec 2018 15:29:01 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Halil Pasic <pasic@linux.ibm.com>, Laurent Vivier <laurent@vivier.eu>,
	qemu-block@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Michael Tokarev <mjt@tls.msk.ru>, Richard Henderson <rth@twiddle.net>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Michael Roth <mdroth@linux.vnet.ibm.com>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-s390x@nongnu.org,
	Collin Walling <walling@linux.ibm.com>,
	Markus Armbruster <armbru@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	David Hildenbrand <david@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
	Max Reitz <mreitz@redhat.com>, qemu-trivial@nongnu.org,
	Roman Bolshakov <r.bolshakov@yadro.com>
Date: Tue, 18 Dec 2018 15:28:49 +0100
Message-Id: <20181218142851.9477-3-laurent@vivier.eu>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20181218142851.9477-1-laurent@vivier.eu>
References: <20181218142851.9477-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:UY57jcpLeXyZhLzCOjp8UlR5puYrJhbzXT6lmqfhxXg5RnslyHc
	Fr6jLa8PH3g4+4NOiI6W8rkVExMKbJ3E1vL8zGlMMUVGqHKPqmReyXod3KRjZgxWsll2FBA
	CP+6A9ctJkslEpTbgbiPqbDgNcwUSub6I+1NlPe8nKE8HEN8ZkmUEaIQ/EgQhLi4sCt7H5/
	CxtWj0wmiUNSbcbEDleaQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:lqqYrYZAU74=:RdmYonMLtWwZSaw6llySDE
	i/7Cap2ogaw98h8X5iADrgDW2zPGWCT8DHPx9uEzxnkDyuVpL7abXYCtmHnlFVNP6l7mxryju
	BKYt7HRnO8QYtAOJxMiV0pKDhYHpO9dQfRTnQT+pz7pDPGThPUziBs4AiO3dWlaiaw7ispfb5
	iCOISv0Uash8XTNCf3WpPTvgh+Bj6/2WsbLZd6w6Tjr/mhOonoGU13K4o7U2lfWWKK93y90eS
	apEsMaPBAetTdX1mR1kvxcyVbLi8KGHrtxu90uJ2UevNHfZP4PRuZ10Ytu51dwgmlR4GCpeFk
	01Npf8p0eMtRXN8copCuy/xifQb9txr1s1Al0LxjisTUTLD493F3uSmpvGHhG0imh86GJcUof
	zY/UWL+Ra1JKD9yBMzMwYfuoGRi6gejNHJ8fnSppxYOlTY4Mq1oLt3x5gIhhc5CSTfjMKWWTV
	j3IRIwCGpS6iu2IJ04VWHqPe7Sf2y/gM3TVoY+uKkfpd9ncHStIf4Vl29vXegtQLVQCkqO3h8
	zRMzt3VgRLrC8EM9S0rDzaFDaGH53+bdReCyiFg1C6Pex8Cy8WAWtB8lY+aXVXZ2pNGlMmT3M
	Gp1/956qq1eyvBF6qI/32aO5X5dynGj0ZJLTM0FX8kBZIxoJAF2KpFDIT0vxEtDS3nu1tLca7
	t68mCYZjYkvL4uC0AwQQvhKHD38qdpbcPS8hjKH/v2/Xds72ZpvbEJytmb2DqGSIZSWNdxEPC
	DQgJATf4V9iNv5dLsBWup2nokp/TEu/pe922Tg==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.130
Subject: [Qemu-trivial] [PULL 2/4] i386: hvf: drop debug printf in
 decode_sldtgroup
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
X-List-Received-Date: Tue, 18 Dec 2018 14:29:21 -0000

From: Roman Bolshakov <r.bolshakov@yadro.com>

It's going to clutter QEMU logs if 0x0f00 is trapped.

Signed-off-by: Roman Bolshakov <r.bolshakov@yadro.com>
Message-Id: <20181203100415.53027-2-r.bolshakov@yadro.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 target/i386/hvf/x86_decode.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/target/i386/hvf/x86_decode.c b/target/i386/hvf/x86_decode.c
index d125a6ef83..5f513c5563 100644
--- a/target/i386/hvf/x86_decode.c
+++ b/target/i386/hvf/x86_decode.c
@@ -525,8 +525,6 @@ static void decode_sldtgroup(CPUX86State *env, struct x86_decode *decode)
         X86_DECODE_CMD_INVL
     };
     decode->cmd = group[decode->modrm.reg];
-    printf("%llx: decode_sldtgroup: %d\n", env->hvf_emul->fetch_rip,
-            decode->modrm.reg);
 }
 
 static void decode_lidtgroup(CPUX86State *env, struct x86_decode *decode)
-- 
2.19.2


