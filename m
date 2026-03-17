Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D911FD8748
	for <qemu-trivial@archiver.kernel.org>; Tue, 17 Mar 2026 12:02:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1w2T8L-0008JU-Uo; Tue, 17 Mar 2026 08:02:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w2T7x-0008CC-DF
 for qemu-trivial@nongnu.org; Tue, 17 Mar 2026 08:02:27 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w2T7r-0001Pw-Ra
 for qemu-trivial@nongnu.org; Tue, 17 Mar 2026 08:02:24 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4853aec185aso46560505e9.1
 for <qemu-trivial@nongnu.org>; Tue, 17 Mar 2026 05:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1773748937; x=1774353737; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=eEMVLLP1U//JG1yL/MKQCMAGHc16tRv91hnW1ImxWr0=;
 b=Y417AQF5ASIKFM6g/29AqwazuZC0gnar+Jg+Wn+7qkphadUxpfNmdKlRNUY82phjVW
 NPHpMtUNIdjR1D3pEDxxHq//ASTTWtqd0BnOPrQGBZhXozGp8MxPmwL+wOdbuC2QmKcT
 RkCaKCo242SRJ/6M3cKzJaloKvjilYEtIGqThy/C/AFlpe0F+NMl2uUDe1leLWHSd7PG
 mZU8xPXKoYi9oYm/sPK1+3szeu7tbCUYlH81EMwdupnu8tKPB2HE/L5EyugvBFTneVU1
 gtmL613RkkHzIndvoDuCvvwtKXbm+5eOkCZINe9jhuBTSu8Q/BZafCU9oJZ3XyHh6Gid
 G7jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773748937; x=1774353737;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eEMVLLP1U//JG1yL/MKQCMAGHc16tRv91hnW1ImxWr0=;
 b=FnG29RZeedOQ8UAfmmC7nqKhkVU0DYioaXHcDhnIHCskmzprWORsLJbXZLrhXMRmnN
 hRVRrGiwH7hQUMpOtrFW2atgvSKlxVJEsnOsIYFawSSrXyndsxeCIRCS1B8dCmKn2cJc
 BJSSPs0IJVoeqs6bEdZvPZtkl7DDEe2iU0KQjvcUSpwHRLuvVcgo7bfKkn0p0r0SnxN4
 qQwbLVTnMx6mEyC61KYB6YpmeCyAJcpPiR0LUVdVpansEX5NaKk+DtetZJeowZ3WoYdn
 3DWhz1f64iRYTs1XYgWqzama1pV9tmK+oFpAQalqOONJg9v1MdUZ0xRk0TEF6vWnZnNO
 CMwQ==
X-Gm-Message-State: AOJu0YwYMet0sfLORD2/DPdpv3s/KuxvQX1QlqDDIDn6rNfdPLg0wE9/
 ymxbifoiJw8eo7s9AhxA+lqXViCiZj2A5gU87tGaRx/VpHmwgYhnfLBah8AsltwXLho=
X-Gm-Gg: ATEYQzya4o6tLObxzjxOrgBpBIRPlRGaafUxsExlwtOwumeFAmQeeMrad28n0MnhkR4
 F4xyWKExB0vMhyzMbOO8RB4GUortrVhIhekMUzzapZVLlXE8kGRTtWeS/jPQ0FwWLl4DSnONZDD
 eN2AGLi/U3s+Ik3dZs9OUmXLPhDKXRg9WGXIz2hSK5uMOX2DwVNbStFMPg1QRj8Sdom7VGan2dE
 hoaEQB+4JV4glRt0rVLz3V1kM3MJVrsL/USM60UQ6AsEewmQqBMszAqwm4sMoUPIPhRK27xwpBT
 k9vdf/z5yqGWGm2RDZ5b+Jr+LKdMKieLw8O5RceEvTDdkMGF0cPTrGjr9xlDND4epkzVM5+BQ9y
 Xjgo5+E+zFw601QJtGDcl5l4dMp4sDEGhSNnW7lSuwvYr1D+FjLwZ8i9UEeI0ksmVzXyE/N3jRD
 LyhnhnCWgnDeJgDwrEDmWdiEcQT62159JaJrRrtVJsvHT+aSvWlzBLm/5EcLDPB6Pktm+qMybou
 FNPKbN8EFjrtbHTSJfcDiAyf0mjkUg=
X-Received: by 2002:a05:600c:4592:b0:485:3dfc:57a with SMTP id
 5b1f17b1804b1-4855671044fmr284103325e9.32.1773748936871; 
 Tue, 17 Mar 2026 05:02:16 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4856eae3037sm63596795e9.11.2026.03.17.05.02.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Mar 2026 05:02:16 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH] configure: Remove unused variable default_cflags
Date: Tue, 17 Mar 2026 12:02:15 +0000
Message-ID: <20260317120215.2075164-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org
Sender: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org

configure has a variable default_cflags, which was originally added
in commit bafe78ad3bc4c ("contrib/plugins: use an independent
makefile") as part of it setting up the build environment for
contrib/plugins, which at the time used make.  However, we now build
the plugins with meson, and in commit 55c84a72aba4 ("contrib/plugins:
remove Makefile for contrib/plugins") we dropped the logic from
configure that does that makefile setup, leaving default_cflags
as an unused variable.

shellcheck helpfully reports this:
      default_cflags='-O0 -g'
      ^------------^ SC2034 (warning): default_cflags appears unused. Verify use (or export if used externally).

Remove the unused variable.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 configure | 2 --
 1 file changed, 2 deletions(-)

diff --git a/configure b/configure
index cd1dadd8bb..42c45fe47a 100755
--- a/configure
+++ b/configure
@@ -248,7 +248,6 @@ for opt do
   esac
 done
 
-default_cflags='-O2 -g'
 git_submodules_action="update"
 docs="auto"
 EXESUF=""
@@ -707,7 +706,6 @@ for opt do
       meson_option_parse --enable-debug-graph-lock ""
       meson_option_parse --enable-debug-mutex ""
       meson_option_add -Doptimization=0
-      default_cflags='-O0 -g'
   ;;
   --disable-tcg) tcg="disabled"
   ;;
-- 
2.43.0


