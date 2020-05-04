Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jVdVr-0001Gv-VD
	for mharc-qemu-trivial@gnu.org; Mon, 04 May 2020 12:00:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1jVdVq-0001Dj-1i; Mon, 04 May 2020 12:00:10 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:54233)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1jVdVp-0005kG-3H; Mon, 04 May 2020 12:00:09 -0400
Received: from localhost.localdomain ([82.252.135.106]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1Mr8vG-1ikyR83KUw-00oHIX; Mon, 04 May 2020 18:00:05 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>, qemu-trivial@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: [PULL v2 05/19] hw/mem/pc-dimm: Print slot number on error at
 pc_dimm_pre_plug()
Date: Mon,  4 May 2020 17:59:42 +0200
Message-Id: <20200504155956.380695-6-laurent@vivier.eu>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200504155956.380695-1-laurent@vivier.eu>
References: <20200504155956.380695-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:ENPdAA29+zp3lVMUvxu80YJ8Ojw2ObQTjp6eS5nqnTAZiXMr8PL
 8017I3ybDAr5rqXD5VSiGdieseTxwSupG/lzj8zYKp+E7PJvAv8Fgmgflh2zyk4SHU4j3S9
 S4Ik8Ht5w+83x3jpxBb8B5FW1K6oZWU+vklaw+GjbLnIRct7mBjLKn5rIKV8DGlnZopxqgs
 e0hPsIsce0IcKH0kEAKOA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:LwBAzQSgGuw=:PIHfKXJj341vsl2wfh5GMs
 6IAoBvMhHUO1IQ6RWnj3hvFCtOsqSzgiBVrxww70CyRQy5auFBwsDcN5tbGpVk+Aow41ouRsz
 fgzv0uLDDWILlpv/p1iIF4dDKCXCN4E+wPhTAI3XfWJ+9h8aE+pV1retfSVQSLR6zVf0pElIt
 XhbBhWfxKt6yK4E3zesBpjfW9IqzTPx38WoPJw6ARvqcWtWSGJZclnRAjU33RQ6KioWbxoYQ4
 HbQRwODYBc/6+jcM+iJLPkwZcpiIVhv/rok28+W1eiTuziZ50aH7DWHNP9cvQlP1qbSq1E/jx
 1WrmAPOGRTLHG1+DntFwFfAiW/7eTQBUbMYAwuA616/xUgEQhSSq8XIklVBA08i1b0XrKHfZ6
 Vpnv2QZ6GOVIGV8Jn/8uR8rScyj5ll4LylCPPWwZWjGiFE/XAXSeHRYZ6LO70ax5TI8gUwvAr
 uyA3EzlOIUH3+VQ2K+hyuyeWeMXoSNvUkALLZeHDnlZVVwLXip9znCBsp62bvoBf8V+UQAEhI
 pk4Cd8DhR7tHVcMN5Q/S+didc/nVdQqL8sKQdtzVWd0vQWW6N3Zu/vrEamcF7+HJ+P9GsnoA3
 sVhk3Q6n+mk1tnuRnRJtpBl95xWofT4G+M9u/mKiV/3WTZKkOTR4J8nT8JbTKZavyEzmYAv3b
 VewdN5AhwHDPM96fYxT7k9Lccngf7p1PLfUCYG9FNOPSNv6wHZrXmSVz58qljNw9EWFkbBV2A
 7XAGr7UbDbGpOsvolemahh6mf+O/eFjh5OCDMytYz6mK1VHjgvBjIxa3o90dPgpVtGZ7aC3iw
 awbS0y4vNMNXJUBZpD3mRzH5nAkxgULltVF+nCBF0kXY4KBIyDkmyJSYzYchguByLqxskkD
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/04 12:00:07
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Mon, 04 May 2020 16:00:10 -0000

From: Wainer dos Santos Moschetta <wainersm@redhat.com>

The error report in pc_dimm_pre_plug() now has the slot
number printed.

Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-Id: <20200310180510.19489-2-wainersm@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/mem/pc-dimm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/mem/pc-dimm.c b/hw/mem/pc-dimm.c
index 8f50b8afea3c..36edfcf46799 100644
--- a/hw/mem/pc-dimm.c
+++ b/hw/mem/pc-dimm.c
@@ -44,8 +44,8 @@ void pc_dimm_pre_plug(PCDIMMDevice *dimm, MachineState *machine,
                                    &error_abort);
     if ((slot < 0 || slot >= machine->ram_slots) &&
          slot != PC_DIMM_UNASSIGNED_SLOT) {
-        error_setg(&local_err, "invalid slot number, valid range is [0-%"
-                   PRIu64 "]", machine->ram_slots - 1);
+        error_setg(&local_err, "invalid slot number %d, valid range is [0-%"
+                   PRIu64 "]", slot, machine->ram_slots - 1);
         goto out;
     }
 
-- 
2.26.2


