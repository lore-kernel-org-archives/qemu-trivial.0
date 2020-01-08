Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ipDnV-0005vV-Sp
	for mharc-qemu-trivial@gnu.org; Wed, 08 Jan 2020 11:03:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36506)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1ipDnN-0005kv-QJ
 for qemu-trivial@nongnu.org; Wed, 08 Jan 2020 11:03:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1ipDnM-0001wz-Ho
 for qemu-trivial@nongnu.org; Wed, 08 Jan 2020 11:02:57 -0500
Received: from mout.kundenserver.de ([212.227.126.133]:58733)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1ipDnJ-0001sQ-MV; Wed, 08 Jan 2020 11:02:53 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MTzve-1jG4Kg3vVK-00R2Wv; Wed, 08 Jan 2020 17:02:41 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, Eric Blake <eblake@redhat.com>,
 qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Michael Tokarev <mjt@tls.msk.ru>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-trivial@nongnu.org,
 Chen Qun <kuhn.chenqun@huawei.com>, Euler Robot <euler.robot@huawei.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PULL 5/5] vl: fix memory leak in configure_accelerators
Date: Wed,  8 Jan 2020 17:02:33 +0100
Message-Id: <20200108160233.991134-6-laurent@vivier.eu>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200108160233.991134-1-laurent@vivier.eu>
References: <20200108160233.991134-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:dBVTSiGT6cFvz6yTeBe4zQ3GS80X+iAEX9u3kOCQRLeS3Yx6qyC
 Z7Jc8NEZzFMS9OZL2SVwwtgcFeUk1liIDSGHcUEgQYhV+cPkoiVAfYZuc9QT+fvRL1rBuZM
 Pc1y4aBeBiCG3rJ1DBPL0A3OQBgnoZ/dZ7eFHwcpEPBXGEYEN5jT0YrXlAkTrxmsqtMhuYX
 3w7AyKz6hhJFi5zT4A6Ww==
X-UI-Out-Filterresults: notjunk:1;V03:K0:RrWxFiTocSE=:WugAK7Vv6c9O8V7GZ+xfjJ
 vz140dfW2NBp/RynMhp1c1FrKrHWMWw3JCge/tdA4qRmRD0RKekaDP5Be1ghGzIUtYmfXz7nq
 lUclvc31IZGoOLviiXBJKTFxCd11D+8dkkFWWya1LQljBAy/i2nsenzc2GaW5FJiIkeode2Nc
 Y01FwKTtHXHIHbD1EubX7aQx/A+l3d+S/Xsk1CrTr2nmSBJYL/rCIKK7sMoM+q7Va9fTMmP2O
 UFpTCxgXqFINQlKuGsQyMlv95RFAvPRaNTjRTlbRrBNFV3uPZBA3rcFm7E5E1YLdOVf5f0RbR
 DDHjdVLvYOwnetDHdvMscEOkdAKd7do6XPT993MMO8bghGxHBVNi1nrcu02JrmIv2BiJiUE97
 D5rwH+ouQf72B5w2WfiGizGCgxBGTX/b4g9tt0d3fdWrVVwOyUYyvTNjTiP9d3+DR2aywIYPF
 DnypHqEkApWtmxcVNzhTa1EhPTxVtKDH33XcyK0ebtoqEcBAPDEcuL1LPtg4TTMaPLJ2DWISA
 6kiguTSS/zkDkujZWL9p7Hw/LQHlxelqzHA+lYefLxW5jExC2y0DHpVMPSFQLinwjkq8MIxYT
 PXmgOHb2VM3/cOdkyLWk7PqDgp3N+s0vDTT3v8Cv3KN5nK0sEc4vzFesB5SlpwqMWuv/E1vTt
 ZeFr4pgjsYbZhg6bFjBrjvyfwgemmvGbFhRvgCF9u4w+w8qKpR8/GgkLj/inX9zFJMTLPxZ/S
 2glPheRbEVZokjWzerT87Qs38RP+JezwIOQvMLWSUzCCujIACkgBv0J5eI2IM4I7url9+amBx
 WqOEhXscm6Sem5yjs4Hfyw+EFAHUQ+rLfqCuol9Gozr+3CMqWIxJBOIU13UW/g8mvueeN773O
 +dIcVd3TwuNSFAaJcta742DtrErp9BBV4Vhtzp8Ag=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 212.227.126.133
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
X-List-Received-Date: Wed, 08 Jan 2020 16:03:04 -0000

From: Chen Qun <kuhn.chenqun@huawei.com>

The accel_list forgot to free, the asan output:

Direct leak of 16 byte(s) in 1 object(s) allocated from:
    #0 0xffff919331cb in __interceptor_malloc (/lib64/libasan.so.4+0xd31cb)
    #1 0xffff913f7163 in g_malloc (/lib64/libglib-2.0.so.0+0x57163)
    #2 0xffff91413d9b in g_strsplit (/lib64/libglib-2.0.so.0+0x73d9b)
    #3 0xaaab42fb58e7 in configure_accelerators /qemu/vl.c:2777
    #4 0xaaab42fb58e7 in main /qemu/vl.c:4121
    #5 0xffff8f9b0b9f in __libc_start_main (/lib64/libc.so.6+0x20b9f)
    #6 0xaaab42fc1dab  (/qemu/build/aarch64-softmmu/qemu-system-aarch64+0x8b1dab)

Indirect leak of 4 byte(s) in 1 object(s) allocated from:
    #0 0xffff919331cb in __interceptor_malloc (/lib64/libasan.so.4+0xd31cb)
    #1 0xffff913f7163 in g_malloc (/lib64/libglib-2.0.so.0+0x57163)
    #2 0xffff9141243b in g_strdup (/lib64/libglib-2.0.so.0+0x7243b)
    #3 0xffff91413e6f in g_strsplit (/lib64/libglib-2.0.so.0+0x73e6f)
    #4 0xaaab42fb58e7 in configure_accelerators /qemu/vl.c:2777
    #5 0xaaab42fb58e7 in main /qemu/vl.c:4121
    #6 0xffff8f9b0b9f in __libc_start_main (/lib64/libc.so.6+0x20b9f)
    #7 0xaaab42fc1dab  (/qemu/build/aarch64-softmmu/qemu-system-aarch64+0x8b1dab)

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20200108114207.58084-1-kuhn.chenqun@huawei.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 vl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/vl.c b/vl.c
index 86474a55c9ef..035a24e52b24 100644
--- a/vl.c
+++ b/vl.c
@@ -2788,6 +2788,7 @@ static void configure_accelerators(const char *progname)
                 error_report("invalid accelerator %s", *tmp);
             }
         }
+        g_strfreev(accel_list);
     } else {
         if (accel != NULL) {
             error_report("The -accel and \"-machine accel=\" options are incompatible");
-- 
2.24.1


