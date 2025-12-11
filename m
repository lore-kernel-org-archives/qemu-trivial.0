Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C9ABD4335B
	for <qemu-trivial@archiver.kernel.org>; Thu, 11 Dec 2025 22:19:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1vTp03-00063e-S8; Thu, 11 Dec 2025 17:19:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1vTp02-00063E-GK
 for qemu-trivial@nongnu.org; Thu, 11 Dec 2025 17:19:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1vTp00-0002W4-Fe
 for qemu-trivial@nongnu.org; Thu, 11 Dec 2025 17:19:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1765491536;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zsieu2mF6PQ0PO2k1FB7l6z653VVPO2LUXEMNkSR7o8=;
 b=MNNks4Fr2DTfaxUjSlbDgJBt5UWmaxYnjxoAP85hcIwRaGUUczsfsrv1dpRELl/3DEKfp6
 Oa4Wwj6MidlGFiVtazgrU0I15bNOdmjHe/qcR1LfpTCkP/W5BwHf+lEh06kmtGgb5exdnJ
 4bI2lj0taDPh8k7+xKxVYLjC2Fk8e7o=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-621-Gux1ttOANfexLTvBOJwn8g-1; Thu, 11 Dec 2025 17:18:55 -0500
X-MC-Unique: Gux1ttOANfexLTvBOJwn8g-1
X-Mimecast-MFC-AGG-ID: Gux1ttOANfexLTvBOJwn8g_1765491534
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4775d8428e8so4228595e9.0
 for <qemu-trivial@nongnu.org>; Thu, 11 Dec 2025 14:18:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765491534; x=1766096334;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zsieu2mF6PQ0PO2k1FB7l6z653VVPO2LUXEMNkSR7o8=;
 b=hOph7ECC8RwUS5wUOA+m/xHD9xHLcpy3j08mpkqiEUHAYEazwTX/4ru2iVTTG2zeNI
 xj2QPxLsrmKkshyUMn70WX4pmueJ374crFvKxsUD6fe6nGrjH1ZULCJEv/R5PYNPI+c+
 RIOYfnqUhtZDiHA+YtdNHlU/R2o3gBrIorwCTiAcNGm6rmkPh17vQZuesk8gQypPOHus
 UIKhqbwP0rvt5N+UXpmLqmKA25pJ3pGiCMyYWBhlkQf9FozbNrpXRATiZdxAYa6pnHLU
 kySD1JMCHrCHvxEvC3o5fK4Uy9OsthzoGxFsolla/0dT9L+minLg8oBuPNRQwGFaU6jw
 VSYw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUeduIb5zCBqAhGIyDjUs6Xbdhn7w0CcSlwSNg9Km0D7oOi9lComsT1NBZh1C4V29GhC4LQOYIyhwd2PV0=@nongnu.org
X-Gm-Message-State: AOJu0YwZlLdY4xgISwc4QvFqwjhDrII9PzkZMzDbJCuSshBd//b0ketg
 180IsrOpzVvmnPfhS94SjoFoDsMY9pZBNb48ruYul8/v2tnnwBjBHDKsOBWiA9/AMFhJ5IdCEY1
 yj+1lJOZTIEk4fltSBTJKILx2rNyzBEHr7shdVs+HU1W0lSoNqiVh2rVzjBU=
X-Gm-Gg: AY/fxX7V6YaP2h1t5SOi33mgXYpoemUlCA+k2CZafTPMrjAJnZMgVl5CI1IUDnZO4Po
 NON2URVijhx6DlBCHF+x4XOm/c8BQJuK2Uax3DfC3/vjB1IZ423iozQBBRnh0QRkA0ACvzzSkuW
 nduRJSrNapbUKVio0j7ahBOn/ddR6PptCyq8h1xt47B18OiMIULvj9Ma1XmsiyN2MLX05ucpf7k
 YGjm/0Y/g+4dXVlITabewzWijy+HipK/gqx+yzVWSZBA4I+9HlzF0TO9YODXAQBXmnyEr1s3p4z
 HMNx/N+nVOkhIEtZp9WUpnNg39qUGmRrP7eeHcv4A7xArAfwrFVBHktAJk6kjtCgUdFuIEGL5yS
 MVDyVaMhXhVbiQ8K0+H39YvNKtM8zArA=
X-Received: by 2002:a05:600c:210b:b0:477:7a87:48d1 with SMTP id
 5b1f17b1804b1-47a89d90bf0mr33215445e9.30.1765491533786; 
 Thu, 11 Dec 2025 14:18:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH9qa/LQjooZszllyqMv2UskNMf1ZBzNFf4qUVU3ZXhFQ0jM6J7HlzMOBWWqzzSe3KjANh8fQ==
X-Received: by 2002:a05:600c:210b:b0:477:7a87:48d1 with SMTP id
 5b1f17b1804b1-47a89d90bf0mr33215335e9.30.1765491533297; 
 Thu, 11 Dec 2025 14:18:53 -0800 (PST)
