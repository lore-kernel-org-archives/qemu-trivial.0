Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1hxsgi-0002tl-SK
	for mharc-qemu-trivial@gnu.org; Wed, 14 Aug 2019 08:47:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46753)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1hxsga-0002rN-Ly
 for qemu-trivial@nongnu.org; Wed, 14 Aug 2019 08:47:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hxsgZ-0006Ik-Cy
 for qemu-trivial@nongnu.org; Wed, 14 Aug 2019 08:47:28 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:34491)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hxsgZ-0006IB-7i
 for qemu-trivial@nongnu.org; Wed, 14 Aug 2019 08:47:27 -0400
Received: by mail-wr1-f65.google.com with SMTP id 31so111010365wrm.1
 for <qemu-trivial@nongnu.org>; Wed, 14 Aug 2019 05:47:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GC88iupRSuNnyAPJpl7DNBIbadpWmmmmfnXyCOrnxdA=;
 b=jqlrCw0gVJ58TMyG64LfkF7yBOD5GhROVgLz580afyf7tUFwk8Y+W+kCXzC64V4pUK
 n4RMhggHn2UL30supBouwj4t/OV0txM1pYYKwDto4zrIlVLcPZRumwpu4XKex37UuB5n
 T+OrpF6ekSstjDJpDsReCRvyywpnLzsP4s+3au532ByNGkCZ/o5hlHgCPIJk38wec+Hz
 4Js9/ivl4qzcCYPiCs2I+Bv42H1bkux5CwIQ6ZsLn4qSuOYWeGOR2i3fam6pnREgI90H
 myWnLkazTrDQDySal377ibyzJsxXItz4Jvpkdw5xB4VlZ5ROLrn+Tvkg2jAEnQTcRimO
 xOhg==
X-Gm-Message-State: APjAAAV7b19WPRLvfjJY5rnhGKIZI4eogMDDcdhM8xyEoqZcdJ8MZeen
 NgtcWGEzcKFjtdZ9On5GhxrP+F+Xems=
X-Google-Smtp-Source: APXvYqwSct0RcaqpUduab3tgYMGI0w6mVQ3cTs5V0Yg4ICVpFuKmgCALN1TKJ/bC+2Qy/kz8wZmYsA==
X-Received: by 2002:a5d:54ce:: with SMTP id x14mr27046370wrv.237.1565786845734; 
 Wed, 14 Aug 2019 05:47:25 -0700 (PDT)
Received: from [192.168.1.39] (251.red-88-10-102.dynamicip.rima-tde.net.
 [88.10.102.251])
 by smtp.gmail.com with ESMTPSA id w14sm10127884wrl.21.2019.08.14.05.47.24
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Wed, 14 Aug 2019 05:47:25 -0700 (PDT)
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-arm@nongnu.org,
 Miroslav Rezanina <mrezanin@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 QEMU Trivial <qemu-trivial@nongnu.org>
References: <20190712133928.21394-1-philmd@redhat.com>
 <20190712133928.21394-4-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <0ded162d-50cf-42f6-bfcf-a0d1b0d97007@redhat.com>
Date: Wed, 14 Aug 2019 14:47:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190712133928.21394-4-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.65
Subject: Re: [Qemu-trivial] [PATCH-for-4.1? 3/7] MAINTAINERS: Add an entry
 for the Bluetooth devices
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
X-List-Received-Date: Wed, 14 Aug 2019 12:47:30 -0000

Cc'ing qemu-trivial@ to salvage this patch.

On 7/12/19 3:39 PM, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  MAINTAINERS | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index cc9636b43a..5d8f27d9bd 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1733,6 +1733,13 @@ F: hw/*/*xive*
>  F: include/hw/*/*xive*
>  F: docs/*/*xive*
>  
> +Bluetooth
> +S: Orphan
> +F: bt-*.c
> +F: hw/bt/
> +F: include/hw/bt.h
> +F: include/sysemu/bt.h
> +
>  Subsystems
>  ----------
>  Audio
> 

