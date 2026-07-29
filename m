Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D942C54FD4
	for <qemu-trivial@archiver.kernel.org>; Wed, 29 Jul 2026 20:46:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1wpBAP-00064s-Ve; Wed, 29 Jul 2026 16:46:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <randy.schifflin@gmail.com>)
 id 1wpBAO-00063m-5g
 for qemu-trivial@nongnu.org; Wed, 29 Jul 2026 16:46:16 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <randy.schifflin@gmail.com>)
 id 1wpBAM-0001wR-PR
 for qemu-trivial@nongnu.org; Wed, 29 Jul 2026 16:46:15 -0400
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-2d02b4c3601so9704265ad.3
 for <qemu-trivial@nongnu.org>; Wed, 29 Jul 2026 13:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1785357973; x=1785962773; darn=nongnu.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=PCbmWZ0w0nVpnefOo1teG9dHXtfZHRXQHypQ7yNGJiM=;
 b=mELwvWrWAxAn2Ix/KaypEJ8pkPDiRmNhI/VHxYXS7UATcRXFR1lVb7Tg5PNUauDk16
 nxOcchsUHEYPaIEU7w9/sfFhUWoWG3Q0xWbNbtiNXsOGHY4DWdYIKdY2jYqYHrVJXkFd
 8QRE9gHb5m4chsmf0AKnSmFM1oooUfmcBiPu8qS3QPLT6LoDk9/PGtZVzzXuuvkPPwcZ
 eH+Gw0rCJi9vxCCSnanjNeICuFMWPgBqck1Y/a/K7QOBMv7QotcWrxat6ExM3WkMTB7Y
 9yZMACeOH3D0XdDdsq+kitlYi9L271cBlAuzpQRSs0N/zWCUy+2+2MBF0oXy+oD2Jwxq
 u6BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785357973; x=1785962773;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=PCbmWZ0w0nVpnefOo1teG9dHXtfZHRXQHypQ7yNGJiM=;
 b=fvL4QJ4klCd5sLEeIq7K9+JMeZMkHmgnKjABvP00nnLe1pGBv7kSG/y33rWPDKAqA+
 Va7p1Uxn085wGnH1dzaqZEB49D9aQU/bhmzcFWm0OT4tw1aSiEF9caVAbDe3VvS52eS7
 Llt7uTf5zWW3Ivja+aFuxVfJX2owK4HK7cMi4AWRdaQF5ZeqFBSbMLumibB2TCICUaQm
 /dMtJL2tWehqYGhuFmX62MJvZ+FkwjAS9Kl0Dh083+Nc/22Sh9V//iVnxb7nesWsZuko
 8jV7yos829cuXX3mM1wD+h+H+mJvZ59L14cRggLcZwGsacJdjj9uI2ye3z/Pyz8MrxKJ
 wVFg==
X-Forwarded-Encrypted: i=1;
 AHgh+RpFPTaXZ7OqqdnHvrq8Gnrlg3MZRr6p78OqVg2rB5SYH6E2zKOOV1xb0pC6ZlXSl8H7ib3u65dBzPuD8wY=@nongnu.org
X-Gm-Message-State: AOJu0Yy9p+Cc2lW9nvyyAEqjl6Sq/1xhtCBGQoEnm8Lb+k0TpNXgmsur
 VA1XLSF9B2C6f80nEeLRiSjdt6g33g8KiRPt2xarCpQTjdmUHgxtLdAp
X-Gm-Gg: AR+sD10HQ+yS/jXw1kmhrfqPx2bUh9JQeGAz2A359yfavTFBOg8iBd4LMPKLCCwts8S
 /WDFWfYZDAOGiInwJEzNrOCnkMYWH5XccbHmkFiWiIjkKdiNCt/vjq8ve8GtUE3hqF5GPowoH92
 LEp8NjdFpiKXBcb9yOI6TnHq9xu1inouNi2yQHbDfXg677fwJlXs52MqstsiLEM/JmaBF3RIONQ
 KLeaVH25IBXg4+63hO13lkA+XUtzohhpcQBkCjuI1whaeggPI6wQ90Uy3vVQxt+y1eybigjSkJX
 dna+NyLWcd0+6TeMdeKKylBaTRng7Rz8fG2/CfmQQt4SuTuUPP9aKDVbNjgrrlYAAIVUjbQ+V84
 ZyjK/JQsQY45/Tjc6bnetOx61lKfV3ZZyUq3jeqf2HupKjJExLCmlGVA7bGkM/er0M51OfL/7HB
 6HSQTyjQ4o/X1Xqy0kkd8eEQlKIGGYDbf79hgZK0LeHVTvLH3JKo3OildhfcL25m1E8Uqrvqs=
X-Received: by 2002:a17:903:2284:b0:2ce:ceef:6632 with SMTP id
 d9443c01a7336-2d0340a096amr4069815ad.26.1785357973220; 
 Wed, 29 Jul 2026 13:46:13 -0700 (PDT)
