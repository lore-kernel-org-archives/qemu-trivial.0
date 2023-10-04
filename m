Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qnxhR-0008Px-67
	for mharc-qemu-trivial@gnu.org; Wed, 04 Oct 2023 04:57:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1qnxhO-0008HJ-J4
 for qemu-trivial@nongnu.org; Wed, 04 Oct 2023 04:57:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1qnxhN-0002AO-1D
 for qemu-trivial@nongnu.org; Wed, 04 Oct 2023 04:57:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1696409859;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xABv1eu7kBKoAyjzNCC6eSzeLK84Y5zhYEDZCeq4Nos=;
 b=iq0BZu72h0tbnXKnBusKDEYpSx68J83mN4fe8pfzFMSfeiBDsBvaVuam7ACKuaru4zmIdN
 mYreBdBnE91uH48sMhiPZ0eLZk1e6pdaxn4o6ELEdEsrWsJBnDY3pu2WfcgO99zlzBQ1fU
 MGcKTjm8u5zyf+qpsB58hxlExeKq9Hk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-237-s1b6pUaCP5agAn7VCGartw-1; Wed, 04 Oct 2023 04:57:38 -0400
X-MC-Unique: s1b6pUaCP5agAn7VCGartw-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-3f41a04a297so13598455e9.3
 for <qemu-trivial@nongnu.org>; Wed, 04 Oct 2023 01:57:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696409857; x=1697014657;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xABv1eu7kBKoAyjzNCC6eSzeLK84Y5zhYEDZCeq4Nos=;
 b=ox23N5ugXqSn+dNBc41UYVhhdnOkEJX1ivPhNQUr9xM92kudv7/TFjz2RqMEw5Wter
 HeizZonovkOcjyQQ3fBjqnr0z9woYiw3Bo5EUZo+7DiJS01xL7scgkf1eqsZpFTm+TtZ
 iL4LrUy5Ebf6Upe1aoPqvb0j0WbFEXo1IIqPJ9vx5Abq/lNA4Nxss+8nXIB9jiN3yOiA
 FSa/CQmTWP40p5JLnI3xpcoKUhdDzrAeSneu7MBzfmJZq62JgFqC/XJGrFu9P2yfv3wT
 U9BwLH9DwHjWFBEIay4sE02ZJpl1ahdG4MvMUOyUSDlfblD5Vtx5K01F86ZCw4b7TZWp
 huGA==
X-Gm-Message-State: AOJu0Yy//JQi5LvCxQuWHAXEz2YLRr8mP2n1vht9uAcG8+GzwZmZed47
 TDSL1KYhYdIk7F5/Civ8m8ukOkypLJ20bYDCNtTl6Rj6ikNKSPPNXBURtoudxPxw4az4zOa5XMz
 o++cHYf4mxoiHjaE75kKgqIrtMw==
X-Received: by 2002:a1c:791a:0:b0:406:5308:cfeb with SMTP id
 l26-20020a1c791a000000b004065308cfebmr1732782wme.11.1696409856813; 
 Wed, 04 Oct 2023 01:57:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFXhRfVkuxXF66F42JfMhbB01j8TaACY/gln6c/SABjFD6B1vG79mkKCpNQXx65tc+PXGi1qg==
X-Received: by 2002:a1c:791a:0:b0:406:5308:cfeb with SMTP id
 l26-20020a1c791a000000b004065308cfebmr1732769wme.11.1696409856422; 
 Wed, 04 Oct 2023 01:57:36 -0700 (PDT)
Received: from redhat.com ([2.52.137.96]) by smtp.gmail.com with ESMTPSA id
 a15-20020a5d570f000000b003217cbab88bsm3460601wrv.16.2023.10.04.01.57.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Oct 2023 01:57:35 -0700 (PDT)
Date: Wed, 4 Oct 2023 04:57:32 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-trivial@nongnu.org
Subject: Re: [PATCH] hw/net/vhost_net: Silence compiler warning when
 compiling with -Wshadow
Message-ID: <20231004045724-mutt-send-email-mst@kernel.org>
References: <20231004084939.96349-1-thuth@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20231004084939.96349-1-thuth@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Wed, 04 Oct 2023 08:57:43 -0000

On Wed, Oct 04, 2023 at 10:49:39AM +0200, Thomas Huth wrote:
> Rename the innermost local variables to avoid compiler warnings
> with "-Wshadow".
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

feel free to merge

> ---
>  hw/net/vhost_net.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
> index 57427a3997..e8e1661646 100644
> --- a/hw/net/vhost_net.c
> +++ b/hw/net/vhost_net.c
> @@ -313,8 +313,8 @@ fail:
>                  /* Queue might not be ready for start */
>                  continue;
>              }
> -            int r = vhost_net_set_backend(&net->dev, &file);
> -            assert(r >= 0);
> +            int ret = vhost_net_set_backend(&net->dev, &file);
> +            assert(ret >= 0);
>          }
>      }
>      if (net->nc->info->poll) {
> @@ -629,8 +629,8 @@ err_start:
>      if (net->nc->info->type == NET_CLIENT_DRIVER_TAP) {
>          file.fd = VHOST_FILE_UNBIND;
>          file.index = idx;
> -        int r = vhost_net_set_backend(&net->dev, &file);
> -        assert(r >= 0);
> +        int ret = vhost_net_set_backend(&net->dev, &file);
> +        assert(ret >= 0);
>      }
>  
>      vhost_dev_stop(&net->dev, vdev, false);
> -- 
> 2.41.0


