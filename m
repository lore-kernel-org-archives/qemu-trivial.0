Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1m1t23-0003ec-Fr
	for mharc-qemu-trivial@gnu.org; Fri, 09 Jul 2021 12:07:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m1t1z-0003ZN-6Q
 for qemu-trivial@nongnu.org; Fri, 09 Jul 2021 12:07:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46288)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m1t1w-000838-L2
 for qemu-trivial@nongnu.org; Fri, 09 Jul 2021 12:07:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625846827;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ad3d/scraSmbJOI7uknp0NpI9oiuVrMJSDV0f/jFvso=;
 b=Oef9XcMAVfVq+XGJLijSRO2EPwQwtXxWOlf6chVzfFiReG+CHlv5AuMmYPi7rFI279qfKY
 LY4G7OHbIsXrjj8VDjGlsJwkLCK2SZbw7ahp9pEpN/99sLfe/k9UYA7wi65f5GpWdmv9cb
 46n4zd83xLirz6zd3XLuzbMiwhNjwQw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-236-5Lv80hioO7OMCpoCNldGTw-1; Fri, 09 Jul 2021 12:07:06 -0400
X-MC-Unique: 5Lv80hioO7OMCpoCNldGTw-1
Received: by mail-wm1-f71.google.com with SMTP id
 k8-20020a05600c1c88b02901b7134fb829so2169273wms.5
 for <qemu-trivial@nongnu.org>; Fri, 09 Jul 2021 09:07:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ad3d/scraSmbJOI7uknp0NpI9oiuVrMJSDV0f/jFvso=;
 b=VVp4kpVjvqKUg+/4tRIBQh7wGMCpVrsPtCzbgJxo//X5AmEX98C1WjbynSDImUghSe
 4O6eginNaiwmuuvQBjs65ueodnG3nhYvZWOuNNvzXEoic+eGCzuaDBtPkjP4nYDjJ9E7
 1XUTg5X8joB5b2WBCY23R75KmxSWcMETQB+ALnUbiZYIevFzdY/Tj3w5+yB53UHuzdLF
 2jLx0D2akHXSzaY3OvG0vNBxdTcyF/xas9VOvDrt15hHPlq1tTfmMPcskYrVAKCeXD0a
 GqUFiYTZqkfi0ptQdkv6/g+KNtT6pqe55KLETqX6b8tl3wks8h0Iwkc7yfaNqoXm9iqF
 3Jgg==
X-Gm-Message-State: AOAM53190fV+vr4dTluVo/KnNh0yeARgHkCYM6wHj1hIEELsxnrdOLmW
 xrcGqi8P+9TIW2/0FXdG4NSZanPYOG/hllCKAZ6rUjLEiv1PHYfSKMAGmsZoEwhy7wBStKJsGzm
 QVmAFD8Ad1p0hdvjRtA==
X-Received: by 2002:adf:9cc7:: with SMTP id h7mr18292844wre.186.1625846824872; 
 Fri, 09 Jul 2021 09:07:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJytyZZLWk/pI8E5KpxTmSvf/xICdoCxdqp8zysSoqaAt0PkhTyV4EE5aqejzaAntXutu1zHYw==
X-Received: by 2002:adf:9cc7:: with SMTP id h7mr18292808wre.186.1625846824591; 
 Fri, 09 Jul 2021 09:07:04 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id x9sm516133wrm.82.2021.07.09.09.07.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Jul 2021 09:07:04 -0700 (PDT)
Subject: Re: [PATCH] util/guest-random: Fix size arg to tail memcpy
To: Mark Nelson <mdnelson8@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, richard.henderson@linaro.org
References: <20210709120600.11080-1-mdnelson8@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <1df2d93e-5245-0ee3-1b8e-8002d944b64a@redhat.com>
Date: Fri, 9 Jul 2021 18:07:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210709120600.11080-1-mdnelson8@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
X-List-Received-Date: Fri, 09 Jul 2021 16:07:12 -0000

On 7/9/21 2:06 PM, Mark Nelson wrote:
> We know that in the body of this if statement i is less than len, so
> we really should be copying len - i bytes not i - len bytes.
> 
> Fix this typo.
> 

Oops.

Fixes: 8d8404f1564 ("util: Add qemu_guest_getrandom and associated
routines")
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> Signed-off-by: Mark Nelson <mdnelson8@gmail.com>
> ---
>  util/guest-random.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/util/guest-random.c b/util/guest-random.c
> index 086115bd67..23643f86cc 100644
> --- a/util/guest-random.c
> +++ b/util/guest-random.c
> @@ -38,7 +38,7 @@ static int glib_random_bytes(void *buf, size_t len)
>      }
>      if (i < len) {
>          x = g_rand_int(rand);
> -        __builtin_memcpy(buf + i, &x, i - len);
> +        __builtin_memcpy(buf + i, &x, len - i);
>      }
>      return 0;
>  }
> 


