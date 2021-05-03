Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ldU4L-0003JO-J4
	for mharc-qemu-trivial@gnu.org; Mon, 03 May 2021 04:36:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1ldU4H-0003GS-4S; Mon, 03 May 2021 04:36:41 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:32905)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1ldU4D-0000hP-Mb; Mon, 03 May 2021 04:36:40 -0400
Received: from quad ([82.142.20.222]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MCbVD-1llQIH0IBn-009jhC; Mon, 03
 May 2021 10:36:30 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 qemu-trivial@nongnu.org, Serge Guelton <sguelton@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PULL 05/23] Fix typo in CFI build documentation
Date: Mon,  3 May 2021 10:36:05 +0200
Message-Id: <20210503083623.139700-6-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210503083623.139700-1-laurent@vivier.eu>
References: <20210503083623.139700-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:MhKl9xDxiVNjdZediBurNQrwtJLpk3QPi0++Cm6B7KozdVuMJn/
 iGnZ7bCzOE1WpHUTKrG68hm5Ukyu0peQ2ZuMw+RHzKNU8RNSmIlxNFE0IctqxP4z2WZhfrV
 9+U1TXXljxoK883MwvjmZ67gIB9yThpROlRecuwHcItHvkRSocAxRKrlbGagO7isZEvXa9M
 83JZ47/oGnQokcRei0dPQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:lCfRp8/mxWc=:W0mM4EZxR5SNTiNYBtV9gB
 TlAVZBtA0dLDYIgZzPX4xx6u8vvEdAN4QBRi9ynqjBYYfrHn70pTa1L8YqUBO1xlFXcbtI/TE
 uNNzlXvnSPsVwQzXId/6cBknPU8NONGD9YqHHJTQj8EApFLzxs77wCOix/XEmrfK7mPo796V6
 4A4hhUugxZl+g2utaskf9Y7PquojURXA/Vq+6Dd2yry6rKMylGmUp0S5jvgl3Ox/xGmpWGU0J
 XK2CAvXjzcQBA9Wpf5CiS2SdNgiOQ3Pg04cXwe5ZYQUfy0CYVmLvRf2ZaYxUPY+AEsJ8v9s/R
 98m30v5qJU3OMwFH0cM+K9zojIXemaQpB/onCOg2Un1dH3jKKjtbn4PklG/OX/Y/jbznVBA3F
 Md97mQb4jHfXmQLG5YfS1w7LzZakC6xKmoB8TZEC3/qBGbqnBpPgZgsy+OjlGo31X7AKMQCuW
 x0YYwAphBlofGmIl3iMF+1oOvXYI0zkaxBur3v/zVTV8qZK0SHqsaiQKOV9vzA/VVR7mfk8dd
 pMEpWlaf0GppXhA/FqgNXA=
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Mon, 03 May 2021 08:36:41 -0000

From: Serge Guelton <sguelton@redhat.com>

Signed-off-by: Serge Guelton <sguelton@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210430150745.GA1401713@sguelton.remote.csb>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 docs/devel/control-flow-integrity.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/devel/control-flow-integrity.rst b/docs/devel/control-flow-integrity.rst
index d89d70733d88..e6b73a4fe1a5 100644
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
2.31.1


