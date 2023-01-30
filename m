Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pMZBp-0001u5-5C
	for mharc-qemu-trivial@gnu.org; Mon, 30 Jan 2023 13:47:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>) id 1pMYMJ-0003mf-TW
 for qemu-trivial@nongnu.org; Mon, 30 Jan 2023 12:54:37 -0500
Received: from mail-b.sr.ht ([173.195.146.151])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>) id 1pMYMG-0005I0-DI
 for qemu-trivial@nongnu.org; Mon, 30 Jan 2023 12:54:22 -0500
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id A60D811EF13;
 Mon, 30 Jan 2023 17:54:15 +0000 (UTC)
From: ~vlaomao <vlaomao@git.sr.ht>
Date: Mon, 30 Jan 2023 20:28:44 +0300
Subject: [PATCH qemu 1/1] vmxnet3: add mac address restore upon reset
Message-ID: <167510125533.6740.18222174398575558338-1@git.sr.ht>
X-Mailer: git.sr.ht
Reply-to: ~vlaomao <vlaomao@gmail.com>
In-Reply-To: <167510125533.6740.18222174398575558338-0@git.sr.ht>
To: laurent@vivier.eu
Cc: qemu-trivial@nongnu.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Received-SPF: pass client-ip=173.195.146.151; envelope-from=outgoing@sr.ht;
 helo=mail-b.sr.ht
X-Spam_score_int: 2
X-Spam_score: 0.2
X-Spam_bar: /
X-Spam_report: (0.2 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FORGED_REPLYTO=2.095,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 30 Jan 2023 13:47:36 -0500
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 30 Jan 2023 17:54:38 -0000

From: VlaoMao <vlaomao@gmail.com>

Changing the address with a subsequent reboot makes this address permanent un=
til the vm is turned off
---
 hw/net/vmxnet3.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/net/vmxnet3.c b/hw/net/vmxnet3.c
index 04159c822..695ca2f92 100644
--- a/hw/net/vmxnet3.c
+++ b/hw/net/vmxnet3.c
@@ -1206,6 +1206,8 @@ static void vmxnet3_reset(VMXNET3State *s)
     s->drv_shmem =3D 0;
     s->tx_sop =3D true;
     s->skip_current_tx_pkt =3D false;
+
+    vmxnet3_reset_mac(s);
 }
=20
 static void vmxnet3_update_rx_mode(VMXNET3State *s)
--=20
2.34.5

