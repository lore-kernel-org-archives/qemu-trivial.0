Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p3Jdv-0008FK-Ac
	for mharc-qemu-trivial@gnu.org; Thu, 08 Dec 2022 11:21:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3Jdq-0008En-M5
 for qemu-trivial@nongnu.org; Thu, 08 Dec 2022 11:20:58 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3Jdo-0005PE-V7
 for qemu-trivial@nongnu.org; Thu, 08 Dec 2022 11:20:58 -0500
Received: by mail-wr1-x42b.google.com with SMTP id d1so2191039wrs.12
 for <qemu-trivial@nongnu.org>; Thu, 08 Dec 2022 08:20:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ORV8lB1xtzAjtK0MGnq2okA7cpON1mRvSayS0/wGNEE=;
 b=HlO9UStzLMGfTv3rmS+tRDICU0t5dkCEU+fbqoDZRdE/3VVAUcakooXA0lJjXKwach
 PRl7oXD8oGLS+v8XaBduMnJP1x6+nhWvDHlkrc64DVu9Oe2uamXfzA9py/KAoWPBhJTu
 yWfZ+3c7J4l2i3/sq9DWh58meoXhUGTAYYOBFVRB+WTIkKw9Qe5PouuNZpIsd5AbNIgR
 PKmVnpXYcNisYKEw9kjgAEI4ifYE+jPOjjHcdN3TsqOwj+Dp3fv0GcaO8gei+Ra/FqkZ
 2Lob3FWFbWlp62JJpnGzeTdU5r4afxhZg4dddFAFyyw3+AeLt6sY89jKOdpqoDL6U9DK
 79Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ORV8lB1xtzAjtK0MGnq2okA7cpON1mRvSayS0/wGNEE=;
 b=vCp3IoGC/VbYSASEWUnfvLjv5TG8vGOEwlHlhK8Xvwvm3OHr3AjFga0MBkoeNUrY9l
 7N3lfzBmw3zM4Z1FNrwMXvtVzldV5PpJudvrGQa5kaHglZU4bhwHyIINBvDn7Gvus8Pz
 iocY7k9+eFXwn99ynK1o/8ICCKPRHbETSVlKLlVX0I3OjWSXJukTx/+o+Xq/sKwutop5
 p9j9xflf07RW62Yt0nwgolJNArUhoXEN9byVDx19FOfcC5+CpfSupZhuo7zp8XW6N3qv
 oPvHq2RSPFECTeRsEzUpV0yoe4Vwe/h4jaGbKKioLJWbh11ZoK0fAX6D5oLOzigTfwDA
 wPnQ==
X-Gm-Message-State: ANoB5pk/l2mc6MQZ/JfS47kUSEqq4pin0y18jUL8Gv/YETji+EZ5EI7N
 d8Z/rBtm2x/r/aoL0MthfFBodA==
X-Google-Smtp-Source: AA0mqf7Z9/IMaXW/Gl0pjNMoJOb0aCLV3RRMvS+38WJycGN+yGeyEd0RhhrAAJmid3xvPEsPZvs1CA==
X-Received: by 2002:a5d:4746:0:b0:242:931:6f63 with SMTP id
 o6-20020a5d4746000000b0024209316f63mr1735859wrs.64.1670516455235; 
 Thu, 08 Dec 2022 08:20:55 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 w1-20020a5d5441000000b002422b462975sm21608850wrv.34.2022.12.08.08.20.53
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 08 Dec 2022 08:20:54 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-trivial@nongnu.org,
 Thomas Huth <thuth@redhat.com>, Eric Blake <eblake@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH] scripts/archive-source: Use more portable argument with tar
 command
Date: Thu,  8 Dec 2022 17:20:51 +0100
Message-Id: <20221208162051.29509-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
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
X-List-Received-Date: Thu, 08 Dec 2022 16:21:00 -0000

When using the archive-source.sh script on Darwin we get:

  tar: Option --concatenate is not supported
  Usage:
    List:    tar -tf <archive-filename>
    Extract: tar -xf <archive-filename>
    Create:  tar -cf <archive-filename> [filenames...]
    Help:    tar --help

Replace the long argument added by commit 8fc76176f6 ("scripts: use
git-archive in archive-source") by their short form to keep this
script functional.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 scripts/archive-source.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/archive-source.sh b/scripts/archive-source.sh
index 23e042dacd..6a710a212e 100755
--- a/scripts/archive-source.sh
+++ b/scripts/archive-source.sh
@@ -67,7 +67,7 @@ for sm in $submodules; do
     esac
     (cd $sm; git archive --format tar --prefix "$sm/" $(tree_ish)) > "$sub_file"
     test $? -ne 0 && error "failed to archive submodule $sm ($smhash)"
-    tar --concatenate --file "$tar_file" "$sub_file"
+    tar -c -f "$tar_file" "$sub_file"
     test $? -ne 0 && error "failed append submodule $sm to $tar_file"
 done
 exit 0
-- 
2.38.1


