Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k68Rk-0005PE-N3
	for mharc-qemu-trivial@gnu.org; Thu, 13 Aug 2020 04:18:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1k68Ri-0005Nm-TX
 for qemu-trivial@nongnu.org; Thu, 13 Aug 2020 04:18:46 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:22995
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1k68Rg-00074r-MS
 for qemu-trivial@nongnu.org; Thu, 13 Aug 2020 04:18:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597306723;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=64EOP+5qWYpMVzxdiPvLinsnda3NNizayfxVcF+snuo=;
 b=eF5b9cZotgj33OKo3fjKC7kYXdh3iku4q+6PmS2vUl7IDY3J5ImuMVrz9U76JS5+ocFK5k
 LqfQyS1RrIOuANo7VQ2HnEO8PA5KHs9Gwmp5WScLBW2wUEUq3cOhdkJwOA6JQqYP8zZxpK
 9w0e3rdToTMXj/UsA4HxirkbxrjK/74=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-560-MfZ6-ogRONqthzjmjyEeTQ-1; Thu, 13 Aug 2020 04:18:42 -0400
X-MC-Unique: MfZ6-ogRONqthzjmjyEeTQ-1
Received: by mail-wm1-f72.google.com with SMTP id z1so1914208wmf.9
 for <qemu-trivial@nongnu.org>; Thu, 13 Aug 2020 01:18:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=64EOP+5qWYpMVzxdiPvLinsnda3NNizayfxVcF+snuo=;
 b=jFzvGPM4EN5cN2EqX/cu7GyL3/ylj1C14nw9GmcV8AZpbDJ7SKt9jI+T3xGXpwpnxm
 lErupC5fozlaTh6q3F91oaVQBf8MF+Pxry7P0NqYVsp5Nct4QG4HNkagoOJV56x/DTpz
 nQTzBs2/SgDM//m5FRqLCASKLVCR6B/t2/9pIX4De0oIRA2/83nzYaiD0IpaMjvBKIzH
 BGBhZUpCz18miYX97pVoAxDdEdiDMmPS52Zn9XBwupV37/MQ/XniF9dy9s/AAi29vF/2
 6AV7mOZ1HfPv5eavjB2Ov+vajLM5nl20HjlVfUZNMQTIDROr1AFWjlAtqYL/4/77vME3
 wJlg==
X-Gm-Message-State: AOAM531u3F03I6/SYIGif11Hu1qTuUyBXgCB9zehWiYnlvh3hT3VKWkb
 hVxjn++xnND+zVE6D0a9AI/4c9RO6CFMAGGjqVQrGF1Atkgu96IBvoFi3ia4+vZDJIvrYreouIV
 B87ifqeMPx7gR+3wbVQ==
X-Received: by 2002:a1c:2b04:: with SMTP id r4mr3117124wmr.76.1597306721102;
 Thu, 13 Aug 2020 01:18:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzsfCmMGfXrncrhKttepLHjDagG43xknwVHZvaUFo0zkJqvZa5WzF5FEmKPKc8gFRWGQKo6GQ==
X-Received: by 2002:a1c:2b04:: with SMTP id r4mr3117103wmr.76.1597306720889;
 Thu, 13 Aug 2020 01:18:40 -0700 (PDT)
Received: from [192.168.1.36] (121.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.121])
 by smtp.gmail.com with ESMTPSA id 126sm8644922wme.42.2020.08.13.01.18.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Aug 2020 01:18:40 -0700 (PDT)
Subject: Re: [PATCH 06/11] hw/net/virtio-net:Remove redundant statement in
 virtio_net_rsc_tcp_ctrl_check()
To: Chen Qun <kuhn.chenqun@huawei.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
Cc: zhang.zhanghailiang@huawei.com, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, pannengyuan@huawei.com,
 Euler Robot <euler.robot@huawei.com>
