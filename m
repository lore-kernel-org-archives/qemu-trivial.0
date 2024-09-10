Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1snz3A-0007j9-F3
	for mharc-qemu-trivial@gnu.org; Tue, 10 Sep 2024 07:28:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1snz38-0007gH-W5
 for qemu-trivial@nongnu.org; Tue, 10 Sep 2024 07:28:47 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1snz37-0003PE-9f
 for qemu-trivial@nongnu.org; Tue, 10 Sep 2024 07:28:46 -0400
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a8d2b24b7a8so517830266b.1
 for <qemu-trivial@nongnu.org>; Tue, 10 Sep 2024 04:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725967723; x=1726572523; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FOStTVlTR7gBcQgAt0bLPJDUQd/JCSgZdNVPc04Dy2A=;
 b=mp0DcR6+zDnA9ffYem07iDHwfNISxMsV60tMQWnQkR077Ph4xYDkY69wa+cGFvCZTY
 Y78wjnlTlVOO7/LgsGORTS3hlLCi1lt5rSNyIaBtqzSkdJQPpxsdO5uBE97+7+0vSoEJ
 WCIn7v78ahDCgyKryNrv1weEmEFuz+rNape54RN/Vr1IOmH7RAJTSvLt6rTC5NY8qTnH
 SD3zYD24ONoNlj1dHBmIecMkfk+97K0rQOBauToJftPkKLdXnRZ20CWTeq6/N8L1Tay1
 cUZwQ08lKauQwAhr+9mi/2FnBjsMdjSklgpARVG1OOVjhtfqwoMZv7dw/OMsKtJWMYyx
 wBpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725967723; x=1726572523;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FOStTVlTR7gBcQgAt0bLPJDUQd/JCSgZdNVPc04Dy2A=;
 b=a7XZtrFcZfy7lhQsrA+1ySFw/hVa0Im2RN6pUp9sMeqQAlwf5m7YemRH2GXDYA5uS1
 27M61rojLqIpHDp4zqxIc6ad3a/LSbY2G4c7Vm8H2GLg7s4/pPx/2l6iNd8V7H0hPwf0
 051uBv/zX6D/d79QVY3ZpiMg/f5FLF7yT5Eg0NjtqfKbmIgvQyknZO8BmbUPnCzkXJvL
 lx6kiJrWTZdhjTKR94RTe/nAhDAZQdsIUAGny27LgLtwcUxAcEJThuVRYcqzJzOGO/PD
 8J3zGt7uIsUKozPqnqZ7JO1nKEkwI53R/KFo+qaLf9kwYn7nndFZY824ytamQULA5y/R
 SZzw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWqGoKZLnH/Dg82nYHJnXCTaPSWUX5FsXcRzQJYT860qryFPMiUXSXgSC3bhiQcFMwOocwy5Q3I7MdEl48=@nongnu.org
X-Gm-Message-State: AOJu0YyHohdGZHVRHO2CKpyh2fuEveXzdUGZ0lrX4iO+CoIaZVCgQrsc
 40+xESP22YgB8dAlh28664FLzUdAaBWxkk/wEAXUBfI8lWKVxekXZRu/dTuZzUE=
X-Google-Smtp-Source: AGHT+IFxWzB7XYj76ZmgG7/k90Mb5LGOtdXXbEMGIcGV/r7/OexQes18OKRKEZHBcTU2JviVyqVE/Q==
X-Received: by 2002:a17:907:e8e:b0:a8d:4954:c209 with SMTP id
 a640c23a62f3a-a8ffae0018emr47262866b.22.1725967723340; 
 Tue, 10 Sep 2024 04:28:43 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.217.32])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25833c90sm468921566b.25.2024.09.10.04.28.41
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 10 Sep 2024 04:28:42 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Brian Cain <bcain@quicinc.com>, qemu-trivial@nongnu.org,
 Anton Johansson <anjo@rev.ng>, Alessandro Di Federico <ale@rev.ng>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 1/2] target/hexagon: Rename macros.inc -> macros.h.inc
