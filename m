Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jgv3E-0006vV-Pa
	for mharc-qemu-trivial@gnu.org; Thu, 04 Jun 2020 14:57:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jgv3D-0006sB-01
 for qemu-trivial@nongnu.org; Thu, 04 Jun 2020 14:57:15 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:43433
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jgv3B-00048V-16
 for qemu-trivial@nongnu.org; Thu, 04 Jun 2020 14:57:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591297032;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vUBwtgqtS3fbGSHGtj76gaU04adG9cf7zkUg6v/29Lc=;
 b=QQxxrW1vnCxTSGIJiyCx9nYvzOPehKQf4oESj2Zs4KcwCREToFe86IOYOFqwSOi3GlZBbh
 rETjcNK8Kj+F7XUvRKNRuRP2alDVyvaofsj/IWXuusM30FmJHFImgmdy7suPO9sn1NDm8V
 shNy+sYvF6MHZqkr24Zazjat1KTsI0I=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-127-G58Ka6yCO0S7K3JpDIwzZw-1; Thu, 04 Jun 2020 14:57:07 -0400
X-MC-Unique: G58Ka6yCO0S7K3JpDIwzZw-1
Received: by mail-wr1-f70.google.com with SMTP id t5so2769047wro.20
 for <qemu-trivial@nongnu.org>; Thu, 04 Jun 2020 11:57:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vUBwtgqtS3fbGSHGtj76gaU04adG9cf7zkUg6v/29Lc=;
 b=AafbmdLtvo4EHGtl6QTxcClVDNyZcfZ8spcRgxaiF1hCzh4QnDHzEpMYyfUWJ869fX
 7g4njUUSDzJSuzOakbxD3efq405Vb7C3d7PAUT5oj6I80JbS0MYFzF2YNkRJhtFb7RT3
 OSea6+6gVN9HQ66IqEvUVA5ouAQLMIY59PAspN+54V03Ac53XjZZJe8w/JjHcimISpfI
 FzQQMsnu8Om/SignOMfqQJCUaoiM+DuTjtgiaZVD9IRUl+v3/ICE3p4WJWR5lu7ChyDW
 BeNhtnbUjwIgT2l1TfPdwtjkZVbW0YMHg5089CFWDU9pyW4XPW6r+JVns7Kq+b0tHwCQ
 AWeg==
X-Gm-Message-State: AOAM532jwUxvHiqvtvyvyW6l6dBArZKd2Q0nSTQzeyzECY1U3vFpv1M5
 fVO98TVwGdznqfsm+7iezP7NCaPT04tbvuRjvoaaSXxs0FbDMZjAeNTdmpkMQrps4um5wU+NgQe
 A+y+dvYfGeMjeO+EQ3A==
X-Received: by 2002:a1c:4143:: with SMTP id o64mr5159418wma.157.1591297025769; 
 Thu, 04 Jun 2020 11:57:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxoKfoQba/VQvR4huvN5rVgbFJj5e20KDK0NPjqekWvwEBWEYyK/nbkp5uCfIyCna6UpiJxhw==
X-Received: by 2002:a1c:4143:: with SMTP id o64mr5159401wma.157.1591297025548; 
 Thu, 04 Jun 2020 11:57:05 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:a0c0:5d2e:1d35:17bb?
 ([2001:b07:6468:f312:a0c0:5d2e:1d35:17bb])
 by smtp.gmail.com with ESMTPSA id p9sm8307588wma.48.2020.06.04.11.57.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Jun 2020 11:57:04 -0700 (PDT)
Subject: Re: [PATCH v2 0/3] exec: Kill CPUReadMemoryFunc/CPUWriteMemoryFunc
 typedefs
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: Richard Henderson <rth@twiddle.net>, Gerd Hoffmann <kraxel@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org
References: <20200601141536.15192-1-f4bug@amsat.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <3e07baa2-59d0-1960-8037-8054396920a5@redhat.com>
Date: Thu, 4 Jun 2020 20:57:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200601141536.15192-1-f4bug@amsat.org>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/04 01:31:23
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Thu, 04 Jun 2020 18:57:15 -0000

On 01/06/20 16:15, Philippe Mathieu-Daudé wrote:
> Followed Peter's suggestions [1]:
> 
>  * delete the unused MmeoryRegionMmio
>  * move these typedefs into include/hw/usb.h and rename them
>    to MUSBReadFunc and MUSBWriteFunc, since that's all they're
>    used for now
> 
> Since v1 [2], addressed Peter review:
> - Renamed include/hw/usb/musb.h -> include/hw/usb/hcd-musb.h
> - Added Peter's R-b tags
> 
> Series fully reviewed.
> 
> [1] https://www.mail-archive.com/qemu-devel@nongnu.org/msg708165.html
> [2] https://www.mail-archive.com/qemu-devel@nongnu.org/msg708194.html
> 
> Philippe Mathieu-Daudé (3):
>   exec/memory: Remove unused MemoryRegionMmio type
>   hw/usb: Move device-specific declarations to new 'hcd-musb.h' header
>   exec/cpu-common: Move MUSB specific typedefs to 'hw/usb/hcd-musb.h'
> 
>  include/exec/cpu-common.h |  3 ---
>  include/exec/memory.h     |  6 -----
>  include/hw/usb.h          | 30 -------------------------
>  include/hw/usb/hcd-musb.h | 47 +++++++++++++++++++++++++++++++++++++++
>  hw/usb/hcd-musb.c         |  5 +++--
>  hw/usb/tusb6010.c         |  1 +
>  6 files changed, 51 insertions(+), 41 deletions(-)
>  create mode 100644 include/hw/usb/hcd-musb.h
> 

Queued, thanks.

Paolo


