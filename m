Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mknCV-00067Y-4f
	for mharc-qemu-trivial@gnu.org; Wed, 10 Nov 2021 07:59:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1mkjqK-0005Et-K6
 for qemu-trivial@nongnu.org; Wed, 10 Nov 2021 04:24:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30019)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1mkjqH-0003Ti-8d
 for qemu-trivial@nongnu.org; Wed, 10 Nov 2021 04:24:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636536268;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SVVGPNEAyVqGYYnxBUr0FKy0AlNi0LQj4Fzcteyyfxk=;
 b=a/8RImMVxVltQzGXYal8DertxscU0B6gDEFTla5mx0AYaO/4dNk8+EgKQNTdLxy4eAibzW
 Og+1Pt9BxgtRYmsC5dGFcYaz3HULlsyddBy0S0fwRVJLslrzlS1XLAmKyqf3bvRufXIYwq
 2EHJOeooM1RsaNVSQKjk+2Dzi0S+jO8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-342-R_hzvJzmNSKoEtzlCCs_vA-1; Wed, 10 Nov 2021 04:24:25 -0500
X-MC-Unique: R_hzvJzmNSKoEtzlCCs_vA-1
Received: by mail-wr1-f71.google.com with SMTP id
 u4-20020a5d4684000000b0017c8c1de97dso267034wrq.16
 for <qemu-trivial@nongnu.org>; Wed, 10 Nov 2021 01:24:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SVVGPNEAyVqGYYnxBUr0FKy0AlNi0LQj4Fzcteyyfxk=;
 b=ap0k+bFVPOC0sXhV3Exa5GLvF8EG+WtmSeKXpDQvSMo8TE9CclbzO0U0iwiq03RItX
 LmMY+LK+44fVXdR5bTFQKSjwPlxOGEIoG75+VbfQvwIsQiJ90rOt8JaHN+HVvEBlrqqF
 IRPeB4YIF78Y1MuHLhGa1HFxBUhP3khAetv4pgx85tkY6FPg/TDE9syIPodEsRHKvGeD
 UQEM01iI/WLWhzcRgV9RysNnKMvIH7lXYxYWaEZjH1lsDHydWS9EV6qS0wjermVA5Ohn
 YhAP8JgFnGRUKdTMdUjrc2cjqyg14lVbZNNNTM3LL9io2uvEkcD3TGRwpwuFLrk47sxi
 EYaQ==
X-Gm-Message-State: AOAM533n6n+7hcbyyZ5EvD4VBkT1v4gR+h7cRfmnNMK24fG/zNOn1wQc
 f8uzMjJHm3E52Y/StTfvVB1h1NgmLLieZsr3YpbLoNXTz7UDYl9ubfpKXMlfkSul2s1ukLWu/eL
 EUSAcy9UR1O275FgQOQ==
X-Received: by 2002:adf:e109:: with SMTP id t9mr17144462wrz.387.1636536264232; 
 Wed, 10 Nov 2021 01:24:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzAtQpgqIQzNixRTEE/0q4OCtHYJse4vp61ois7RztIvg6bes38ghvHwlL7vjDjtsHJV9LZbw==
X-Received: by 2002:adf:e109:: with SMTP id t9mr17144432wrz.387.1636536264009; 
 Wed, 10 Nov 2021 01:24:24 -0800 (PST)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id c5sm19302285wrd.13.2021.11.10.01.24.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Nov 2021 01:24:23 -0800 (PST)
Subject: Re: [PATCH] acpi: tpm: Add missing device identification objects
To: Stefan Berger <stefanb@linux.vnet.ibm.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
Cc: "Michael S . Tsirkin" <mst@redhat.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, Igor Mammedov
 <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 marcandre.lureau@redhat.com, Stefan Berger <stefanb@linux.ibm.com>
References: <20211109004615.993911-1-stefanb@linux.vnet.ibm.com>
From: Eric Auger <eauger@redhat.com>
Message-ID: <4584426c-6bd3-c2f7-74cd-d22b35a2e4f6@redhat.com>
Date: Wed, 10 Nov 2021 10:24:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20211109004615.993911-1-stefanb@linux.vnet.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eauger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eauger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.678, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 10 Nov 2021 07:59:37 -0500
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
X-List-Received-Date: Wed, 10 Nov 2021 09:24:32 -0000

Hi Stefan,

On 11/9/21 1:46 AM, Stefan Berger wrote:
> From: Stefan Berger <stefanb@linux.ibm.com>
> 
> Add missing device identification objects _STR and _UID. They will appear
> as files 'description' and 'uid' under Linux sysfs.
> 
> Cc: Shannon Zhao <shannon.zhaosl@gmail.com>
> Cc: Michael S. Tsirkin <mst@redhat.com>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Cc: Ani Sinha <ani@anisinha.ca>
> Fixes: #708
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric
> Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
> ---
>  hw/arm/virt-acpi-build.c | 1 +
>  hw/i386/acpi-build.c     | 4 ++++
>  2 files changed, 5 insertions(+)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 674f902652..09456424aa 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -228,6 +228,7 @@ static void acpi_dsdt_add_tpm(Aml *scope, VirtMachineState *vms)
>  
>      Aml *dev = aml_device("TPM0");
>      aml_append(dev, aml_name_decl("_HID", aml_string("MSFT0101")));
> +    aml_append(dev, aml_name_decl("_STR", aml_string("TPM 2.0 Device")));
>      aml_append(dev, aml_name_decl("_UID", aml_int(0)));
>  
>      Aml *crs = aml_resource_template();
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index a3ad6abd33..d6d3541407 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -1808,6 +1808,10 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
>                      dev = aml_device("TPM");
>                      aml_append(dev, aml_name_decl("_HID",
>                                                    aml_string("MSFT0101")));
> +                    aml_append(dev,
> +                               aml_name_decl("_STR",
> +                                             aml_string("TPM 2.0 Device")));
> +                    aml_append(dev, aml_name_decl("_UID", aml_int(0)));
>                  } else {
>                      dev = aml_device("ISA.TPM");
>                      aml_append(dev, aml_name_decl("_HID",
> 


