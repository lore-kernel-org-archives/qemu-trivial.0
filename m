Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l00uo-0000lO-Ft
	for mharc-qemu-trivial@gnu.org; Thu, 14 Jan 2021 06:35:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l00un-0000is-Hh
 for qemu-trivial@nongnu.org; Thu, 14 Jan 2021 06:35:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:47650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l00um-0001SM-4x
 for qemu-trivial@nongnu.org; Thu, 14 Jan 2021 06:35:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610624143;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+Dnv8RgGDyFS/r9W+oIiqDJvcKmXh15wK8wW7gxH3nM=;
 b=BXjCYK9KobpCvOTKxHZIxmoF1KOe/HlDL5hwKrS9muvalYoKFnmpbSOFKDVT5UPMBLE6NW
 uEcFWbepV5F2h7qGiqnihaHERVsxK+0Hi0cmOahbBNxmv17im2e53BL3Y7pTr7yLc1q7QK
 4sXq57GhUQWtry55eisO8CDGXXF4UZM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-264-mORI41boOLODn47Q-9r-DA-1; Thu, 14 Jan 2021 06:35:41 -0500
X-MC-Unique: mORI41boOLODn47Q-9r-DA-1
Received: by mail-wr1-f70.google.com with SMTP id i4so2476821wrm.21
 for <qemu-trivial@nongnu.org>; Thu, 14 Jan 2021 03:35:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+Dnv8RgGDyFS/r9W+oIiqDJvcKmXh15wK8wW7gxH3nM=;
 b=kI+HKbtWYAj0GKTAz6L0pJT3qwHEWX4nThty24GsvbYUPSWkrCBMW/ed5HP3ZKdTBN
 eUmIiIbyOvcuQm2X+JUUOl0mpsEvAtMZRs/z0CHszNb+M0mASNrsydjFsScWDU0iP6AU
 8bU9ssWoQuqMa/S0IsZcBJnuDnSeq5dzRUXekmDmgW5wP+/Vvpo+H/X2qewNQM+oj2ur
 uUecj9Yc89Rct+7pWzcblDfeIiDgOjI0CLThhBKA2X0TZ980ZbbCxdP4YUHFTMY898gO
 XtMPLm/sz13UNkrDWzGNoVGmaHmg9neO4WesvGDwd91USkbX7SA6yB0dFbb8j9sQW/MI
 yNVA==
X-Gm-Message-State: AOAM5316GcICVofXe5ljoNtbqgG5RSFf4Qxf0plG9zE53dV5sBoNxfjf
 /BwxbEIpp96/M+IA2X/n6tkuc7pf8D4t+YM6Lrfm4SS8GJQ400xweiy5I9xE686hQeWyuL8WzeI
 B8UYmAKEgayU0UrF3hA==
X-Received: by 2002:a1c:4b10:: with SMTP id y16mr3598365wma.73.1610624140416; 
 Thu, 14 Jan 2021 03:35:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw1EpvQ0pGVtA7VZcLBY+WujKGrQBtb1G9oq0rLbqhXIrx5g8my9A0WpBJi2BLPZ2IOi9MCwg==
X-Received: by 2002:a1c:4b10:: with SMTP id y16mr3598345wma.73.1610624140182; 
 Thu, 14 Jan 2021 03:35:40 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id p8sm9693282wru.50.2021.01.14.03.35.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Jan 2021 03:35:39 -0800 (PST)
Subject: Re: [PATCH 7/9] net: Remove assignment in if condition
To: Zhang Han <zhanghan64@huawei.com>, jasowang@redhat.com
Cc: alex.chen@huawei.com, hunongda@huawei.com, qemu-trivial@nongnu.org,
 hang.zhanghailiang@huawei.com, qemu-devel@nongnu.org
References: <20201222082340.67405-1-zhanghan64@huawei.com>
 <20201222082340.67405-8-zhanghan64@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <5426b47e-cd7c-de59-bd70-b74c69ba4904@redhat.com>
Date: Thu, 14 Jan 2021 12:35:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201222082340.67405-8-zhanghan64@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 14 Jan 2021 11:35:45 -0000

On 12/22/20 9:23 AM, Zhang Han wrote:
> Put the assignment before the if condition
> 
> Signed-off-by: Zhang Han <zhanghan64@huawei.com>
> ---
>  net/tap-bsd.c     | 3 ++-
>  net/tap-solaris.c | 9 ++++++---
>  2 files changed, 8 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


