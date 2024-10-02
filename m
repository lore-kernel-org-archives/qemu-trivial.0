Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1svwm7-0001sj-Bn
	for mharc-qemu-trivial@gnu.org; Wed, 02 Oct 2024 06:40:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1svwm5-0001rc-LK
 for qemu-trivial@nongnu.org; Wed, 02 Oct 2024 06:40:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1svwm3-0002HE-Tf
 for qemu-trivial@nongnu.org; Wed, 02 Oct 2024 06:40:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1727865602;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=YHukl+IKOol9Bnc66BawQ4L4CvfySS29sw4jng/sBDE=;
 b=GgFeu6DblYSnQn0iHj3K/0oHc9jM7tICN6QedLXQT2lp4L6tkwrP35FvY/gCYlw22MsoCb
 PgccTvu2so+nBmPtcfVb3ZjE2XypbonnJVVOqoeOXscjCIdBTL8ZHHk7ggqIVm/u4MKFKe
 qWbARtdZ8JEFDntGFbZF8bz+zdHEWz4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-282-v-NWccmqObySL-TKJ3Xq8Q-1; Wed, 02 Oct 2024 06:40:00 -0400
X-MC-Unique: v-NWccmqObySL-TKJ3Xq8Q-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-37ce12c2f36so2345915f8f.2
 for <qemu-trivial@nongnu.org>; Wed, 02 Oct 2024 03:40:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727865599; x=1728470399;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YHukl+IKOol9Bnc66BawQ4L4CvfySS29sw4jng/sBDE=;
 b=Lk1VdDRifTUM4oTwbqThSGTX3zXaanY10Y9unTRlex6rn3PyydkEivtQ0teZy3mtCE
 NaUlmbb0k0nn3SSXo34DJWR+avtvOl3YULUS/NqBmZRqmhBVnXngBroH4E3+qavtUpmZ
 3fx/O2RnoYKtcMoM5sXbF759a/XHv7S70+FgP0CPbIiwHpFrSMbvPvbz5MOvBdVd/FKn
 UcStDyzVAk4UymmMsiNs/CdugP8JdKR+bIX4pJaqvIkDhs5CChIX3dE/tPVoH3MfQQpo
 WDIUmzBW8EtUZNZ3wk+kMfFbu5/qJsh9l9CG7VMA9Ds9NgBRgZH4JgCxKxuwZOYWG9SU
 KEvQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWr4rEAtipa1OgUA0udjO0tt4nwYVoUsRTdstuCPxVF1up2v0Sqrzoye6495iqDL4c5GCwWERvawCnxcFA=@nongnu.org
X-Gm-Message-State: AOJu0YyX+n3R1nE9SOIVLL2wicb5YvJ+LLL/AMpZDakX45Z8dAamdrb0
 jkC9BDuVgMwhRlq+VAT1AZZbuv5iXw/8diI41dGiPMlmnhBIlYAUwqgaMzUUrYRmnpuN4iQ40pT
 fzdRj1G1tiWgs7EoGAnowb3Z28FRuWda8dNjRgXLjCTkmLm8eq4jaSHs=
X-Received: by 2002:adf:ee4e:0:b0:374:b9a7:5ed6 with SMTP id
 ffacd0b85a97d-37cfb8c7949mr1698707f8f.22.1727865599537; 
 Wed, 02 Oct 2024 03:39:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGUetIOSAKZTWZGMt+jtK32PjutF92nMD/DMRknmGmNcp0qZ7LWTTiROiszy6y1mFYaYMthLw==
X-Received: by 2002:adf:ee4e:0:b0:374:b9a7:5ed6 with SMTP id
 ffacd0b85a97d-37cfb8c7949mr1698689f8f.22.1727865599092; 
 Wed, 02 Oct 2024 03:39:59 -0700 (PDT)
Received: from [192.168.0.7] (ip-109-42-49-143.web.vodafone.de.
 [109.42.49.143]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42f7a01f4a4sm15077195e9.29.2024.10.02.03.39.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Oct 2024 03:39:58 -0700 (PDT)
Message-ID: <6135cbe3-74bf-4452-a64a-d5e7924ec406@redhat.com>
Date: Wed, 2 Oct 2024 12:39:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] vhost: Remove unused vhost_dev_{load|save}_inflight
To: dave@treblig.org, mst@redhat.com, sgarzare@redhat.com,
 QEMU Trivial <qemu-trivial@nongnu.org>
