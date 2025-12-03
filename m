Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75AC9D12D63
	for <qemu-trivial@archiver.kernel.org>; Wed,  3 Dec 2025 13:59:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1vQnOA-0007Rc-BX; Wed, 03 Dec 2025 08:59:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vQnO9-0007R5-46
 for qemu-trivial@nongnu.org; Wed, 03 Dec 2025 08:59:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vQnO7-000207-LB
 for qemu-trivial@nongnu.org; Wed, 03 Dec 2025 08:59:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1764770361;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=bqc2/M3DH/hL9gd9uHKqe1jeHS3sUs70htuKcIcortCiaXmIlYHm2oQv4MzXXudZG4szU4
 Deb3tZRssJi7N+nUuVIKba3kYvYo+triVjsl2bTEpdkPQNzIIrkFing4ns9VhboNVuVmP4
 1mEIxHVOXRn+a/4+h0julEwXWRZVqwY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-281-tlibCj1fMxmROXe2ISU3-w-1; Wed, 03 Dec 2025 08:59:19 -0500
X-MC-Unique: tlibCj1fMxmROXe2ISU3-w-1
X-Mimecast-MFC-AGG-ID: tlibCj1fMxmROXe2ISU3-w_1764770359
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-4779b3749a8so58712135e9.1
 for <qemu-trivial@nongnu.org>; Wed, 03 Dec 2025 05:59:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764770359; x=1765375159;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=WhrxPJjSh3HMdI/KzmCPS0LKT+XYxAAN69DfTsbqSLkZ3ssw2PejPUmFL2GGxTlPVr
 ACSthyIRz2hMTBb1ri8O4pk2SvAkLHff/GJAOtxY+4s2k+GMbgOST5ohxBmw9WukzC5l
 9a1dE5r242+sIanhrVn8IK35Xm7U6n8DMNgFQmTCOosWrxGRNlQbrOnO3nIJO+FSIrhg
 BOyhv/m6lGzhj/WrVX65bUxkV2aOPrwHafGxz0iEnpO8ujFj440C0dS8wsHbtX0f0xLr
 mkdS8ckSjkNl2uA4cdYymdHj8x/hP9v9iCMMFG6z3tBimusZWonZO0EYEFhRb794N8JS
 bZ2g==
X-Gm-Message-State: AOJu0YyMsVJalhhl8H+UBNiAkdiFUA1ilMCexiIyBPpAajCyl4TNp5JF
 yB15QrmzwvuB5jwe+fp8F+eFre5oSO1X2h9F9mMOihX5ac2PhGxpHjrJQgcHSw/MAg2MIqAf80y
 GG2vzvAMC/lGf/rFma1trRmZ+VRKyb6S41AufztYOKewCVA6Qf1N2L4rV+O4=
X-Gm-Gg: ASbGnctkfX16gfWxewVALJ/6e/XHyyRMGxGLVQ6XV2ZnBwGs7/b2tUz+A/msQbkvrDH
 sCa0bMwalbLWfRmtfVaOwvy9Tx4dA4JndritbsniQuribLG4K/IA+r/wpCjNTfnBHMhbweXaZTS
 GIAjcMHqt/2oFh4ykL8uJ4sSqzRMfu866/OkG0pmAsT8dY+ufBT1BXJWKL0jKNguH+WG7Zj/hDt
 1zeUQE2H90gW8iFRbGULAJSP34iJ4KkXphNs1obOO7mSOTu2oGKfuT/l7hoKZDyOPDsCTMgA64K
 xopYFE8vUt8ibvW4guOBhVv4XpDJ8FLOq7gdNa3tBK8//qxtzqnm2q7WXQVvdDPc7L8bUJkewp5
 73iCrg0WxmXTAno/C/jbnFX0x87hf/JFkofAbvkAeiSAVBU6kBYNiN35rurxdTOtW1+JYfqkjDQ
 sSGty/jjHo9WwVBeU=
X-Received: by 2002:a05:600c:19d2:b0:477:df7:b020 with SMTP id
 5b1f17b1804b1-4792af39a3dmr22829405e9.18.1764770358749; 
 Wed, 03 Dec 2025 05:59:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEN8S0BRaCMjBkEMw/RIvJ6eFhHrEBKgDTu1ron4RcftS85vDSCrWhBpt0nVE/VS61XkjVzzw==
X-Received: by 2002:a05:600c:19d2:b0:477:df7:b020 with SMTP id
 5b1f17b1804b1-4792af39a3dmr22829145e9.18.1764770358341; 
 Wed, 03 Dec 2025 05:59:18 -0800 (PST)
Received: from [192.168.10.48] ([176.206.119.13])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4792a7a2148sm49708265e9.8.2025.12.03.05.59.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Dec 2025 05:59:17 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: dave@treblig.org
Cc: qemu-trivial@nongnu.org, mjt@tls.msk.ru, laurent@vivier.eu,
 thuth@redhat.com, pbonzini@redhat.com, jak@jak-linux.org,
 qemu-devel@nongnu.org
Subject: Re: [PATCH] qemu-options.hx: Document -M as -machine alias
Date: Wed,  3 Dec 2025 14:59:14 +0100
Message-ID: <20251203135915.1566082-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251203131511.153460-1-dave@treblig.org>
References: 
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: HLUSU0bsvLs9GfIhw3y-BAhqPfibx_hw0DpGs5Z_rMk_1764770359
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Queued, thanks.

Paolo