Date: Tue, 10 Sep 2024 13:28:32 +0200
Message-ID: <20240910112833.27594-2-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240910112833.27594-1-philmd@linaro.org>
References: <20240910112833.27594-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x636.google.com
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
X-List-Received-Date: Tue, 10 Sep 2024 11:28:47 -0000

Since commits 139c1837db ("meson: rename included C source files
to .c.inc") and 0979ed017f ("meson: rename .inc.h files to .h.inc"),
EMU standard procedure for included header files is to use *.h.inc.

Besides, since commit 6a0057aa22 ("docs/devel: make a statement
about includes") this is documented in the Coding Style:

  If you do use template header files they should be named with
  the ``.c.inc`` or ``.h.inc`` suffix to make it clear they are
  being included for expansion.

Therefore rename "macros.inc" as "macros.h.inc".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/hexagon/idef-parser/README.rst                   | 4 ++--
 target/hexagon/idef-parser/{macros.inc => macros.h.inc} | 0
 target/hexagon/gen_idef_parser_funcs.py                 | 2 +-
 target/hexagon/meson.build                              | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)
 rename target/hexagon/idef-parser/{macros.inc => macros.h.inc} (100%)

diff --git a/target/hexagon/idef-parser/README.rst b/target/hexagon/idef-parser/README.rst
index d0aa34309b..7199177ee3 100644
--- a/target/hexagon/idef-parser/README.rst
+++ b/target/hexagon/idef-parser/README.rst
@@ -138,7 +138,7 @@ we obtain the pseudo code
 with macros such as ``fJUMPR`` intact.
 
 The second step is to expand macros into a form suitable for our parser.
-These macros are defined in ``idef-parser/macros.inc`` and the step is
+These macros are defined in ``idef-parser/macros.h.inc`` and the step is
 carried out by the ``prepare`` script which runs the C preprocessor on
 ``idef_parser_input.h.inc`` to produce
 ``idef_parser_input.preprocessed.h.inc``.
@@ -266,7 +266,7 @@ in plain C is defined as
     #define fABS(A) (((A) < 0) ? (-(A)) : (A))
 
 and returns the absolute value of the argument ``A``. This macro is not included
-in ``idef-parser/macros.inc`` and as such is not expanded and kept as a "call"
+in ``idef-parser/macros.h.inc`` and as such is not expanded and kept as a "call"
 ``fABS(...)``. Reason being, that ``fABS`` is easier to match and map to
 ``tcg_gen_abs_<width>``, compared to the full ternary expression above. Loads of
 macros in ``macros.h`` are kept unexpanded to aid in parsing, as seen in the
diff --git a/target/hexagon/idef-parser/macros.inc b/target/hexagon/idef-parser/macros.h.inc
similarity index 100%
rename from target/hexagon/idef-parser/macros.inc
rename to target/hexagon/idef-parser/macros.h.inc
diff --git a/target/hexagon/gen_idef_parser_funcs.py b/target/hexagon/gen_idef_parser_funcs.py
index eb494abba8..72f11c68ca 100644
--- a/target/hexagon/gen_idef_parser_funcs.py
+++ b/target/hexagon/gen_idef_parser_funcs.py
@@ -50,7 +50,7 @@ def main():
     tagimms = hex_common.get_tagimms()
 
     with open(sys.argv[-1], "w") as f:
-        f.write('#include "macros.inc"\n\n')
+        f.write('#include "macros.h.inc"\n\n')
 
         for tag in hex_common.tags:
             ## Skip the priv instructions
diff --git a/target/hexagon/meson.build b/target/hexagon/meson.build
index 9ea1f4fc59..f1723778a6 100644
--- a/target/hexagon/meson.build
+++ b/target/hexagon/meson.build
@@ -284,7 +284,7 @@ if idef_parser_enabled and 'hexagon-linux-user' in target_dirs
         'idef_parser_input.preprocessed.h.inc',
         output: 'idef_parser_input.preprocessed.h.inc',
         input: idef_parser_input_generated,
-        depend_files: [idef_parser_dir / 'macros.inc'],
+        depend_files: [idef_parser_dir / 'macros.h.inc'],
         command: [idef_parser_dir / 'prepare', '@INPUT@', '-I' + idef_parser_dir, '-o', '@OUTPUT@'],
     )
 
-- 
2.45.2


