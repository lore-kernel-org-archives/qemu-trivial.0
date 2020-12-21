Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1krLCN-0004yy-UE
	for mharc-qemu-trivial@gnu.org; Mon, 21 Dec 2020 08:26:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1krLCB-0004xR-Lk
 for qemu-trivial@nongnu.org; Mon, 21 Dec 2020 08:25:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:29912)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1krLC6-000575-R6
 for qemu-trivial@nongnu.org; Mon, 21 Dec 2020 08:25:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608557145;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P+lPXiAL1rTSS5/AHiHxE3G6s4PPGu7F7Esp739Z0X0=;
 b=PmXTBDH8CLo0NzH2DfE+U5asg73Efw4qlf+b5L6qw18GeS5RyEj3AO4yfUHuFrEaR1mhea
 YJRB7FfaXedZHrMBpp5uUQVkFVicybSu2djolv7Kwr0evHFR6oyQ2c8Azs1p+56seBlo0i
 9gz4Tz3ABNF7eFKvckMWHP48EV3udqE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-296-Uwj5CsBIN-yPnoy2pjoOgg-1; Mon, 21 Dec 2020 08:25:44 -0500
X-MC-Unique: Uwj5CsBIN-yPnoy2pjoOgg-1
Received: by mail-wr1-f72.google.com with SMTP id o17so8562667wra.8
 for <qemu-trivial@nongnu.org>; Mon, 21 Dec 2020 05:25:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=P+lPXiAL1rTSS5/AHiHxE3G6s4PPGu7F7Esp739Z0X0=;
 b=bArkRvCl9iPddG0aJPV3ZsatokmejM+fIsrb9KTP5tsW4mtQpuPm3P2uwrIVX3OhA7
 sdySLoxXRBKmWZ9VLFJdljV9hKknaOXMsQB26m/Gn7A7Ns8Ws7NZio1izjY7TKt3IRz0
 kyq4fQ8LC8BVj3VU6y7p/HyZW93GnpvBDJqpZ65ido6/C8qceg+6rcWTnmHfCAV6vllm
 HGF7u8Pc8ZHx+madleCAwcyJq7AKOIYTUYbKXkDjuUgz4k5/f+CiCVjFibfqdXO9A9Gf
 12qI9JHejqQwU7HDqBiJtUt2VpuyUHb2r3RDPFz9Wo0OtNX9ovaWg5+r5/hgzBAtZdE/
 BdUw==
X-Gm-Message-State: AOAM532nYQgPO09chsMxeKXHpvugaX3WPFH8qMyfX3bVtQO9E2Ej5Bj5
 eBWFJGjI9k0sP13vyMTvoIZSthdpbD4vywLhFYwbB9K/V2MoFfYJYPZO4/5hebIig7I8TX+whLG
 57tuM7u/HGxbDS9ux3LDDD2AlZ9K/AtX3dpc+gMxvWh+Shwu8JD9frZfha4mqCeSQ6hojiw==
X-Received: by 2002:a1c:5fd4:: with SMTP id t203mr16129274wmb.15.1608557142330; 
 Mon, 21 Dec 2020 05:25:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwS4zdbPIJuttgyVd890lszMc0dQ64yf3/RVbnjEILkCcWMKHt6/o62at+CoZnkm06RTTpxIg==
X-Received: by 2002:a1c:5fd4:: with SMTP id t203mr16129243wmb.15.1608557141995; 
 Mon, 21 Dec 2020 05:25:41 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id i16sm26247035wrx.89.2020.12.21.05.25.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Dec 2020 05:25:41 -0800 (PST)
Subject: Re: [PATCH] Docs/RCU: Correct sample code of qatomic_rcu_set
To: Keqian Zhu <zhukeqian1@huawei.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jones <drjones@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 wanghaibin.wang@huawei.com, "qemu-trivial@nongnu.org"
 <qemu-trivial@nongnu.org>
References: <20201221121745.27156-1-zhukeqian1@huawei.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <2acdeb6f-6763-7332-e3f2-6d9cf9acf5ae@redhat.com>
Date: Mon, 21 Dec 2020 14:25:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201221121745.27156-1-zhukeqian1@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.233, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
X-List-Received-Date: Mon, 21 Dec 2020 13:25:58 -0000

On 21/12/20 13:17, Keqian Zhu wrote:
> Correct sample code to avoid confusing readers.
> 
> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
> ---
>   docs/devel/rcu.txt | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/docs/devel/rcu.txt b/docs/devel/rcu.txt
> index cdf002edd8..2e6cc607a1 100644
> --- a/docs/devel/rcu.txt
> +++ b/docs/devel/rcu.txt
> @@ -392,7 +392,7 @@ Instead, we store the size of the array with the array itself:
>   
>               /* Removal phase.  */
>               old_array = global_array;
> -            qatomic_rcu_set(&new_array->data, new_array);
> +            qatomic_rcu_set(&global_array, new_array);
>               synchronize_rcu();
>   
>               /* Reclamation phase.  */
> 

Cc: qemu-trivial@nongnu.org
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>


