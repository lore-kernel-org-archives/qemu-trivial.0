Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91D7BCAC5B0
	for <qemu-trivial@archiver.kernel.org>; Sat,  4 Oct 2025 19:49:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1v58FQ-0007XG-He; Sat, 04 Oct 2025 15:48:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xpahos@gmail.com>) id 1v56Mm-0003rP-Os
 for qemu-trivial@nongnu.org; Sat, 04 Oct 2025 13:48:21 -0400
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xpahos@gmail.com>) id 1v56Mj-0007UC-3V
 for qemu-trivial@nongnu.org; Sat, 04 Oct 2025 13:48:20 -0400
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-57f1b88354eso3339782e87.1
 for <qemu-trivial@nongnu.org>; Sat, 04 Oct 2025 10:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759600091; x=1760204891; darn=nongnu.org;
 h=to:cc:date:message-id:subject:mime-version
 :content-transfer-encoding:from:from:to:cc:subject:date:message-id
 :reply-to; bh=vuzm8FeLO84xvcLhr8EGDm+15bWYBkiXGDkQ3fYG9w8=;
 b=Ybpfp4seDpVzIUtnBPcLSTsPfnd1UO3aKNaAd8MbSiYAJ94KWUc4qHIBUsD/E9GqmR
 ZrN0wlSUMzU3W5btZFVyx40ssPYurz/cUsY7rfA9PNzilXV99VcI+lDxj9VmND6BWU+/
 IS/1FcKJC3SqshYRuLJN1wUypHltPeX5IFIx11AOOLq78I9GvIAK/m4ym0p6/ZhczNeI
 6hm7FnCkpdHhATNd78sSsUH1ERu7JY22raVPCcXdJXG3FJEn0hjyRobLnt/hIU9YULNN
 h54mmgAYiEloNczs/64ORb5GmxrDqc/ulvpc2tXERADfT9pSjfYbTEHMn48MN3d4utR4
 Nj0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759600091; x=1760204891;
 h=to:cc:date:message-id:subject:mime-version
 :content-transfer-encoding:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vuzm8FeLO84xvcLhr8EGDm+15bWYBkiXGDkQ3fYG9w8=;
 b=iua3RMlp8Sc9xX3qoZW0Zl6mviUOIFz4kBLPZknmwyAbQ/H4cOncQwm5Mrt9LgEC4I
 cNryfBGMvsbN1eVowVVlKlE7gn8n0IMTy3lHcGHlnYBPk1USBHzoMlaSO7j9BQzaKxH5
 6MCpUTkkQeaWK+g8+GfMe7AelrnEuB5Ed7cb6nO/O1Q773nSTHm/D142tbdWhuJhgkWd
 5FGs5YMlJLhA/fDnLDMzZqqkw8cIGR9xU0+FpC8i9hCPcST1UnJ3ShAuA19EfwDjfAZz
 S9pF/laNKlxnFGQoNOvD50PE9pzayhxR/IKabdlV25L/HdyxpFb3J9rSHbWvWbwa/PIN
 mpLQ==
X-Gm-Message-State: AOJu0YzEf2b6cT1PSty/9/oDaz9LJFmBBHbRqrMdQDGzdAXRo1Uei4Ol
 JhDrTq/0POKZ14+AZHqAbf07uD4lCSviKB7owyCMOxdKldFp8ggrBcwX
X-Gm-Gg: ASbGnctDRB9fNnLKhbtUq9Hw9vUVDNxXq6WxZQv3mAUpsBhifKs8JfcGhKQsyS7mySW
 fpbwkuRcMnUWEibRg7oi+HTLmKB3oSXLfqjeqwYN6YgX11eKURGVRyLE8qtFfQuYV2ZDiv/fqZA
 hBYyUrdsHDaGca47jbpLIRDlzU+TcnN/7EQneNPltxV35saiwqjm4BYEAlrohaAWfRcpFB9w8Lh
 BjNQC5uskXxmGA+5zJEIG9KrexCOSkyWxwcJnAmSx38QF5UkH+zUpOyaacAERfeXfCwTRrkm9uo
 u0aM1dIZPC5a3Zr3MeJB0DoxwXDZfJNpygA9CNK1NJyculynE5OaH/BTc6PGAnyiC6KpWAphiEK
 d5LqYHSbdD8XZszAUVAp1ssVUfevEDSbHaOxfm1bl/iPf5XqS
X-Google-Smtp-Source: AGHT+IHiOkNR+s7Ffelj60WmPq4+KOPES10Pfvf3mEbBnOm2mk2kCFxZmOLzT+IKidFAKkJW/vif4Q==
X-Received: by 2002:a05:6512:23a9:b0:58b:6f:719e with SMTP id
 2adb3069b0e04-58cba6c1968mr2335972e87.17.1759600090581; 
 Sat, 04 Oct 2025 10:48:10 -0700 (PDT)
Received: from smtpclient.apple ([2a02:6bf:8080:446::1:2b])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-58b0118d258sm3042216e87.66.2025.10.04.10.48.08
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 04 Oct 2025 10:48:10 -0700 (PDT)
From: Alexander Gryanko <xpahos@gmail.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51.11.2\))
Subject: [PATCH] system/runstate.c: Add a newline character to correctly log
 guest errors
Message-Id: <32D0DF37-A1B3-4532-B350-082E19E4EABB@gmail.com>
Date: Sat, 4 Oct 2025 20:47:56 +0300
Cc: qemu-trivial@nongnu.org,
 =?utf-8?B?0JDQu9C10LrRgdCw0L3QtNGAINCT0YDRj9C90LrQvg==?= <xpahos@gmail.com>
To: qemu-devel@nongnu.org
X-Mailer: Apple Mail (2.3776.700.51.11.2)
Received-SPF: pass client-ip=2a00:1450:4864:20::12c;
 envelope-from=xpahos@gmail.com; helo=mail-lf1-x12c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 04 Oct 2025 15:48:50 -0400
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

The pvpanic handler calls the qemu_system_guest_panicked
function with a NULL parameter, which results in the absence
of a newline character in the guest error log.
The qemu_system_guest_crashloaded function has no additional
logic, but also omits the newline character.
The qemu_system_guest_pvshutdown has no reporting in the
guest error log.

Signed-off-by: Alexander Gryanko <xpahos@gmail.com>
---
system/runstate.c | 5 ++++-
1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/system/runstate.c b/system/runstate.c
index 6178b0091a..8b4bf75cd6 100644
--- a/system/runstate.c
+++ b/system/runstate.c
@@ -674,18 +674,21 @@ void =
qemu_system_guest_panicked(GuestPanicInformation *info)
        }

        qapi_free_GuestPanicInformation(info);
+    } else {
+        qemu_log_mask(LOG_GUEST_ERROR, "\n");
    }
}

void qemu_system_guest_crashloaded(GuestPanicInformation *info)
{
-    qemu_log_mask(LOG_GUEST_ERROR, "Guest crash loaded");
+    qemu_log_mask(LOG_GUEST_ERROR, "Guest crash loaded\n");
    qapi_event_send_guest_crashloaded(GUEST_PANIC_ACTION_RUN, info);
    qapi_free_GuestPanicInformation(info);
}

void qemu_system_guest_pvshutdown(void)
{
+    qemu_log_mask(LOG_GUEST_ERROR, "Guest shutdown requested\n");
    qapi_event_send_guest_pvshutdown();
    qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
}

---
base-commit: 81e3121bef89bcd3ccb261899e5a36246199065d
change-id: 20251004-add-newline-guest-error-log-62d68638b28c

Best regards,
--=20
Alexander Gryanko <xpahos@gmail.com>


