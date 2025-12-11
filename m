Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE87ED41C36
	for <qemu-trivial@archiver.kernel.org>; Thu, 11 Dec 2025 13:15:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1vTgV7-0008Nd-Dg; Thu, 11 Dec 2025 08:14:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1vTgV4-0008Mm-Mn
 for qemu-trivial@nongnu.org; Thu, 11 Dec 2025 08:14:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1vTgV1-0006X6-1R
 for qemu-trivial@nongnu.org; Thu, 11 Dec 2025 08:14:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1765458865;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iZTKgbl4nJ4pEmCnr3LUr8q+SVhkuFCdscPN5Jcb+Xc=;
 b=Dc0M99o9UCFheUaaGDtP9kB1Nky/7gn8wR1wXJiSByXHRkn3Xm5TmnNNWd70zg8BeQcmB1
 DHRffq1PdcKHaIfR97jn+j9UUETb0ItrDQUaiawjtEWZc4lBq3C3IzN2ljqU5RvIq6sPDN
 t/SNCA7IZ8Yq5h0pm3DKKT9KtWLzjEM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-596-lu6XUfZLM76Lf06d2t2B3g-1; Thu, 11 Dec 2025 08:14:24 -0500
X-MC-Unique: lu6XUfZLM76Lf06d2t2B3g-1
X-Mimecast-MFC-AGG-ID: lu6XUfZLM76Lf06d2t2B3g_1765458863
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-477939321e6so534625e9.0
 for <qemu-trivial@nongnu.org>; Thu, 11 Dec 2025 05:14:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765458862; x=1766063662;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iZTKgbl4nJ4pEmCnr3LUr8q+SVhkuFCdscPN5Jcb+Xc=;
 b=Hmkt6ypFBb1PuXWPbEh7+PooSTG/vWZZKSH0J6ThCaX5o27o7cxJHjgg3+MAiYJO+e
 fv8nblYvxitH1Ze0R+zhF/e/e2HUGPXpPz5R4yWN0yF/kUHyw6gvhL1opD1PGGMUjl1t
 6BoB+XU0/+cxn7hL5Jpz9+W/pFlhSEQl6no/BPu1EfZX0FlG/bkXzT+v31Lpscih6JEX
 BNDPYpj9IeHIPCE/5dpf/6SmIPtpnERMflvS8ljla3RCkBr32/g0Z0QoIX/zBlvjBOKu
 NMwpjnUQSK8R+i+ssXtsJm65RNMl+Fv/u38+WT+5NBPy/uQgwBji5VDRckLopfGQ8/yq
 TCpQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUBIG13Ix4TejRbr19kju779b+ADlbnEEl87cqEZA1iWqH/3vdrnt3SUNjv7WROWOMt3+2G+7TSVFAdmuY=@nongnu.org
X-Gm-Message-State: AOJu0Ywp+EqmAjIw5n+o/KWc7QdpwMkL+gsqo7VEbXWtDTHTNPj3IjHt
 bKhGiV8hWk7K3N77TPJdql6bpr84O9sbZuVSMhbJ8QRGtLUsT66nDV5uRNPA2fXCR7uB5iLOPUw
 7rYCI3KlbNiJr7nC1zudvloKn+A9MnR4OfntLUltMtUXrCDPuSQlhutX0uILFdm4emDQ=
X-Gm-Gg: AY/fxX6qeKfKmiOL8c77lA2u8TtAc91Ier4/ik4mYpjyntV/cDbe2tk2EDcvIvzlPRa
 COY8qggA/4fQHFfP8zFw3WyKND7kjqy0OnoVViNVPYPNHOyo1M9tIfrfbFUSv08o9niitXahmuO
 9IVva4o/D+FJ3QEoLXhKvwpECv5BDr2K2r20hxMExImaaZERsb2YZ5Kg6HCv3u3BI9nqX/lKhrY
 5d+ClTUuYvakcUpy8g6sc5SY1dePir+YFJyfwrzJEHsC08IBukKkMhmfFD9oFxijRrRPOQUO590
 J/RHn006BZiyfiNkwqIF1mUACwJZJGbWJ9GK7ufkh2IGBzh3Q2o3T99uMYvmFFm2cbEFrxFjzUc
 u4AF0l8IppYTi+ZWcEnVfrdQeyZeEx/I=
