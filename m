Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ljp4q-0001wP-E1
	for mharc-qemu-trivial@gnu.org; Thu, 20 May 2021 16:15:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1ljoyp-0006Jf-Np
 for qemu-trivial@nongnu.org; Thu, 20 May 2021 16:09:15 -0400
Received: from [201.28.113.2] (port=60634 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>) id 1ljoyo-0002a9-Bz
 for qemu-trivial@nongnu.org; Thu, 20 May 2021 16:09:15 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Thu, 20 May 2021 16:51:56 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id 649B98013E1;
 Thu, 20 May 2021 16:51:56 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	Matheus Ferst <matheus.ferst@eldorado.org.br>
Subject: [PATCH] scripts/checkpatch.pl: process .c.inc and .h.inc files as C
 source
Date: Thu, 20 May 2021 16:51:42 -0300
Message-Id: <20210520195142.941261-1-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 20 May 2021 19:51:56.0587 (UTC)
 FILETIME=[96D5E7B0:01D74DB1]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 20 May 2021 16:15:27 -0400
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 20 May 2021 20:09:15 -0000

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

Change the regex used to determine whether a file should be processed as
C source to include .c.inc and .h.inc extensions.

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 scripts/checkpatch.pl | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 3d185cceac..bbcd25ae05 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -12,7 +12,7 @@ use Term::ANSIColor qw(:constants);
 my $P = $0;
 $P =~ s@.*/@@g;
 
-our $SrcFile    = qr{\.(?:h|c|cpp|s|S|pl|py|sh)$};
+our $SrcFile    = qr{\.(?:(h|c)(\.inc)?|cpp|s|S|pl|py|sh)$};
 
 my $V = '0.31';
 
@@ -1671,7 +1671,7 @@ sub process {
 		}
 
 # check we are in a valid C source file if not then ignore this hunk
-		next if ($realfile !~ /\.(h|c|cpp)$/);
+		next if ($realfile !~ /\.((h|c)(\.inc)?|cpp)$/);
 
 # Block comment styles
 
-- 
2.25.1


