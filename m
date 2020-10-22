Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kVbSH-00067f-LB
	for mharc-qemu-trivial@gnu.org; Thu, 22 Oct 2020 10:20:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kVbSG-00064l-7T
 for qemu-trivial@nongnu.org; Thu, 22 Oct 2020 10:20:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:24589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kVbSE-0002Py-M4
 for qemu-trivial@nongnu.org; Thu, 22 Oct 2020 10:20:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603376433;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2TWaegd2S7RBLRDF0Ip4AR0g6uaYiOMGs1Uzg9tJfec=;
 b=fHxnMVLsDPDXDgJw7jLuxU6osK5m97QPLQfCpRuD/NLLO0A086NkSX1SWII0rlIuUs1IjH
 cEHhrgEeiSBQWTDaHBuoqJWP4qLmn+Dj4ZoZGvOYbkYBGbZZrsgDklHBR0W78duvktRqQa
 cgEXreL39/bnBjxkGEoix20vwf0DoQM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-286-rZhW6suZOiiVwMS-Q2uwzw-1; Thu, 22 Oct 2020 10:20:31 -0400
X-MC-Unique: rZhW6suZOiiVwMS-Q2uwzw-1
Received: by mail-wm1-f69.google.com with SMTP id o15so654238wmh.1
 for <qemu-trivial@nongnu.org>; Thu, 22 Oct 2020 07:20:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2TWaegd2S7RBLRDF0Ip4AR0g6uaYiOMGs1Uzg9tJfec=;
 b=HjtSMdBeoZWgumXYTmUOy2VRjWph23kf4s4x/WbDeYf0ivYC7q5etqE+OhPHeY/UmL
 IS9jYBRlMXVrGajIt2Jhbc2Qu3YVqHULsWZ7XQDOb+51gI/wMeAyTtOaClsnSUvk8V3z
 +Pr5QFbKJaoMfDlD99b34FNCwtShtl9pY98dz70FIs9ihI/r/8+WHLX5jTdnSjrIfe5k
 NWQIlsgKQNhpIPipZUC1qR/FRXLieiqoXPLURY4MnJVeGhCUv7bDM1qzn3Q4LW+F9Kqm
 49135IwVo/DNBLfqcj3wwrwdCoPEbSUmXr8/vNqFHngAtcOX3ei0W6cws2izTkwdC0/M
 BY8Q==
X-Gm-Message-State: AOAM531sOZf0a6bfqB4pmvA2TLTTsfMBWsaBCi5LPuOoBKlhnFbYnMZG
 ruhfbLOfGWCAxIf67i5x/uFyvE+478/fF6dsTWZ6V4bExihzuylvuPZpA/Kqa1HB9iEWjD1Q1Fg
 zq9/6uSWkpbwnVJxgDg==
X-Received: by 2002:a1c:5545:: with SMTP id j66mr2901451wmb.31.1603376429998; 
 Thu, 22 Oct 2020 07:20:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxmHePokSeOQBoNLL1nZJrY+OBOrH7XZ40IuNWZ5uYmuNfLg+/CelWbLm4ox+uodeiQBFp1vg==
X-Received: by 2002:a1c:5545:: with SMTP id j66mr2901423wmb.31.1603376429840; 
 Thu, 22 Oct 2020 07:20:29 -0700 (PDT)
Received: from [192.168.1.36] (237.red-88-18-140.staticip.rima-tde.net.
 [88.18.140.237])
 by smtp.gmail.com with ESMTPSA id f8sm4321641wrw.85.2020.10.22.07.20.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Oct 2020 07:20:28 -0700 (PDT)
Subject: Re: [PATCH] MAINTAINERS: Cover "block/nvme.h" file
To: qemu-devel@nongnu.org, QEMU Trivial <qemu-trivial@nongnu.org>
Cc: qemu-block@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Fam Zheng <fam@euphon.net>, Keith Busch <kbusch@kernel.org>,
 Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Niklas Cassel <Niklas.Cassel@wdc.com>, Klaus Jensen <its@irrelevant.dk>,
 Klaus Jensen <k.jensen@samsung.com>, Maxim Levitsky <mlevitsk@redhat.com>,
 Dmitry Fomichev <Dmitry.Fomichev@wdc.com>,
 Andrzej Jakowski <andrzej.jakowski@linux.intel.com>
References: <20200701140634.25994-1-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <ccdce593-67fc-1ed5-c05c-c64d45cf5515@redhat.com>
Date: Thu, 22 Oct 2020 16:20:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20200701140634.25994-1-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/22 08:09:01
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.107, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
X-List-Received-Date: Thu, 22 Oct 2020 14:20:36 -0000

Cc'ing qemu-trivial@

On 7/1/20 4:06 PM, Philippe Mathieu-Daudé wrote:
> The "block/nvme.h" header is shared by both the NVMe block
> driver and the NVMe emulated device. Add the 'F:' entry on
> both sections, so all maintainers/reviewers are notified
> when it is changed.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
> Cc: Fam Zheng <fam@euphon.net>
> Cc: Keith Busch <kbusch@kernel.org>
> Cc: Kevin Wolf <kwolf@redhat.com>
> Cc: Max Reitz <mreitz@redhat.com>
> Cc: Niklas Cassel <Niklas.Cassel@wdc.com>
> Cc: Klaus Jensen <its@irrelevant.dk>
> Cc: Klaus Jensen <k.jensen@samsung.com>
> Cc: Maxim Levitsky <mlevitsk@redhat.com>
> Cc: Dmitry Fomichev <Dmitry.Fomichev@wdc.com>
> Cc: Andrzej Jakowski <andrzej.jakowski@linux.intel.com>
> ---
>   MAINTAINERS | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index dec252f38b..9995cdc805 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1795,6 +1795,7 @@ M: Keith Busch <kbusch@kernel.org>
>   L: qemu-block@nongnu.org
>   S: Supported
>   F: hw/block/nvme*
> +F: include/block/nvme.h
>   F: tests/qtest/nvme-test.c
>   
>   megasas
> @@ -2804,6 +2805,7 @@ M: Fam Zheng <fam@euphon.net>
>   L: qemu-block@nongnu.org
>   S: Supported
>   F: block/nvme*
> +F: include/block/nvme.h
>   
>   Bootdevice
>   M: Gonglei <arei.gonglei@huawei.com>
> 


