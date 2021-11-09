Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mkNB0-00063Y-Ju
	for mharc-qemu-trivial@gnu.org; Tue, 09 Nov 2021 04:12:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mkNAy-00060L-HB
 for qemu-trivial@nongnu.org; Tue, 09 Nov 2021 04:12:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mkNAr-0004wd-3p
 for qemu-trivial@nongnu.org; Tue, 09 Nov 2021 04:12:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636449131;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8CFktBgWCj9eZXIWie4+kNqsmZ3N9hqF/m1Ph5ttOsw=;
 b=f3XPhJ7FW9sMGk+FzwPqGdHG/J2AFWPJM1cuVFCY8wV3iRmSLPi2BZt9rWaOC3vDeoRUWu
 gMZ2IeLN5Z8zJKUry7bpSzN7JPlrwKGY9c6zZrmxHeDDjT91bnhX5HsTEE0sHrvZQXR6w3
 5cPwtK7DtRnenwNd4ab5FIiLDcUbhWY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-170-u4TTsIgcOn6DQUTi5_X38Q-1; Tue, 09 Nov 2021 04:12:08 -0500
X-MC-Unique: u4TTsIgcOn6DQUTi5_X38Q-1
Received: by mail-wr1-f69.google.com with SMTP id
 p17-20020adff211000000b0017b902a7701so4653052wro.19
 for <qemu-trivial@nongnu.org>; Tue, 09 Nov 2021 01:12:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8CFktBgWCj9eZXIWie4+kNqsmZ3N9hqF/m1Ph5ttOsw=;
 b=vHawTUSqp7u2C+v+ccpWQgDrbHXaZ7k2uNZxLHL8cI0Yj1l3JxVbPewkVKWsQUKPJJ
 POeCpLlSx7q91cRkXuKVUIz4dSDdjQcMz1wPpovu5o+4i/C2G+6ZWjUDFbTwgVTn3WRs
 l9kHsoHLQrib9vB97TRJCzQyHNghydMK2Jcym8L68rhJ319zILa60qaXCXLXx+CtFMoG
 nENDSB9kLe3eAFq+6hIkkQvajg4IR9K8F/OQTdZnrBG7ZvoQ/+W/YQMfddKEP5fs+dZo
 kPkP9dkj11s4WKFvEnHUL3mq5XMXut8xvaMFGkY2n/MAAd6FuXKfifK5vYZf/XOPb15T
 555w==
X-Gm-Message-State: AOAM533LSUJkWnj88nBVhexKVpfaNMWQSpVRwr9WN2YVX5FlE2fUEajU
 GLbVxr5wmuzGjehuDmuL040D40eSVu+W+KlaI5PvI8yL7wHVCEAy5sSFlSqBcoPuOsfR5MyUhIF
 QZrq/xum4zg0Et60nqA==
X-Received: by 2002:a7b:c38d:: with SMTP id s13mr5622218wmj.12.1636449126949; 
 Tue, 09 Nov 2021 01:12:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwyfF1837esZYPrp4oTyxO4ZdhVfc2LHJudxiwGcQbhaxElT7ow9F9neDi1Mr1M5/+3wPq+2A==
X-Received: by 2002:a7b:c38d:: with SMTP id s13mr5622191wmj.12.1636449126757; 
 Tue, 09 Nov 2021 01:12:06 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id z11sm19204551wrt.58.2021.11.09.01.12.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Nov 2021 01:12:06 -0800 (PST)
Message-ID: <eae893e0-b808-8d45-1e4c-8f28081d9270@redhat.com>
Date: Tue, 9 Nov 2021 10:12:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] acpi: tpm: Add missing device identification objects
To: Stefan Berger <stefanb@linux.vnet.ibm.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
Cc: "Michael S . Tsirkin" <mst@redhat.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, Igor Mammedov
 <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 marcandre.lureau@redhat.com, Stefan Berger <stefanb@linux.ibm.com>
References: <20211109004615.993911-1-stefanb@linux.vnet.ibm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211109004615.993911-1-stefanb@linux.vnet.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.364, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 09 Nov 2021 09:12:20 -0000

On 11/9/21 01:46, Stefan Berger wrote:
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

https://gitlab.com/qemu-project/qemu/-/issues/708

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


