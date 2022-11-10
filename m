Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ot3BZ-00009P-P5
	for mharc-qemu-trivial@gnu.org; Thu, 10 Nov 2022 03:45:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ot3BP-00006r-Uq
 for qemu-trivial@nongnu.org; Thu, 10 Nov 2022 03:45:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ot3BN-0005p3-Fk
 for qemu-trivial@nongnu.org; Thu, 10 Nov 2022 03:45:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668069908;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vvAg1kNhG4FiNRhilzMHeg0+4jDFDcbXk7nkb9d25Qk=;
 b=Fnc2jrkhRRp1ecfSJ34lhaWcITR6n4+g+mydXDc+KV/j3sxgMKK8Uq0rM4gYZ2Tj1FkF0j
 jQVxDEe6ttmKmrT7ZXSdcA/aKF3hzOeHjhmgqWAZDofY6M2yaHCNpY5I8NqkMlMpXH9Xfn
 IfK5Z0Vh9DneK55ZXIo45o7PhVaLwdE=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-594-KGWMqBqMPuajx58uq2Geyw-1; Thu, 10 Nov 2022 03:45:07 -0500
X-MC-Unique: KGWMqBqMPuajx58uq2Geyw-1
Received: by mail-pj1-f69.google.com with SMTP id
 ci1-20020a17090afc8100b00212e5b4c3afso828276pjb.3
 for <qemu-trivial@nongnu.org>; Thu, 10 Nov 2022 00:45:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:cc:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vvAg1kNhG4FiNRhilzMHeg0+4jDFDcbXk7nkb9d25Qk=;
 b=MVe/3hLxHuw6g3of5uiGsUvM2LtTANP/e77gCv/gcpUXB8KY2bbF2Z9u898HrGNdKj
 3BqzLZIK7lWTI3lRHeiorubwVZtCeUa90QQod/I7VT9R0XdQZ3los4wybd3k098FadDK
 y0waqIVrV+4ln9O/9pcYLxXrYL3sH9WkTz6EU/gQTg2eCFPnUbjpo+HsFPqoN5G7youw
 VFxN+Ng3MkwlYfW6AXt2X0oiYBkswx+daOrop3g/lZepeJp2mulhFogYwDSwDlxLCv7W
 bYnEfEtXLp9tWOthfvpn4SDeYrpWpZ0Uf2Vz6Iy+DjQzbvJ3k6emO5f/o7NYYHgj8gjF
 Ai2g==
X-Gm-Message-State: ACrzQf36XUl+08cWlNDd7deGrMv06jdKi19jBrVpiOj1UNMf1DXi7u8g
 HBmlpaoE614Gi7H3I0gqGNOEWGmLb3xyQeYNEb1aplYXbU9LIS7RnSOl3uj63UUaQyRA4SWlZCB
 1yOxEfImRUM3SEitMdw==
X-Received: by 2002:a17:903:2447:b0:186:e200:6109 with SMTP id
 l7-20020a170903244700b00186e2006109mr64489660pls.104.1668069906505; 
 Thu, 10 Nov 2022 00:45:06 -0800 (PST)
X-Google-Smtp-Source: AMsMyM4SNhd/8cGWcCMZDDUOpkZJ/+GxrlkA7qWduIFeh5UopuwznJZ8vmR/bQJmbfMblux4wiS5Hw==
X-Received: by 2002:a17:903:2447:b0:186:e200:6109 with SMTP id
 l7-20020a170903244700b00186e2006109mr64489650pls.104.1668069906228; 
 Thu, 10 Nov 2022 00:45:06 -0800 (PST)
Received: from [10.33.192.232] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 w7-20020a634747000000b0042b5095b7b4sm8720609pgk.5.2022.11.10.00.45.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Nov 2022 00:45:05 -0800 (PST)
Message-ID: <f6c1e498-7f23-5489-56d7-d1b1b598ef19@redhat.com>
Date: Thu, 10 Nov 2022 09:44:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 4/4] host-libusb: Remove unused variable
To: mrezanin@redhat.com, qemu-devel@nongnu.org
References: <cover.1668009030.git.mrezanin@redhat.com>
 <00df0db69ff9167d38bac81f6d03281955bd861a.1668009030.git.mrezanin@redhat.com>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <00df0db69ff9167d38bac81f6d03281955bd861a.1668009030.git.mrezanin@redhat.com>
X-Mimecast-Spam-Score: 0
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
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
X-List-Received-Date: Thu, 10 Nov 2022 08:45:14 -0000

On 09/11/2022 16.57, mrezanin@redhat.com wrote:
> From: Miroslav Rezanina <mrezanin@redhat.com>
> 
> Variable unconnected used in usb_host_auto_check function is only incremented
> but never read as line where it is read was disabled since introducing the code.
> This causes 'Unused but set variable' warning on Clang 15.0.1 compiler.
> 
> Removing the variable and disabled code to prevent the warning.
> 
> Signed-off-by: Miroslav Rezanina <mrezanin@redhat.com>
> ---
>   hw/usb/host-libusb.c | 15 ---------------
>   1 file changed, 15 deletions(-)
> 
> diff --git a/hw/usb/host-libusb.c b/hw/usb/host-libusb.c
> index 28f8af8941..176868d345 100644
> --- a/hw/usb/host-libusb.c
> +++ b/hw/usb/host-libusb.c
> @@ -1837,7 +1837,6 @@ static void usb_host_auto_check(void *unused)
>       struct USBAutoFilter *f;
>       libusb_device **devs = NULL;
>       struct libusb_device_descriptor ddesc;
> -    int unconnected = 0;
>       int i, n;
>   
>       if (usb_host_init() != 0) {
> @@ -1897,9 +1896,6 @@ static void usb_host_auto_check(void *unused)
>           libusb_free_device_list(devs, 1);
>   
>           QTAILQ_FOREACH(s, &hostdevs, next) {
> -            if (s->dh == NULL) {
> -                unconnected++;
> -            }
>               if (s->seen == 0) {
>                   if (s->dh) {
>                       usb_host_close(s);
> @@ -1908,17 +1904,6 @@ static void usb_host_auto_check(void *unused)
>               }
>               s->seen = 0;
>           }
> -
> -#if 0
> -        if (unconnected == 0) {
> -            /* nothing to watch */
> -            if (usb_auto_timer) {
> -                timer_del(usb_auto_timer);
> -                trace_usb_host_auto_scan_disabled();
> -            }
> -            return;
> -        }
> -#endif
>       }
>   
>       if (!usb_vmstate) {

Reviewed-by: Thomas Huth <thuth@redhat.com>


