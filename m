Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nXkc2-0006c4-37
	for mharc-qemu-trivial@gnu.org; Fri, 25 Mar 2022 10:08:22 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <julien.durillon@clever-cloud.com>)
 id 1nXiAE-0000Hn-Dz
 for qemu-trivial@nongnu.org; Fri, 25 Mar 2022 07:31:30 -0400
Received: from [2a00:1450:4864:20::430] (port=38445
 helo=mail-wr1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <julien.durillon@clever-cloud.com>)
 id 1nXiAC-0007u2-Le
 for qemu-trivial@nongnu.org; Fri, 25 Mar 2022 07:31:29 -0400
Received: by mail-wr1-x430.google.com with SMTP id t11so10464557wrm.5
 for <qemu-trivial@nongnu.org>; Fri, 25 Mar 2022 04:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=clever-cloud.com; s=google;
 h=message-id:from:date:subject:to;
 bh=JzMRFnGZnZPjbzpHwBxOiOnTHMiJqVxjiEBBhdfmpKs=;
 b=XJW8dbpF/rlvzjCMhztDZ++eiC4UOQuMy3Rq5ITMgfhRnnTk8hSNxOyNI6PLUoXErW
 3cBSXTVNc02/qbUW77Y2uu8XO/iGtaeMhjyPby7MzsqPg5/RMMfOsgEX8F+jDgFKaPR0
 Aklz1ihP7u1HOjLV2SwtNkr5eDygYxctAg5oNw+6xeAA4DZlV+cJ9XseuP9iyjy7ZnJr
 /yyvNX9dC3ySLH0SwJAieu9Q2lSUnhj3rq0jDzrIVeeZg0CkComLrj3AUNGlmgz+02vB
 yChbgSzkq6ighYwhkJMLnxYZ/u9pQogTHqIuz/tEfRAmZP3FIAFzpz20enebhlFVnjGG
 cujQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:from:date:subject:to;
 bh=JzMRFnGZnZPjbzpHwBxOiOnTHMiJqVxjiEBBhdfmpKs=;
 b=5rs9ZWkQS+XOsU8DK9P6QcVlZrF68TyDY/5WaI33+sDIsRSdvglIwDbI7+qp5+hcDg
 vHyND3E5ejMVaGMR0DbeTk0lgg+sExo2MgDs1sscnUwEdUhjSPF5cQ3v8VeOQWJHCbiV
 9zvQ7Bpu/8LWhNZ7+1RifK3dytputMwkInDE401D3l3qGG0D9qAUFJsg3b36cmxtZrU8
 koiOoqrWplf0d9VmkMUu/KXpEmwRLz1jMKNDdNt0Fra5cl/OmZc+UzJnfr0lak++kLml
 eN8E7KAMqWLDenQ5l6CgOwKW2kQUNtrVlZBCQ3bvirIiCu6Sv4NNdJyNGqTrexwOvPay
 rRvQ==
X-Gm-Message-State: AOAM532GwXnTOvKsJCFIPU2J4mbFyxAUw22XSyMizKZiC3v61LUQm1M2
 uUANmgmKf3FwaBZAuzgBWDvL/cAwhycb5g==
X-Google-Smtp-Source: ABdhPJzTJK/SjqXkyi1+UOQp0GTKNG/b3IP52jyt9dFh6Gpc6HXANHat2R5gCPoZZjW3v7MruWK8nw==
X-Received: by 2002:a05:6000:178e:b0:205:7acf:8fb1 with SMTP id
 e14-20020a056000178e00b002057acf8fb1mr8991760wrg.499.1648207886628; 
 Fri, 25 Mar 2022 04:31:26 -0700 (PDT)
Received: from localhost (2a01cb000397e40057c1e592a870c98e.ipv6.abo.wanadoo.fr.
 [2a01:cb00:397:e400:57c1:e592:a870:c98e])
 by smtp.gmail.com with ESMTPSA id
 p7-20020a5d48c7000000b002058b748dcdsm4787529wrs.114.2022.03.25.04.31.25
 for <qemu-trivial@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Mar 2022 04:31:26 -0700 (PDT)
Message-ID: <623da80e.1c69fb81.8a40a.3b35@mx.google.com>
From: Julien Durillon <julien.durillon@clever-cloud.com>
Date: Fri, 25 Mar 2022 11:21:34 +0100
Subject: [PATCH] Use prefixed strings command from distro.
To: qemu-trivial@nongnu.org
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::430
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=julien.durillon@clever-cloud.com; helo=mail-wr1-x430.google.com
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
X-List-Received-Date: Fri, 25 Mar 2022 11:31:30 -0000

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


