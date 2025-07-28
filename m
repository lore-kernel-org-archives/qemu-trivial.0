Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6291DC83F17
	for <qemu-trivial@archiver.kernel.org>; Mon, 28 Jul 2025 15:40:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1ugPxZ-000553-Lo; Mon, 28 Jul 2025 11:40:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1ugPxL-0004hu-GK
 for qemu-trivial@nongnu.org; Mon, 28 Jul 2025 11:40:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1ugPxI-0002Bg-5K
 for qemu-trivial@nongnu.org; Mon, 28 Jul 2025 11:40:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1753717199;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aK8BuoLFAeS+eg6Hlk4zc+Pdw9VG+Sjj2feSeB0EzqA=;
 b=F8ae9pI6hmuyYR/2IfE092KU+zC+FE0EEh3j8PtRoIkr4SlGlxajfzmwM7sMe4wt7vxqI6
 0B+0WsH9iUNZrMbHub5+fSF9wylwUPz+DbZMffctkOBFaJnSuAa3+wBiZH+xLVD/ExD5tL
 N65OAQ+FqVlQ+pQCqXR1ixtD7eClqic=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-38-1taa5IOQNN25iKXuKLipYw-1; Mon, 28 Jul 2025 11:39:57 -0400
X-MC-Unique: 1taa5IOQNN25iKXuKLipYw-1
X-Mimecast-MFC-AGG-ID: 1taa5IOQNN25iKXuKLipYw_1753717196
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-3b788e2581bso671403f8f.0
 for <qemu-trivial@nongnu.org>; Mon, 28 Jul 2025 08:39:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753717196; x=1754321996;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aK8BuoLFAeS+eg6Hlk4zc+Pdw9VG+Sjj2feSeB0EzqA=;
 b=EeT1myf0QeFl0Sbsv+24bmzhxmju7ia3yK5TlO053BizybjgTnYIE+7m0fR/hAmz7q
 PwrWShEXzqnpqsxsV5Jo1XmImQTf3ZQa++LTH3xhg8td1Ysxs0zDUdThsW1hP0WTpx2I
 ZlOXUMmlcqKMooGf7FvvM1W2nMzUxMLQbVS8haQNJ8mh6YRPW/ONG9zQNzpInWS4VJ6c
 009MtNkd2MHM9tPmzfxSNR3Bcyoi3ZHj8zSFKSBHanXkOMbFnDANY30ecom2ZsViGkr2
 k3+JBNOQMdzwxHxgj7V02CU6ntFoaIubpvzpLr77xBivUcUglYH23a+/WR34wPXWD2Cm
 IivQ==
X-Gm-Message-State: AOJu0Ywk550hxAH1o+HF7ioOEwoJ3rhXoVRnB0W+Y44H2bzJ+BJ7xWBW
 vOwR/K/gZ0p+gTr/s82btSXLmrwtxHV+q4SClDlH6mLdcEaS2r23/n0xIUCpyBeDVGGwxnOFImG
 WMYYh5BcGjwwkixN7QIcOpmSI0mwwXPbq5PaN+gEIeazz1Qm01tI3BecS23o=
X-Gm-Gg: ASbGncutEdU4lZFfJfEoX878C/gECZySaaresuCsdKYUK3FgZFQj0i0fyzzpbUAay+k
 v6m2kgB7ufx4tgaye4rW54Mk2Pxla6cjFHcU4kuxEROW/FoZVScf1nrRrqzmFA4qd7MbuIz9S49
 M+XfNm/6iVeckl7l60OxEq7HclqCTR4IkqeHPHxSlzAVoNE00SNs2tPZMFpmA2zeTj9sv7sDDY8
 ac9/6TZgsh/5b98foGKtRbPa4zSUd0FgnkqmDuJGqv1/sQWWuaHpe8ml/t+0Tu8iUmQhN85Hj1+
 oUeo3OuKCwOrclTVveB+Uz9AlcZ6r5gnc4fHutyKJU0vz5RcsOZ3tFK/UwCRjPv09NqkGQhHBQ=
 =
X-Received: by 2002:a05:6000:381:b0:3b5:def6:4e4 with SMTP id
 ffacd0b85a97d-3b776673e7emr9067914f8f.46.1753717196343; 
 Mon, 28 Jul 2025 08:39:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEF67qDpb22TeRbtQzTezeRa7KUwIP9cnsc8vZXe8wtCDOrvrJDxLMeKxUYJnjRNvC4/KPQ8Q==
X-Received: by 2002:a05:6000:381:b0:3b5:def6:4e4 with SMTP id
 ffacd0b85a97d-3b776673e7emr9067891f8f.46.1753717195820; 
 Mon, 28 Jul 2025 08:39:55 -0700 (PDT)
Received: from [192.168.3.191] (228.246.150.77.rev.sfr.net. [77.150.246.228])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4587054f686sm157746295e9.14.2025.07.28.08.39.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jul 2025 08:39:55 -0700 (PDT)
Message-ID: <9ece87e2-215e-4604-ab9f-03e65fe07fae@redhat.com>
Date: Mon, 28 Jul 2025 17:39:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for 10.1] hw/pci-host/gpex-acpi:
 PCI_EXPRESS_GENERIC_BRIDGE: select ACPI_PCI instead of imply'ing it
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
References: <20250728152445.23917-1-mjt@tls.msk.ru>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250728152445.23917-1-mjt@tls.msk.ru>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 63CEv2y6kZqS_0X-jRZwkF34ZhM6RuHJIz9YdSkB7YI_1753717196
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org
Sender: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org



On 7/28/25 5:24 PM, Michael Tokarev wrote:
> Commit af151d50eac24 added dependency on hw/i386/acpi-build.c
> (where this function is defined) to hw/pci-host/gpex-acpi.
> But acpi-build.c is only built when ACPI_PCI is enabled,
> and the build fails at link time if it is not.  So ACPI_PCI
> becomes a hard dependency of PCI_EXPRESS_GENERIC_BRIDGE.
> Fix it.
>
> Fixes: af151d50eac24 "hw/pci-host/gpex-acpi: Use build_pci_host_bridge_osc_method"
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> ---
>  hw/pci-host/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/pci-host/Kconfig b/hw/pci-host/Kconfig
> index 9824fa188d..19b6605c7f 100644
> --- a/hw/pci-host/Kconfig
> +++ b/hw/pci-host/Kconfig
> @@ -54,7 +54,7 @@ config PCI_EXPRESS_Q35
>  config PCI_EXPRESS_GENERIC_BRIDGE
>      bool
>      select PCI_EXPRESS
> -    imply ACPI_PCI
> +    select ACPI_PCI

As mentionned in the previous thread,

build_pci_host_bridge_osc_method() is called from gpex-acpi.c whose compilation depend on

pci_ss.add(when: ['CONFIG_PCI_EXPRESS_GENERIC_BRIDGE', 'CONFIG_ACPI'],
if_true: files('gpex-acpi.c'))

so the hard dependency exists only if ACPI is selected.

If one use "select", ACPI_PCI will be mandated even if ACPI is not set. I am not sure this is what we want.

"Imply" was supposed to condition the selection depending on ACPI_PCI dependencies, ie. ACPI and PCI

Eric

>  
>  config PCI_EXPRESS_XILINX
>      bool


