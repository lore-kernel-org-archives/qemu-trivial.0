Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iriRy-0002Nn-GP
	for mharc-qemu-trivial@gnu.org; Wed, 15 Jan 2020 08:11:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54864)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1iriRv-0002LH-SO
 for qemu-trivial@nongnu.org; Wed, 15 Jan 2020 08:11:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1iriRs-0003jc-0n
 for qemu-trivial@nongnu.org; Wed, 15 Jan 2020 08:11:07 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:22845
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1iriRr-0003gt-Si
 for qemu-trivial@nongnu.org; Wed, 15 Jan 2020 08:11:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579093862;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ghYAhUlcaHszEgi7Olz7AZkocCBLSOKwcNeMAplEE6Y=;
 b=OlJ7N/aEjCSzdmnzhT5yujNY4UV7mTIsTX4X+X4OuBD+pi2LXBZHORb0tvsSF9UFif6LT0
 Si2u53GP6wWSirCh4EwpWb6XLTSI7bbi6jAAsRlz+1O/2EZufFDOAgZlyS6EV7IkGVltQz
 IqLhhlZ5a2GmRmy93xyP5x24aY4j258=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-253-1CX-giFUPUaLmoLhg-S2uA-1; Wed, 15 Jan 2020 08:11:01 -0500
Received: by mail-wr1-f71.google.com with SMTP id f10so8016641wro.14
 for <qemu-trivial@nongnu.org>; Wed, 15 Jan 2020 05:11:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ghYAhUlcaHszEgi7Olz7AZkocCBLSOKwcNeMAplEE6Y=;
 b=r9VswN3BbaLO+2IsttePQcD9L72FcKWf6hguvDoCWhVYbUWe7E1Z6UY1xnhnqIGu4A
 u31rIEQd5K31pxw223225YnbK5fUEdlBCn0sfgBFTelw97EY478V20vu9fYltKQbPfuh
 3v/1DstA3yGUHuOGYOOurxqSuJhVk6n4cxRGUAbfdaxKTJJAcknHLJn7fxBirTM0fiDB
 P0PQJneHmjav9r/Qe60qRSOWnhksJLtk5kOEn+h59k4Q2AwO3loVrY10XGeavq9OVat9
 CIlFjFDsiaQFU04vTnnu6B25SLnK8XMSG/6YrrT/KcPLNeBS6jauxxFsTwJ1zkn2OGvv
 u9kA==
X-Gm-Message-State: APjAAAWvl2oEtBXYMG1wf5WnN87+gjgf5ccCIdHtkaY96L+6IiaAQvjD
 RwAdpgt3fHzn/iHhuvNCnh45I4aDgJDoPcZR6Pf4MWJzZ4OCXGrPwi8q31GtcV82IJvmyHwBsu9
 PEomc0LUzp4cPs+s8tA==
X-Received: by 2002:adf:ca07:: with SMTP id o7mr31919177wrh.49.1579093860410; 
 Wed, 15 Jan 2020 05:11:00 -0800 (PST)
X-Google-Smtp-Source: APXvYqxqnKdC2op8Nz78/c73+WtSnksMAoS8in5OTnxsS56+zdlXSNY7IcGLmlyAw5N4xnMK/hQlIA==
X-Received: by 2002:adf:ca07:: with SMTP id o7mr31919159wrh.49.1579093860158; 
 Wed, 15 Jan 2020 05:11:00 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:436:e17d:1fd9:d92a?
 ([2001:b07:6468:f312:436:e17d:1fd9:d92a])
 by smtp.gmail.com with ESMTPSA id z124sm25421666wmc.20.2020.01.15.05.10.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jan 2020 05:10:59 -0800 (PST)
Subject: Re: [PATCH] hw/input: Do not enable CONFIG_PCKBD by default
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: Philippe Mathieu-Daude <philmd@redhat.com>, qemu-trivial@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <20200115113748.24757-1-thuth@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <d0552e1f-1e05-c761-d69a-b73f7bd0a118@redhat.com>
Date: Wed, 15 Jan 2020 14:10:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20200115113748.24757-1-thuth@redhat.com>
Content-Language: en-US
X-MC-Unique: 1CX-giFUPUaLmoLhg-S2uA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
X-List-Received-Date: Wed, 15 Jan 2020 13:11:09 -0000

On 15/01/20 12:37, Thomas Huth wrote:
> The i8042 device is part of the chipset of a machine, so it should
> be selected by the machines or chipsets (e.g. SuperIO chipsets),
> and not be enabled by default.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  hw/input/Kconfig | 1 -
>  hw/isa/Kconfig   | 1 +
>  2 files changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/input/Kconfig b/hw/input/Kconfig
> index 287f08887b..a2f25725be 100644
> --- a/hw/input/Kconfig
> +++ b/hw/input/Kconfig
> @@ -7,7 +7,6 @@ config LM832X
>  
>  config PCKBD
>      bool
> -    default y
>      select PS2
>      depends on ISA_BUS
>  
> diff --git a/hw/isa/Kconfig b/hw/isa/Kconfig
> index 8a38813cc1..c7f07854f7 100644
> --- a/hw/isa/Kconfig
> +++ b/hw/isa/Kconfig
> @@ -16,6 +16,7 @@ config I82378
>  config ISA_SUPERIO
>      bool
>      select ISA_BUS
> +    select PCKBD
>  
>  config PC87312
>      bool
> 

Since you CCed qemu-trivial,

Acked-by: Paolo Bonzini <pbonzini@redhat.com>


