Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CEB3EA8541
	for <qemu-trivial@archiver.kernel.org>; Sun,  8 Mar 2026 20:37:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1vzKqc-0007Hw-7j; Sun, 08 Mar 2026 16:35:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vzKqa-0007Fp-OJ
 for qemu-trivial@nongnu.org; Sun, 08 Mar 2026 16:35:32 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vzKqZ-00045S-9n
 for qemu-trivial@nongnu.org; Sun, 08 Mar 2026 16:35:32 -0400
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-439b9b1900bso5417328f8f.1
 for <qemu-trivial@nongnu.org>; Sun, 08 Mar 2026 13:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773002130; x=1773606930; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rGa+Qk9w7jO0yb09YCUU3MEUEX2jrREiC7pzktGBq9g=;
 b=WpeSB+xPA7eTCjTbiNfNBL5Nl2d3gfJWuT1Osj8ZBhl4D57QmnWV4uGcLnL2CGDzJh
 JB6KDJ1vdFsbQna+x/34y2actYmKAkb5pArxuPjFWOOzcRgVpX4JIFLTKbiG/dy4GNiL
 ZAdmZEOgau6AYTORViBYtxFNsPKT8SrFBnnRbZErokzyuArelOoQmCH8bEsRrEhDbrHS
 IZbXG9pIgoHj4Q+cwfpblrd1agJR1qTgZgKBEaKz6BbwbvZsIxg7jI8XNUDIoAlq4QlF
 M/xh5UMz4beJap0vuBJta9SPX9qRsieAv7+4h72dCBdSlEDFxsyY1btFBacDKF5QIl64
 fj9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773002130; x=1773606930;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=rGa+Qk9w7jO0yb09YCUU3MEUEX2jrREiC7pzktGBq9g=;
 b=blWhqn/rsHPcTe/6jmRNLve85AU5jWhsRgqTJQ58274VWaPAMhbEH9laXBcOuHhKiu
 9nhWLatcJ0Ks2opW1vjj/HNdmqxoNiqhnZQNMPMWztItgGfOAaj8LZqS6Lp0nDiIdIp3
 4f4FIPrN1v/+AFcLCB4e19jpPLSZBtqGDTjWe4wZijLHPAD8elJaqkhq8QHyt1ETY2dq
 WUfT47ZAp+ImLYcAQTLaCL3sNUWn/OCxLdmj9bgoFHR9vGC+SN1OMDpyGLb5b9raZGjR
 0MBs5Bw9s3A41grzMmuwibiUfRviyRdUPHPUR47dETQlmPbDhnloZ1gQPU9vF2CRaSVY
 6KlA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXQv9Fr1xPF4KTC6zxEnYP7T206qAlL3PzFF7fXLzq2lLsVnkFGYUU+Zhb+YFBBdal+x/Snq11kSrxGaYc=@nongnu.org
X-Gm-Message-State: AOJu0YzpB7GFdXy9DnEA8A3whiv3Ar1rZDWkClZs2ezgwWZTnMQ94wQI
 RONyankK7QgmiFKBvrNCUaXkSaOOBFhibyqzhMPCJyjnCCUkcPNFTCJK
X-Gm-Gg: ATEYQzxPy/CZuIgvvE7Nw1xpWYwpyqwOWHpN05TmBgU41gtT8nwFR540eanqHniysu4
 XKyWLews+mIdNdyRWW/9ypraMhG7B9Hadk3HinnyyZnYx1ILUiVdNYwDYaLTAQ0dQUuSM0XekRv
 DKFlmLS+dqYUSwhZsPJ7G6xuYc4P+3GbzUCmX7XjPoPjBQfEho5CfZHRlE5bcGhbuYAhoTpvy2T
 iTh37unyrPty0NVMZlmn2yxJECwqrG0ESdG27qvWOiYIt3k03nvOZnBrvQ9xevDVYc3ACArU2br
 NqbXF3+X1P1wlXtPigLgvDnrgGmcASzJMFYI3a/PQmDV3r9N50rsL0Kfx2BUOoxmywKrxpRmmjD
 vuVPXhzcFihjc//cmt/oHhgvGaTsQCCun4EGR1Xaz6k9Reu/OkH+YJETTgxb6OCDuep0xdbafof
 imlr44/ViOx6cWCdwISFztuE5bmTFoibo5AOhc1HY0STxCpT/Ww6NJhW98O0DKBEMqTUfwLb80D
 XFPsSiAH/cIL702Zt8CRhoOIrJC3+k=
X-Received: by 2002:a05:6000:4313:b0:439:a95b:3c43 with SMTP id
 ffacd0b85a97d-439da65e31amr15851395f8f.21.1773002129604; 
 Sun, 08 Mar 2026 13:35:29 -0700 (PDT)
Received: from Provence
 (dynamic-2a02-3100-25c6-8f00-0219-99ff-feb2-2458.310.pool.telefonica.de.
 [2a02:3100:25c6:8f00:219:99ff:feb2:2458])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439dae2bdf8sm20995508f8f.25.2026.03.08.13.35.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Mar 2026 13:35:29 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-trivial@nongnu.org,
 qemu-arm@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 4/5] system/vl: Fix reference count of machine object
Date: Sun,  8 Mar 2026 21:35:15 +0100
Message-ID: <20260308203516.160103-5-shentey@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260308203516.160103-1-shentey@gmail.com>
References: <20260308203516.160103-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=shentey@gmail.com; helo=mail-wr1-x42c.google.com
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

object_new_with_class() and object_property_add_child() leave a reference count
of two while the QOM root is the sole owner. Fix the reference count to be one
by calling object_unref() once.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 system/vl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/system/vl.c b/system/vl.c
index 38d7b849e0..91b390dafd 100644
--- a/system/vl.c
+++ b/system/vl.c
@@ -2197,6 +2197,7 @@ static void qemu_create_machine(QDict *qdict)
     current_machine = MACHINE(object_new_with_class(OBJECT_CLASS(machine_class)));
     object_property_add_child(object_get_root(), "machine",
                               OBJECT(current_machine));
+    object_unref(current_machine);
     qemu_create_machine_containers(OBJECT(current_machine));
     object_property_add_child(machine_get_container("unattached"),
                               "sysbus", OBJECT(sysbus_get_default()));
-- 
2.53.0


