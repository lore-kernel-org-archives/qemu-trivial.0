Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lgf2k-00025a-K5
	for mharc-qemu-trivial@gnu.org; Tue, 11 May 2021 22:56:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lgf2j-000234-0S
 for qemu-trivial@nongnu.org; Tue, 11 May 2021 22:56:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49246)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lgf2f-0004v3-Ff
 for qemu-trivial@nongnu.org; Tue, 11 May 2021 22:56:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620788168;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0zQwEI8otUkqqKeq8bINhFvKtfFUVHOHOWw7x4EJDPQ=;
 b=Is55RbfYn4c0wVhesAfrdkdCSEKYwQTPfLUX9N6eWwqmYZV24+Bx5RKjVtGTsBUmhOZNtb
 i+8z1HXdrrlCGFLdtPzAP3UzHR/h2w0PuQlBLEKpgQHI6VG+WYmYiOe+1zB4UiyTLeFmOR
 6uZty8zL7o2dkqEGSbRcXlMJ/F3GpVI=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-236-2_dEjgSNPZebOFIJyjUUfw-1; Tue, 11 May 2021 22:56:07 -0400
X-MC-Unique: 2_dEjgSNPZebOFIJyjUUfw-1
Received: by mail-pl1-f198.google.com with SMTP id
 z14-20020a170903018eb02900eed5c11984so8543237plg.16
 for <qemu-trivial@nongnu.org>; Tue, 11 May 2021 19:56:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=0zQwEI8otUkqqKeq8bINhFvKtfFUVHOHOWw7x4EJDPQ=;
 b=X6IGncTQlY82NROEQYJWr5JniOGXjW1+CsGXItA23m1gskponp7pXxWXPmYC9zwb0A
 RBxKqYpTMaDHGhi0NQ3UD4YBEjdwqACvJVWjA6VpLYb2fUaNdnw/T4VU77ExMJKYQWAr
 e62Zegk9iXXXrR8Nn0RuBxDTukoOL6e9aSNztIRtqsxRTs3e8H9VwHEAKYTvFaB6inS6
 q6WdMY6VKCBSneBL2k7ywOjT8jo0kaFxtl11P3B3TlL19F9HE/+t5Ts5ppByiv1ORNtJ
 ddmWHBA0TL1Hkr2bLvn+Froej7FjpDDlOHcNA3sWZ5yWXOrombCEAXkWTNhfiFt2QysB
 jiDA==
X-Gm-Message-State: AOAM531PLGb+DESKsXwfa34pQArZQCoHaqqUezDOoMRqvYEVvf/1TyT1
 SXO2T+G4INy9Ew6GK/E/xX8V/D6hSeNdO4Oq95F/7gHmrdp53hjDW+RsDZ/92CtZ2GnR4dahLtg
 SsP1asmEcpl1d9Gpb8BDZVJeNqe2rLKKcu31PVCNDnduM093qv8kSI1ALMCf4uJUIdhrATQ==
X-Received: by 2002:a17:90a:aa14:: with SMTP id
 k20mr8794110pjq.88.1620788165872; 
 Tue, 11 May 2021 19:56:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJypIXyOx9ke9A0quNXF//7PNBPjWEo9rqsdrKKjTSnMQodBH/idYEpx96naaPhf0r9DxFtp8Q==
X-Received: by 2002:a17:90a:aa14:: with SMTP id
 k20mr8794074pjq.88.1620788165532; 
 Tue, 11 May 2021 19:56:05 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id j16sm15632697pgh.69.2021.05.11.19.56.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 May 2021 19:56:04 -0700 (PDT)
Subject: Re: [PATCH 1/3] hw/virtio: Pass virtio_feature_get_config_size() a
 const argument
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-trivial@nongnu.org
References: <20210511104157.2880306-1-philmd@redhat.com>
 <20210511104157.2880306-2-philmd@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <fe8bbc8e-be18-a5db-414f-4008b07a6f36@redhat.com>
Date: Wed, 12 May 2021 10:55:59 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210511104157.2880306-2-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
X-List-Received-Date: Wed, 12 May 2021 02:56:13 -0000


在 2021/5/11 下午6:41, Philippe Mathieu-Daudé 写道:
> The VirtIOFeature structure isn't modified, mark it const.
>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>


Acked-by: Jason Wang <jasowang@redhat.com>


> ---
>   include/hw/virtio/virtio.h | 2 +-
>   hw/virtio/virtio.c         | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
> index b7ece7a6a89..8bab9cfb750 100644
> --- a/include/hw/virtio/virtio.h
> +++ b/include/hw/virtio/virtio.h
> @@ -43,7 +43,7 @@ typedef struct VirtIOFeature {
>       size_t end;
>   } VirtIOFeature;
>   
> -size_t virtio_feature_get_config_size(VirtIOFeature *features,
> +size_t virtio_feature_get_config_size(const VirtIOFeature *features,
>                                         uint64_t host_features);
>   
>   typedef struct VirtQueue VirtQueue;
> diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
> index 9e13cb9e3ad..e02544b2df7 100644
> --- a/hw/virtio/virtio.c
> +++ b/hw/virtio/virtio.c
> @@ -2981,7 +2981,7 @@ int virtio_set_features(VirtIODevice *vdev, uint64_t val)
>       return ret;
>   }
>   
> -size_t virtio_feature_get_config_size(VirtIOFeature *feature_sizes,
> +size_t virtio_feature_get_config_size(const VirtIOFeature *feature_sizes,
>                                         uint64_t host_features)
>   {
>       size_t config_size = 0;


