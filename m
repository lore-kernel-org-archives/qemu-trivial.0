Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rWbIx-0000ZR-TF
	for mharc-qemu-trivial@gnu.org; Sun, 04 Feb 2024 07:08:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1rWbIw-0000Yj-M1
 for qemu-trivial@nongnu.org; Sun, 04 Feb 2024 07:08:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1rWbIu-0000iN-KM
 for qemu-trivial@nongnu.org; Sun, 04 Feb 2024 07:08:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1707048535;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gZgd+FvMhHlMzWX6cc7WX9EVkdTvVxtVmI0BKMthI2o=;
 b=S6+OKKyiTFiXN5fOq77eJA5oEx9FS+Qux2p+5XsKbdc+5/89nyo6Jz8RQzknfE1kqo5FRE
 +VHBQH1TnXSujfR5ca8usp/Oy1HJytEONbALouuQxbIjkIrJnJXuAhvh3oChUiYedIHoCj
 hzPLF3NF1vAHY72qj3foARbX4kIGIXg=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-606-YAdVHBYJPxO_84RYi9GhfA-1; Sun, 04 Feb 2024 07:08:52 -0500
X-MC-Unique: YAdVHBYJPxO_84RYi9GhfA-1
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-a34a22e09ccso148306966b.1
 for <qemu-trivial@nongnu.org>; Sun, 04 Feb 2024 04:08:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707048531; x=1707653331;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gZgd+FvMhHlMzWX6cc7WX9EVkdTvVxtVmI0BKMthI2o=;
 b=h8YFEt4eKBKFh7Cb3zVg8qOFv+jN25Rb+9F+T4MmJpuM7fIRqg86owh3H3hZeMNn+f
 qDp6spRFiR7MpO02Qa54ydJVn8gv6hmokbKX5UQzGNwAcRbIxqM+badjuQN8QKBTYNuX
 yFByKC05a4zHds6TggC5eYIpGJkgUGp4/yiH6hwhR6BT3DSTuJK0TPwpb8i4RI8XSTFp
 4yL5S1yImI6o6MBUGe4uAO7CNAiLr5BsTQiQEOVHaLzAPLkMGWVD8wyEhmjdKTm/bAbv
 iZdzozTNVd3evex83IA1zjv0gie6d/d0WIjkuPVXFhbZrNxOJO2m611Pl+LJW8qkb5ED
 6rjA==
X-Gm-Message-State: AOJu0YzDChWfFqUCR5vVxE9qeGfF9KWEpNs4KvjQ4JID6u9kkaYBIbvc
 OfYb76mmH8XFrebhGB3M1AXatU9BXnn9+NCe0J8P32a+sBHi2QrE5TkNLD7SfgLe09HrFQ8O2+4
 0TBhLIAIR7aZ+zQ15K60I6jRQDkKygaMztEW0Dee8OZXqD9wf+h8EYvI=
X-Received: by 2002:a17:907:78c9:b0:a37:97f1:d70f with SMTP id
 kv9-20020a17090778c900b00a3797f1d70fmr681718ejc.19.1707048531043; 
 Sun, 04 Feb 2024 04:08:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG+ZIpGoloay66k3Snh53LdJxjtvKo79iqZGwNESAsAM9s5WQylCK01MUtTx/JO3NEFqAN9NQ==
X-Received: by 2002:a17:907:78c9:b0:a37:97f1:d70f with SMTP id
 kv9-20020a17090778c900b00a3797f1d70fmr681697ejc.19.1707048530747; 
 Sun, 04 Feb 2024 04:08:50 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCUH7szXyxWSIXr6x9ESaFxk89w/sGnj6mGDTTpJ3E6qfd/x2whtQaeOdn8ItvnsxXyg0oRx4z8HgLbIlv6Jtqn4EXLyGZcGcmOZUn2Zrt8jMqHKYMh96Ifby24OX1d/klIGCTVke3vPGe+NmYA/xYd1tliPWpmCBIFQ8N+ZjnmnQsfz2TyMbkgzMMwTdyRI1UYawYMEA455qvkTXxTjlWfu
Received: from redhat.com ([2.52.129.159]) by smtp.gmail.com with ESMTPSA id
 z9-20020a170906714900b00a36edfb508asm3083139ejj.79.2024.02.04.04.08.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Feb 2024 04:08:49 -0800 (PST)
Date: Sun, 4 Feb 2024 07:08:46 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: Akihiko Odaki <akihiko.odaki@daynix.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <anisinha@redhat.com>, qemu-devel@nongnu.org,
 qemu-stable@nongnu.org, QEMU Trivial <qemu-trivial@nongnu.org>
Subject: Re: [PATCH v2 0/2] hw/smbios: Fix option validation
Message-ID: <20240204070829-mutt-send-email-mst@kernel.org>
References: <20240129-smbios-v2-0-9ee6fede0d10@daynix.com>
 <7ee3278a-3224-41de-81fa-a3667aa491fb@tls.msk.ru>
MIME-Version: 1.0
In-Reply-To: <7ee3278a-3224-41de-81fa-a3667aa491fb@tls.msk.ru>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.137,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Sun, 04 Feb 2024 12:08:58 -0000

On Sun, Feb 04, 2024 at 07:57:48AM +0300, Michael Tokarev wrote:
> 29.01.2024 11:03, Akihiko Odaki:
> > This fixes qemu_smbios_type8_opts and qemu_smbios_type11_opts to have
> > list terminators and elements for the type option.
> 
> > Akihiko Odaki (2):
> >        hw/smbios: Fix OEM strings table option validation
> >        hw/smbios: Fix port connector option validation
> > 
> >   hw/smbios/smbios.c | 12 ++++++++++++
> >   1 file changed, 12 insertions(+)
> 
> Should I pick this up via the trivial-patches tree perhaps?
> The changes are trivial enough.  Picking up there, unless there's
> a pull request pending for smbios area.
> 
> Thanks,

Fine, sure

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>


> /mjt


