Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mGFeo-0003IU-Ce
	for mharc-qemu-trivial@gnu.org; Wed, 18 Aug 2021 03:06:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mGFef-0003Fa-Up
 for qemu-trivial@nongnu.org; Wed, 18 Aug 2021 03:06:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59978)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mGFeZ-0005xT-HY
 for qemu-trivial@nongnu.org; Wed, 18 Aug 2021 03:06:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629270382;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A04eg1/ILTQ+zdDNR8lxr6kc1NxhWRJQ6/sPwFmmXsg=;
 b=e5WCL56yJMP+rZt4hO3WwEVbsJGyYBisOUSk4aX3NdL30a99TdJGdP4M5e1aPd//WmYxPj
 96FXpgjVoNyjcYxKPjROWqzME7fXtjqxBOaOwxjEiOEXmsh+vN18LnyzGixLXT7JxERyTB
 J9xOPqYY5Bm1C9wa/gwoeLdh7NUnPzs=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-296-P96m1TyQMPWLF1r52vFbHA-1; Wed, 18 Aug 2021 03:06:18 -0400
X-MC-Unique: P96m1TyQMPWLF1r52vFbHA-1
Received: by mail-ej1-f71.google.com with SMTP id
 v3-20020a1709063383b02905b4d1d1e27cso498847eja.19
 for <qemu-trivial@nongnu.org>; Wed, 18 Aug 2021 00:06:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=A04eg1/ILTQ+zdDNR8lxr6kc1NxhWRJQ6/sPwFmmXsg=;
 b=ohcSahFMwmC5a5e0fcRH4pQngVp0xt+EgdsjGSZNCJYYc/EXUU8mJ6mHtL+Fvn6/fF
 kvwK1Mh8WKC4qcKwwSOQ+cw79KuRtVl9cJ+YgG8LMzMBIj9FMOmoFHwKSq9pkIz5rNiI
 5bpca4ZfWevRRIGF7z5iEPNhw4KkiZuOT1tzVrw57SIHAw0/4Ib1O5DvWaJijEfe1Yfw
 gX/F6VCGNW/PgUq6zpyVRrD43M36qh0SG03fFawNLs48GwwP0G1ktI/Dm5XarYoryN8I
 IYfRv2c79IA3wmzt89hSdHDG6EUMoK6hk6x+imS/eq5CeJTle90SAYK4VMP+cmMWPPQD
 hZyw==
X-Gm-Message-State: AOAM532cCwGmh/Sr15n+w3Z3wZcmQPcFefSqk6XJHls71JEmbAXbW4et
 pXhYkcoAKD4V6P37e+8gUitduwp2pUkQ/YUEEUFpR5fYDJqHpTqHIiPFSZ6ZxHuQCbpbR+UFLdi
 TwN7Qs1HiiDKYAdK8BQ==
X-Received: by 2002:a17:906:2813:: with SMTP id
 r19mr8273205ejc.150.1629270376838; 
 Wed, 18 Aug 2021 00:06:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxSwz6qXKmKwrtnBp4pvw6ANKiNTlUz4bsFHRgXlPOkdov+23DwKaSWUNErNCRdUEBCNxNbDA==
X-Received: by 2002:a17:906:2813:: with SMTP id
 r19mr8273177ejc.150.1629270376540; 
 Wed, 18 Aug 2021 00:06:16 -0700 (PDT)
Received: from thuth.remote.csb (pd9e83070.dip0.t-ipconnect.de.
 [217.232.48.112])
 by smtp.gmail.com with ESMTPSA id m18sm2096254edr.18.2021.08.18.00.06.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Aug 2021 00:06:16 -0700 (PDT)
Subject: Re: [PATCH v4] vga: don't abort when adding a duplicate isa-vga device
To: "Jose R. Ziviani" <jziviani@suse.de>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, philmd@redhat.com, kraxel@redhat.com,
 mark.cave-ayland@ilande.co.uk
References: <20210817192629.12755-1-jziviani@suse.de>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <0976e5be-8720-60e2-9f17-e2ae63249041@redhat.com>
Date: Wed, 18 Aug 2021 09:06:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210817192629.12755-1-jziviani@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.961, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 18 Aug 2021 07:06:31 -0000

On 17/08/2021 21.26, Jose R. Ziviani wrote:
> If users try to add an isa-vga device that was already registered,
> still in command line, qemu will crash:
> 
> $ qemu-system-mips64el -M pica61 -device isa-vga
> RAMBlock "vga.vram" already registered, abort!
> Aborted (core dumped)
> 
> That particular board registers the device automaticaly, so it's
> not obvious that a VGA device already exists. This patch changes
> this behavior by displaying a message and exiting without crashing.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/44
> Signed-off-by: Jose R. Ziviani <jziviani@suse.de>
> ---
> v3 to v4: Used object_resolve_path_type instead of qemu_ram_block_by_name
>            and copied the message from virgl, to give the same user exp.
> v2 to v3: Improved error message
> v1 to v2: Use error_setg instead of error_report
> 
>   hw/display/vga-isa.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/hw/display/vga-isa.c b/hw/display/vga-isa.c
> index 90851e730b..8cea84f2be 100644
> --- a/hw/display/vga-isa.c
> +++ b/hw/display/vga-isa.c
> @@ -33,6 +33,7 @@
>   #include "hw/loader.h"
>   #include "hw/qdev-properties.h"
>   #include "qom/object.h"
> +#include "qapi/error.h"
>   
>   #define TYPE_ISA_VGA "isa-vga"
>   OBJECT_DECLARE_SIMPLE_TYPE(ISAVGAState, ISA_VGA)
> @@ -61,6 +62,15 @@ static void vga_isa_realizefn(DeviceState *dev, Error **errp)
>       MemoryRegion *vga_io_memory;
>       const MemoryRegionPortio *vga_ports, *vbe_ports;
>   
> +    /*
> +     * make sure this device is not being added twice, if so
> +     * exit without crashing qemu
> +     */
> +    if (object_resolve_path_type("", TYPE_ISA_VGA, NULL)) {
> +        error_setg(errp, "at most one %s device is permitted", TYPE_ISA_VGA);
> +        return;
> +    }
> +
>       s->global_vmstate = true;
>       vga_common_init(s, OBJECT(dev));
>       s->legacy_address_space = isa_address_space(isadev);
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


