Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ipDnr-0006Qx-IM
	for mharc-qemu-trivial@gnu.org; Wed, 08 Jan 2020 11:03:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36878)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1ipDnl-0006JO-7j
 for qemu-trivial@nongnu.org; Wed, 08 Jan 2020 11:03:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1ipDnf-0002DL-7g
 for qemu-trivial@nongnu.org; Wed, 08 Jan 2020 11:03:21 -0500
Received: from mout.kundenserver.de ([212.227.126.187]:46689)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1ipDnK-0001tl-Lk; Wed, 08 Jan 2020 11:02:54 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1N5mWp-1jmd0O4C7v-017F6e; Wed, 08 Jan 2020 17:02:40 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, Eric Blake <eblake@redhat.com>,
 qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Michael Tokarev <mjt@tls.msk.ru>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-trivial@nongnu.org,
 Pan Nengyuan <pannengyuan@huawei.com>,
 Euler Robot <euler.robot@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PULL 4/5] arm/translate-a64: fix uninitialized variable warning
Date: Wed,  8 Jan 2020 17:02:32 +0100
Message-Id: <20200108160233.991134-5-laurent@vivier.eu>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200108160233.991134-1-laurent@vivier.eu>
References: <20200108160233.991134-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:EHnKO7J//24FrZUg1j5EIhq7KWvRVTiEIll+WUa35nyi5IL7Tzh
 ePKu/lTxyjEGo2CJgXrXlBESFDb4nLEwOexjcPUoLntfZ65SYP/HxOsb3KOu92ZrSUlkPiA
 h/G+s05PwjTZjcDlVxEffhkdpwxYipDYsQ9a0ECbdAEQyXAY/R78dTx/qog3VB3u7n+2ovH
 3FvNgcWftBwkIAsAFRcFw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:kp8Eg0YxKM4=:Ez7+Vo4nmSWoZpQ1sfoR1j
 TlLb05P6sWZj1pWDrDa8ZoMsiWLK2QlImCTTpgmhcZE4924VP1DfouXPx0YGMYoJhmZB/NZO8
 XqEhHNLHB9J+tcB+KO/SwRu9YaF2u94o61/HuhhZgSnSyH3NtVrz1zXGiH6Km/tJOdO6U9NjU
 OwMWx+RhF0L+itcsPbeRp/+HjnNwFXtOIOyH79VyaJJawDmC2ivHrDzQmYqFp1HcM6L4Y4pbQ
 +wQftz0gT0xXcmvjQO1BOwxcrOMmbkF6Vn4H//1vYJdPq1dliHFEyxSTSeyitZZvRMXp3eA1O
 EWm12TFCI8TloyA4jdTLlbSYS0LUn3DpzlmOkOWP9dtIiL2Z6SkxPXcDefvCCiNAsj5kMW6dG
 9SeAJWYyJqgNX5iNoC0V01mJjW4AmzDLLdVPrZwHJQCLf0dPWuzafzJMh7N9tTvNvMVdp8+2C
 cAkczGi8eTaGc+f2+hdlheaU8WKfYhPNMID1lBKyFQvnaKjwdrh2zilJbqk19CvJrhhpHRMeW
 rqWfuigEIv+5PFLIuPsB3Tfi+9++mkWgdfC4QeMNchlABu4x+ZKnsRZiBlhViNVWs5YXweH7G
 IqFX2NQO8nEQjRuF74zh+8TNey+YPGVw4O5BpxfGuiA9YPiZphfrwcd0r6uQBs4waJcZ1hDnI
 rSKHQpkSyQa/qZ5jFOgl3ijCxt4il2mspnhVXE4MwlHQ3S+7tLsVvkOv5e/e8Ohsi7wtV7sky
 iyK2gMG7K7Q9cmp5+NW+4A7I/a2hiO2TC3qhctSIHG4/Gngmcr4+Pf7rlSITF+lnuMt1/tF1K
 vY6dfgOR9C8YjQFCcZp/85JhrrAgFNH3gZv3CM/HtRA3EI/gqVeXpHtWS4Q1jtDehrSo7AycH
 5ykwqdja1wAGXaQtpn/5IskW0HuvHtgqBRFegV0Pw=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 212.227.126.187
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
X-List-Received-Date: Wed, 08 Jan 2020 16:03:25 -0000

From: Pan Nengyuan <pannengyuan@huawei.com>

Fixes:
target/arm/translate-a64.c: In function 'disas_crypto_three_reg_sha512':
target/arm/translate-a64.c:13625:9: error: 'genfn' may be used uninitialized in this function [-Werror=maybe-uninitialized]
    genfn(tcg_rd_ptr, tcg_rn_ptr, tcg_rm_ptr);
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
qemu/target/arm/translate-a64.c:13609:8: error: 'feature' may be used uninitialized in this function [-Werror=maybe-uninitialized]
    if (!feature) {

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Pan Nengyuan <pannengyuan@huawei.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20200108023915.52288-1-pannengyuan@huawei.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 target/arm/translate-a64.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index d4bebbe62958..63a3d2668710 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -13585,6 +13585,8 @@ static void disas_crypto_three_reg_sha512(DisasContext *s, uint32_t insn)
             feature = dc_isar_feature(aa64_sha3, s);
             genfn = NULL;
             break;
+        default:
+            g_assert_not_reached();
         }
     } else {
         switch (opcode) {
-- 
2.24.1