Received: from redhat.com (IGLD-80-230-32-59.inter.net.il. [80.230.32.59])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47a89f74284sm60425105e9.9.2025.12.11.14.18.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Dec 2025 14:18:52 -0800 (PST)
Date: Thu, 11 Dec 2025 17:18:50 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Aaron Lo <aaronlo0929@gmail.com>
Cc: =?iso-8859-1?Q?=22Daniel_P=2E_Berrang=E9=22?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, David Hildenbrand <david@kernel.org>,
 qemu-trivial@nongnu.org
Subject: Re: [PATCH] virtio-balloon: only create statsq when
 VIRTIO_BALLOON_F_STATS_VQ exists
Message-ID: <20251211171828-mutt-send-email-mst@kernel.org>
References: <20251211-balloon-check-stats-feature-v1-1-ae8951957b80@gmail.com>
 <aTrTsbhiyKjspttD@redhat.com>
 <E383EEBC-073E-4C5B-B793-E9ADD17EFBD2@gmail.com>
MIME-Version: 1.0
In-Reply-To: <E383EEBC-073E-4C5B-B793-E9ADD17EFBD2@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: YlwAAyK4pwtF0ysCCIzh9Y9ahoOei7Jaxs_9HeHh6ak_1765491534
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
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

On Thu, Dec 11, 2025 at 02:15:58PM -0600, Aaron Lo wrote:
> Hi Daniel and Michael,
> 
> Thanks for the quick feedback.
> 
> Given the migration concerns and issues with the spec itself, I think it’ll be
> best to drop the code changes for now.
> 
> Thanks again for the guidance,
> Aaron

You can do the spec changes though ;)

> 
>     On Dec 11, 2025, at 8:22 AM, Daniel P. Berrangé <berrange@redhat.com>
>     wrote:
> 
>     On Thu, Dec 11, 2025 at 03:05:49AM -0600, Aaron Lo wrote:
> 
>         The VirtIO specification (section 5.5.2) states that the stats queue
>         is only present if the VIRTIO_BALLOON_F_STATS_VQ feature is
>         negotiated. QEMU currently creates the statsq unconditionally.
> 
>         This patch guards statsq creation so it occurs only when the
>         feature bit is enabled.
> 
>         Resolves: https://gitlab.com/qemu-project/qemu/-/issues/3188
> 
>         Signed-off-by: Aaron Lo <aaronlo0929@gmail.com>
>         ---
>         hw/virtio/virtio-balloon.c | 9 +++++++--
>         1 file changed, 7 insertions(+), 2 deletions(-)
> 
>         diff --git a/hw/virtio/virtio-balloon.c b/hw/virtio/virtio-balloon.c
>         index 02cdd807d7..f5d4d5f60c 100644
>         --- a/hw/virtio/virtio-balloon.c
>         +++ b/hw/virtio/virtio-balloon.c
>         @@ -892,7 +892,10 @@ static void virtio_balloon_device_realize
>         (DeviceState *dev, Error **errp)
> 
>             s->ivq = virtio_add_queue(vdev, 128, virtio_balloon_handle_output);
>             s->dvq = virtio_add_queue(vdev, 128, virtio_balloon_handle_output);
>         -    s->svq = virtio_add_queue(vdev, 128,
>         virtio_balloon_receive_stats);
>         +
>         +    if (virtio_has_feature(s->host_features,
>         VIRTIO_BALLOON_F_STATS_VQ)) {
>         +        s->svq = virtio_add_queue(vdev, 128,
>         virtio_balloon_receive_stats);
>         +    }
> 
> 
>     This seems like a change that is liable to break live migration
>     state compatibility, as IIUC the queues are encoded in the state ?
> 
> 
> 
>             if (virtio_has_feature(s->host_features,
>         VIRTIO_BALLOON_F_FREE_PAGE_HINT)) {
>                 s->free_page_vq = virtio_add_queue(vdev, VIRTQUEUE_MAX_SIZE,
>         @@ -932,7 +935,9 @@ static void virtio_balloon_device_unrealize
>         (DeviceState *dev)
> 
>             virtio_delete_queue(s->ivq);
>             virtio_delete_queue(s->dvq);
>         -    virtio_delete_queue(s->svq);
>         +    if (s->svq) {
>         +        virtio_delete_queue(s->svq);
>         +    }
>             if (s->free_page_vq) {
>                 virtio_delete_queue(s->free_page_vq);
>             }
> 
>         ---
>         base-commit: 9c23f2a7b0b45277693a14074b1aaa827eecdb92
>         change-id: 20251211-balloon-check-stats-feature-7ea658e038ce
> 
>         Best regards,
>         -- 
>         Aaron Lo <aaronlo0929@gmail.com>
> 
> 
> 
> 
>     With regards,
>     Daniel
>     -- 
>     |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange
>      :|
>     |: https://libvirt.org         -o-            https://fstop138.berrange.com
>      :|
>     |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange
>      :|
> 
> 


