Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Y34er-0002eW-9R
	for mharc-qemu-trivial@gnu.org; Mon, 22 Dec 2014 10:12:29 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58677)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dslutz@verizon.com>) id 1Y34X2-0002Aq-Lp
	for qemu-trivial@nongnu.org; Mon, 22 Dec 2014 10:04:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dslutz@verizon.com>) id 1Y34Ww-0007QQ-Jj
	for qemu-trivial@nongnu.org; Mon, 22 Dec 2014 10:04:24 -0500
Received: from fldsmtpe04.verizon.com ([140.108.26.143]:36199)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dslutz@verizon.com>)
	id 1Y34Wk-0007Ow-1T; Mon, 22 Dec 2014 10:04:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=verizon.com; i=dslutz@verizon.com; q=dns/txt; s=corp;
	t=1419260645; x=1450796645;
	h=from:to:cc:subject:date:message-id;
	bh=bb4UZgRgd+Vqghrkz9oFm92FMWTVMxWn/RpLaCrK7BY=;
	b=RLWOUI0TGkAEOfpHhlfvc029hVE6dEHYb+PZmYAhkUA32uK3klbB9b2X
	rkeGwKunWIEBdAFKkA2pTUrRPlG2YAT4CRQEHR5HqAyTbsTIGxJT+sK77
	fUclfKZICIhWm7OFMCKedgEyJoynd4yZ6y/k6YXgT3YsLMOvpxpkZxgFr o=;
X-IronPort-Anti-Spam-Filtered: false
Received: from unknown (HELO fldsmtpi01.verizon.com) ([166.68.71.143])
	by fldsmtpe04.verizon.com with ESMTP; 22 Dec 2014 15:04:04 +0000
X-VzAPP: 1
X-IronPort-AV: E=Sophos;i="5.07,624,1413244800"; d="scan'208";a="936419545"
Received: from unknown (HELO don-760.CloudSwitch.com) ([70.105.105.12])
	by fldsmtpi01.verizon.com with ESMTP; 22 Dec 2014 15:04:03 +0000
From: Don Slutz <dslutz@verizon.com>
To: <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>
Date: Mon, 22 Dec 2014 10:04:00 -0500
Message-Id: <1419260640-2922-1-git-send-email-dslutz@verizon.com>
X-Mailer: git-send-email 1.8.4
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 140.108.26.143
X-Mailman-Approved-At: Mon, 22 Dec 2014 10:12:28 -0500
Cc: Paolo Bonzini <pbonzini@redhat.com>, Don Slutz <dslutz@verizon.com>,
	Anthony Liguori <aliguori@amazon.com>
Subject: [Qemu-trivial] [PATCH 1/1] Do not hang on full PTY
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 22 Dec 2014 15:04:30 -0000

Signed-off-by: Don Slutz <dslutz@verizon.com>
---
 qemu-char.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/qemu-char.c b/qemu-char.c
index ef84b53..6eec1d2 100644
--- a/qemu-char.c
+++ b/qemu-char.c
@@ -1387,6 +1387,7 @@ static CharDriverState *qemu_chr_open_pty(const char *id,
     }
 
     close(slave_fd);
+    qemu_set_nonblock(master_fd);
 
     chr = qemu_chr_alloc();
 
-- 
1.8.4