X-Received: by 2002:a05:600c:1c93:b0:471:d2f:7987 with SMTP id
 5b1f17b1804b1-47a837b9a4cmr65554515e9.26.1765458862524; 
 Thu, 11 Dec 2025 05:14:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE5W0XdTUMaiS+g1tNbrTIUnknkLC9jNhaVkk7NoYSN0fJUjROIq5OOez700GNo4ceNiHUSxg==
X-Received: by 2002:a05:600c:1c93:b0:471:d2f:7987 with SMTP id
 5b1f17b1804b1-47a837b9a4cmr65554145e9.26.1765458861897; 
 Thu, 11 Dec 2025 05:14:21 -0800 (PST)
Received: from redhat.com (IGLD-80-230-32-59.inter.net.il. [80.230.32.59])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47a89d9c8acsm36059985e9.1.2025.12.11.05.14.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Dec 2025 05:14:21 -0800 (PST)
Date: Thu, 11 Dec 2025 08:14:19 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Aaron Lo <aaronlo0929@gmail.com>
Cc: qemu-devel@nongnu.org, David Hildenbrand <david@kernel.org>,
 qemu-trivial@nongnu.org
Subject: Re: [PATCH] virtio-balloon: only create statsq when
 VIRTIO_BALLOON_F_STATS_VQ exists
Message-ID: <20251211081246-mutt-send-email-mst@kernel.org>
References: <20251211-balloon-check-stats-feature-v1-1-ae8951957b80@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20251211-balloon-check-stats-feature-v1-1-ae8951957b80@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: dnhUs_BmY2NBec_gd8oP7IuoILUo0En9kh1nMq1Y_2I_1765458863
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org
Sender: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org

On Thu, Dec 11, 2025 at 03:05:49AM -0600, Aaron Lo wrote:
> The VirtIO specification (section 5.5.2) states that the stats queue
> is only present if the VIRTIO_BALLOON_F_STATS_VQ feature is
> negotiated. QEMU currently creates the statsq unconditionally.
> 
> This patch guards statsq creation so it occurs only when the
> feature bit is enabled.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/3188
> 
> Signed-off-by: Aaron Lo <aaronlo0929@gmail.com>


did you test this with linux guests and with
free page hinting?



The issue is that sadly everyone is out of spec here.


We will have to fix the spec.


> ---
>  hw/virtio/virtio-balloon.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/virtio/virtio-balloon.c b/hw/virtio/virtio-balloon.c
> index 02cdd807d7..f5d4d5f60c 100644
> --- a/hw/virtio/virtio-balloon.c
> +++ b/hw/virtio/virtio-balloon.c
> @@ -892,7 +892,10 @@ static void virtio_balloon_device_realize(DeviceState *dev, Error **errp)
>  
>      s->ivq = virtio_add_queue(vdev, 128, virtio_balloon_handle_output);
>      s->dvq = virtio_add_queue(vdev, 128, virtio_balloon_handle_output);
> -    s->svq = virtio_add_queue(vdev, 128, virtio_balloon_receive_stats);
> +
> +    if (virtio_has_feature(s->host_features, VIRTIO_BALLOON_F_STATS_VQ)) {
> +        s->svq = virtio_add_queue(vdev, 128, virtio_balloon_receive_stats);
> +    }
>  
>      if (virtio_has_feature(s->host_features, VIRTIO_BALLOON_F_FREE_PAGE_HINT)) {
>          s->free_page_vq = virtio_add_queue(vdev, VIRTQUEUE_MAX_SIZE,
> @@ -932,7 +935,9 @@ static void virtio_balloon_device_unrealize(DeviceState *dev)
>  
>      virtio_delete_queue(s->ivq);
>      virtio_delete_queue(s->dvq);
> -    virtio_delete_queue(s->svq);
> +    if (s->svq) {
> +        virtio_delete_queue(s->svq);
> +    }
>      if (s->free_page_vq) {
>          virtio_delete_queue(s->free_page_vq);
>      }
> 
> ---
> base-commit: 9c23f2a7b0b45277693a14074b1aaa827eecdb92
> change-id: 20251211-balloon-check-stats-feature-7ea658e038ce
> 
> Best regards,
> -- 
> Aaron Lo <aaronlo0929@gmail.com>


