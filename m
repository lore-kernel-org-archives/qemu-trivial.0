Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rfl3c-0004Mz-UF
	for mharc-qemu-trivial@gnu.org; Thu, 29 Feb 2024 13:23:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1rfl3c-0004Mm-25
 for qemu-trivial@nongnu.org; Thu, 29 Feb 2024 13:23:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1rfl3a-0003nF-Gt
 for qemu-trivial@nongnu.org; Thu, 29 Feb 2024 13:22:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709230977;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BpiaHxI+8UQLe1wx09sJpHmjRrfk/I1HJs0jbBlrP0U=;
 b=iB0MSlURpPG+ing8E9DTRVOYCxFpQCIVKRX1qtLGzE9L0VQSOdbjVCfCSGxqj/OK+TzdDL
 4NDHyCeN7jIKuNgMiWfBX4eYAEWpEIgeycxdjW5nYLpjg7sFvw7CZvcpe17Cr4+FY4nPwR
 inHSNKJsuHl0YX66l++UD7lxtSdtovU=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-692-_JmyW8VIOVKTdGnyEbI5oQ-1; Thu, 29 Feb 2024 13:22:56 -0500
X-MC-Unique: _JmyW8VIOVKTdGnyEbI5oQ-1
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6901eddd100so13019676d6.1
 for <qemu-trivial@nongnu.org>; Thu, 29 Feb 2024 10:22:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709230975; x=1709835775;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BpiaHxI+8UQLe1wx09sJpHmjRrfk/I1HJs0jbBlrP0U=;
 b=a7GNmCbYXYePzTjcssX4H4TjYp2hhtoYV6TdNDZekBbDiWcA8GhJnnZM1JXjYqte55
 Cr72T2LhT9t3GXfkfaS0rUf+SOPlJsayCo8K1Vo9ArdUfySzn3k7srJhvBUNb+gnqGSl
 otkEYzHWlUBMmiufxgvmffrkK8zTqLxavQnmMzSAc4ly6lKvB5GggUT7zXaNHXfkqdDp
 COMXqlQ8V5gRJEkMjmCWPV1tFa+c0GbTm03E3eKJZb8xw7+AoVIhabZ5qxWWzydtkyIY
 6U+xzwpVXr0RahwqyO1qGLHoQpR2mouLu6MTaQXD+SyN4AOniOc+s4GILsImf3QIs+0d
 /xYw==
X-Gm-Message-State: AOJu0YzF2odIGDClmEAli1Hs+KsxMoljr+yX+RgA8UioQCSliiUmk63J
 a2mmyGTObXdwr6k80vKtEUyI3Am34fcmEofBIxEXXt+U5kgPU7DLOupfPsSmO6UlJ9f35Kth6Md
 hYVzkRx3da8ubpmpw4rfwf7gZBnkFch52/jpij8Wc3g8IKUuNkbjMyEE=
X-Received: by 2002:ad4:434c:0:b0:68f:dddb:747 with SMTP id
 q12-20020ad4434c000000b0068fdddb0747mr2758507qvs.58.1709230975766; 
 Thu, 29 Feb 2024 10:22:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG2uVWhomefuQzbWaiVVbRZ52Ri44fvLKtGmZJrPNifNLXvW1JhgaHhX2DESIGfSRSaQgQnBA==
X-Received: by 2002:ad4:434c:0:b0:68f:dddb:747 with SMTP id
 q12-20020ad4434c000000b0068fdddb0747mr2758492qvs.58.1709230975521; 
 Thu, 29 Feb 2024 10:22:55 -0800 (PST)
Received: from ?IPV6:2a01:e0a:280:24f0:9db0:474c:ff43:9f5c?
 ([2a01:e0a:280:24f0:9db0:474c:ff43:9f5c])
 by smtp.gmail.com with ESMTPSA id
 qp11-20020a056214598b00b0068fef74fdb3sm994819qvb.59.2024.02.29.10.22.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Feb 2024 10:22:54 -0800 (PST)
