Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1sq9iK-0002YI-TU
	for mharc-qemu-trivial@gnu.org; Mon, 16 Sep 2024 07:16:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mzamazal@redhat.com>)
 id 1sq9iI-0002Vq-Sj
 for qemu-trivial@nongnu.org; Mon, 16 Sep 2024 07:16:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mzamazal@redhat.com>)
 id 1sq9iH-0002Qv-3h
 for qemu-trivial@nongnu.org; Mon, 16 Sep 2024 07:16:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1726485372;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kyi0gXmnoxT6hg320Z+exO/+kWwl0GnTdJC8MFADhwU=;
 b=Gt+bwboydbLYD+2kf8BV5cNU4aNcJewODX22RqQQoAP1FxGg9ZsofbEunJGOZ2/o6qq5Na
 XHpDUVWZDZBMkXBB+rPsVuYoljOEVS1xrORxaoRPYIJNJVj4OnMzwOa9MLoNoGbHQymf0H
 VvR8wbZcsrDMRDj1JILffHz2TXrls8Q=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-333-T0oklOxVOWmKbtcXyy38sg-1; Mon, 16 Sep 2024 07:15:02 -0400
X-MC-Unique: T0oklOxVOWmKbtcXyy38sg-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-42e611963c2so5942095e9.1
 for <qemu-trivial@nongnu.org>; Mon, 16 Sep 2024 04:15:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726485301; x=1727090101;
 h=mime-version:user-agent:message-id:date:references:in-reply-to
 :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kyi0gXmnoxT6hg320Z+exO/+kWwl0GnTdJC8MFADhwU=;
 b=sgV7aUy6X/oJ7t7sZQe0GGxxfKk9Dgx8V80dLTOXTnifolPiLNVlbev3E5o8/1BJd8
 MNoigO7resh+xq9MMjWvThz5dnjjUseITccTYe8eO5DfEamumblkByfqbUFy7TPBZAc7
 AsrfF8fkX5gUaam6ohfOf5tzLgyFjP4swD1IYpDgR+a6mhcSSjZ7rFQxe2syUGrZ0B/+
 tUecjYs3MpM8ZeKoXnuaL6IW8r7zzQl+/PK0dBTiWmmRCvPX2roZ5aOaRpizqrLDr96R
 i9Hl7TbJXiOX+pVh7zUxkSH9s4Nbojeg3DA2A4DyiEJOIAsCclb2x2uzP7Be6ADpXChd
 dNhQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXwoy6kiF5KZf43u65/i97fWwdQr4WYmN0RzMGbqwcK3m0yPOYjMbiP2YQ9vsbLpoWx3dlvuL8NSzteMDk=@nongnu.org
X-Gm-Message-State: AOJu0Yx78NMdf2xAJXgbY6TAHVmp2mmsYzr/nYT/D6MNNQDKBvWzYcvx
 BRELU1GRHTSCPOWng9U6dcxlv+P5tovv4MfFAb3ziqCHDjB2TqvDW91Hfd8SIpf3LEhYsygv4xE
 qZOB9feFwbmPbctmcButD0FGmCgCtuBAgS3gS4kxD5eURElLSrQq4sz8=
X-Received: by 2002:a05:600c:3b0f:b0:42c:cd7c:a196 with SMTP id
 5b1f17b1804b1-42cdb54cf19mr115742025e9.17.1726485301025; 
 Mon, 16 Sep 2024 04:15:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEkL030V5o6h8N0e4K/E0JIlCgdrENjj1iL033Va/Be4tYEFuSb/R0heWs45zlDoixLU3F8RQ==
X-Received: by 2002:a05:600c:3b0f:b0:42c:cd7c:a196 with SMTP id
 5b1f17b1804b1-42cdb54cf19mr115741755e9.17.1726485300553; 
 Mon, 16 Sep 2024 04:15:00 -0700 (PDT)
Received: from nuthatch (ip-77-48-47-2.net.vodafone.cz. [77.48.47.2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42e62989024sm26841555e9.36.2024.09.16.04.14.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Sep 2024 04:15:00 -0700 (PDT)
From: Milan Zamazal <mzamazal@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org,  qemu-trivial@nongnu.org,  "Michael S . Tsirkin"
 <mst@redhat.com>,  qemu-arm@nongnu.org
Subject: Re: [PATCH] hw/virtio/Kconfig: Include vhost-user-scmi only on arm
 targets
In-Reply-To: <20240913131858.418407-1-thuth@redhat.com> (Thomas Huth's message
 of "Fri, 13 Sep 2024 15:18:58 +0200")
References: <20240913131858.418407-1-thuth@redhat.com>
Date: Mon, 16 Sep 2024 13:14:59 +0200
Message-ID: <87cyl3alzg.fsf@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mzamazal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 16 Sep 2024 11:16:15 -0000

Thomas Huth <thuth@redhat.com> writes:

> The System Control and Management Interface is specific to arm
> machines, so don't include this device in non-arm targets.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Milan Zamazal <mzamazal@redhat.com>

Thank you,
Milan

> ---
>  hw/virtio/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/virtio/Kconfig b/hw/virtio/Kconfig
> index aa63ff7fd4..bea5be4d4a 100644
> --- a/hw/virtio/Kconfig
> +++ b/hw/virtio/Kconfig
> @@ -109,4 +109,4 @@ config VHOST_USER_SND
>  config VHOST_USER_SCMI
>      bool
>      default y
> -    depends on VIRTIO && VHOST_USER
> +    depends on VIRTIO && VHOST_USER && ARM


