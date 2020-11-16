Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kef7x-0006zj-MR
	for mharc-qemu-trivial@gnu.org; Mon, 16 Nov 2020 09:05:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kef7u-0006xS-UD
 for qemu-trivial@nongnu.org; Mon, 16 Nov 2020 09:05:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42152)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kef7q-0004vq-SQ
 for qemu-trivial@nongnu.org; Mon, 16 Nov 2020 09:05:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605535497;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Kte5nT7MyDmZySILHZjxxcYGyHAA12w2e/xAe+pB92A=;
 b=cpWxnoZI+AN8kfkW0BVlHfy4xztdR+tfzKyIWUHDCFdrjBrXy14Is6+TKysUv8LLPAWPkI
 6XOnsqvB+mEwbQdiRAz2oooXQfo2ZxEs4uXYy9aRW+avbDBLiPvM4FE1PPW/zB49eTrx08
 8zLHB1nd0b8HNYDYPMJ5kJN6KoP/Htg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-567-YQS4t6GUPUCpL2EtMvtVvg-1; Mon, 16 Nov 2020 09:04:55 -0500
X-MC-Unique: YQS4t6GUPUCpL2EtMvtVvg-1
Received: by mail-wr1-f69.google.com with SMTP id r15so11210030wrn.15
 for <qemu-trivial@nongnu.org>; Mon, 16 Nov 2020 06:04:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Kte5nT7MyDmZySILHZjxxcYGyHAA12w2e/xAe+pB92A=;
 b=XFABvuK43cn2evdvNIokZGT5ub58FPYYDAENsZWNr4561xYdGqM8LBHxq2ClEmSz/D
 jVqFo2agT8oU/IIpjx6hXS7ht4VERjbrSHvE8cvl9OkhPBV2fGxlQKLKBm4NXcYHOXR7
 ldofYkTsCsOTAnVZE/PN9pSgTfSnZDgWpDmHR8c7FN6JOwBzAISX8iEEfZAxbZ6iMUnF
 /zVK1pXRQVLA1wzeW6RUsyEqoan40Yl3YEIvp+OQr+CyFTa9gxkSYWNXZpV7Cel2yEao
 eyKogKySWsoADuoLkp+7YEUPS8TX1xZj4WGhBAloDPePLCc3o78o66rTs9Y6lKV9C3fb
 tPEA==
X-Gm-Message-State: AOAM531q7ysd9DskHEZD6sKcCP4yi4CsN3x4zI+c5/kXn71F3+6vZsWq
 3twDkVP12vpq8OZRxAbw8P1IfrwK3fWxHP6puGar2cx6ka8QMCkx9SKPYh7iLA2NDcMbbIDvsMY
 9kV+Relxkkf/I+fBkBg==
X-Received: by 2002:a5d:414e:: with SMTP id c14mr14229865wrq.256.1605535494237; 
 Mon, 16 Nov 2020 06:04:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwPn+1myQjLrmaMB0TgDpImnkqgdcsZhScIaeKRHavYL+kku1ffKnRk7cJju6CMiUbZ6a5b0A==
X-Received: by 2002:a5d:414e:: with SMTP id c14mr14229809wrq.256.1605535493905; 
 Mon, 16 Nov 2020 06:04:53 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id j8sm19201024wrx.11.2020.11.16.06.04.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Nov 2020 06:04:53 -0800 (PST)
Subject: Re: [PATCH 09/13] u2f-passthru: put it into the 'usb' category
To: Gan Qixin <ganqixin@huawei.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>, thuth@redhat.com
Cc: kuhn.chenqun@huawei.com, zhang.zhanghailiang@huawei.com,
 Gerd Hoffmann <kraxel@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
References: <20201115184903.1292715-1-ganqixin@huawei.com>
 <20201115184903.1292715-10-ganqixin@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <49d4e8e3-7138-18cf-3972-c18e8275d3be@redhat.com>
Date: Mon, 16 Nov 2020 15:04:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201115184903.1292715-10-ganqixin@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/15 22:35:17
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 16 Nov 2020 14:05:04 -0000

On 11/15/20 7:48 PM, Gan Qixin wrote:
> The category of the u2f-passthru device is not set, put it into the 'usb'
> category.

I guess we discussed this with Thomas 1 or 2 years ago
but I don't remember. I think it was about using set_bits()
so devices can appear in multiple categories.

Gerd, do you know what is the point of the "usb" category for
management apps? This is a bus accepting multiple better
categorized devices (display, storage, input, network, sound).

Unrelated but multiple devices are related to SECURITY.
Maybe it is time to introduce the DEVICE_CATEGORY_SECURITY?

> 
> Signed-off-by: Gan Qixin <ganqixin@huawei.com>
> ---
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  hw/usb/u2f-passthru.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/hw/usb/u2f-passthru.c b/hw/usb/u2f-passthru.c
> index ae00e93f35..000822f396 100644
> --- a/hw/usb/u2f-passthru.c
> +++ b/hw/usb/u2f-passthru.c
> @@ -534,6 +534,7 @@ static void u2f_passthru_class_init(ObjectClass *klass, void *data)
>      dc->desc = "QEMU U2F passthrough key";
>      dc->vmsd = &u2f_passthru_vmstate;
>      device_class_set_props(dc, u2f_passthru_properties);
> +    set_bit(DEVICE_CATEGORY_USB, dc->categories);
>  }
>  
>  static const TypeInfo u2f_key_passthru_info = {
> 


