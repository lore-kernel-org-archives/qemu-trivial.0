Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kPxtc-0003RN-Hc
	for mharc-qemu-trivial@gnu.org; Tue, 06 Oct 2020 21:05:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slyfox@gentoo.org>) id 1kPvII-0007ll-D6
 for qemu-trivial@nongnu.org; Tue, 06 Oct 2020 18:18:50 -0400
Received: from dev.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4]:42297
 helo=smtp.gentoo.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <slyfox@gentoo.org>) id 1kPvIF-0007UY-O3
 for qemu-trivial@nongnu.org; Tue, 06 Oct 2020 18:18:49 -0400
Received: by sf.home (Postfix, from userid 1000)
 id A4C995A22074; Tue,  6 Oct 2020 23:18:33 +0100 (BST)
From: Sergei Trofimovich <slyfox@gentoo.org>
To: qemu-trivial@nongnu.org
Cc: Sergei Trofimovich <slyfox@gentoo.org>
Subject: [PATCH] meson.build: drop duplicate 'sparc64' entry
Date: Tue,  6 Oct 2020 23:18:27 +0100
Message-Id: <20201006221827.1682106-1-slyfox@gentoo.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:470:ea4a:1:5054:ff:fec7:86e4;
 envelope-from=slyfox@gentoo.org; helo=smtp.gentoo.org
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/06 18:18:37
X-ACL-Warn: Detected OS   = ???
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 06 Oct 2020 21:05:30 -0400
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
X-List-Received-Date: Tue, 06 Oct 2020 22:18:50 -0000

Signed-off-by: Sergei Trofimovich <slyfox@gentoo.org>
---
 meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index a02c743794..48e7c56cc1 100644
--- a/meson.build
+++ b/meson.build
@@ -41,7 +41,7 @@ have_block = have_system or have_tools
 python = import('python').find_installation()
 
 supported_oses = ['windows', 'freebsd', 'netbsd', 'openbsd', 'darwin', 'sunos', 'linux']
-supported_cpus = ['ppc', 'ppc64', 's390x', 'sparc64', 'riscv32', 'riscv64', 'x86', 'x86_64',
+supported_cpus = ['ppc', 'ppc64', 's390x', 'riscv32', 'riscv64', 'x86', 'x86_64',
   'arm', 'aarch64', 'mips', 'mips64', 'sparc', 'sparc64']
 
 cpu = host_machine.cpu_family()
-- 
2.28.0


