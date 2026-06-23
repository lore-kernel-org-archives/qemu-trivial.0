Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD600CDB470
	for <qemu-trivial@archiver.kernel.org>; Tue, 23 Jun 2026 09:13:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1wbxBg-00047X-SD; Tue, 23 Jun 2026 05:12:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1wbxBf-00046B-CE
 for qemu-trivial@nongnu.org; Tue, 23 Jun 2026 05:12:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1wbxBd-00032L-PX
 for qemu-trivial@nongnu.org; Tue, 23 Jun 2026 05:12:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1782205972;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XY0i4tKMDaN+wiRXwH9n8el2pNwOYOLhYvxb68wTl4Q=;
 b=hBowJQO+lDzuDsmXMdTFpJQgzddgnBcJs7PToit9Bgezl0CZoDluk5ZWbUOPrE0CodVhIP
 Qw9Si/7RnGQCLejwFVqMQ+vPowbYSZa1zIqXxlunbQnRYieRq4ZTm7h/9evTe8GZ8tXQ62
 EyLkPzbOW6iL0pYAsroEQ8YoUMs4p7w=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-20-Z74tx2SMPmSnBK5sNzEQfA-1; Tue, 23 Jun 2026 05:12:50 -0400
X-MC-Unique: Z74tx2SMPmSnBK5sNzEQfA-1
X-Mimecast-MFC-AGG-ID: Z74tx2SMPmSnBK5sNzEQfA_1782205970
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-4639f122c38so3767504f8f.1
 for <qemu-trivial@nongnu.org>; Tue, 23 Jun 2026 02:12:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782205969; x=1782810769;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XY0i4tKMDaN+wiRXwH9n8el2pNwOYOLhYvxb68wTl4Q=;
 b=p6TKInepBy4L0f7VTWQuNg3RalWPStS6baEC9QfOn0eNswy6Wi3N4n8hu+U2uvLTLH
 ZECpVqH+RGS6v/qwhymxjpRIdwvCGL8jQklU+24UMZmZ753sTSyXV0wJVz9Kmzc/3Ve6
 a83E4P9V/DZNAfU4oWPrwz93bfpDjK8iQhzKRDshZt1zg/eS9AGcm7TdCKI/O2kBFRgi
 lZridrSnySLNp83rBARx2N2C8agERx4vJ47RIXZpZEuZ6XL56+WwOMWCXo8l6VfKpWWs
 wOZ00nvpuRktRvnGZz5j7ERgI96SB9KHigEN1yHetElnMgbd3B125ufEg56E4eVCU3aK
 QyZw==
X-Forwarded-Encrypted: i=1;
 AFNElJ9swJo4yvHSTkTHcTetAYAZi3xXK+5zNht47+zbEhoASWzWbhd3LtjW4Dl/ZQ1w5ZmyvRPrkkdAmOng26k=@nongnu.org
X-Gm-Message-State: AOJu0Yz18bOCOqqTbw3IRqkWBrXXSFvZ3yoZ8uM/tkJofPHM2g9Ox8QV
 WdcUh8MApJnuAb5F4uw5ZbHJSXCaiXtEtGBDOonEgvQvx1XJFVRHeiTLf4YgelWXtZnwaUyXPs8
 9Ij0eKxMoiR1iI+ARwqpGVxPIJdt0AqjNPir5QQ+1QP47RqQCO5UvVjQZZ30=
X-Gm-Gg: AfdE7cn28T6md0hlNoOKL1uowbHew2GbhddRDKmtzJiFSs0s6YwFknKKx6DH8OjF2E/
 e9gCohpAEgL3s3DuGg+hVsd5aBF3r7azqa2OoCtCUpLBnE86mfarynELOhbN56JWpMBQ2cl9rHm
 gAjxSu0crfbxfMgu1PfIssLjCyPKtTX+XDCTauEM/Pn7WnFBF3nUNA3GEiB2PhWaU6mG3YN3wSg
 YDVhxSeexjIOWxklTM4lZ4Jwsz6ihqfR/3iiFobl/WvmOrNh/eAFf3+3H5bTiBRLUS4K22FfSWg
 HNFasBhunprF0XN1KwnxJeGQzgmzE1QIOIYo+hMNVa6WT8gWM4Bi055MMFaJjQygvI34Ihrk1uB
 TKMnyLH0D3VO0ZP0PzH3/dBLKupZ+DPRo
