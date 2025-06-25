Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uUQIu-0008Ug-KQ
	for mharc-qemu-trivial@gnu.org; Wed, 25 Jun 2025 09:36:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1uUQIl-0008TS-C4
 for qemu-trivial@nongnu.org; Wed, 25 Jun 2025 09:36:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1uUQIg-0000Bt-Ux
 for qemu-trivial@nongnu.org; Wed, 25 Jun 2025 09:36:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1750858588;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=7BCOCbzDm2MeCoHk5tQ3Cz/favCS5gp+hfXzv3pgbN0=;
 b=Q7WYVanfWTia04kEqLmi8UdeBXvamJEgoCifSi+1b1LApaK4Mo6aBRdOVpxvdtTOkWvTH0
 lSkr2jhrk0EbsDs84xmDWZjekrsQOayvlYuRek2T7UO2IpX5LdmjKvddWfEayfNHzTg3Sy
 I+ULi6/Cirrc+ybnWaphszj2SC29Mhg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-534-M6vpyor3MJqLBesYdJJlBg-1; Wed, 25 Jun 2025 09:36:25 -0400
X-MC-Unique: M6vpyor3MJqLBesYdJJlBg-1
X-Mimecast-MFC-AGG-ID: M6vpyor3MJqLBesYdJJlBg_1750858585
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-450eaae2934so55882565e9.2
 for <qemu-trivial@nongnu.org>; Wed, 25 Jun 2025 06:36:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750858584; x=1751463384;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7BCOCbzDm2MeCoHk5tQ3Cz/favCS5gp+hfXzv3pgbN0=;
 b=et5j/Y9jD/bdXiOVKSAn3/5cNx6EyECGJMqhf4rQVssmVXp5uQetB4J+OpVPaeN7xV
 7NmCiBxRIKSyzRUFXF1pRRZ+2ecbUrGYXANTQTihzNr3h1BP4gwmBulJX/myhqPSrRSD
 FLzE6JtTycPQvL5O0roR9eN6MQUP4+g/YqGRmRVDQNb2o59mSpqmFz8EwBQgb+YHBWxX
 WbkBWY7J+fx1oFboqq83SVMW6khwE/a8nPY0afCG4fpabSYKRJSpGytYaT/x+8AlpGJB
 cmj0xl2iyZbAoBVM502Qexl2IIvcRSK837Gr45CTZEC/Cae1uM43ViLK1xpiw8s2JHqD
 D48w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXVk1CbL87h792w2OwvMGW1gNx6tUWjgcbVYTZq/S4sOGb6RKUm0EY7fPm352gixBsmBbtaIGhANgs7u6E=@nongnu.org
X-Gm-Message-State: AOJu0YwsM/4W93bvtyVnjKBHcAAdur468K3O4EEXySZgo8Dnngu8pY0t
 Bexv9ph2Uz0i52KTNkibXedo6xsJuoid3/vBryN+vhunnfUwvBRNUFpjDfmjMCudC94sNzumtPf
 HctzWRgLv/6Yke7BPUx+AreSTrlxHa2onL9ngdwFINGUoW8AWiLpOQTB17Go=
X-Gm-Gg: ASbGncunTJSQd9CuxqERxGXe1nyaQr4wNOjTcNHaPZwOtSzvkvbjPng+vcy6gAoHq/y
 DyS0L7E8c4+/mHwCK6AM8ZXFf8r9l4sCI87MyA2/AbrS+qpw395cXDPMpKnfIG6f7wez9bELlOZ
 Hlgj8Zrl6s/20VHKd+uXMHW5aDBRQcDsnpE/DzyGCEjvh7GQmi7zhQC2BVHMTXpv+xH0sEWNK2M
 3uU7Rcagy+GiihtGhrxDQwc/1ouoMri0zAvc9hFAscbxYmYYT69tvlULcxgKtPF5nOsxUUAR1pH
 YOJ7f2ByEm2VPl6jL/wdRq36XDVOLM+sUjPafYdhsjnO8R8=
X-Received: by 2002:a05:600c:4e8a:b0:450:d3c6:84d8 with SMTP id
 5b1f17b1804b1-45381aaff08mr34050655e9.14.1750858584529; 
 Wed, 25 Jun 2025 06:36:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHuDEs0Of6VUXpQBUnPo+0CdAnZU22Y2LYVV5B6kfRufxinoiutzEZHbJnsaZCrwPXMRz3HvA==
X-Received: by 2002:a05:600c:4e8a:b0:450:d3c6:84d8 with SMTP id
 5b1f17b1804b1-45381aaff08mr34050285e9.14.1750858584086; 
 Wed, 25 Jun 2025 06:36:24 -0700 (PDT)
Received: from [10.33.192.219] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45382349548sm20660475e9.10.2025.06.25.06.36.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Jun 2025 06:36:23 -0700 (PDT)
Message-ID: <0755e5fc-5887-42e6-8400-65418dd4fa96@redhat.com>
Date: Wed, 25 Jun 2025 15:36:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/s390x/ccw-device: Fix memory leak in loadparm setter
To: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
Cc: pasic@linux.ibm.com, borntraeger@linux.ibm.com, farman@linux.ibm.com,
 qemu-s390x@nongnu.org, qemu-trivial@nongnu.org,
 Fabiano Rosas <farosas@suse.de>, Eric Farman <farman@linux.ibm.com>
References: <20250625082751.24896-1-kwolf@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20250625082751.24896-1-kwolf@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: MEESlNec7SY8sCBoaSKESZSIB3HX2YPfuK2yvDHMbN0_1750858585
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
X-List-Received-Date: Wed, 25 Jun 2025 13:36:35 -0000

On 25/06/2025 10.27, Kevin Wolf wrote:
> Commit bdf12f2a fixed the setter for the "loadparm" machine property,
> which gets a string from a visitor, passes it to s390_ipl_fmt_loadparm()
> and then forgot to free it. It left another instance of the same problem
> unfixed in the "loadparm" device property. Fix it.
> 
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>   hw/s390x/ccw-device.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/s390x/ccw-device.c b/hw/s390x/ccw-device.c
> index 19c2238f76..8be1813b9e 100644
> --- a/hw/s390x/ccw-device.c
> +++ b/hw/s390x/ccw-device.c
> @@ -57,7 +57,7 @@ static void ccw_device_set_loadparm(Object *obj, Visitor *v,
>                                    Error **errp)
>   {
>       CcwDevice *dev = CCW_DEVICE(obj);
> -    char *val;
> +    g_autofree char *val = NULL;
>       int index;

I was able to reproduce the leak with a command line like this:

valgrind --trace-children=yes --track-origins=yes --leak-check=full \
  --show-leak-kinds=definite ./qemu-system-s390x -nographic -accel kvm \
   -drive if=none,file=/tmp/disk0.qcow2,format=qcow2,id=drive_image1 \
   -device virtio-blk-ccw,drive="drive_image1",bootindex=0,loadparm=4 \
   -device virtio-scsi-ccw

And I can confirm that your patch fixes the issue, thank you!

Tested-by: Thomas Huth <thuth@redhat.com>

I'll queue it for my next pull request.


