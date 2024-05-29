Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1sCKkF-0005jr-SA
	for mharc-qemu-trivial@gnu.org; Wed, 29 May 2024 10:57:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.mehnert@kernkonzept.com>)
 id 1sCJk6-0000Du-J5
 for qemu-trivial@nongnu.org; Wed, 29 May 2024 09:53:27 -0400
Received: from serv1.kernkonzept.com ([2a01:4f8:1c1c:b490::2]
 helo=mx.kernkonzept.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.mehnert@kernkonzept.com>)
 id 1sCJk3-0003Hz-SU
 for qemu-trivial@nongnu.org; Wed, 29 May 2024 09:53:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=kernkonzept.com; s=mx1; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:Message-ID:Date:Subject:To:From:References:In-Reply-To:Cc:
 Reply-To:Content-ID:Content-Description;
 bh=mwaAxJQEHpb90HAjxXxBrXjhlIuyukcfgqlo0Wo+Z0k=; b=p0dDoSOCQoS6hytlSSDseJak4k
 Lr9y6qVjFR9XPgQutg1AysYabN9W4+HthXNFW9rok33fdS5drUgFpMrXsZTTh5eabTlJDxDdFroc9
 xGzrjyf9LMm/OHDhPuvkvQABsUHvPOl3KDFKRzgCX8Nl/37Ox3o/WXrS1mD6vmOa933BT5s3zzvjy
 4e5Kdbdqu5bEj2wNC44R1PnPe6Z78XwLyWZEFZiU+xQWhMvIWIU5/4KYIPZym0Bluq/mNJUx+JR/e
 1+9qnRFZyvC3REIuaDPZS6iVIZsqPHWdGnAelQxNqkHMTq3I10iDmAZl5+qMqT63DJ7NpC6395vhE
 Pwk993JQ==;
Received: from [10.22.3.60] (helo=noys4.localnet)
 by mx.kernkonzept.com with esmtpsa
 (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim 4.96)
 id 1sCJjy-0047fp-2q for qemu-trivial@nongnu.org;
 Wed, 29 May 2024 15:53:18 +0200
From: Frank Mehnert <frank.mehnert@kernkonzept.com>
To: qemu-trivial@nongnu.org
Subject: [PATCH] fix SSE2/SSSE3 feature detection in tcg/decode-new.c.inc
Date: Wed, 29 May 2024 15:53:13 +0200
Message-ID: <2975380.e9J7NaK4W3@noys4>
Organization: Kernkonzept
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=2a01:4f8:1c1c:b490::2;
 envelope-from=frank.mehnert@kernkonzept.com; helo=mx.kernkonzept.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 29 May 2024 10:57:38 -0400
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
X-List-Received-Date: Wed, 29 May 2024 13:53:27 -0000

The correct bitmask is cpuid_features rather than cpuid_ext_features.
---
 target/i386/tcg/decode-new.c.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/i386/tcg/decode-new.c.inc b/target/i386/tcg/decode-new.c.inc
index 27dc1bb146..0ec849b003 100644
--- a/target/i386/tcg/decode-new.c.inc
+++ b/target/i386/tcg/decode-new.c.inc
@@ -2041,9 +2041,9 @@ static bool has_cpuid_feature(DisasContext *s, X86CPUIDFeature cpuid)
     case X86_FEAT_PCLMULQDQ:
         return (s->cpuid_ext_features & CPUID_EXT_PCLMULQDQ);
     case X86_FEAT_SSE:
-        return (s->cpuid_ext_features & CPUID_SSE);
+        return (s->cpuid_features & CPUID_SSE);
     case X86_FEAT_SSE2:
-        return (s->cpuid_ext_features & CPUID_SSE2);
+        return (s->cpuid_features & CPUID_SSE2);
     case X86_FEAT_SSE3:
         return (s->cpuid_ext_features & CPUID_EXT_SSE3);
     case X86_FEAT_SSSE3:
-- 
2.45.1



