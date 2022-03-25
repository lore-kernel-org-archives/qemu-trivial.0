Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nXkby-0006Zs-Om
	for mharc-qemu-trivial@gnu.org; Fri, 25 Mar 2022 10:08:21 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <julien.durillon@clever-cloud.com>)
 id 1nXhhG-0005Ti-K6
 for qemu-trivial@nongnu.org; Fri, 25 Mar 2022 07:01:34 -0400
Received: from [2a00:1450:4864:20::42a] (port=33687
 helo=mail-wr1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <julien.durillon@clever-cloud.com>)
 id 1nXhhE-0002b8-Sd
 for qemu-trivial@nongnu.org; Fri, 25 Mar 2022 07:01:34 -0400
Received: by mail-wr1-x42a.google.com with SMTP id r7so9241382wrc.0
 for <qemu-trivial@nongnu.org>; Fri, 25 Mar 2022 04:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=clever-cloud.com; s=google;
 h=message-id:from:date:subject:to;
 bh=JzMRFnGZnZPjbzpHwBxOiOnTHMiJqVxjiEBBhdfmpKs=;
 b=Q3esLJmFP8saInR4+YkSmgSmvrZDOI2PWOhV5xgkAJv9JKk7bLXtcRu3m65/647o8o
 nktgf3KcAAUKPwwklp0Wr6/tXClPby41YGnWMzlQ7DtOalc1+sg+DqsfFAJ345+R1bIW
 JJd2BrAYiqMaxN82YuimosawyiNhP41Dztcv4fTRepkK+8d03BnJPd+bnKaGKGbTWKeg
 tR38ztvGz5w0C/Kr17o4d5wyBKYC5YtYYvDT2oRozTSp7RrRZ6nuatKSTCHIVvOsKxd5
 z0UyA/0Y3+tPYJ5mASiST4DVuGBRkcGQtrb2stJqIiq8ZG6STRaeDF45xMc7omEfdpZX
 aV/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:from:date:subject:to;
 bh=JzMRFnGZnZPjbzpHwBxOiOnTHMiJqVxjiEBBhdfmpKs=;
 b=YrytqorXBD51G2Bedr0cV0hyt2EIwDbXFSo6ytmhldDmoSnxuEy5kU2kUNfhqDhUXq
 IZ+bz6o7WUn3Nz+RpvryEl1YfGZrgTkqzZsZ+CcWlMuJwVP76BsGSb/ZNMvWlla29xHQ
 vV0SB44J289B2y3cVWQwIQ7nRDFpIeHeaGBtpSzQu7QO65SEKcsr8QipKT1/qpolYSEF
 eVg+Z3Qqao2f/QEWUNarZYmf6Yzh21P5eG0WOauT+c5Z+y5VvpqQvsJ4Ic8sYJZEu2bV
 P0dovw9HFiOh/b/BWmy8JGm1kwCXtdZQ/7gq970uDbnWqpJb7wji2oYBAYuMji8y0kJV
 EtFw==
X-Gm-Message-State: AOAM530bCdLVF2PXXO5UeRQ4q7ipviQy7k73NjkCx4bw2U3T+szPt06V
 3RJmPU2j4hEFU4igGAz7Kvh2EbYnjoNJLg==
X-Google-Smtp-Source: ABdhPJxD3xLEiaOyFwq3o5VHRJWU0tT2/gP1/NNQYeNzH/ZF1z0eh+0Mm5LAO75OWLuosFPxNEK4Ig==
X-Received: by 2002:adf:8122:0:b0:1e7:b111:3b92 with SMTP id
 31-20020adf8122000000b001e7b1113b92mr8719935wrm.695.1648206090456; 
 Fri, 25 Mar 2022 04:01:30 -0700 (PDT)
Received: from localhost (2a01cb000397e40057c1e592a870c98e.ipv6.abo.wanadoo.fr.
 [2a01:cb00:397:e400:57c1:e592:a870:c98e])
 by smtp.gmail.com with ESMTPSA id
 z5-20020a05600c0a0500b0037fa93193a8sm4860228wmp.44.2022.03.25.04.01.29
 for <qemu-trivial@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Mar 2022 04:01:29 -0700 (PDT)
Message-ID: <623da109.1c69fb81.4c36a.3f15@mx.google.com>
From: Julien Durillon <julien.durillon@clever-cloud.com>
Date: Fri, 25 Mar 2022 11:21:34 +0100
Subject: [PATCH] Use prefixed strings command from distro.
To: qemu-trivial@nongnu.org
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=julien.durillon@clever-cloud.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 25 Mar 2022 10:08:15 -0400
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
X-List-Received-Date: Fri, 25 Mar 2022 11:01:35 -0000

All the other tools can be prefixed/overriden by distro builders, but
strings. This makes the build work in build packages like the Exherbo
one.

Signed-off-by: Julien Durillon <julien.durillon@clever-cloud.com>
---
 configure | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/configure b/configure
index 6d9cb23ac5..c891b8c6ea 100755
--- a/configure
+++ b/configure
@@ -427,6 +427,7 @@ ranlib="${RANLIB-${cross_prefix}ranlib}"
 nm="${NM-${cross_prefix}nm}"
 smbd="$SMBD"
 strip="${STRIP-${cross_prefix}strip}"
+strings="${STRINGS-${cross_prefix}strings}"
 windres="${WINDRES-${cross_prefix}windres}"
 pkg_config_exe="${PKG_CONFIG-${cross_prefix}pkg-config}"
 query_pkg_config() {
@@ -1671,9 +1672,9 @@ int main(int argc, char *argv[])
 EOF
 
 if compile_prog ; then
-    if strings -a $TMPE | grep -q BiGeNdIaN ; then
+    if $strings -a $TMPE | grep -q BiGeNdIaN ; then
         bigendian="yes"
-    elif strings -a $TMPE | grep -q LiTtLeEnDiAn ; then
+    elif $strings -a $TMPE | grep -q LiTtLeEnDiAn ; then
         bigendian="no"
     else
         echo big/little test failed
-- 
2.35.1


