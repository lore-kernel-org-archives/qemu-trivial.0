Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 011BDC43458
	for <qemu-trivial@archiver.kernel.org>; Mon, 13 Jul 2026 10:16:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1wjDhV-0001ku-W3; Mon, 13 Jul 2026 06:15:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wjDhS-0001kT-3J
 for qemu-trivial@nongnu.org; Mon, 13 Jul 2026 06:15:47 -0400
Received: from mail-yx1-xb135.google.com ([2607:f8b0:4864:20::b135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wjDhL-0007WP-60
 for qemu-trivial@nongnu.org; Mon, 13 Jul 2026 06:15:41 -0400
Received: by mail-yx1-xb135.google.com with SMTP id
 956f58d0204a3-6679d88abdcso4130512d50.2
 for <qemu-trivial@nongnu.org>; Mon, 13 Jul 2026 03:15:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783937736; cv=none;
 d=google.com; s=arc-20260327;
 b=ou2F4wXm7kmYUd8iG2/VW4CZs6SuQOx/6DktWx3emKJJKo/87wJyg1yGx9JdqPmJvy
 a1zkjjs4CRx3eSvyKMefbq+gmyCJMl6HZuRAZnGgCa7BCHAuGU6eQJHmQegA3JfWxfuB
 Eg2hrflE+8Qbj6OLmm14un1/Twlo9RQKW/YVGUE8a5vDNsIPgFWHm3+Kdlpn7nPXOVdS
 Slz/qaDj9deazn0zQxmNqUbhyGCB/qDeA083+2Ug0xyLoTMpM9qWxmUtUd7jlUJmN3dY
 SxRTdkZV+Yst8KT/gCql9sHO0otnudGuVpnTn0R+U7O8pGdd1QgvrKiShsTnTIKDio9M
 RMeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=Ez6fdOpUFLAagbJn0g1cbwWOs9uXZ4f/TlFa1Gbs+co=;
 fh=KaLtoeX3QJvYlzJnrhyNm+HaFANgq3dgVFuO97M2CqI=;
 b=BFtXQxNkxOuTn3FKgCl3PKeXCWCQw26LAz7BwY5suStBpqljfpueAY5muQoINnS25q
 8DK6CMTs/ZJHcaeFsum6Op+d/JK7bpqi+EYpcVU2u+ToxK94DMzWLmgNDrRj59B2dJs3
 nL5UEbQr0yZILskoN5Z4PxkNSqkUt3oNHBL1miiLBgIXRkzVHonauWbj5jZE3/wroCV/
 C5sUlkKzdIhC9UAKxbV7DKDEYcFdwlE4V4DdNcMM4lNpuKvlnqIwu7XXrGvR7cv9D8Ra
 eNexJvAKKRmhrHg/BkCysrS4oxT6FPU1r5bqBN7ujLEBpg1gQep/N/TMORVWF+nQeYJC
 4TrQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783937736; x=1784542536; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=Ez6fdOpUFLAagbJn0g1cbwWOs9uXZ4f/TlFa1Gbs+co=;
 b=zICA95QmWlcNOMRCIvA8ZOFTfHkQE1NvgOhFap6YCRPeFkPJRrqFCWGLzcYNY/fYDK
 FmuqjOJwKvQbfo1jrb4zKu6rkEK2Z1gG8n0GLo2i+D6A9FrtNg5nfRFXYB5DDNX+Y9Ko
 wtbXeM9biCEwZ1OtZj8W10CD0/yvfVjhgC05rqb8UdgVuckg3aJN4rd3zaA76IGKg6oT
 MrWt6e5bNduwbM9Avy9aQm8YNxNHmmm7ivrK/pmQnCy4PKf03NbFtjy4tFCeoDcMEiIl
 Fcfh/lbXvAMW2LqTYGZLbr3g94+LjnFxsP9PBzmRa+4A81AFpHXKw6WXuBjM6Gh3ugMu
 qetA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783937736; x=1784542536;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=Ez6fdOpUFLAagbJn0g1cbwWOs9uXZ4f/TlFa1Gbs+co=;
 b=ImpOfURzx/O56wlUT+F+fnOiDqWVP4rmNeaWj54SEE5lsUgzc64ygcEiXhvD+V0Dl7
 zyQsJeapdX6MNExqxSB/dpuA4yMhA+m+str0UBIeDZBzDHBYehwfeTVkdDk5qGRvn43q
 EqxAB0QSfEs/SiZYBZgUHEf7XRrxMddyK8ON1bkX24a0p+kTDte3s5+KYRVuVVr5UTJj
 tekMN86sWYz6hf7bRZq3BRJx5lcBnDkBHOJ7V+dU5uxVaBjwNdRmpRvs8gOPL17xziN6
 oqdNRqAQw3IAyYM7SSvngHN9lXhr38ICFsUbyInFc5KQgjAkk6/+dmY8TBK63Y8hzHg6
 ceYw==
X-Forwarded-Encrypted: i=1;
 AHgh+RoEqGz2RrdlNCll0u4kDxZDqFwSaVc5XALVfWa8+f+pmZ7Fiy7EDnfQl6UE+1Zarw4TAVJ7CUreviF5iXQ=@nongnu.org
X-Gm-Message-State: AOJu0YyJaQ4yd4orX7+EGHEpvAUQ9OgHTYCuIEo2z0Bhyftz6Z+GWTUa
 1Jn10rFiYTxoU4XKxTRzxjl/FYYz9akZosdHnqP3t5F+thphywu8uHfvg2hOfBfTdDk+s13K08i
 lzdQlIw924oaDaofumryIClhXnuCpiuyIFVDyx1VvQQ==
X-Gm-Gg: AfdE7cnbr3lSONZe9taUqVx/8/uzlJzNCdpSn+Nz0/7pOEHMpSuPcxDy5S4c5S2sYLO
 MAzPlBlmcAxCgvws9QKc+MLY0Gtg+SRDJ8iqs1FRRGfnudyCJhYHCAqz9fOjC/jSDOJaglSFN80
 Hj9KtNuO/reFXCM+Uyijl0iPBHvGm4CEDfuOC/yG41VO7pQNW0BO1F1qkfrA3HQcH4EeFmWYjv3
 5os2hxODDvEVCDqeAofNfL65hHessySlVFye9xR2Ttr52zeDjRaU77Y4IYIKTag55qzlh4u8qCq
 9CHH5jL0K98Rdtsdp5uZMdbYRxvEixGfhMJ2AwJak+8gmCMwUtLNOdnc
X-Received: by 2002:a05:690e:1918:b0:664:ae6a:efc with SMTP id
 956f58d0204a3-667d7c0b8eemr5749075d50.70.1783937735637; Mon, 13 Jul 2026
 03:15:35 -0700 (PDT)
MIME-Version: 1.0
References: <20260713100508.123623-1-thuth@redhat.com>
 <20260713100508.123623-2-thuth@redhat.com>
In-Reply-To: <20260713100508.123623-2-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Jul 2026 11:15:24 +0100
X-Gm-Features: AVVi8CeTEIrqXtnQm57FKz5bHIzePI6OOfhoCjaRiQKqHxRa0JBBmixy8TkQjXY
Message-ID: <CAFEAcA8xNZRi9qui=M7HLhM9HFMxsXTjXkA6QFAPPqrsH8pEMQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] hw/usb/hcd-xhci: Turn guest-triggerable abort()
 into qemu_log_mask()
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, 
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb135.google.com
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

On Mon, 13 Jul 2026 at 11:05, Thomas Huth <thuth@redhat.com> wrote:
>
> From: Thomas Huth <thuth@redhat.com>
>
> The FIXME macros in xhci_alloc_device_streams() can be triggered
> by a (malicious) guest. Since the macro also contains an abort()
> statement, this terminates QEMU. Turn the FIXME statements into
> a qemu_log_mask() instead to avoid that a guest can shoot itself
> this way.
>
> Reported-by: Feifan Qian <bea1e@proton.me>
> Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/3784
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@oss.qualcomm.com>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  hw/usb/hcd-xhci.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/hw/usb/hcd-xhci.c b/hw/usb/hcd-xhci.c
> index 2cdab3ba0e4..f5bb7d25600 100644
> --- a/hw/usb/hcd-xhci.c
> +++ b/hw/usb/hcd-xhci.c
> @@ -965,11 +965,13 @@ static TRBCCode xhci_alloc_device_streams(XHCIState=
 *xhci, unsigned int slotid,
>           * together and make an usb_device_alloc_streams call per group.
>           */
>          if (epctxs[i]->nr_pstreams !=3D req_nr_streams) {
> -            FIXME("guest streams config not identical for all eps");
> +            qemu_log_mask(LOG_UNIMP,
> +                          "guest streams config not identical for all ep=
s\n");
>              return CC_RESOURCE_ERROR;
>          }
>          if (eps[i]->max_streams !=3D dev_max_streams) {
> -            FIXME("device streams config not identical for all eps");
> +            qemu_log_mask(LOG_UNIMP,
> +                          "device streams config not identical for all e=
ps\n");
>              return CC_RESOURCE_ERROR;
>          }
>      }


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