Cc: qemu-devel@nongnu.org
References: <20240918121034.16417-1-dave@treblig.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20240918121034.16417-1-dave@treblig.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.144,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 02 Oct 2024 10:40:05 -0000

On 18/09/2024 14.10, dave@treblig.org wrote:
> From: "Dr. David Alan Gilbert" <dave@treblig.org>
> 
> vhost_dev_load_inflight and vhost_dev_save_inflight have been
> unused since they were added in 2019 by:
> 
> 5ad204bf2a ("vhost-user: Support transferring inflight buffer between qemu and backend")
> 
> Remove them, and their helper vhost_dev_resize_inflight.
> 
> Signed-off-by: Dr. David Alan Gilbert <dave@treblig.org>
> ---
>   hw/virtio/vhost.c         | 56 ---------------------------------------
>   include/hw/virtio/vhost.h |  2 --
>   2 files changed, 58 deletions(-)
> 
> diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
> index 7c5ef81b55..76f9b2aaad 100644
> --- a/hw/virtio/vhost.c
> +++ b/hw/virtio/vhost.c
> @@ -1930,62 +1930,6 @@ void vhost_dev_free_inflight(struct vhost_inflight *inflight)
>       }
>   }
>   
> -static int vhost_dev_resize_inflight(struct vhost_inflight *inflight,
> -                                     uint64_t new_size)
> -{
> -    Error *err = NULL;
> -    int fd = -1;
> -    void *addr = qemu_memfd_alloc("vhost-inflight", new_size,
> -                                  F_SEAL_GROW | F_SEAL_SHRINK | F_SEAL_SEAL,
> -                                  &fd, &err);
> -
> -    if (err) {
> -        error_report_err(err);
> -        return -ENOMEM;
> -    }
> -
> -    vhost_dev_free_inflight(inflight);
> -    inflight->offset = 0;
> -    inflight->addr = addr;
> -    inflight->fd = fd;
> -    inflight->size = new_size;
> -
> -    return 0;
> -}
> -
> -void vhost_dev_save_inflight(struct vhost_inflight *inflight, QEMUFile *f)
> -{
> -    if (inflight->addr) {
> -        qemu_put_be64(f, inflight->size);
> -        qemu_put_be16(f, inflight->queue_size);
> -        qemu_put_buffer(f, inflight->addr, inflight->size);
> -    } else {
> -        qemu_put_be64(f, 0);
> -    }
> -}
> -
> -int vhost_dev_load_inflight(struct vhost_inflight *inflight, QEMUFile *f)
> -{
> -    uint64_t size;
> -
> -    size = qemu_get_be64(f);
> -    if (!size) {
> -        return 0;
> -    }
> -
> -    if (inflight->size != size) {
> -        int ret = vhost_dev_resize_inflight(inflight, size);
> -        if (ret < 0) {
> -            return ret;
> -        }
> -    }
> -    inflight->queue_size = qemu_get_be16(f);
> -
> -    qemu_get_buffer(f, inflight->addr, size);
> -
> -    return 0;
> -}
> -
>   int vhost_dev_prepare_inflight(struct vhost_dev *hdev, VirtIODevice *vdev)
>   {
>       int r;
> diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
> index c75be46c06..461c168c37 100644
> --- a/include/hw/virtio/vhost.h
> +++ b/include/hw/virtio/vhost.h
> @@ -338,8 +338,6 @@ void vhost_virtqueue_stop(struct vhost_dev *dev, struct VirtIODevice *vdev,
>   
>   void vhost_dev_reset_inflight(struct vhost_inflight *inflight);
>   void vhost_dev_free_inflight(struct vhost_inflight *inflight);
> -void vhost_dev_save_inflight(struct vhost_inflight *inflight, QEMUFile *f);
> -int vhost_dev_load_inflight(struct vhost_inflight *inflight, QEMUFile *f);
>   int vhost_dev_prepare_inflight(struct vhost_dev *hdev, VirtIODevice *vdev);
>   int vhost_dev_set_inflight(struct vhost_dev *dev,
>                              struct vhost_inflight *inflight);

Reviewed-by: Thomas Huth <thuth@redhat.com>


