Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lb1sV-0001NZ-BG
	for mharc-qemu-trivial@gnu.org; Mon, 26 Apr 2021 10:06:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lb1sU-0001NP-GD
 for qemu-trivial@nongnu.org; Mon, 26 Apr 2021 10:06:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20533)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lb1sR-0005qJ-OL
 for qemu-trivial@nongnu.org; Mon, 26 Apr 2021 10:06:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619445978;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vxaX7w5P9mVOxpVbfKSgieoj/iDSR4kJWx0mVNfzgWs=;
 b=Tv1XHwBVkqgCfsqoTTZRpZrnMrBNF9WBdJzZknPGX2Y8TVDr0HMZSKbYvnCmeq8019wvnq
 2C4yGcmBQa7Pk9W97FmV7GGGoMpYgIpajV06ZL1CUK5Eptu3iBI1IaWVL8dbSimuQ9ZbiN
 /+rm/6TtqvqjeJUeD6CS+mkE9iUYLVw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-603-ECHnnWNWOHKBqQY6cFeJwA-1; Mon, 26 Apr 2021 10:06:15 -0400
X-MC-Unique: ECHnnWNWOHKBqQY6cFeJwA-1
Received: by mail-wm1-f69.google.com with SMTP id
 g199-20020a1c9dd00000b02901355dd71edaso3110288wme.7
 for <qemu-trivial@nongnu.org>; Mon, 26 Apr 2021 07:06:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vxaX7w5P9mVOxpVbfKSgieoj/iDSR4kJWx0mVNfzgWs=;
 b=BFmVzEAWyxcaaZ8KhUPMU1PA+UWhNnhpzz3X10Wty7DpR+RZfMX0gTxS+RQ+CvI2+9
 ThEEPcUOoGTbbdc6nnb7HwuPMS7hqUn7utZux9g/42DDC+m7QzAPg2Iv1dpDQ3bdPVjm
 hjMI8zvwVHCu9TfNCrkMWK9YMVCUfbgzArb6NQ8g1+16XUFu/KHerlPVndfY/Q89D9hT
 4B9ZXzwuSCdf69vBl61dfYX5aj6E4X5oQG5ZEa1bUV7zRcuydN6XbHUjgqn3CicIzMut
 tdd2gwlS1wjKcNMNSLPpk4yhzpWWc8hNRft8MZYutGNHBl3cLZQmIArPXBghhpa7Lqpc
 WjrA==
X-Gm-Message-State: AOAM530RMe4D7GziyTs8ixl8sICvGNktKqWiahcOXZHNhovE5+/hSif0
 tXHfRuTE61riidVDDTarg7Go+PhQ4OAZ38tdyNVlSoy/7y/1uhao4BdjghohjBvXtBt1LG1OmbA
 ZmtEfyVGVeCXVahgPTw==
X-Received: by 2002:a1c:720d:: with SMTP id n13mr20328497wmc.89.1619445974703; 
 Mon, 26 Apr 2021 07:06:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxkzzoqhrK1PJuOCUmnmfmq+1jU0YO/URoqWzvOWgkA+QHeV7JcaFNo6EWwY+2yWIe3t5ydfQ==
X-Received: by 2002:a1c:720d:: with SMTP id n13mr20328472wmc.89.1619445974427; 
 Mon, 26 Apr 2021 07:06:14 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id q19sm20482226wmc.44.2021.04.26.07.06.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Apr 2021 07:06:13 -0700 (PDT)
Subject: Re: [PATCH] cutils: Fix memleak in get_relocated_path()
To: Zhenzhong Duan <zhenzhong.duan@intel.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com,
 Stefano Garzarella <sgarzare@redhat.com>
References: <20210426223042.119554-1-zhenzhong.duan@intel.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <0cf13eb3-e28b-31d4-82d1-d99636cbcaf9@redhat.com>
Date: Mon, 26 Apr 2021 16:06:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210426223042.119554-1-zhenzhong.duan@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.219,
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
X-List-Received-Date: Mon, 26 Apr 2021 14:06:22 -0000

Hi,

On 4/27/21 12:30 AM, Zhenzhong Duan wrote:
> Valgrind complains definitely loss in get_relocated_path(), because
> GString is leaked in get_relocated_path() when returning with gchar *.
> Use g_string_free(, false) to free GString while preserving gchar *.
> 
> Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
> ---
>  util/cutils.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/util/cutils.c b/util/cutils.c
> index ee908486da..f58c2157d2 100644
> --- a/util/cutils.c
> +++ b/util/cutils.c
> @@ -1055,5 +1055,5 @@ char *get_relocated_path(const char *dir)
>          assert(G_IS_DIR_SEPARATOR(dir[-1]));
>          g_string_append(result, dir - 1);
>      }
> -    return result->str;
> +    return g_string_free(result, FALSE);
>  }
> 

Thanks for your patch, but Stefano sent the same fix 2 weeks ago:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg798279.html

It should be merged once the development tree opens again (we are
now 'freezed' before the v6.0.0 release).

You might want to send your Review-by or Tested-by tag to Stefano's
patch.

Regards,

Phil.


