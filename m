Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45AEACD8C90
	for <qemu-trivial@archiver.kernel.org>; Sun,  7 Jun 2026 20:46:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1wWKOE-0005uP-1B; Sun, 07 Jun 2026 16:46:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1wWKOB-0005tP-Gm
 for qemu-trivial@nongnu.org; Sun, 07 Jun 2026 16:46:35 -0400
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1wWKOA-0001GN-8E
 for qemu-trivial@nongnu.org; Sun, 07 Jun 2026 16:46:35 -0400
Received: by mail-qk1-x736.google.com with SMTP id
 af79cd13be357-9158fbaa4bbso418553785a.1
 for <qemu-trivial@nongnu.org>; Sun, 07 Jun 2026 13:46:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780865193; cv=none;
 d=google.com; s=arc-20240605;
 b=Ymgq7bFgqGnCCZ7KEa37uWpVIUaangrjNOsNv+Mr0HBslUlCZ+/jWubYt/DLz3CBP0
 iVSxE5lchFfZSl62Qb20zNMQozt6Bj9R/39vNAo4DTQZBGw/tsEo3829m90+qz2l9S4/
 bt8o23mB33GFnVbNhZJ7GEp4TaBUZUlWnR1otyyIWsHBAW4l/UJWurGSToTstpk7hVtg
 2DhJ9fUjZ4TktrnOXYXHOt7CE2bES5sP7oi/hyQOkt7VmyiO4MwChk1ncyXCEbCUJxE+
 0ixjUBcw6Np1j6MYt53j5clE9Ksjd+Pg+Aer++EASNWuYpggQQhnMNpuCIsmrKFvK1QE
 Gl0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=eQnjQoXnP+z8OYaeZT+X+pfOXJDNjEgiA1wJQR1dN90=;
 fh=b6Ca2+LzfPtFN9Im0kZwJS+Tmm1O9Y8y21iKR1g1hhk=;
 b=VPYw32v8Iv0BN5QYpRMDSisKzxugnzcxgV5sz7YusCgkDUboSu5p5lzcgMHLVozoiz
 88AWy6/bfZuZWMB+uCDo0Cc5Fsnq8pGzpZGn1Ue4eCrXugMA/LQnHyQps4G9pzGiUNLI
 lJGeWgXVhaC44BmmO41PI1i4knIlkvZ2iFa5YrjOzJrFNAx8oRYnVm59ipXCsh/9GgR+
 fH6sGemzw8cp6bZK1HgAYJZIiHN2LM/dx8syiRbVjEBL5+FboSIR/QXZ11BZn+qS8OHB
 3Ia/jBFvdY4Clf7xpV2s62hN5aqJKIqrIcuCNnitahlxaM2jI8AaHaRwr8d92/Vwg++D
 /gQA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780865193; x=1781469993; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eQnjQoXnP+z8OYaeZT+X+pfOXJDNjEgiA1wJQR1dN90=;
 b=ozJibbQPBn3tPFH7b6n/cNVlM5zTZsIfSZvU8WrwY0YMLDjmR/mTF//BnInDh3GHnA
 aHO9cly/OJG/hhj2triv6b+lULnUp6OoVR7V+EjODUPkxeLHxfnCoHRf/ISbXf2GSDc7
 jf6c7yAbtZ58+Hp0UCl4G8QeQoZKHufgeuXDEIN3kQ02HEclFDa0qRxL/qwhXEdEgB7W
 jxMlmgYgnCnuxaQprt8Vi2fOVf6cU6y4mpoDpfM6BJUvePXcRK6P867i6VoImzsiGy3u
 FRHQg/DF2jOOIFIOvJ+7rJ7AWBA+Oo37H1GmD2n6N4zGC9Kecz0y3mnyjX4zwnxHcxCS
 YVGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780865193; x=1781469993;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=eQnjQoXnP+z8OYaeZT+X+pfOXJDNjEgiA1wJQR1dN90=;
 b=FBw4ATNhWZcQ8WSsGEnZ/96B/OYgxqYDx89ICOPTOXmSGuTffSkK42KzxAv11yiRXX
 nConG5nwf24J8Y5I9OIBFAbhN4YfsCiteeAOKdz1mPNXKejQlIAyNFwovG/48imyQvc3
 3GewAWlG5PNQIifY/OxH5WYxh8PYUt3S3nIGB0Kwu+ER3acPivTE/VM5QmAnyEKB8WGs
 LdpKxKWDchsCtjL0BBYGc5fR6tq8rIKZBzmqe71AYqToSNAdZNjQQfANlrgnDvkG3nDi
 HlWQP/L19ORGiAgqu+EG6q8wUXvq8Y9Cm8vlo39HgrSG7LYuFpsN5YQY+fdEJd+lFeog
 UoWw==
