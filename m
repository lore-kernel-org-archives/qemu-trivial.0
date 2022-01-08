Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n66KW-0006Vd-PS
	for mharc-qemu-trivial@gnu.org; Sat, 08 Jan 2022 02:40:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n66Iv-0005Va-7B
 for qemu-trivial@nongnu.org; Sat, 08 Jan 2022 02:38:21 -0500
Received: from [2607:f8b0:4864:20::d31] (port=38518
 helo=mail-io1-xd31.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n66It-0003X0-VV
 for qemu-trivial@nongnu.org; Sat, 08 Jan 2022 02:38:20 -0500
Received: by mail-io1-xd31.google.com with SMTP id u8so10107535iol.5
 for <qemu-trivial@nongnu.org>; Fri, 07 Jan 2022 23:38:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GioDY4nXC7yuWDiwWaq62PITdulW8xkFyjlazyzw9XU=;
 b=rru1w7eBKWXhreoaZEqlbA2dTXFPSQu7FWyAFtG/VLg24WKVmc99AnOf9V5ECAzR62
 Xi6DUVqAGddIQMW5ccms5NP45ZfF3UbLTtfHHn8vKfjGwqCheJmgb7SR+po7PbRbww2J
 gIDUbxfqhuHv1/fy7AoXYSy/q2fUp9vD7XD5aM3/UknDISpTqO7xAkUO9pSu+9h2idvh
 4NBIFOwhHt+W4mU/oW8of3hD+xUXWgDv1FCYX3xgXe1k1GGNm5R6Y0YRGWeoXoRw5Osq
 RATbSx4NmmuoLjIklY4gdh1Hdn9h780oMn3GLCiur7nNhd5/7Sratpyrg0iYLEspZs3s
 7UqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GioDY4nXC7yuWDiwWaq62PITdulW8xkFyjlazyzw9XU=;
 b=CoCAcRwaOUrzaJHAkFCu0t9SFiJcJUnC2U2u50gb2VimOiCaZaCOlDKYJd/8qqBlQo
 +byp3LzKRT/V4NfDG9TT46Eu12X1pyAO5Fg0q4R4sz4tHwKruv5OsgHRDBM63ntTMXf6
 waeESS2SuGndKitnI2VPpVBCGkyJt6lJUJ8OX58VGwcoLXQ7WLy+aB+yrMraU1CITrcr
 FW2SHImPwHFek+AfEyJcAvrCCvmbvfnP9R9dYRgW/GqFVe4n+RNtYVzrmlP3DqwND8vF
 uBsMeg9oWE1K3PICpa4ldcDROO4P6algt032TQYIUBr+ifXQTCa1tTHb3ck7zTO5q3a9
 pDJg==
X-Gm-Message-State: AOAM530tjOoNcMdxO4BOIixrurcLv/yrN5sr1JJnGrBFq4NrnQbp2rxQ
 PHkBtgVBEYHbt3qZ0/z32ZYtpA==
X-Google-Smtp-Source: ABdhPJxwXYe89r2T56E7Y97q3T/NDImQxG2h2OBNPyBAfjyxwzf/8hRtLzs6QprWhiyN4eUnxJDsSg==
X-Received: by 2002:a02:ca02:: with SMTP id i2mr32443596jak.42.1641627498884; 
 Fri, 07 Jan 2022 23:38:18 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id w19sm613022iov.12.2022.01.07.23.38.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 23:38:18 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-trivial@nongnu.org, kevans@freebsd.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Warner Losh <imp@bsdimp.com>,
 Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
 Kyle Evans <kevans@FreeBSD.org>
Subject: [PULL 37/37] bsd-user: add arm target build
Date: Sat,  8 Jan 2022 00:37:37 -0700
Message-Id: <20220108073737.5959-38-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220108073737.5959-1-imp@bsdimp.com>
References: <20220108073737.5959-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d31
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d31;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd31.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Sat, 08 Jan 2022 07:38:22 -0000

CC: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Acked-by: Kyle Evans <kevans@FreeBSD.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 configs/targets/arm-bsd-user.mak | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 configs/targets/arm-bsd-user.mak

diff --git a/configs/targets/arm-bsd-user.mak b/configs/targets/arm-bsd-user.mak
new file mode 100644
index 00000000000..cb143e6426a
--- /dev/null
+++ b/configs/targets/arm-bsd-user.mak
@@ -0,0 +1,2 @@
+TARGET_ARCH=arm
+TARGET_XML_FILES= gdb-xml/arm-core.xml gdb-xml/arm-vfp.xml gdb-xml/arm-vfp3.xml gdb-xml/arm-vfp-sysregs.xml gdb-xml/arm-neon.xml gdb-xml/arm-m-profile.xml gdb-xml/arm-m-profile-mve.xml
-- 
2.33.1


