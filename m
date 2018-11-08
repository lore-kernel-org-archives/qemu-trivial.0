Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gKk7R-00015W-8F
	for mharc-qemu-trivial@gnu.org; Thu, 08 Nov 2018 08:13:09 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59200)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gKk7M-0000iP-2g
	for qemu-trivial@nongnu.org; Thu, 08 Nov 2018 08:13:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gKk7A-0004EU-PQ
	for qemu-trivial@nongnu.org; Thu, 08 Nov 2018 08:12:59 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:33961)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gKk78-0003om-NZ
	for qemu-trivial@nongnu.org; Thu, 08 Nov 2018 08:12:52 -0500
Received: by mail-wr1-f67.google.com with SMTP id j26-v6so21228108wre.1
	for <qemu-trivial@nongnu.org>; Thu, 08 Nov 2018 05:12:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=xeWdK68jUpUFcvoYdxrj1gaJNjmxRG8DC4m4vX4AvA8=;
	b=YNftPV2m1hPLaicsaida6UGYAMdjN5yM3ZcNKlksy4XGYiAPRUN9w4ZPbO/QIZTb50
	4MNfwKTUWv5GOKFla0CQaVlgHIVN/+PnpWaIDYnEVBgg8kuDK1Aoi8WbFidC1MI97VGh
	HmDp9ktXrYQqpEgf420K5R3p3gwA7qPnVidgOjg16dynaqT2pq6T67bCJx5Gu9UUiRKp
	zwSnCn2BBm9g8RT9hUJ8NPd1Jwna/ubZe87CLxcFBmnU9vEoW1s5YdS0U+SoCK5CsmWr
	MEN43J3VnTpxTF/3fun8H2Ka+a0Cy1/Y/rjJ6aSgRez9Rgo9s3BMdEl/Xe+ecArA2V1K
	nB/g==
X-Gm-Message-State: AGRZ1gKD/KW9SWwAfM42mw7UO+EYGY6PpGpzMdyQQWtIS+AjSdakdTZR
	1MWAbpytLRRyirZVg44m4y6nl1DlLzdS+Q==
X-Google-Smtp-Source: AJdET5els8O7LJDKyPsbzk7kzAweiLc2k1lWIr4Q8XKLm8i6rouY2d4qdbz4fZOOFfuaEWdtHt45Tg==
X-Received: by 2002:adf:9b84:: with SMTP id
	d4-v6mr3912613wrc.240.1541682758512; 
	Thu, 08 Nov 2018 05:12:38 -0800 (PST)
Received: from [192.168.0.151] (138.red-88-22-110.staticip.rima-tde.net.
	[88.22.110.138]) by smtp.gmail.com with ESMTPSA id
	j203-v6sm6327257wmd.46.2018.11.08.05.12.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 08 Nov 2018 05:12:37 -0800 (PST)
To: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>, qemu-devel@nongnu.org
Cc: mst@redhat.com,
	"qemu-trivial@nongnu.org >> QEMU Trivial" <qemu-trivial@nongnu.org>
References: <20181108122102.9915-1-maozhongyi@cmss.chinamobile.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <1898dc23-c512-88bd-cb73-5a2cffccd176@redhat.com>
Date: Thu, 8 Nov 2018 14:12:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181108122102.9915-1-maozhongyi@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.67
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] pci_bridge: fix a typo in
 comment
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 08 Nov 2018 13:13:08 -0000

Cc'ing qemu-trivial@

On 8/11/18 13:21, Mao Zhongyi wrote:
> Signed-off-by: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>   hw/pci/pci_bridge.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/pci/pci_bridge.c b/hw/pci/pci_bridge.c
> index ee9dff2d3a..da8daa3ff2 100644
> --- a/hw/pci/pci_bridge.c
> +++ b/hw/pci/pci_bridge.c
> @@ -310,7 +310,7 @@ void pci_bridge_reset(DeviceState *qdev)
>   
>       /*
>        * the default values for base/limit registers aren't specified
> -     * in the PCI-to-PCI-bridge spec. So we don't thouch them here.
> +     * in the PCI-to-PCI-bridge spec. So we don't touch them here.
>        * Each implementation can override it.
>        * typical implementation does
>        * zero base/limit registers or
> 