Message-ID: <8437091d-a048-4ece-b95d-f9c96d850206@redhat.com>
Date: Thu, 29 Feb 2024 19:22:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/17] hw/vfio/helpers: Fix missing ERRP_GUARD() for
 error_prepend()
To: Zhao Liu <zhao1.liu@linux.intel.com>,
 Markus Armbruster <armbru@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Michael Tokarev <mjt@tls.msk.ru>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Zhao Liu <zhao1.liu@intel.com>,
 Alex Williamson <alex.williamson@redhat.com>
References: <20240229143914.1977550-1-zhao1.liu@linux.intel.com>
 <20240229143914.1977550-8-zhao1.liu@linux.intel.com>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
In-Reply-To: <20240229143914.1977550-8-zhao1.liu@linux.intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.096,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 29 Feb 2024 18:23:00 -0000

On 2/29/24 15:39, Zhao Liu wrote:
> From: Zhao Liu <zhao1.liu@intel.com>
> 
> As the comment in qapi/error, passing @errp to error_prepend() requires
> ERRP_GUARD():
> 
> * = Why, when and how to use ERRP_GUARD() =
> *
> * Without ERRP_GUARD(), use of the @errp parameter is restricted:
> ...
> * - It should not be passed to error_prepend(), error_vprepend() or
> *   error_append_hint(), because that doesn't work with &error_fatal.
> * ERRP_GUARD() lifts these restrictions.
> *
> * To use ERRP_GUARD(), add it right at the beginning of the function.
> * @errp can then be used without worrying about the argument being
> * NULL or &error_fatal.
> 
> ERRP_GUARD() could avoid the case when @errp is the pointer of
> error_fatal, the user can't see this additional information, because
> exit() happens in error_setg earlier than information is added [1].
> 
> In hw/vfio/helpers.c, there're 3 functions passing @errp to
> error_prepend() without ERRP_GUARD():
>   - vfio_set_irq_signaling()
>   - vfio_device_get_name()
>   - vfio_device_set_fd()
> 
> As the widely used helpers, their @errp parameters are so widely sourced
> that it is necessary to protect them with ERRP_GUARD().
> 
> To avoid the issue like [1] said, add missing ERRP_GUARD() at their
> beginning.
> 
> [1]: Issue description in the commit message of commit ae7c80a7bd73
>       ("error: New macro ERRP_GUARD()").
> 
> Cc: Alex Williamson <alex.williamson@redhat.com>
> Cc: "Cédric Le Goater" <clg@redhat.com>
> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>


Reviewed-by: Cédric Le Goater <clg@redhat.com>

Thanks,

C.


> ---
>   hw/vfio/helpers.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/hw/vfio/helpers.c b/hw/vfio/helpers.c
> index 678987080228..47b4096c05ee 100644
> --- a/hw/vfio/helpers.c
> +++ b/hw/vfio/helpers.c
> @@ -110,6 +110,7 @@ static const char *index_to_str(VFIODevice *vbasedev, int index)
>   int vfio_set_irq_signaling(VFIODevice *vbasedev, int index, int subindex,
>                              int action, int fd, Error **errp)
>   {
> +    ERRP_GUARD();
>       struct vfio_irq_set *irq_set;
>       int argsz, ret = 0;
>       const char *name;
> @@ -613,6 +614,7 @@ bool vfio_has_region_cap(VFIODevice *vbasedev, int region, uint16_t cap_type)
>   
>   int vfio_device_get_name(VFIODevice *vbasedev, Error **errp)
>   {
> +    ERRP_GUARD();
>       struct stat st;
>   
>       if (vbasedev->fd < 0) {
> @@ -644,6 +646,7 @@ int vfio_device_get_name(VFIODevice *vbasedev, Error **errp)
>   
>   void vfio_device_set_fd(VFIODevice *vbasedev, const char *str, Error **errp)
>   {
> +    ERRP_GUARD();
>       int fd = monitor_fd_param(monitor_cur(), str, errp);
>   
>       if (fd < 0) {


