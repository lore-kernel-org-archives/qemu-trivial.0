Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nG07f-00010m-G0
	for mharc-qemu-trivial@gnu.org; Fri, 04 Feb 2022 10:03:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nG07e-0000wy-0K
 for qemu-trivial@nongnu.org; Fri, 04 Feb 2022 10:03:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47050)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nG07b-0007go-EK
 for qemu-trivial@nongnu.org; Fri, 04 Feb 2022 10:03:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643987014;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NjDbxZXfU53Ksx0dmsqcwUCXSLr88e04bMymUAQ+3cc=;
 b=acXDViFmypuADX6AdjiWyMVzQjVuI1GqN+KjvPkDSCkc6dE77tbLYkghJP8KhstJI6FZnS
 IzmQESeVNay8LiKZnwIBZOloh0d+2R1L/lnxtl1BSc8BKmzGlrHcs6/0AsDTwXXMpL6qY0
 iNwWKUG9b+fOF6yrfnUPgELDYVjXujk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-657-9hOuc1qDPAuJm1KtbMfoig-1; Fri, 04 Feb 2022 10:03:33 -0500
X-MC-Unique: 9hOuc1qDPAuJm1KtbMfoig-1
Received: by mail-wm1-f71.google.com with SMTP id
 z2-20020a05600c220200b0034d2eb95f27so2507140wml.1
 for <qemu-trivial@nongnu.org>; Fri, 04 Feb 2022 07:03:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=NjDbxZXfU53Ksx0dmsqcwUCXSLr88e04bMymUAQ+3cc=;
 b=Ep1Qtf9Jp2/kD/f4NCtzIle/FM662CBROhh6Z/nmf+41ocfEMg8+yHH1FjalugXmmu
 3lf0f0ZA/RFq9C5Ltk/QMAg+zgfCEn3Y7Y++pWuahZXd7haWeYP2Wfms3Pih4duY3dUJ
 eQthTj8cseUGZp2YhrJAXp4J2rD50fOe+N2XHUORVwHZpnPA6jKxFg8fEs4R2IuFde/u
 FRUaMSf1glYtB/AvlXuEqUPPxJ6XWrALgUjTAVffI9gGIpAHMGdFSNCSl7Uqtn+3p8Jn
 nkrakXJWazMltszZKjKkDK7bZAnVRAJmgvvjcQbaCfn66UZ0JWvrgcGF+NHxxRXd98ki
 40aQ==
X-Gm-Message-State: AOAM530XkXiGKrPkh32up5RvVmTZSlM5gVsspM5dibrh5jg6Nech9zQ2
 2DczpedoNTten1FmMV4+8HFZo+WGx+UahzuiRfCqjSZjQd5POeQCuA58XDNWpfABbHIIt1B+JFU
 1GGM6hkWpKZsKzaZyDw==
X-Received: by 2002:a5d:5249:: with SMTP id k9mr84273wrc.327.1643987012451;
 Fri, 04 Feb 2022 07:03:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzm051b+22iBmfbW/URcZpv6W1wuGryAgSXFZfGa6+x9ZD78ksE7LmLFuYwTtG4cCP7Xa0DaQ==
X-Received: by 2002:a5d:5249:: with SMTP id k9mr84258wrc.327.1643987012261;
 Fri, 04 Feb 2022 07:03:32 -0800 (PST)
Received: from [192.168.8.100] (tmo-096-196.customers.d1-online.com.
 [80.187.96.196])
 by smtp.gmail.com with ESMTPSA id p17sm2127606wrf.112.2022.02.04.07.03.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Feb 2022 07:03:31 -0800 (PST)
Message-ID: <13b200a0-7a05-2b2a-04f1-a20a8a2f9389@redhat.com>
Date: Fri, 4 Feb 2022 16:03:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 01/10] hw/tpm: Clean includes
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefan Berger <stefanb@linux.ibm.com>, QEMU Trivial <qemu-trivial@nongnu.org>
References: <20220203193803.45671-1-f4bug@amsat.org>
 <20220203193803.45671-2-f4bug@amsat.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220203193803.45671-2-f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.092,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 04 Feb 2022 15:03:38 -0000

On 03/02/2022 20.37, Philippe Mathieu-Daudé wrote:
> "tpm_ppi.h" only requires to include "exec/memory.h" to get
> the MemoryRegion declaration.
> 
> tpm_ppi.c requires "hw/qdev-core.h" to use the DEVICE() macro,
> tpm_crb.c is the only source file requiring "exec/address-spaces.h".
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   hw/tpm/tpm_crb.c | 1 +
>   hw/tpm/tpm_ppi.c | 4 ++--
>   hw/tpm/tpm_ppi.h | 4 ++--
>   3 files changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/tpm/tpm_crb.c b/hw/tpm/tpm_crb.c
> index 58ebd1469c..aa9c00aad3 100644
> --- a/hw/tpm/tpm_crb.c
> +++ b/hw/tpm/tpm_crb.c
> @@ -18,6 +18,7 @@
>   
>   #include "qemu/module.h"
>   #include "qapi/error.h"
> +#include "exec/address-spaces.h"
>   #include "hw/qdev-properties.h"
>   #include "hw/pci/pci_ids.h"
>   #include "hw/acpi/tpm.h"
> diff --git a/hw/tpm/tpm_ppi.c b/hw/tpm/tpm_ppi.c
> index 274e9aa4b0..6dbb9f41e4 100644
> --- a/hw/tpm/tpm_ppi.c
> +++ b/hw/tpm/tpm_ppi.c
> @@ -14,9 +14,9 @@
>   #include "qemu/osdep.h"
>   
>   #include "qapi/error.h"
> -#include "cpu.h"
>   #include "sysemu/memory_mapping.h"
>   #include "migration/vmstate.h"
> +#include "hw/qdev-core.h"
>   #include "hw/acpi/tpm.h"
>   #include "tpm_ppi.h"
>   #include "trace.h"
> @@ -44,7 +44,7 @@ void tpm_ppi_reset(TPMPPI *tpmppi)
>       }
>   }
>   
> -void tpm_ppi_init(TPMPPI *tpmppi, struct MemoryRegion *m,
> +void tpm_ppi_init(TPMPPI *tpmppi, MemoryRegion *m,
>                     hwaddr addr, Object *obj)
>   {
>       tpmppi->buf = qemu_memalign(qemu_real_host_page_size,
> diff --git a/hw/tpm/tpm_ppi.h b/hw/tpm/tpm_ppi.h
> index 6f773c25a0..bf5d4a300f 100644
> --- a/hw/tpm/tpm_ppi.h
> +++ b/hw/tpm/tpm_ppi.h
> @@ -12,7 +12,7 @@
>   #ifndef TPM_TPM_PPI_H
>   #define TPM_TPM_PPI_H
>   
> -#include "exec/address-spaces.h"
> +#include "exec/memory.h"

I wonder whether a simple "struct MemoryRegion;" forward declaration would 
even be better to avoid nested header inclusion?

>   typedef struct TPMPPI {
>       MemoryRegion ram;
> @@ -29,7 +29,7 @@ typedef struct TPMPPI {
>    * Register the TPM PPI memory region at @addr on the given address
>    * space for the object @obj.
>    **/
> -void tpm_ppi_init(TPMPPI *tpmppi, struct MemoryRegion *m,
> +void tpm_ppi_init(TPMPPI *tpmppi, MemoryRegion *m,
>                     hwaddr addr, Object *obj);
>   
>   /**

Anyway:
Reviewed-by: Thomas Huth <thuth@redhat.com>


