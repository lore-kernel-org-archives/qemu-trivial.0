Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kfdFC-0005pB-Vo
	for mharc-qemu-trivial@gnu.org; Thu, 19 Nov 2020 01:16:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kfdF9-0005oi-Ul
 for qemu-trivial@nongnu.org; Thu, 19 Nov 2020 01:16:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22857)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kfdF7-0000Jp-5E
 for qemu-trivial@nongnu.org; Thu, 19 Nov 2020 01:16:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605766587;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wbHyCtp+i1fvPbHkSGWSGE/0YuWHbPHq6tdTqbkZr/U=;
 b=UrPyjSYZiN3ZhMJd6SEGnW8rCpypu+PcRuWH4DRaBsifzpd2Y1J0NlbezQiXV4RGZP1eJC
 TRbMzovGD6khlKNGAOnaajE6AChumM7MYQYp9SS7nFdtott9wfDpbrtqdOl84wIYVK6dp9
 T+2S5RF0HpU5CsCH3SgfXnsx9EDl+Lg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-579-CRHlddLpMcWWoJ_YEozn1w-1; Thu, 19 Nov 2020 01:16:25 -0500
X-MC-Unique: CRHlddLpMcWWoJ_YEozn1w-1
Received: by mail-wm1-f72.google.com with SMTP id o203so2028223wmo.3
 for <qemu-trivial@nongnu.org>; Wed, 18 Nov 2020 22:16:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wbHyCtp+i1fvPbHkSGWSGE/0YuWHbPHq6tdTqbkZr/U=;
 b=P1aetCOvE3IhkGTFLGB8f7hoLImeWkyBF3ILSeUwzYB/sBgUJUhdsoH5rPLnZOjyAU
 /UJapFTc8bK+vOxHByowE16Zt2qgBtRpzrb63USjgoeNIsUWunKs8kbYyc4sJg1dnPT/
 txeYcwL8NlKQ4SZzNZ9UAC6REkiVx9OKgY5cSGhqvToW/hqWr7NtkG8G8u7fyhckmC/o
 41bMQMhSwJwKmH5y+8vBlKaHbFKK/0p/kKYTI4KmO3Dj2OAHIToa9RyPGANGef49+uLF
 tZHL97lk3mnArhq4Gv1bKuW8MwH5u1o3qjbjm/4d1vaPK+3iwhRfBkxnzOz8lXWJxE4F
 579g==
X-Gm-Message-State: AOAM531gGBZoQnO+3J8Cub24sV4pwaqX4exSt2Xa2UDPDD+Jp1sIXU6G
 C+kUozkobQEQn0fVZr5cXHDAoGGZUksNvw4PMhekzrDCjjILfQOh4C3HbkUu4eEGt26TVWnGA08
 6xjWHql/hzGcAvfBDcA==
X-Received: by 2002:a1c:2645:: with SMTP id m66mr780410wmm.66.1605766584200;
 Wed, 18 Nov 2020 22:16:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx0QAO69GDyg2Y/Hcee9YCbfzyknyVRUInBC5/2y5G9lpVvZ4lFavl3286KscAguUyev5urew==
X-Received: by 2002:a1c:2645:: with SMTP id m66mr780376wmm.66.1605766583886;
 Wed, 18 Nov 2020 22:16:23 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id k16sm38008476wrl.65.2020.11.18.22.16.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Nov 2020 22:16:23 -0800 (PST)
Subject: Re: [PATCH] display/vmware_vga: Fix bad printf format specifiers
To: Alex Chen <alex.chen@huawei.com>, quintela@redhat.com, pbonzini@redhat.com
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org, qemu-devel@nongnu.org, 
 zhang.zhanghailiang@huawei.com
References: <20201119030151.87393-1-alex.chen@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <7eca99aa-54c9-de70-cb72-25cd6f805128@redhat.com>
Date: Thu, 19 Nov 2020 07:16:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201119030151.87393-1-alex.chen@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/19 01:09:21
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
X-List-Received-Date: Thu, 19 Nov 2020 06:16:32 -0000

Hi Alex,

On 11/19/20 4:01 AM, Alex Chen wrote:
> We should use printf format specifier "%u" instead of "%d" for
> argument of type "unsigned int".
> 
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Alex Chen <alex.chen@huawei.com>
> ---
>  hw/display/vmware_vga.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/display/vmware_vga.c b/hw/display/vmware_vga.c
> index bef0d7d69a..f93bbe15c2 100644
> --- a/hw/display/vmware_vga.c
> +++ b/hw/display/vmware_vga.c
> @@ -534,7 +534,7 @@ static inline void vmsvga_cursor_define(struct vmsvga_state_s *s,
>  #endif
>          break;
>      default:
> -        fprintf(stderr, "%s: unhandled bpp %d, using fallback cursor\n",
> +        fprintf(stderr, "%s: unhandled bpp %u, using fallback cursor\n",
>                  __func__, c->bpp);

The format fix is correct, but since you change that line,
"fprintf(stderr)" is old code, nowadays we prefer get rid of it
by using warn_report() in place (see "qemu/error-report.h").

Preferably using warn_report():
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

>          cursor_put(qc);
>          qc = cursor_builtin_left_ptr();
> 


