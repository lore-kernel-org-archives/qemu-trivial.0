Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ip2Gq-00022E-7H
	for mharc-qemu-trivial@gnu.org; Tue, 07 Jan 2020 22:44:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47403)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1ip2Go-0001z5-5p
 for qemu-trivial@nongnu.org; Tue, 07 Jan 2020 22:44:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1ip2Gm-0001Uv-5W
 for qemu-trivial@nongnu.org; Tue, 07 Jan 2020 22:44:33 -0500
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:44276)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1ip2Gl-0001TC-UV
 for qemu-trivial@nongnu.org; Tue, 07 Jan 2020 22:44:32 -0500
Received: by mail-pl1-x644.google.com with SMTP id az3so533124plb.11
 for <qemu-trivial@nongnu.org>; Tue, 07 Jan 2020 19:44:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=t9nsho0Y4J3wU6LI4fcqMlN7D6a6PFi25xdf9ScGT/s=;
 b=ydW1ICm4QmEBVlMm9uu9G704okVm2bGGtE05iQRs7PEcuPSbgEcuEa8IXlP8/GS1Yb
 2BhnzvP8RwBgvgMbzxWltQNq+1Rd25oFo7bcOabF4awl5g2lX3r3C+Se2B8vo0j6qN5q
 L+XplDC5lvk9N9FBBiRxiknS91v4BYhaZt96l0sGD+/qyfnTublUMYm9c9gKZ/stY2G+
 PNBdQAZ0v9AzHYWfr2NBh43ZiP5RFfHCOKQRQ5BC4wKY1VMW87Xg0nhPZK+hvfdHNjjW
 CxvtxFYqMM07nVY+Pbk8MR2DONvYXOpLrEqaU1MH6oFlBJ1uA8z9LaWsaSPzdFd7VK7A
 QRaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=t9nsho0Y4J3wU6LI4fcqMlN7D6a6PFi25xdf9ScGT/s=;
 b=DQjscuJJmEb3jiLv2VSlhAYbhjFK3X2pwaWeiCwaECTTWzj7HFuh2t5H/cHXOhNP4b
 UlZWHswsiv/5a3U2eIts6v/JGcCU1+mA/DQPe9TvRuabWWU8qqp5dSfc434/R6nG3J4J
 5WgD0q11poMF7rPEM4u7vKz030ENkqFXg1ScUxYtsDEbukVgdFl/rF7LUuANPmNgCRmv
 pZz2kMf97Y6nrG1SGFlqz+PeC5epnUVOUqy0SJ7oBu/QUP1oqpmGIYXDagZaIOpcStuZ
 +83lxeRDMbMe+UF6K3/OVYniBre+7oz2xWQYi/8UWtge0hVOQVo1bm0M87060ZtZmnfb
 dXeQ==
X-Gm-Message-State: APjAAAVaF9mdRJYaI7pVTj4/ordvXKXYEBjI7AkyooV5JyOTTjMqqaJb
 TU+Ap7s2blfse0NOtWOufzSdEw==
X-Google-Smtp-Source: APXvYqyvQLIbI/uDDoS3sAPsl1GQVMKUw8wdunn8lOO3UUFOef8j6mPhwG6Hvg6WYYOloRYjpWo0lQ==
X-Received: by 2002:a17:902:59cd:: with SMTP id
 d13mr3274960plj.146.1578455070625; 
 Tue, 07 Jan 2020 19:44:30 -0800 (PST)
Received: from [192.168.15.12] (alanje.lnk.telstra.net. [120.151.179.201])
 by smtp.gmail.com with ESMTPSA id j9sm1124255pff.6.2020.01.07.19.44.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jan 2020 19:44:29 -0800 (PST)
Subject: Re: [PATCH v2] nbd: fix uninitialized variable warning
To: pannengyuan@huawei.com, eblake@redhat.com
Cc: zhang.zhanghailiang@huawei.com, qemu-block@nongnu.org,
 qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
 Euler Robot <euler.robot@huawei.com>
References: <20200108025132.46956-1-pannengyuan@huawei.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f26f8785-9523-c37a-17bf-74c65faac85d@linaro.org>
Date: Wed, 8 Jan 2020 13:44:24 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200108025132.46956-1-pannengyuan@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::644
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
X-List-Received-Date: Wed, 08 Jan 2020 03:44:35 -0000

On 1/8/20 12:51 PM, pannengyuan@huawei.com wrote:
> From: Pan Nengyuan <pannengyuan@huawei.com>
> 
> Fixes:
> /mnt/sdb/qemu/nbd/server.c: In function 'nbd_handle_request':
> /mnt/sdb/qemu/nbd/server.c:2313:9: error: 'ret' may be used uninitialized in this function [-Werror=maybe-uninitialized]
>      int ret;
> 
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Pan Nengyuan <pannengyuan@huawei.com>
> ---
> Changes v2 to v1:
> - change 'if(client->export_meta.bitmap)' into 'else' to fix uninitialized warning and clean up pointless code (suggested by Eric Blake)
> ---
>  nbd/server.c | 10 +---------
>  1 file changed, 1 insertion(+), 9 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

