Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lsk3Y-0002y3-1i
	for mharc-qemu-trivial@gnu.org; Mon, 14 Jun 2021 06:43:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lsk3X-0002xW-4W
 for qemu-trivial@nongnu.org; Mon, 14 Jun 2021 06:42:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50946)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lsk3V-0008QF-M5
 for qemu-trivial@nongnu.org; Mon, 14 Jun 2021 06:42:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623667376;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7nIZOpAgHCdv8UGBx6UPNaaYHlJBRIiArE9tBOF+o9E=;
 b=VrYRchuGr1fdCFnHICGAsiIsgYdqbzCeGeroa2vkCix4P8/zOKj4Pl9tlra6VtypW05w5F
 b4WPR/egBNzw+Sunm25jzqlUg3deRZrSmu2rgTDnJwklg2iqh/fSiV2iNFwW1vHbyjNhh/
 BX5cyBlyMvPO7g26G2Uc996NQnLbqfs=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-485-bQQAz1S-PeeBJSVyogRSsg-1; Mon, 14 Jun 2021 06:42:54 -0400
X-MC-Unique: bQQAz1S-PeeBJSVyogRSsg-1
Received: by mail-wr1-f72.google.com with SMTP id
 r17-20020a5d52d10000b0290119976473fcso6867059wrv.15
 for <qemu-trivial@nongnu.org>; Mon, 14 Jun 2021 03:42:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7nIZOpAgHCdv8UGBx6UPNaaYHlJBRIiArE9tBOF+o9E=;
 b=N/qaVgd/xFrisTTuwzHSafgi2T6iQIDToOQ8eT7Z64w/n2c9fSCRd6ScsCDB0hvuJ7
 o3w2FF0Nl9+Rgmk9RXrvl8mXpeW04wt/rOfaeG5RmC8CSzmt3OHBCE+2cR4obncXt/0W
 TjYTyLrgfMVGz3QBZ0cwiIy7JajeFKxhVWuyE8gXBlxvpWiIuoYpJVxg+HDhEOiyef4b
 MB6h6l0Qtm1PcDxrGDNYi4wfPozJOeHG0taM/uM1fpXx0hmkv0TLq2Ty1ubdk5XaPpsU
 XxQx2cOZ7cTpOoPoPdCzoDclo4LeMSrjPr/4W/r7Phikt/ZYzVu82l5z0xsFym1+C7gQ
 0zMQ==
X-Gm-Message-State: AOAM5319pNO3XzwrrJoFQVfObCnjTYvx5Y1CZNCLEqxnPGpXqeqybnRL
 UeBWThdzFwIUMc32rJgVWl+va1SR0roHGqku4TCYfEzWUFurtSR/aAE7drACLoORTLhHABNi7Vm
 Bpjjlx3hfD2zZfckhHA==
X-Received: by 2002:a05:600c:3594:: with SMTP id
 p20mr29609210wmq.52.1623667373919; 
 Mon, 14 Jun 2021 03:42:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyZ0rkED85ZM7UuH7brxRZaQZNkxVB4qkBnoe5Pvv5GmKzdFlmzOc5hL61oKlQ7Jn44JO0nnA==
X-Received: by 2002:a05:600c:3594:: with SMTP id
 p20mr29609183wmq.52.1623667373666; 
 Mon, 14 Jun 2021 03:42:53 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id p6sm16394542wrf.51.2021.06.14.03.42.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jun 2021 03:42:53 -0700 (PDT)
Subject: Re: [PATCH v2] hw/virtio: Document *_should_notify() are called
 within rcu_read_lock()
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
References: <20210523094040.3516968-1-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <0f261583-ba8f-5fdd-dae3-2a0174d95992@redhat.com>
Date: Mon, 14 Jun 2021 12:42:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210523094040.3516968-1-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.144, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Mon, 14 Jun 2021 10:42:59 -0000

Hi Michael,

On 5/23/21 11:40 AM, Philippe Mathieu-Daudé wrote:
> Such comments make reviewing this file somehow easier.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
> v2: only one space before end of comment (mst)

Are you OK if this patch is queued via trivial@?

> ---
>  hw/virtio/virtio.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
> index e02544b2df7..130e3568409 100644
> --- a/hw/virtio/virtio.c
> +++ b/hw/virtio/virtio.c
> @@ -2449,6 +2449,7 @@ static void virtio_set_isr(VirtIODevice *vdev, int value)
>      }
>  }
>  
> +/* Called within rcu_read_lock(). */
>  static bool virtio_split_should_notify(VirtIODevice *vdev, VirtQueue *vq)
>  {
>      uint16_t old, new;
> @@ -2485,6 +2486,7 @@ static bool vring_packed_need_event(VirtQueue *vq, bool wrap,
>      return vring_need_event(off, new, old);
>  }
>  
> +/* Called within rcu_read_lock(). */
>  static bool virtio_packed_should_notify(VirtIODevice *vdev, VirtQueue *vq)
>  {
>      VRingPackedDescEvent e;
> 


