Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lZZip-0007Qw-4F
	for mharc-qemu-trivial@gnu.org; Thu, 22 Apr 2021 09:50:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <serge.guelton@telecom-bretagne.eu>)
 id 1lZUme-0006yM-QO; Thu, 22 Apr 2021 04:34:00 -0400
Received: from smtp2-g21.free.fr ([2a01:e0c:1:1599::11]:2470)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <serge.guelton@telecom-bretagne.eu>)
 id 1lZUmc-0001yY-GC; Thu, 22 Apr 2021 04:34:00 -0400
Received: from localhost (unknown [IPv6:2a01:e0a:923:3150:6f60:5f78:f08b:c504])
 (Authenticated sender: sergesanspaille@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id A8DAE200407;
 Thu, 22 Apr 2021 10:33:40 +0200 (CEST)
From: Serge Guelton <sguelton@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, philmd@redhat.com,
 serge-sans-paille <sguelton@redhat.com>
Subject: [PATCH] Fix typo in CFI build documentation
Date: Thu, 22 Apr 2021 10:33:35 +0200
Message-Id: <1619080415-4888-1-git-send-email-sguelton@redhat.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: permerror client-ip=2a01:e0c:1:1599::11;
 envelope-from=serge.guelton@telecom-bretagne.eu; helo=smtp2-g21.free.fr
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_NONE=0.001,
 T_SPF_PERMERROR=0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 22 Apr 2021 09:50:12 -0400
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
X-List-Received-Date: Thu, 22 Apr 2021 08:34:01 -0000

From: serge-sans-paille <sguelton@redhat.com>

Signed-off-by: Serge Guelton <sguelton@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 docs/devel/control-flow-integrity.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/devel/control-flow-integrity.rst b/docs/devel/control-flow-integrity.rst
index d89d707..e6b73a4 100644
--- a/docs/devel/control-flow-integrity.rst
+++ b/docs/devel/control-flow-integrity.rst
@@ -39,7 +39,7 @@ later).
 Given the use of LTO, a version of AR that supports LLVM IR is required.
 The easies way of doing this is by selecting the AR provided by LLVM::
 
- AR=llvm-ar-9 CC=clang-9 CXX=lang++-9 /path/to/configure --enable-cfi
+ AR=llvm-ar-9 CC=clang-9 CXX=clang++-9 /path/to/configure --enable-cfi
 
 CFI is enabled on every binary produced.
 
@@ -131,7 +131,7 @@ lld with version 11+.
 In other words, to compile with fuzzing and CFI, clang 11+ is required, and
 lld needs to be used as a linker::
 
- AR=llvm-ar-11 CC=clang-11 CXX=lang++-11 /path/to/configure --enable-cfi \
+ AR=llvm-ar-11 CC=clang-11 CXX=clang++-11 /path/to/configure --enable-cfi \
                            -enable-fuzzing --extra-ldflags="-fuse-ld=lld"
 
 and then, compile the fuzzers as usual.
-- 
1.8.3.1


