Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YzKY9-0005TU-UX
	for mharc-qemu-trivial@gnu.org; Mon, 01 Jun 2015 03:54:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58239)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1YzKY7-0005P0-83
	for qemu-trivial@nongnu.org; Mon, 01 Jun 2015 03:54:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1YzKY6-0007co-GS
	for qemu-trivial@nongnu.org; Mon, 01 Jun 2015 03:54:19 -0400
Received: from mail-wg0-x22f.google.com ([2a00:1450:400c:c00::22f]:34908)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1YzKY0-0007aJ-DD; Mon, 01 Jun 2015 03:54:12 -0400
Received: by wgme6 with SMTP id e6so106752739wgm.2;
	Mon, 01 Jun 2015 00:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=o5oAWU2/GbPCBEtfMNPMlHTdpk2v0XkVCVoTGaYqsYw=;
	b=sJpeT3zudC53zVKCrhYwy6hLuX/2RFmOUswvaLEteCr+YE1Ma62kat4DTmLUcq7qtB
	hmaZqaipGyi/VGqXal8GCuA3HVgPr3zXOl6cqV528o8Rx66GD0POczz8u8Jih00HBYAY
	X96rUxCEe0S3sW+TbbVXLTl3vPgInZRtUa4rjjG/+mflTukwO6X5TOQT0Qxqe9Jej2wG
	UA61EqITDSaG3fX7n9FCYmT2eLeL3TGQ6AjEtvAJjibzEtVC24V+DqY6Xb+AFwF+Ho76
	14hNUQBEsFrvBaIwaJzbeiRSFgkbnNpNb7ztpRQX3887hVAfCuwbHx+HB/JTgu8uSb67
	5dFg==
X-Received: by 10.180.100.101 with SMTP id ex5mr18736755wib.13.1433145251687; 
	Mon, 01 Jun 2015 00:54:11 -0700 (PDT)
Received: from donizetti.localdomain ([5.170.194.159])
	by mx.google.com with ESMTPSA id
	hn7sm20600304wjc.16.2015.06.01.00.54.09
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 01 Jun 2015 00:54:10 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon,  1 Jun 2015 09:53:55 +0200
Message-Id: <1433145235-13941-1-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 2.4.1
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c00::22f
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH] translate-all: delete prototype for
	non-existent function
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
X-List-Received-Date: Mon, 01 Jun 2015 07:54:20 -0000

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 translate-all.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/translate-all.h b/translate-all.h
index ef9166c..0384640 100644
--- a/translate-all.h
+++ b/translate-all.h
@@ -24,7 +24,6 @@ void tb_invalidate_phys_page_fast(tb_page_addr_t start, int len);
 void tb_invalidate_phys_page_range(tb_page_addr_t start, tb_page_addr_t end,
                                    int is_cpu_write_access);
 void tb_invalidate_phys_range(tb_page_addr_t start, tb_page_addr_t end);
-void cpu_unlink_tb(CPUState *cpu);
 void tb_check_watchpoint(CPUState *cpu);
 
 #ifdef CONFIG_USER_ONLY
-- 
2.4.1


