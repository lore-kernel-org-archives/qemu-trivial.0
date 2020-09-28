Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kMpGi-0003sM-Bv
	for mharc-qemu-trivial@gnu.org; Mon, 28 Sep 2020 05:16:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1kMpGc-0003pl-QG; Mon, 28 Sep 2020 05:16:19 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:51481)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1kMpGX-0002Wo-6u; Mon, 28 Sep 2020 05:16:16 -0400
Received: from localhost.localdomain ([82.252.129.222]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MzkK9-1kZhFG3B7B-00vccX; Mon, 28 Sep 2020 11:16:07 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>, qemu-trivial@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Laurent Vivier <lvivier@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PULL 2/8] meson: fix static flag summary
Date: Mon, 28 Sep 2020 11:15:56 +0200
Message-Id: <20200928091602.383870-3-laurent@vivier.eu>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200928091602.383870-1-laurent@vivier.eu>
References: <20200928091602.383870-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:B5fsLNp/y7OAU7H51raGoR5B1yImrNjHVJwdZRlVeQH02aeAEpR
 sWSvQyWDMNIwmHIjmzbVM95JP46uUb8QE1beSuMiv3ZShJ2lQMv6IprxKEA8UbFe3RGCNmx
 tCHpK9RSqG3IkjIHOMmlSWxZoUnBB6zURE61vnnWFQo90qPwLA9Wj3dSxcOBqecJYc+kQPM
 IS4QqsnobpDbwAHQh2vuQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:sZjCdlrUsoQ=:hkRsQD3uVSt6GVocDneRXL
 5IxGDYCdJ2yE6lDAcSBfxpyTdsC4NKFIqBSFNF60BQHg/z+JqBvLSVQ/8g5sUFNXVOmLIc49l
 aHp4HgR6WI0pWpTaQk6YtkFg/Bdps23wLKv2jwMbLfKBWiDkaLWoPtH0hNdiEp4reNnzBIU0B
 XfQnwWHcewCdIP5Q8A7Fq+wIS9SdUVNwZX9J+eN71DdS3LMjdyOzaV5m582TqbGWhOdArQ/5s
 Yj3ShJPmZwMPVn+wlMOpDKDJcOj2etC8uANsSTNthg5TaN4l3r1ptcuZAETsnElKLlKdZ+CsX
 srjHAhe1wsEkAOCa1jzp1RqNKKdhZ/+mFkyp7RlZUaw0EhI90DcZZsToME1UQZM4JKyi73cP2
 2PKaLwHpZ0lqUUph/tsBWfwA7xTSU/pROn1y/WodqBWO8ze6EhDW5ijUfUuVW6f9JV6vBJi3X
 xTQW8c0fQVYklKcSnoDlkXmdUPMrWQSzqFCQcP5yYR/HsSQq76Z1G0ZIXHszBcCGMQPYNSEF6
 y6JLk73TyjNDKv2Hmq7qHkTeuzOOA2eSM5iwMnNNS7PsFZCiLVCrYZuO5bf8IX9RV51dgo0YL
 Q0o5LuUJnhsLr1xh+VNfkdyxR5SZtWqU4N2DUcwDg6Xfg0AAMAE3DdGtzDHiC9Ljk7YznrhOl
 ZdjqGbZS43f4p8hsdCbs/u+r10zmhkjM1DexK8/5frCIyIggPFxSFrxM+2QjjftFy5kITS+N2
 F4h3PdPNXpE75qaFNInPrHUPRI2vhbqpJzNdliqOPyCWOYhxPg0qD24XWWp86uF8pbayLnw6f
 107HTS90vB/uBoFgouyVbfYGv5VX/wF90Hr66A8rI9uNO8m1TCSBnaZrdWuWdMeZ2XMwZWa
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/28 05:16:11
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.462, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 28 Sep 2020 09:16:20 -0000

From: Laurent Vivier <lvivier@redhat.com>

'static build:' must display value of CONFIG_STATIC rather than value of
CONFIG_TOOLS.

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20200917140700.673171-1-lvivier@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index f4d1ab109680..b26c8bffc6fe 100644
--- a/meson.build
+++ b/meson.build
@@ -1368,7 +1368,7 @@ summary_info += {'gprof enabled':     config_host.has_key('CONFIG_GPROF')}
 summary_info += {'sparse enabled':    meson.get_compiler('c').cmd_array().contains('cgcc')}
 summary_info += {'strip binaries':    get_option('strip')}
 summary_info += {'profiler':          config_host.has_key('CONFIG_PROFILER')}
-summary_info += {'static build':      config_host.has_key('CONFIG_TOOLS')}
+summary_info += {'static build':      config_host.has_key('CONFIG_STATIC')}
 if targetos == 'darwin'
   summary_info += {'Cocoa support': config_host.has_key('CONFIG_COCOA')}
 endif
-- 
2.26.2


