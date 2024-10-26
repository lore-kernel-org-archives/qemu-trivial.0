Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1t4rSJ-0007Bj-Ji
	for mharc-qemu-trivial@gnu.org; Sat, 26 Oct 2024 20:48:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1t4qbY-0000PI-49; Sat, 26 Oct 2024 19:54:00 -0400
Received: from mail-a.sr.ht ([46.23.81.152])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1t4qbV-0002ha-Td; Sat, 26 Oct 2024 19:53:59 -0400
DKIM-Signature: a=rsa-sha256; bh=nnM0qsTKZawvPSe65RgGHinZMHOACZZWNgiVrM0q4Xg=; 
 c=simple/simple; d=git.sr.ht;
 h=From:Date:Subject:Reply-to:To:Cc; 
 q=dns/txt; s=20240113; t=1729986833; v=1;
 b=JDXh3qXfG8N9O0o1rdDb5dV2jNJlz8zIbgbElUNOf2XWGWQRxmQ8T30uQDW0RAEa1KE6QtEc
 Rz03povhKwfKkN0Kb2aLS6VtD1KSK1xCr1KpYrM4GqO23a1PdSAWf8FNrDBEUAbqgut8S1acIvA
 RMyJUF32q2Ud2WeN29tsUOh7ATr2kcN+swVQ9GnkRuqH9b2JSEbd/9Z5VXP81B1pQVDRcbAmgHn
 +6Utc8ZWi/tFxV998vhlgdrbViSNU+7JbnP1hWUEmyB6MSwAaA+eUA1Qk9tx3Xayqe4dpBTdzpx
 dxBMC5VFugRiYcb79TFzim7S8z0agfq7vscBSnKcK/DPA==
Received: from git.sr.ht (unknown [46.23.81.155])
 by mail-a.sr.ht (Postfix) with ESMTPSA id 43E632026F;
 Sat, 26 Oct 2024 23:53:53 +0000 (UTC)
From: ~axelheider <axelheider@git.sr.ht>
Date: Sat, 26 Oct 2024 23:53:53 +0000
Subject: [PATCH qemu.git 0/1] docs/devel/reset: add missing words
MIME-Version: 1.0
Message-ID: <172998683323.20070.572834413126431721-0@git.sr.ht>
X-Mailer: git.sr.ht
Reply-to: ~axelheider <axelheider@gmx.de>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=46.23.81.152; envelope-from=outgoing@sr.ht;
 helo=mail-a.sr.ht
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, FREEMAIL_FORGED_REPLYTO=2.095,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 26 Oct 2024 20:48:26 -0400
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
X-List-Received-Date: Sat, 26 Oct 2024 23:54:00 -0000

Add missing words in documentation

Axel Heider (1):
  docs/devel/reset: add missing words

 docs/devel/reset.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.45.2