X-Forwarded-Encrypted: i=1;
 AFNElJ9WQUhM67iuZAgxE9LLBHWB2em/Nw5wwln2V3Ow+XiSdHEmRfrTCK2yRvLBsTSqG75h6AagJW4yniPCkR0=@nongnu.org
X-Gm-Message-State: AOJu0YxunUxqEMnYozX4uQ2kWY4GclObOt7kcXi4CwGl1bz4cxkSAOHr
 McySF1ZMIBBtOwUqXXvrq/VDKQKRZGCHH/jtnCUvai0+78K26kSrIHNvq6/pyUNDNDzVuO5eZxE
 Wj4kR4T5UPj7oSLunk/+f3FKVGxNBCxk=
X-Gm-Gg: Acq92OHA3mVHW+wci0B2a6H9LfhWS5hyVyAHjuWeYhTaMDkvwHjAsErSTkTzHe/9M3u
 Wq+8OezmSRMcCUROtW0ALcqTwNTRoZFQCTazW2Nq8TFVqj7zuz+AA9TrCfY/q+BthhlD8i7AUXV
 /qQZdul912tXSeSlAtUiGqGAY1OgXYZ+uUf/gIw05u8g2waWHuLRrJ4QzYy/oAAGQxEdZrAz6W4
 Ta2bYGKkBPbjQ3tf7HR8WBe8g4YAw0A3yxnpIQqfXrMoPD1QRQvtIYmtVqAOGkS0HUOccZ7t4Re
 LWWtnGb00xjzsKNqbd+/w4zaFgZogCVvdShAjjKe02GLWJRtJEwhCKt5Ny/zAya6RCGBMuykqRG
 EupP5CA1zjcq0U77olM+6QgzmIs3+7fS1LkyZ
X-Received: by 2002:a05:620a:690d:b0:915:8865:dc01 with SMTP id
 af79cd13be357-915a9da7f30mr2206249685a.46.1780865193005; Sun, 07 Jun 2026
 13:46:33 -0700 (PDT)
MIME-Version: 1.0
References: <20260604162849.199541-1-audgirka@redhat.com>
In-Reply-To: <20260604162849.199541-1-audgirka@redhat.com>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Sun, 7 Jun 2026 13:46:22 -0700
X-Gm-Features: AVVi8CffGr15_uQqnuTCg7lcEdGwrLM44w81uonYMbDbRlfta-OX6aH8XidhXjM
Message-ID: <CAMo8BfJMJ+hf5MBptz-sFojCLAYdEsiduR1xbMhJs2kN1Ju-yQ@mail.gmail.com>
Subject: Re: [PATCH] hw/xtensa: replace calloc with g_new0 in mx_pic
To: Ajinkya Udgirkar <ajinkyaudgirkar@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, 
 Ajinkya Udgirkar <audgirka@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::736;
 envelope-from=jcmvbkbc@gmail.com; helo=mail-qk1-x736.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.999, HK_RANDOM_FROM=0.999,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On Thu, Jun 4, 2026 at 9:29=E2=80=AFAM Ajinkya Udgirkar
<ajinkyaudgirkar@gmail.com> wrote:
>
> Replace libc calloc() with GLib g_new0() for consistency with the
> rest of the QEMU codebase. g_new0() aborts on allocation failure
> rather than returning NULL, which matches QEMU's allocation policy.
>
> Signed-off-by: Ajinkya Udgirkar <audgirka@redhat.com>
> ---
>  hw/xtensa/mx_pic.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Max Filippov <jcmvbkbc@gmail.com>

--=20
Thanks.
-- Max

