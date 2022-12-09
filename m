Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p3bdq-0003Md-Hi
	for mharc-qemu-trivial@gnu.org; Fri, 09 Dec 2022 06:34:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3bdV-0003HS-PG
 for qemu-trivial@nongnu.org; Fri, 09 Dec 2022 06:33:59 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3bdS-0000IO-PH
 for qemu-trivial@nongnu.org; Fri, 09 Dec 2022 06:33:49 -0500
Received: by mail-wm1-x331.google.com with SMTP id v7so3375899wmn.0
 for <qemu-trivial@nongnu.org>; Fri, 09 Dec 2022 03:33:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dLA8QEjrYdTNf33My29KKVDGQuaGLbZ2RRxkNnsl2uI=;
 b=Uw4evc2tCg3N2e/Fnf2zQ4uznEWGggsANlDwOzhmJlXHJxTbLkZpy0VpFrwfynQEPK
 Wkw4EQ0VTOu1Cp8AN+azO8tKfs4HAoUbBBvY1EuIoyioCIyyzthPyVLYEcrrV6cNad/e
 tm6WHicVnLNMiPAEGmJdKhq6UhK8t6qAJrtsMzwGMn/CtGsVP9YFyvtHoSNkV/eIlYoo
 1t0fqdHBsWxg+nPFCl5Zz/uTLMzwPZS0z2MtZj1qbiCkJPK5MM5uG8ARdxdPegiLlKdv
 53jOO9SZB+ysyyLTG/fqAJCXTbv53mvWhgWQCk1HT6eFMm0DJUzvNKpDA/kftX6wnfC6
 TILA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dLA8QEjrYdTNf33My29KKVDGQuaGLbZ2RRxkNnsl2uI=;
 b=fPNWQ5va2ivCmQS7ydIz/kXmO9207nAiLE3EMYXI/fdDSrYcZPhn+lJmUvyNHoA5xG
 Ve3Vw69eZJnuWUweVR1Se++pAZsmmX3QSJHIfnmQPkvXgcMflYwXEw4oMP5IB4vSUSbE
 kTfHfq0gLnxN0hcoXDyJbKoWPZi35YO4Hr0MLBuRk9YsQwJ+OePhKLM1GexyHJz1B2Tm
 BdG8l4xbcWqj48cLAOQ3k3YR5JOe0qfn5L5ZfldfUxk3EPt/bDZrNLnRyfAKtTFNRsfs
 CHxIP0pUHD6QGF00Bt1kiSy7pgTLojEEYfuz1zhfjqIuRfljPFkBS3ohqZUCU1iEVuMc
 CHyQ==
X-Gm-Message-State: ANoB5plD25hFq9m5HqbrN3AsDGEFJ72U4m2rs8opt8J/IlUewGbS+h3Q
 xx6YA/Q0+RcJdcXo9nYpPFNHNQ==
X-Google-Smtp-Source: AA0mqf5pZ8/0JzVg2RjX9zPCaZYkM3QE2Blevv5hbduTbNVBbtdIk/GKu66OgKj/i9GCQiIgHRKFlQ==
X-Received: by 2002:a05:600c:538b:b0:3cf:8d51:fae1 with SMTP id
 hg11-20020a05600c538b00b003cf8d51fae1mr4825907wmb.0.1670585625010; 
 Fri, 09 Dec 2022 03:33:45 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 v24-20020a05600c215800b003cf6a55d8e8sm1575290wml.7.2022.12.09.03.33.43
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 09 Dec 2022 03:33:44 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-trivial@nongnu.org,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eric Blake <eblake@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: [PATCH v2] scripts/archive-source: Use GNU tar on Darwin
Date: Fri,  9 Dec 2022 12:33:42 +0100
Message-Id: <20221209113342.61053-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Fri, 09 Dec 2022 11:34:03 -0000

When using the archive-source.sh script on Darwin we get:

  tar: Option --concatenate is not supported
  Usage:
    List:    tar -tf <archive-filename>
    Extract: tar -xf <archive-filename>
    Create:  tar -cf <archive-filename> [filenames...]
    Help:    tar --help

'tar' default to the BSD implementation:

  $ tar --version
  bsdtar 3.5.3 - libarchive 3.5.3 zlib/1.2.11 liblzma/5.0.5 bz2lib/1.0.8

Try to use the GNU implementation if it is available (from homebrew).

Suggested-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
Supersedes: <20221208162051.29509-1-philmd@linaro.org>
---
 scripts/archive-source.sh | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/archive-source.sh b/scripts/archive-source.sh
index 23e042dacd..e3d0c23fe5 100755
--- a/scripts/archive-source.sh
+++ b/scripts/archive-source.sh
@@ -18,6 +18,7 @@ if test $# -lt 1; then
     error "Usage: $0 <output tarball>"
 fi
 
+test $(uname -s) = "Darwin" && tar=gtar || tar=tar
 tar_file=$(realpath "$1")
 sub_tdir=$(mktemp -d "${tar_file%.tar}.sub.XXXXXXXX")
 sub_file="${sub_tdir}/submodule.tar"
@@ -67,7 +68,7 @@ for sm in $submodules; do
     esac
     (cd $sm; git archive --format tar --prefix "$sm/" $(tree_ish)) > "$sub_file"
     test $? -ne 0 && error "failed to archive submodule $sm ($smhash)"
-    tar --concatenate --file "$tar_file" "$sub_file"
+    $tar --concatenate --file "$tar_file" "$sub_file"
     test $? -ne 0 && error "failed append submodule $sm to $tar_file"
 done
 exit 0
-- 
2.38.1


