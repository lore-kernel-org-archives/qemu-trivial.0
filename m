Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kZVxX-00048L-5B
	for mharc-qemu-trivial@gnu.org; Mon, 02 Nov 2020 04:17:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kZVxV-00047K-EA
 for qemu-trivial@nongnu.org; Mon, 02 Nov 2020 04:17:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kZVxT-0003T3-7Z
 for qemu-trivial@nongnu.org; Mon, 02 Nov 2020 04:17:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604308617;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iQMV9ZvxKIX641YFiRMCZuHjmOkgGNDRjq3GRDWw8Io=;
 b=i/wiRKMFgR6rBUlNQpN+QwKgiJ4gnUnXTYhHAQe2KuOWO3wIEcIIsamhKxSLhDTjTmY8U/
 oQ3UWtM/zbYxUWzJgodRnE+Swhig9y+pXrQ6jxsaOrcsJeMX1UDjTPFVJVpHyU5OlRQS/T
 4I5SpCE4gm6wBktdZTBC3WwKaPdKyZA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-46-4E0C-cLZM-y-TNM0Wz4bZQ-1; Mon, 02 Nov 2020 04:16:56 -0500
X-MC-Unique: 4E0C-cLZM-y-TNM0Wz4bZQ-1
Received: by mail-wr1-f69.google.com with SMTP id 31so6166744wrg.12
 for <qemu-trivial@nongnu.org>; Mon, 02 Nov 2020 01:16:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iQMV9ZvxKIX641YFiRMCZuHjmOkgGNDRjq3GRDWw8Io=;
 b=eibN+wVPav3vtUSh+iS0eYlHZR3V0SEdurjoJSP4a5s6D8zSOY/qfNMX3AxDpUrGMl
 MuOlWpWzb4MCiUx3cWhxXzFb4GzSEaugm646GjchpwAcT2iJCJjFmNZI1nqQLWTsLrJ1
 T34U1kzYzqEXRb6yttVlQwZ8H37O7yoeOqJ2telpC7lZkl9E9HuCVlIkuDBzrsWLLk+w
 IHsHMWdBBj/LiRD8cTI5GBxnVmvN/XB1KeA2ZYnwFGkdZAnyI84i19eZvP+cDg29znfI
 vya1FR+DF83nPBJIF9VrVk2Mx98F6kFJIA+9WXXemvVJlT1SSrkUflByKTojyxGyh8U2
 oTqA==
X-Gm-Message-State: AOAM530yvkakzSE5K8OAWrXJmxA3qWeN3Yo8vTsZDnu6UiskPjDojJUh
 a/P8cNFM4UVBdxDg61U5tcAsL+yrrCZYqrMY1dJdo39FDObSQLlPl2Q+4Uo/m3MhwRXZKMsalZu
 ngZAwemlOjFJihIxENw==
X-Received: by 2002:adf:fc07:: with SMTP id i7mr13825594wrr.223.1604308614960; 
 Mon, 02 Nov 2020 01:16:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwxP6IpcuGBA2LvpCKTqvxgRbfd3CD8LYHJ0CSLFbh3ysVvJa5VFdpTRsej9uV8BtFKd/rFpA==
X-Received: by 2002:adf:fc07:: with SMTP id i7mr13825565wrr.223.1604308614699; 
 Mon, 02 Nov 2020 01:16:54 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id f7sm22434871wrx.64.2020.11.02.01.16.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Nov 2020 01:16:53 -0800 (PST)
Subject: Re: [PATCH V2] hw/display/exynos4210_fimd: Fix potential NULL pointer
 dereference
To: AlexChen <alex.chen@huawei.com>, Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU <qemu-devel@nongnu.org>, zhang.zhanghailiang@huawei.com
References: <5F9F8D88.9030102@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <b2945df0-186e-e670-bdfc-34104d8ddf2c@redhat.com>
Date: Mon, 2 Nov 2020 10:16:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <5F9F8D88.9030102@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/02 03:02:24
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Mon, 02 Nov 2020 09:17:01 -0000

On 11/2/20 5:39 AM, AlexChen wrote:
> In exynos4210_fimd_update(), the pointer s is dereferinced before

Typo dereferinced -> dereferenced.

> being check if it is valid, which may lead to NULL pointer dereference.
> So move the assignment to global_width after checking that the s is valid.

Easier to read "after checking 's' is valid."

> 
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Alex Chen <alex.chen@huawei.com>
> ---
>  hw/display/exynos4210_fimd.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


