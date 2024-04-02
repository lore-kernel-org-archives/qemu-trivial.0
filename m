Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rrcqJ-0000Qp-MF
	for mharc-qemu-trivial@gnu.org; Tue, 02 Apr 2024 08:02:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rrcpN-0007lq-VP
 for qemu-trivial@nongnu.org; Tue, 02 Apr 2024 08:01:22 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rrcoR-0003Np-L1
 for qemu-trivial@nongnu.org; Tue, 02 Apr 2024 08:01:21 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4161c24baadso3311755e9.0
 for <qemu-trivial@nongnu.org>; Tue, 02 Apr 2024 05:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712059215; x=1712664015; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XLtSFJIR+pdlVJvy9cvj3GhXFmD3XkdoFwgLyOSTVnw=;
 b=AZAvNpTe2jtmJ2Ayuu52EzK37dnF2svpTnT6M4s6/eDtaoWfTQNKp218Pr2lkF/7YG
 KcVSi35JSMBsMGYIkoD92LK+GpViqjbXee4J0hpJAUSiTe0oBg+RyupTwAlxabnSHJe6
 hAPpPx0sOq3o1czziVOFkigGT9xWjfR6gbS73KKiNwcXs9pQfOldeug4a+MXKsJdqwb8
 YJMvh0wwC1+vkFLrf6jZcnAYf17Cx36lCESskpET7Cvd8I8XC5gInWLmO/BH3CzgwiJX
 +IyWmmYnGUiKW52cehUfPVNcyYnsodVpO2eYXhxAGNDwSVVLcy2Dl4OmYP6yrnTV/VX8
 7Edg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712059215; x=1712664015;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XLtSFJIR+pdlVJvy9cvj3GhXFmD3XkdoFwgLyOSTVnw=;
 b=IhDCWEKYwaLUSTFK/lnpXZjFvX8bVCEHJ4u0rmWxdYfVmtbDQZSaBHKp/Sg2ZBNVCU
 JOzeZK15RPs/l/EnvGnJa/kPk/gGJ5Pg7y3ae4YI2VrL7j5HeqU/0fUxstnPJVYOHBFT
 Rdmggk2TlOEVtfRAOAaCHOdnDijG8vJ33FIT0E9FoVRYK6hY8LtL66tlkphiBlQ9jHGG
 oJIpGL8W+iL3A13c8HQAT0JgHeTwvXWKzt5zVR80Q1SjSKRNaZFC0cYORHLqc+EIxD9L
 Vms6kjGAcCS9XTRL/aUXQnFHgr3A9NogjJQm02J4OrRaTdy5cn9rQYwD4U3+QO8bAe8w
 OPBQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWSoRpNfUzOdLbaNVTSPDZIVxFbkKpSg/A8LCXAhW5c2WXm+IEe8kP0tT033bhea9QVhiXISsRgaE7to1WIgfx1sYz9LO/t/Q==
X-Gm-Message-State: AOJu0YwXKf5Mm0X9y9sc3hgktikHEGYSI2gQj8HQ+jNtyOcY7AkBHN9B
 Ft95OSM6CEE8KDQyChEu1tE85OsDjm5i3A+/Yy262qvULLx+++6DdkSQ71Bidww=
X-Google-Smtp-Source: AGHT+IGdp3cLjKZrqYZS5LCwWv3bSsCGzZNkzl7KHVeZCKOh3YCpLvW0XOQ7+n6s2QyD5hondVse1A==
X-Received: by 2002:a05:600c:a47:b0:414:cbd:1ee2 with SMTP id
 c7-20020a05600c0a4700b004140cbd1ee2mr9128870wmq.35.1712059215639; 
 Tue, 02 Apr 2024 05:00:15 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.202.91])
 by smtp.gmail.com with ESMTPSA id
 w7-20020a05600c474700b004156ca1df95sm3946167wmo.18.2024.04.02.05.00.14
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 02 Apr 2024 05:00:15 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, qemu-trivial@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>, Peter Maydell <peter.maydell@linaro.org>,
 Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 2/2] scripts/checkpatch: Do not use mailmap
Date: Tue,  2 Apr 2024 13:59:58 +0200
Message-ID: <20240402115958.67615-3-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240402115958.67615-1-philmd@linaro.org>
References: <20240402115958.67615-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
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
X-List-Received-Date: Tue, 02 Apr 2024 12:01:22 -0000

The .mailmap file fixes mistake we already did.
Do not use it when running checkpatch.pl, otherwise
we might commit the very same mistakes.

Reported-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 scripts/checkpatch.pl | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 12e9028b10..76a0b79266 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -435,8 +435,8 @@ if ($chk_branch) {
 	my @patches;
 	my %git_commits = ();
 	my $HASH;
-	open($HASH, "-|", "git", "log", "--reverse", "--no-merges", "--format=%H %s", $ARGV[0]) ||
-		die "$P: git log --reverse --no-merges --format='%H %s' $ARGV[0] failed - $!\n";
+	open($HASH, "-|", "git", "log", "--reverse", "--no-merges", "--no-mailmap", "--format=%H %s", $ARGV[0]) ||
+		die "$P: git log --reverse --no-merges --no-mailmap --format='%H %s' $ARGV[0] failed - $!\n";
 
 	for my $line (<$HASH>) {
 		$line =~ /^([0-9a-fA-F]{40,40}) (.*)$/;
@@ -460,7 +460,7 @@ if ($chk_branch) {
                      "-c", "diff.renamelimit=0",
                      "-c", "diff.renames=True",
                      "-c", "diff.algorithm=histogram",
-                     "show",
+                     "show", "--no-mailmap",
                      "--patch-with-stat", $hash) ||
 			die "$P: git show $hash - $!\n";
 		while (<$FILE>) {
-- 
2.41.0


