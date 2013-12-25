Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VvtyY-00075E-PC
	for mharc-qemu-trivial@gnu.org; Wed, 25 Dec 2013 14:18:38 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51565)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <0intro@gmail.com>) id 1VvpJS-00086n-GS
	for qemu-trivial@nongnu.org; Wed, 25 Dec 2013 09:20:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <0intro@gmail.com>) id 1VvpJK-0004gR-2h
	for qemu-trivial@nongnu.org; Wed, 25 Dec 2013 09:19:54 -0500
Received: from mail-we0-x234.google.com ([2a00:1450:400c:c03::234]:47932)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <0intro@gmail.com>) id 1VvpJJ-0004gC-Qo
	for qemu-trivial@nongnu.org; Wed, 25 Dec 2013 09:19:46 -0500
Received: by mail-we0-f180.google.com with SMTP id t61so6639010wes.39
	for <qemu-trivial@nongnu.org>; Wed, 25 Dec 2013 06:19:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=IBwuriIO4B7t7wYftIrrN6JYSA0XSbXvc5QC+xF+Yug=;
	b=v7qSdi4FDfGCtaPfd0p8pWk3H/JMUax0aJAAq8Ip4/nxCyjPDqP4narNIiFUCL0H3B
	SguZ6iT+8oNUsn4S0SPtZIw0oKiG1rnWQY7HJzOmMDkb7Awc3HNGx+WfDGQYtxvcicIx
	AQgh2gfnTlhi93NWS8F61B1Dd90skfjW+1Aw9j4/KbsZ8SNHsrJ5tiFVt5ztEs/UCTlI
	DyeUrrjWkkuiJ9up5LduHptVZ9QM136pD2TbSRtIGAtgKhVaCX0f+q/G+NvhjANRNOkv
	7JZBIInt4xBNk3ZKCz0Jxv4abhH6uEUCA3ZYcgYlLvZJ05/ywLelwGeAlucUS0tr4oI3
	Gv6A==
X-Received: by 10.180.75.115 with SMTP id b19mr26710476wiw.19.1387981183822;
	Wed, 25 Dec 2013 06:19:43 -0800 (PST)
Received: from zinc.9fans.fr (ARennes-658-1-73-33.w92-139.abo.wanadoo.fr.
	[92.139.80.33])
	by mx.google.com with ESMTPSA id e5sm980wja.15.2013.12.25.06.19.43
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 25 Dec 2013 06:19:43 -0800 (PST)
From: David du Colombier <0intro@gmail.com>
To: qemu-trivial@nongnu.org
Date: Wed, 25 Dec 2013 15:17:43 +0100
Message-Id: <1387981063-14880-1-git-send-email-0intro@gmail.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c03::234
X-Mailman-Approved-At: Wed, 25 Dec 2013 14:18:37 -0500
Cc: David du Colombier <0intro@gmail.com>
Subject: [Qemu-trivial] [PATCH] ide: cmd_exec_dev_diagnostic() always set
	error register to 0x01
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
X-List-Received-Date: Wed, 25 Dec 2013 14:20:03 -0000

This notably fix IDE CD probing on the Plan 9 operating system,
which rely on the error register set by the Execute Device
Diagnostic command to detect drive configurations.

Thanks to Rémi Pommarel for reporting this issue.

Signed-off-by: David du Colombier <0intro@gmail.com>
---
 hw/ide/core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/ide/core.c b/hw/ide/core.c
index e1f4c33..7783d58 100644
--- a/hw/ide/core.c
+++ b/hw/ide/core.c
@@ -1321,6 +1321,7 @@ static bool cmd_exec_dev_diagnostic(IDEState *s, uint8_t cmd)
         s->status = 0; /* ATAPI spec (v6) section 9.10 defines packet
                         * devices to return a clear status register
                         * with READY_STAT *not* set. */
+        s->error = 0x01;
     } else {
         s->status = READY_STAT | SEEK_STAT;
         /* The bits of the error register are not as usual for this command!
-- 
1.8.3.1


