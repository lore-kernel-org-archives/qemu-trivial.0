Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lgf3o-0003r0-3S
	for mharc-qemu-trivial@gnu.org; Tue, 11 May 2021 22:57:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lgf3m-0003nd-SN
 for qemu-trivial@nongnu.org; Tue, 11 May 2021 22:57:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42327)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lgf3k-0005qk-Vj
 for qemu-trivial@nongnu.org; Tue, 11 May 2021 22:57:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620788236;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=znSd28ZNJvaIgAyhqizi2Y0bkszVkdPi1gjXzRcoXyA=;
 b=b2wgzVC4TvlQerm1w3ac1C8n5qVOXx4TNy55rvK740ix34b90cUNPAdZY/IBCT+Rk8dweu
 C8zKfefJUrGmv0PpNapFxgUoqiFn8tklZI4XwLJ0srwEBP3HKq7wfoa4cGIoqx6pAUNji9
 QjGpGyBWUSYSOd5KQV1SI+3SJqDql7A=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-569-DQhltOZoPq6g_qGx9V9vKw-1; Tue, 11 May 2021 22:57:14 -0400
X-MC-Unique: DQhltOZoPq6g_qGx9V9vKw-1
Received: by mail-pg1-f198.google.com with SMTP id
 w33-20020a6349210000b029020ed5af91a4so13401721pga.14
 for <qemu-trivial@nongnu.org>; Tue, 11 May 2021 19:57:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=znSd28ZNJvaIgAyhqizi2Y0bkszVkdPi1gjXzRcoXyA=;
 b=pOR+uR652UM6p9uQamDYXV/Mu82B9Y540ipo+Q6N+5PgNElVOX8mhcnwF05jQmWyDx
 IoR2dHZO2zxH1KaQ5idchQtCan9yAN0LHyW72XpDY0AuLGvFPjUxPw3zLaj6PBbBYn52
 uQTSmzHqrmFhQ7PctucqKmTcLRmyEzdlp7VziVCczfKiYqOKOSaqTsKYH9fF0DT0cndP
 MEMnePuxKmt8/AJ7DjwZQrb3x05ajdDnu8UORY1tVCmSgua8WaYqR/IYZCAogau9w/6v
 9QfeQRq1XdQby+AFwmUok1y5MWrrK5N0QlQXM0jL/qzAWgu5MwIZYK1t0YIN9VCt43bX
 RA6A==
X-Gm-Message-State: AOAM532D490NVy6HTmJs3qJOqdwg/UGtauw89rZaMfYaCAvDc4hg9KAm
 bl27ksdD4FprYntqjohKmazMCXijKnGjfZ+kwwh7VdlTonw5HiuIukxnwvi9ljTOV4yYtJSiepc
 wSxESmc3NLRXvtOHdfKK/RAGF8QubVn0ndvEXtun4nIXskq4jInKtK3nr0+6ggurH1LgARw==
X-Received: by 2002:a63:5049:: with SMTP id q9mr9751980pgl.123.1620788233183; 
 Tue, 11 May 2021 19:57:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw73S8v94F64l2KzqcBwbrYFLIXWEnce9fRy+O18rplAUpyEbmVrYovKkCOg7j4WyppKK4izQ==
X-Received: by 2002:a63:5049:: with SMTP id q9mr9751953pgl.123.1620788232804; 
 Tue, 11 May 2021 19:57:12 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id mg1sm3129286pjb.14.2021.05.11.19.57.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 May 2021 19:57:08 -0700 (PDT)
Subject: Re: [PATCH 3/3] virtio-net: Constify VirtIOFeature feature_sizes[]
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-trivial@nongnu.org
References: <20210511104157.2880306-1-philmd@redhat.com>
 <20210511104157.2880306-4-philmd@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <774a603f-f511-903a-2383-8d191ac27c7d@redhat.com>
Date: Wed, 12 May 2021 10:57:03 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210511104157.2880306-4-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
X-List-Received-Date: Wed, 12 May 2021 02:57:19 -0000


在 2021/5/11 下午6:41, Philippe Mathieu-Daudé 写道:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   hw/net/virtio-net.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> index 66b9ff45118..6b7e8dd04ef 100644
> --- a/hw/net/virtio-net.c
> +++ b/hw/net/virtio-net.c
> @@ -89,7 +89,7 @@
>                                            VIRTIO_NET_RSS_HASH_TYPE_TCP_EX | \
>                                            VIRTIO_NET_RSS_HASH_TYPE_UDP_EX)
>   
> -static VirtIOFeature feature_sizes[] = {
> +static const VirtIOFeature feature_sizes[] = {
>       {.flags = 1ULL << VIRTIO_NET_F_MAC,
>        .end = endof(struct virtio_net_config, mac)},
>       {.flags = 1ULL << VIRTIO_NET_F_STATUS,


Acked-by: Jason Wang <jasowang@redhat.com>



