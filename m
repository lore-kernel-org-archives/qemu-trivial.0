Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pPSZ2-0008HZ-72
	for mharc-qemu-trivial@gnu.org; Tue, 07 Feb 2023 13:19:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pPSZ0-0008G8-PS
 for qemu-trivial@nongnu.org; Tue, 07 Feb 2023 13:19:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pPSYy-0003sI-9Q
 for qemu-trivial@nongnu.org; Tue, 07 Feb 2023 13:19:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675793964;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3tlJvyIkHw+kEqypg/oUPCMuZ9Qrp54A/XQNKtZFujs=;
 b=Z83q7aLKtCf2N8eJEcbKxV103hDIBwPUt5JS6hcWFYyx2uF7ruu9AR3G6merPdXxwyDrWO
 TVnCcU5GZGQw/ILf9PobeR6ztZCMGBOtEIqxS0j4vAhfELBhx1Z07eUSk2bTD3kFcsJ/PQ
 H6BpDaGBJ0DzjHvQHaMl496Kqft7Pts=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-203-Z32M51DdMbeb1N7KhuB80w-1; Tue, 07 Feb 2023 13:19:22 -0500
X-MC-Unique: Z32M51DdMbeb1N7KhuB80w-1
Received: by mail-qt1-f200.google.com with SMTP id
 c14-20020ac87d8e000000b003ba2d72f98aso3135563qtd.10
 for <qemu-trivial@nongnu.org>; Tue, 07 Feb 2023 10:19:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3tlJvyIkHw+kEqypg/oUPCMuZ9Qrp54A/XQNKtZFujs=;
 b=CFzlhvUHuyV8xnH89NlU1InaLrT8swn/HFCgBoV5wmvYwQcUHf0LNqhHR3EnH2yJ6o
 Bohxg63gDwmRfUYHOgqfbZKltmdfH+949apPgx449TR6dltoo+AOBYXgRrFNf6priJad
 hAB/mKDvajAKipRj8sn/7eLCMdE+VtfbAj+vi9sAt4iwZar/gM+NRQAS4AlPSl2mrnrS
 d6ebcTJDVyOvY8oHhrKZlIdsSvkgKB9whKRl8l8AkCBPfSC5v8wcm+jqcBy+07GhyIi1
 w5ZdesNGsQYWO9uichLe+a12MF5z32BReKBuU6obXpvEiJNWXFYuUCjyBd5Gu50Zy2My
 0/Ww==
X-Gm-Message-State: AO0yUKVYjp2Fa1/oPxCgGc0YItvlV8EUT1+fCipx9P10MIctMqDMViKx
 G3+xLoNhpUGXYdDteABrpTitYYrV6pM+ke4p5Q0QFC3dPCobf8AZ46zT66Nzf7NtEnpNzoq66Nl
 MNaixOWffJDt7OCfEDw==
X-Received: by 2002:ac8:5949:0:b0:3b8:41f4:94e7 with SMTP id
 9-20020ac85949000000b003b841f494e7mr6717851qtz.17.1675793962414; 
 Tue, 07 Feb 2023 10:19:22 -0800 (PST)
X-Google-Smtp-Source: AK7set+dWkZol/kIpYW50sCKofOw6LibcxfL+GBEZ22FbNeKjulQ2k/PSz5b5xW4PkQpd7ZxoUn2Vw==
X-Received: by 2002:ac8:5949:0:b0:3b8:41f4:94e7 with SMTP id
 9-20020ac85949000000b003b841f494e7mr6717828qtz.17.1675793962204; 
 Tue, 07 Feb 2023 10:19:22 -0800 (PST)
Received: from [192.168.8.105] (tmo-099-228.customers.d1-online.com.
 [80.187.99.228]) by smtp.gmail.com with ESMTPSA id
 m3-20020ac807c3000000b003b848759ed8sm9799703qth.47.2023.02.07.10.19.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Feb 2023 10:19:21 -0800 (PST)
Message-ID: <6c5029a9-4832-fb7f-7dd4-eab81fe50a4b@redhat.com>
Date: Tue, 7 Feb 2023 19:19:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 05/10] hw/arm: Select VIRTIO_NET for virt machine
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 QEMU Trivial <qemu-trivial@nongnu.org>
References: <20230206140809.26028-1-farosas@suse.de>
 <20230206140809.26028-6-farosas@suse.de>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230206140809.26028-6-farosas@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.148, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
X-List-Received-Date: Tue, 07 Feb 2023 18:19:31 -0000

On 06/02/2023 15.08, Fabiano Rosas wrote:
> The 'virt' machine uses virtio-net-pci as a fallback when no other
> network driver has been selected via command line. Select VIRTIO_NET
> and VIRTIO_PCI from CONFIG_ARM_VIRT to avoid errors when PCI_DEVICES=n
> (due to e.g. --without-default-devices):
> 
> $ ./qemu-system-aarch64 -M virt -accel tcg -cpu max
> qemu-system-aarch64: Unsupported NIC model: virtio-net-pci
> 
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> ---
>   hw/arm/Kconfig | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index 2d157de9b8..8dcc08b7ec 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -31,6 +31,8 @@ config ARM_VIRT
>       select VIRTIO_MEM_SUPPORTED
>       select ACPI_CXL
>       select ACPI_HMAT
> +    select VIRTIO_PCI
> +    select VIRTIO_NET

Reviewed-by: Thomas Huth <thuth@redhat.com>


