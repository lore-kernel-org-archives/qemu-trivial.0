Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04B47CDE001
	for <qemu-trivial@archiver.kernel.org>; Thu, 25 Jun 2026 14:59:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1wclYB-0001fw-2b; Thu, 25 Jun 2026 10:59:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wclY7-0001eP-HB
 for qemu-trivial@nongnu.org; Thu, 25 Jun 2026 10:59:27 -0400
Received: from mail-yx1-xb129.google.com ([2607:f8b0:4864:20::b129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wclY5-0003y5-8D
 for qemu-trivial@nongnu.org; Thu, 25 Jun 2026 10:59:27 -0400
Received: by mail-yx1-xb129.google.com with SMTP id
 956f58d0204a3-662bcc30fafso2512292d50.2
 for <qemu-trivial@nongnu.org>; Thu, 25 Jun 2026 07:59:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782399564; cv=none;
 d=google.com; s=arc-20260327;
 b=N/voTA3mYyfKDB5uTgi6Wx1dts6EEtAC1P1Lq9NM1sId5vwEASh4gtvIbTTY9VWp9i
 J2XsV3Q+jWEEVw5EUe4Ye4pSVmTp6pnUAfgnBZ4PTxFs5a38csOICNWX0AA1TpLTFr6a
 Fk9QHmH7XqFMy1eMRTuQIjkyU6zLaAGPtquUucORKFsJkQyAIaQPSZuQw35JmLDnSvyE
 HCtS2RM06tP6/Kl/RjCFPO+vHT+eYJMErEWdVyJGJywyjCHmvRjWAGYJWeBp7epR6Q1k
 jznbXXIxVAHZVa09G2xpehGcLMmrPSndnLDSrJaW4bY9dVUi7CeHmF075AT1szbDvB0D
 fHYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=HzdtMgVwHzlp/WK8F9dbK0OiTLbLnYpCESvD8iz7rCw=;
 fh=kfKb+QGP/++BQVf691LhJErUC50tu6RMvNpX8GcRlUU=;
 b=lLlomKQZSkpwf3Wut7km4aavlHohuqU5jcARjyZpg5WuLN2bdoAw1M7l5+jeoG/hDN
 InID5JLKIMQhyjCUFQHt+dyX34f53ttZQDLB/uGVkkyZdb+EVQ/3g7O61E/ohwDM7EJL
 EXAyO+6CJSqoUF6j82R83bXQx0psoMyRcgpgWwwrxG58suxVgottKTuUf84mAq6vCU4C
 T3uCnSkPv9lrIBC0g95f8Z0Z8uwADlHNua1qklGwCd3osIkjw0hr/M/ZW0AJZkuTNmJ9
 W+QBSS8lUYuBl8S9tB3ygjsGF77W1E8oe51BDG9sG46xk9OWE3SBOnRqbnSp7upj1+7l
 JOuA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1782399564; x=1783004364; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=HzdtMgVwHzlp/WK8F9dbK0OiTLbLnYpCESvD8iz7rCw=;
 b=SU754vQmGoh0iy53qcCGbBJXZPf4vMfYtIeUVK829/ZQzzw4/JTRFAiP1ljbj1IHTo
 UHThxp1pXlmj3wWTAUlkxQFEit83CKfcxhmSkvle+NaPKQq0Vb32Eq/V5obL/ScQFgUr
 WegUWiB6Z5eoCyDhUFVz2j0elSy8ptsnD3gOTdplNaERLQjVV4r5HLuWr/T5Ry7RoVcr
 4LfIC+rL8lGN1tmTkLkdDd8GugORtnl5QlyHdAJnbREki2F7LWhrZLaqbiD8YelA+tWR
 anowsumTkJx4T5WVhsLWbeSIhFjhZ57PwMSUl3iK6uLTOo4Jq2AYZ2HU8rKekPYMFU3p
 unug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782399564; x=1783004364;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HzdtMgVwHzlp/WK8F9dbK0OiTLbLnYpCESvD8iz7rCw=;
 b=W2FCeJyJVbptFK/EIiuo0TcxIRPKvomz8xXblr4HNQmQYmZHG3aRSKVmVGSOEOW1ZJ
 +9nu51KlQ29g3yh/rRl0m19zn+2MPfCwnOehDFTBCY4sMNwW8vKP7MM7qBxS+v4+3WbY
 JEyQjoNcjOI4Dh1yJBNqdIs931WEoDF4nl/yKVO4hiU7oxCR957MhmEYnQnlArnhhsJ8
 LOLxYGZre6d2UpvRdJivqUdJofgBARdOGibnjYDlYW8cEAVWs/45/cB0ECshH9TBTc/T
 6UfBPZueKoqw8n3wQNsUKGIdHO/OjFkIisry2fBpcDef53tQbDio5nAy+ABBbk72jajs
 9gQw==
X-Forwarded-Encrypted: i=1;
 AHgh+RodPWBpxH0M9ImcWQ9RhmKa5bm5rA5IahDZvoPCDNEElj2sR/rGDXHrZShoXI9EnW2y/YuKXZ2wx9HPzw8=@nongnu.org
X-Gm-Message-State: AOJu0YzH0Y8gix3GPKjC7vcFHQimMRAjml2o57nD+D3PIqMbO5/ADkjR
 fbQlXWwDaPXpDRdfUWakVF90LUU0WzUIr+6B6rKc14SvsGZmDfqvYTBqqJW7wWHLwzJ7rYRysqZ
 ZqS5qQv1wisUz1QnGxY7ynZXamQh1djmK0r2TxVqjDA==
X-Gm-Gg: AfdE7ckQCsae6s2PwuqHR+LZhiH5kDcKSAP5k2dJXhdabm9GnBtUVvIJ/SsKd4qXbq2
 iiEVaTi7vAtG8LxLhjmWkBSy2pCeD5WYMw8kQXHdI0WjqucAWdKZo0C9nNoEZx0ldPcBea9gfUb
 b0mOLD8UR03YtRBomXBDff/4UNXydZbGqsOO0FC042qOyf1Y0wHTeiU59UmoAOLrzN/7RTdiwRp
 w0DYpBSocopSXhDsRl0xAjCY5/56IQvm36zTFKwdJw58guyowQRucVAShm32t+ie+oroyqbDnvE
 tK/rtcxzpiH7dM+NakTBNNiPYUU7+YK43T9AffJCZaNTerIozKFTq5I9+dR9aZ2/D3A=
X-Received: by 2002:a05:690e:4386:b0:662:8a91:f034 with SMTP id
 956f58d0204a3-66487d83b10mr1656826d50.38.1782399563852; Thu, 25 Jun 2026
 07:59:23 -0700 (PDT)
MIME-Version: 1.0
References: <20260623170354.43981-1-163wangjack@gmail.com>
 <20260623170354.43981-3-163wangjack@gmail.com>
In-Reply-To: <20260623170354.43981-3-163wangjack@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 Jun 2026 15:59:12 +0100
X-Gm-Features: AVVi8CcAN68-jUD6W6jP4xsWl5dBErSXJVYSI8N79sP_1tddjMvjBV9yVsO1IIY
Message-ID: <CAFEAcA-XeUSW5h9ATR196uTMXVr6OXtfgXjpCFNv5p3yArtcUw@mail.gmail.com>
Subject: Re: [PATCH 2/3] hw/misc/imx25_ccm: Replace DPRINTF with trace events
To: jack wang <163wangjack@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, 
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 "open list:i.MX25 PDK" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb129.google.com
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

On Tue, 23 Jun 2026 at 18:04, jack wang <163wangjack@gmail.com> wrote:
>
> ---
>  hw/misc/imx25_ccm.c  | 34 ++++++++++------------------------
>  hw/misc/trace-events |  9 +++++++++
>  2 files changed, 19 insertions(+), 24 deletions(-)

This patch and patch 3 are missing your Signed-off-by:
line; we can't take them without it.


> -    DPRINTF("reg[%s] <= 0x%" PRIx32 "\n", imx25_ccm_reg_name(offset >> 2),
> -            (uint32_t)value);
> +    trace_imx25_ccm_write(imx25_ccm_reg_name(offset >> 2), (uint32_t)value);

You can drop the uint32_t cast here. We needed it with DPRINTF
because that's a variadic function. But the trace version
is a normal function and because the argument's type there
is uint32_t C will do the conversion for us automatically.

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

