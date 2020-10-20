Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kUn6O-0003ZE-W2
	for mharc-qemu-trivial@gnu.org; Tue, 20 Oct 2020 04:34:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kUn6N-0003WR-K7
 for qemu-trivial@nongnu.org; Tue, 20 Oct 2020 04:34:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51945)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kUn6K-0000lw-PK
 for qemu-trivial@nongnu.org; Tue, 20 Oct 2020 04:34:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603182874;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uyhKBy6pP8AvqUTYQWJUwu8uDYbcDAWVVcKvmck2xwo=;
 b=KOj8IuvvsydRKMgK3FhrpNZn5Q1SiVgH85zP5UlN1cE1IpBelWhC481d1CSwLS7hAMZz2r
 isXsFMlkgpX30vjY5zAWT1koBg4eJTC5KQVVp5AWxt7SsA6zd/gPuTci7xlUZ5/kKaCa+J
 zK/JQcMABRKeHT1HZILaq7bSOD7OjH8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-364-QP4oiVmXPhyFwLzb4wnHFg-1; Tue, 20 Oct 2020 04:34:32 -0400
X-MC-Unique: QP4oiVmXPhyFwLzb4wnHFg-1
Received: by mail-wm1-f70.google.com with SMTP id g71so196428wmg.2
 for <qemu-trivial@nongnu.org>; Tue, 20 Oct 2020 01:34:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uyhKBy6pP8AvqUTYQWJUwu8uDYbcDAWVVcKvmck2xwo=;
 b=bUho+1Pvx7hEvzFJpVKKUBG29JQt9Ynq+Ff/LnpG1BoAXR+YaKIS+JwyNoxEq5x1Va
 E+laooT3pJRC5JK3OkwZM3HeMB0CtrOnXYCk16zHqQ1FODqsaNXvlbP3QY76yc89rLfN
 4EvL88uz6h91szBzKPnzoQSJRhEWP9oOynR5QXDV6oNhiPz3AGrEF+M0Z8KfUleBErfB
 mYsjiz2DF4drVZzhDX4DsP2lK+dtw16mjP7JJpXI0rZsE8sVTw0hDJ93bFzKVPWSXBaM
 8yX6YNQheILqL7yJBkHtgovG1vxA32oqpLy0+9SJZxUdp5omYbvd3nCPWVkfbNRLrN5+
 y+2Q==
X-Gm-Message-State: AOAM5308PqXpT0pqM2cO/gLt142Bm2rfEzj0iWYGrkduAWT7L21bf9ug
 6p6kjeTzSStAXTB9zHFzOP1gbAdsbYnXSu0fYvLpl9kXK4w5OON/591hFGjSH1EINbLSOpIFy09
 syRtWxKcBxiFHTqOj+A==
X-Received: by 2002:a1c:e082:: with SMTP id x124mr1670198wmg.60.1603182871456; 
 Tue, 20 Oct 2020 01:34:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxWY1WazRvOKIEHzBIi+Sc8vzWPsTsUeeQzMNJM8vuTI2ZW7KYHaBnnS0UkEHOKdHkhMaYg8Q==
X-Received: by 2002:a1c:e082:: with SMTP id x124mr1670165wmg.60.1603182871158; 
 Tue, 20 Oct 2020 01:34:31 -0700 (PDT)
Received: from [192.168.1.36] (237.red-88-18-140.staticip.rima-tde.net.
 [88.18.140.237])
 by smtp.gmail.com with ESMTPSA id h4sm1904891wrv.11.2020.10.20.01.34.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Oct 2020 01:34:30 -0700 (PDT)
Subject: Re: [PATCH v4] migration: using trace_ to replace DPRINTF
To: Bihong Yu <yubihong@huawei.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
Cc: dgilbert@redhat.com, alex.chen@huawei.com, wanghao232@huawei.com,
 zhengchuan@huawei.com
References: <1603182706-2421-1-git-send-email-yubihong@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <d67e4a48-dfc4-28cf-e99e-9462ed0a6e41@redhat.com>
Date: Tue, 20 Oct 2020 10:34:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <1603182706-2421-1-git-send-email-yubihong@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/20 01:15:43
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
X-List-Received-Date: Tue, 20 Oct 2020 08:34:39 -0000

On 10/20/20 10:31 AM, Bihong Yu wrote:
> Signed-off-by: Bihong Yu <yubihong@huawei.com>
> ---
>   migration/block.c      | 36 ++++++++++++++++++------------------
>   migration/page_cache.c | 13 +++----------
>   migration/trace-events | 13 +++++++++++++
>   3 files changed, 34 insertions(+), 28 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


