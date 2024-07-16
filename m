Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1sTiSi-0003ni-Tq
	for mharc-qemu-trivial@gnu.org; Tue, 16 Jul 2024 09:43:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1sTiSf-0003bC-Ml
 for qemu-trivial@nongnu.org; Tue, 16 Jul 2024 09:43:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1sTiSc-0007Wu-9K
 for qemu-trivial@nongnu.org; Tue, 16 Jul 2024 09:43:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1721137396;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9psGEOlrWJb8OW0jgIXVgsqkq1DsnpX2JGAGsNa2T1s=;
 b=P6BMprBN6Y7Lo8gKPOAObt/aFCH+jVTl2tN0Az8Bx1dKeKJqjtWeTss3+PIZFfundwjp0g
 9OtfeS7OxuQN4FCKv+YTXIcrlpYl0638N5NEj78fVE+GzyIOFR9MS+dYNkqeNdxeEpWv0J
 iru6tJP8TIQ8ioZ4waNIY5AWLMP6oCg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-690-taCl9UR0MiOdF_1Ss06Nbw-1; Tue, 16 Jul 2024 09:43:13 -0400
X-MC-Unique: taCl9UR0MiOdF_1Ss06Nbw-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-42671a6fb9dso35852395e9.3
 for <qemu-trivial@nongnu.org>; Tue, 16 Jul 2024 06:43:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721137392; x=1721742192;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9psGEOlrWJb8OW0jgIXVgsqkq1DsnpX2JGAGsNa2T1s=;
 b=ex2x9JSqm0OkmzNfp3B2JDP0YVe8PlX//f5vAjeVh3X5v6eyJqmIDrTCUAXvNqCUS9
 ApxO+k5mkal+4EnVYlnZYVmC4VNON7XkLKt1hdLntN17oXfgC1CZ6PgQt+xXzCLFNdeR
 2+soxN7dhOFHLjvNH7BWx1H3JwmC0cHzzEcNqF3DeZuvuc8b/62V3uNIgBI9zCQlBM5c
 OlVu3uq/j+QenIpn3EaPplTMpa5wyYc9wyHmuk7VBzL3rQYDyM9xbIn7WHiCG1u/GKpJ
 HD4vkOtWh3A8ZvnEIKxb56dHIPzl1jA8aqNqiDtKwR8FVJ1cIEcET1ZoUgFVWw9LQ/Bm
 B3RQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCURB0+MkLaokG8B4s7iUwZKF+2MEGGFUBfsdD2VLYZ3shFtiTHSvKl8uo+NOBIZYZFwS1+qEsefdSB6ixfU5RlDa45hj7HsLQ==
X-Gm-Message-State: AOJu0Yz7+CoeZlXVLUKHhcO/RyhMeCrbU8NaYCk5E9o6U8rhS3IBoZU8
 C6KUI+93bIAIL9vI/kMquD2OgsGEL68HsjLfQ6bV7MszaoyvC5qumvY/I0seOfC4iC9ZQNIp2PF
 tBOA7CD+83FSOD9wDXJ6tNvysLjbUb5U5L/DX47w3HyX393n9f19OPPc=
X-Received: by 2002:a05:600c:3d8a:b0:425:7884:6b29 with SMTP id
 5b1f17b1804b1-427ba6991f7mr14098855e9.19.1721137392105; 
 Tue, 16 Jul 2024 06:43:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEsAfXGkMJ8zQpegoBENwNU3dtdua0gCXiFZ4oaGgwkLCQX3A0lW2zz+6wOkOS69MIZ+RCa/g==
X-Received: by 2002:a05:600c:3d8a:b0:425:7884:6b29 with SMTP id
 5b1f17b1804b1-427ba6991f7mr14098715e9.19.1721137391675; 
 Tue, 16 Jul 2024 06:43:11 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:9e2:9000:26c5:842:8baa:576b?
 ([2a01:e0a:9e2:9000:26c5:842:8baa:576b])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4279f2397f7sm164158875e9.9.2024.07.16.06.43.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Jul 2024 06:43:11 -0700 (PDT)
Message-ID: <7a3108f2-6ef4-4fde-8b99-5714bc70ecd5@redhat.com>
Date: Tue, 16 Jul 2024 15:43:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] hw/vfio/container: Get rid of qemu_open_old()
To: Zhao Liu <zhao1.liu@intel.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>
Cc: =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
 Alex Williamson <alex.williamson@redhat.com>
References: <20240715082155.28771-1-zhao1.liu@intel.com>
 <20240715082155.28771-5-zhao1.liu@intel.com>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
In-Reply-To: <20240715082155.28771-5-zhao1.liu@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 16 Jul 2024 13:43:23 -0000

On 7/15/24 10:21, Zhao Liu wrote:
> For qemu_open_old(), osdep.h said:
> 
>> Don't introduce new usage of this function, prefer the following
>> qemu_open/qemu_create that take an "Error **errp".
> 
> So replace qemu_open_old() with qemu_open().
> 
> Cc: Alex Williamson <alex.williamson@redhat.com>
> Cc: "Cédric Le Goater" <clg@redhat.com>
> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>


Reviewed-by: Cédric Le Goater <clg@redhat.com>

Thanks,

C.


> ---
>   hw/vfio/container.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/vfio/container.c b/hw/vfio/container.c
> index 425db1a14c07..38a9df34964a 100644
> --- a/hw/vfio/container.c
> +++ b/hw/vfio/container.c
> @@ -600,9 +600,8 @@ static bool vfio_connect_container(VFIOGroup *group, AddressSpace *as,
>           }
>       }
>   
> -    fd = qemu_open_old("/dev/vfio/vfio", O_RDWR);
> +    fd = qemu_open("/dev/vfio/vfio", O_RDWR, errp);
>       if (fd < 0) {
> -        error_setg_errno(errp, errno, "failed to open /dev/vfio/vfio");
>           goto put_space_exit;
>       }
>   
> @@ -743,9 +742,8 @@ static VFIOGroup *vfio_get_group(int groupid, AddressSpace *as, Error **errp)
>       group = g_malloc0(sizeof(*group));
>   
>       snprintf(path, sizeof(path), "/dev/vfio/%d", groupid);
> -    group->fd = qemu_open_old(path, O_RDWR);
> +    group->fd = qemu_open(path, O_RDWR, errp);
>       if (group->fd < 0) {
> -        error_setg_errno(errp, errno, "failed to open %s", path);
>           goto free_group_exit;
>       }
>   