Received: from devone.local ([2600:8801:100:1910:66a:cb3f:f6a7:d5f0])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-31504b88e12sm13032389eec.11.2026.07.29.13.46.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jul 2026 13:46:12 -0700 (PDT)
From: Randy Schifflin <randy.schifflin@gmail.com>
Date: Wed, 29 Jul 2026 13:45:06 -0700
Subject: [PATCH v2 2/2] Fixes TCG generation for sh4 `fipr` and `ftrv`
 instructions.
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-fixup-sh4-tcg-fpu-instructions-b4-v2-2-2c1c0fe04672@gmail.com>
References: <20260729-fixup-sh4-tcg-fpu-instructions-b4-v2-0-2c1c0fe04672@gmail.com>
In-Reply-To: <20260729-fixup-sh4-tcg-fpu-instructions-b4-v2-0-2c1c0fe04672@gmail.com>
To: qemu-devel@nongnu.org
Cc: Yoshinori Sato <yoshinori.sato@nifty.com>, qemu-trivial@nongnu.org, 
 Randy Schifflin <randy.schifflin@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openssh-sha256; t=1785357969; l=398;
 i=randy.schifflin@gmail.com; s=id_rsa; h=from:subject:message-id;
 bh=eX88J2x128SVDs6GH7jLMgLqSu2FOli3NICLpONnwR8=;
 b=U1NIU0lHAAAAAQAAAZcAAAAHc3NoLXJzYQAAAAMBAAEAAAGBALXHj1ozDvr3TmWcPoueK1kIy
 Q3yQ7HL5bbiu8J+P0QBzcchmw5nwN0avQmreXhYuMhz40g0dhCJPnJqNHg1FBflQPz2cgY7Utm3
 9lQrK/CQqWsjRwXMinMR7LrmtMFp9+up7MzdXoxmTLgPsKJ/dQmx0rUHx++mUSl8zl7lHO50YVD
 hsw1RHrkrXlxnUjRi+jtjgErRHvoRwSZpKc44yR62wV8chkTMnHtrn8hgL0Hh+jhHteNn4JTQB/
 wme8MghhliXR5oh9xirpeLlS9S4TBY3Vdk6ccgvncSS4uF/y2ZAAV5sNiLZ97OFkBhIQ0bXhVx9
 w1LPMkho650Iu9da5/0koNheHS2KAVC2FdPTyaxvqeFAsAB8fCprfh4lpShdcVpyChdd2KXFS53
 s9MAUQmZjG0pQvS/dqGCCDWqo7cY3J3VTMXwVtdzYkgZt5eMajL7z8VljXQ08ZgAStdizC/rHNg
 wy+fIL+6kgxvL/NhJwoiAWhC4D+xQY7SXjJGTvwAAAAZwYXRhdHQAAAAAAAAABnNoYTUxMgAAAZ
 QAAAAMcnNhLXNoYTItNTEyAAABgC8bvn3/ATj2Gq3xAyi8Pb5EjhKEmh69JDhIg/w9wBNOx+DIa
 DG5yhFEtl8JX5q2u96PhKy39IvteyogtiB8wHEWLEkzywIGUUYNYh9RAzrxRnvCBSOtEe+/zEL/
 ngNJi30rFjx1nQbjDNDLAmlNbM6G6RYPYZ9hZfA5KuF3XZBu8Km3r1QQR7deLsLx+KLf+zuAgU0
 bV9gGNpCBSWVGkTE6+IFxMuIoloHGtBHDM17HfLUCuvc1tEjKDGQdw/eUHv0Nh1fB4MeIELdknJ
 M/3v98M7SiYu4Q6bmP8X+0n0fXQMIjrCqWdXso4UfJT7HpZiaHjgSdcBlS1talQPtaW9py8l90q
 NiHe4QGdT9lw0fYlC+TgR2GTPxIszJSMCQQmLmHt6qaBvcaKOvYLPrti5r0yi6V+V1GHNSKFy/J
 Dt8RVEc/VVPC9umXvYUF74rGlNQPWpmKiyar4F/suxlqVNsINrcxba8gaxjj9BbHmff9FDhefbO
 /8DnLPZ3dH/u6lQ==
X-Developer-Key: i=randy.schifflin@gmail.com; a=openssh;
 fpr=SHA256:7gww1tlDoVPb7symWGdTNhRWcHyTORA23OcjS8eyd8Y
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=randy.schifflin@gmail.com; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Errors-To: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org
Sender: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org

Updates the current logic for these instructions to check the
FPSCR register appropriately (according to the sh4 cpu manual, `fipr`
and `ftrv` are only defined when the FPSCR register PR flag is 0).
Also fixes the mth/nth-vector operands by multiplying by 4 to convert
to the correct floating point register offset.

Signed-off-by: Randy Schifflin <randy.schifflin@gmail.com>

-- 
2.43.0