References: <20200813073712.4001404-1-kuhn.chenqun@huawei.com>
 <20200813073712.4001404-7-kuhn.chenqun@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Autocrypt: addr=philmd@redhat.com; keydata=
 mQINBDXML8YBEADXCtUkDBKQvNsQA7sDpw6YLE/1tKHwm24A1au9Hfy/OFmkpzo+MD+dYc+7
 bvnqWAeGweq2SDq8zbzFZ1gJBd6+e5v1a/UrTxvwBk51yEkadrpRbi+r2bDpTJwXc/uEtYAB
 GvsTZMtiQVA4kRID1KCdgLa3zztPLCj5H1VZhqZsiGvXa/nMIlhvacRXdbgllPPJ72cLUkXf
 z1Zu4AkEKpccZaJspmLWGSzGu6UTZ7UfVeR2Hcc2KI9oZB1qthmZ1+PZyGZ/Dy+z+zklC0xl
 XIpQPmnfy9+/1hj1LzJ+pe3HzEodtlVA+rdttSvA6nmHKIt8Ul6b/h1DFTmUT1lN1WbAGxmg
 CH1O26cz5nTrzdjoqC/b8PpZiT0kO5MKKgiu5S4PRIxW2+RA4H9nq7nztNZ1Y39bDpzwE5Sp
 bDHzd5owmLxMLZAINtCtQuRbSOcMjZlg4zohA9TQP9krGIk+qTR+H4CV22sWldSkVtsoTaA2
 qNeSJhfHQY0TyQvFbqRsSNIe2gTDzzEQ8itsmdHHE/yzhcCVvlUzXhAT6pIN0OT+cdsTTfif
 MIcDboys92auTuJ7U+4jWF1+WUaJ8gDL69ThAsu7mGDBbm80P3vvUZ4fQM14NkxOnuGRrJxO
 qjWNJ2ZUxgyHAh5TCxMLKWZoL5hpnvx3dF3Ti9HW2dsUUWICSQARAQABtDJQaGlsaXBwZSBN
 YXRoaWV1LURhdWTDqSAoUGhpbCkgPHBoaWxtZEByZWRoYXQuY29tPokCVQQTAQgAPwIbDwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4AWIQSJweePYB7obIZ0lcuio/1u3q3A3gUCXsfWwAUJ
 KtymWgAKCRCio/1u3q3A3ircD/9Vjh3aFNJ3uF3hddeoFg1H038wZr/xi8/rX27M1Vj2j9VH
 0B8Olp4KUQw/hyO6kUxqkoojmzRpmzvlpZ0cUiZJo2bQIWnvScyHxFCv33kHe+YEIqoJlaQc
 JfKYlbCoubz+02E2A6bFD9+BvCY0LBbEj5POwyKGiDMjHKCGuzSuDRbCn0Mz4kCa7nFMF5Jv
 piC+JemRdiBd6102ThqgIsyGEBXuf1sy0QIVyXgaqr9O2b/0VoXpQId7yY7OJuYYxs7kQoXI
 6WzSMpmuXGkmfxOgbc/L6YbzB0JOriX0iRClxu4dEUg8Bs2pNnr6huY2Ft+qb41RzCJvvMyu
 gS32LfN0bTZ6Qm2A8ayMtUQgnwZDSO23OKgQWZVglGliY3ezHZ6lVwC24Vjkmq/2yBSLakZE
 6DZUjZzCW1nvtRK05ebyK6tofRsx8xB8pL/kcBb9nCuh70aLR+5cmE41X4O+MVJbwfP5s/RW
 9BFSL3qgXuXso/3XuWTQjJJGgKhB6xXjMmb1J4q/h5IuVV4juv1Fem9sfmyrh+Wi5V1IzKI7
 RPJ3KVb937eBgSENk53P0gUorwzUcO+ASEo3Z1cBKkJSPigDbeEjVfXQMzNt0oDRzpQqH2vp
 apo2jHnidWt8BsckuWZpxcZ9+/9obQ55DyVQHGiTN39hkETy3Emdnz1JVHTU0Q==
Message-ID: <7bdc8bcd-75ef-7dd2-6894-004b19f20ee1@redhat.com>
Date: Thu, 13 Aug 2020 10:18:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200813073712.4001404-7-kuhn.chenqun@huawei.com>
Content-Language: en-US
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/13 03:44:40
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Thu, 13 Aug 2020 08:18:47 -0000

On 8/13/20 9:37 AM, Chen Qun wrote:
> Clang static code analyzer show warning:
> hw/net/virtio-net.c:2077:5: warning: Value stored to 'tcp_flag' is never read
>     tcp_flag &= VIRTIO_NET_TCP_FLAG;
>     ^           ~~~~~~~~~~~~~~~~~~~
> 
> The 'VIRTIO_NET_TCP_FLAG' is '0x3F'. The last ‘tcp_flag’ assignment statement is
>  the same as that of the first two statements.
> 
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
> ---
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Jason Wang <jasowang@redhat.com>
> ---
>  hw/net/virtio-net.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> index a1fe9e9285..cb0d27084c 100644
> --- a/hw/net/virtio-net.c
> +++ b/hw/net/virtio-net.c
> @@ -2075,7 +2075,6 @@ static int virtio_net_rsc_tcp_ctrl_check(VirtioNetRscChain *chain,
>      tcp_flag = htons(tcp->th_offset_flags);
>      tcp_hdr = (tcp_flag & VIRTIO_NET_TCP_HDR_LENGTH) >> 10;
>      tcp_flag &= VIRTIO_NET_TCP_FLAG;
> -    tcp_flag = htons(tcp->th_offset_flags) & 0x3F;
>      if (tcp_flag & TH_SYN) {
>          chain->stat.tcp_syn++;
>          return RSC_BYPASS;
> 

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