X-Received: by 2002:a05:600c:1549:b0:492:324d:e93f with SMTP id
 5b1f17b1804b1-492490b80e5mr203085195e9.36.1782205969444; 
 Tue, 23 Jun 2026 02:12:49 -0700 (PDT)
X-Received: by 2002:a05:600c:1549:b0:492:324d:e93f with SMTP id
 5b1f17b1804b1-492490b80e5mr203084795e9.36.1782205968962; 
 Tue, 23 Jun 2026 02:12:48 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-85-71.inter.net.il. [80.230.85.71])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-466648c5413sm35313148f8f.11.2026.06.23.02.12.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jun 2026 02:12:48 -0700 (PDT)
Date: Tue, 23 Jun 2026 05:12:45 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: no92 <leo@managarm.org>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, qemu-stable@nongnu.org,
 clement.mathieu--drif@bull.com, yi.l.liu@intel.com,
 Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2] hw/i386/x86-iommu: Correctly set pt bit in extended
 capability register
Message-ID: <20260623051234-mutt-send-email-mst@kernel.org>
References: <20260623082223.1431499-1-leo@managarm.org>
MIME-Version: 1.0
In-Reply-To: <20260623082223.1431499-1-leo@managarm.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Mowdap4MNj7k1XSG65XadN56-6uPHaMUv0BOxB7Za3c_1782205970
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

On Tue, Jun 23, 2026 at 10:22:23AM +0200, no92 wrote:
> With the changes in c7b2e22bd957, the `pt` bit was set in the (wrong)
> capability register, instead of the (correct) extended capability
> register.
> 
> Fixes: c7b2e22bd957 ("hw/i386/x86-iommu: Remove X86IOMMUState::pt_supported field")
> Signed-off-by: no92 <leo@managarm.org>
> Reviewed-by: Clement Mathieu--Drif <clement.mathieu--drif@bull.com>
> Reviewed-by: Yi Liu <yi.l.liu@intel.com>
> ---
> v1: https://lore.kernel.org/qemu-devel/20260622162138.1045170-1-leo@managarm.org/

changes since v1?

>  hw/i386/intel_iommu.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
> index 744cdfd2e6..d1af7a3135 100644
> --- a/hw/i386/intel_iommu.c
> +++ b/hw/i386/intel_iommu.c
> @@ -4988,7 +4988,7 @@ static void vtd_cap_init(IntelIOMMUState *s)
>  {
>      X86IOMMUState *x86_iommu = X86_IOMMU_DEVICE(s);
> 
> -    s->cap = VTD_CAP_FRO | VTD_CAP_NFR | VTD_CAP_ND | VTD_ECAP_PT |
> +    s->cap = VTD_CAP_FRO | VTD_CAP_NFR | VTD_CAP_ND |
>               VTD_CAP_MAMV | VTD_CAP_PSI | VTD_CAP_SSLPS | VTD_CAP_DRAIN |
>               VTD_CAP_ESRTPS | VTD_CAP_MGAW(s->aw_bits);
>      if (x86_iommu->dma_translation) {
> @@ -4999,7 +4999,7 @@ static void vtd_cap_init(IntelIOMMUState *s)
>                      s->cap |= VTD_CAP_SAGAW_48bit;
>              }
>      }
> -    s->ecap = VTD_ECAP_QI | VTD_ECAP_IRO;
> +    s->ecap = VTD_ECAP_QI | VTD_ECAP_IRO | VTD_ECAP_PT;
> 
>      if (x86_iommu_ir_supported(x86_iommu)) {
>          s->ecap |= VTD_ECAP_IR | VTD_ECAP_MHMV;
> --
> 2.54.0


