Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l5934-0000sP-K8
	for mharc-qemu-trivial@gnu.org; Thu, 28 Jan 2021 10:17:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <s.reiter@proxmox.com>)
 id 1l58tw-00039T-Ix; Thu, 28 Jan 2021 10:08:04 -0500
Received: from proxmox-new.maurer-it.com ([212.186.127.180]:28446)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <s.reiter@proxmox.com>)
 id 1l58tu-0008Mw-AE; Thu, 28 Jan 2021 10:08:04 -0500
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id D744446132;
 Thu, 28 Jan 2021 15:58:23 +0100 (CET)
From: Stefan Reiter <s.reiter@proxmox.com>
To: qemu-trivial@nongnu.org
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>
Subject: [PATCH] docs: don't install corresponding man page if guest agent is
 disabled
Date: Thu, 28 Jan 2021 15:58:01 +0100
Message-Id: <20210128145801.14384-1-s.reiter@proxmox.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=212.186.127.180;
 envelope-from=s.reiter@proxmox.com; helo=proxmox-new.maurer-it.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 28 Jan 2021 10:17:28 -0500
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
X-List-Received-Date: Thu, 28 Jan 2021 15:08:05 -0000

No sense outputting the qemu-ga and qemu-ga-ref man pages when the guest
agent binary itself is disabled. This mirrors behaviour from before the
meson switch.

Signed-off-by: Stefan Reiter <s.reiter@proxmox.com>
---
 docs/meson.build | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/docs/meson.build b/docs/meson.build
index bb14eaebd3..f84306ba7e 100644
--- a/docs/meson.build
+++ b/docs/meson.build
@@ -46,9 +46,11 @@ if build_docs
                           meson.source_root() / 'docs/sphinx/qmp_lexer.py',
                           qapi_gen_depends ]
 
+  have_ga = have_tools and config_host.has_key('CONFIG_GUEST_AGENT')
+
   man_pages = {
-        'qemu-ga.8': (have_tools ? 'man8' : ''),
-        'qemu-ga-ref.7': 'man7',
+        'qemu-ga.8': (have_ga ? 'man8' : ''),
+        'qemu-ga-ref.7': (have_ga ? 'man7' : ''),
         'qemu-qmp-ref.7': 'man7',
         'qemu-storage-daemon-qmp-ref.7': (have_tools ? 'man7' : ''),
         'qemu-img.1': (have_tools ? 'man1' : ''),
-- 
2.20.1



