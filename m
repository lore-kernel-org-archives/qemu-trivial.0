Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kfR8h-0000Li-Hj
	for mharc-qemu-trivial@gnu.org; Wed, 18 Nov 2020 12:21:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kfR8e-0000Fs-TC
 for qemu-trivial@nongnu.org; Wed, 18 Nov 2020 12:21:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:25549)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kfR8c-0002IC-5t
 for qemu-trivial@nongnu.org; Wed, 18 Nov 2020 12:21:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605720052;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nrI50kPNCZ45HXYFYyxcsMC1QWaXFy7XZX4EjINRAP8=;
 b=EZWXyeVWXYZ9riUb45uZwzdNSryyJl2xctQTN0LKHPFcQ/8mQuFYpFQ/fcjBaRuNbewavh
 jybUKuf0MVydyJxCamY+kvAcZ6rrp/DR1NMsiMWyIySiGKlOz2ZbFpOSYOrpWjNxzIVqQi
 gpwjkm273CrhGpQzQKn4zUP3bAhYS0E=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-16-uLOHwhBBOrKSD0BTRrFQaw-1; Wed, 18 Nov 2020 12:20:50 -0500
X-MC-Unique: uLOHwhBBOrKSD0BTRrFQaw-1
Received: by mail-ed1-f72.google.com with SMTP id c24so1097272edx.2
 for <qemu-trivial@nongnu.org>; Wed, 18 Nov 2020 09:20:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nrI50kPNCZ45HXYFYyxcsMC1QWaXFy7XZX4EjINRAP8=;
 b=tIWS9F54UGu9J8/4MCz53iu0TEkzhiD4dRGkGIWZu8fgFCDCOluQQhezJKfHT44AIL
 r8H4kM/YwQ2xM5B2QGzAwGWssT98QOo4Bu+ucO9gdmASphiN1vXV6sFmcpd+0adZFXkG
 H6ZnrfShOdgRGGboqlqhrVy2hhHTBILLVr/9ue+Wv80T2UxKYnxkhO8qfSpk7YstQIFT
 bAlQ+uG5fyk0MapMO3P0nwy8AxgHWh+kuZdH5f/BQFKbat1q+qgpHM9c6DaRp2kDdaCf
 I9ZYYBqdflAVNacRWDbXziCnXXE+/lcFM3LN2WUhG02XNPZY74ThZFbO1KCCP6y3vkRt
 r7Fw==
X-Gm-Message-State: AOAM532BmWTa2kBGtnl02qy1yu9uhyOGiL1F8yw6y33/W388M6y+3GFu
 gkE/2761YIwROqd+zhXS382kQqYM5Es7LjP8gBd3RiKCb0tNA0topyMrsp35ctCyWgM8UERS34n
 /ZnPBmXEJQeOBIqQKEhhbAghlF2UfQek4frX1O7fSSNjemtCPFkOei4h4gwPkX4VdTQL3Yw==
X-Received: by 2002:a17:906:f98d:: with SMTP id
 li13mr2331257ejb.547.1605720049028; 
 Wed, 18 Nov 2020 09:20:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwjW191oXW0RkLapzy8roIhSvcOv4p7a1BTGFV0fM+mH523LCbO3HlTjQwfpnO+AmOwZ/e1jw==
X-Received: by 2002:a17:906:f98d:: with SMTP id
 li13mr2331230ejb.547.1605720048667; 
 Wed, 18 Nov 2020 09:20:48 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id cz14sm13841798edb.46.2020.11.18.09.20.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Nov 2020 09:20:47 -0800 (PST)
Subject: Re: [PATCH 0/6] configure / meson: Move check for headers to
 meson.build
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>,
 "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>
References: <20201118171052.308191-1-thuth@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <d0606941-0ef2-3590-bc36-73cdea39b634@redhat.com>
Date: Wed, 18 Nov 2020 18:20:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201118171052.308191-1-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 19:41:43
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
X-List-Received-Date: Wed, 18 Nov 2020 17:21:01 -0000

On 18/11/20 18:10, Thomas Huth wrote:
> The checks for header files can be done much shorter and nicer in
> meson.build. Let's move them there.

Nice, thanks.  Let's route it through qemu-trivial unless Laurent complains.

Thanks,

Paolo

> Thomas Huth (6):
>    configure: Remove the obsolete check for ifaddrs.h
>    configure / meson: Move check for pty.h to meson.build
>    configure / meson: Move check for drm.h to meson.build
>    configure / meson: Move check for sys/signal.h to meson.build
>    configure / meson: Move check for sys/signal.h to meson.build
>    configure / meson: Move check for linux/btrfs.h to meson.build
> 
>   configure                 | 58 ---------------------------------------
>   linux-user/ioctls.h       |  2 +-
>   linux-user/syscall.c      |  4 +--
>   linux-user/syscall_defs.h |  2 +-
>   meson.build               |  5 ++++
>   5 files changed, 9 insertions(+), 62 deletions(-)
> 


