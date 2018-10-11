Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gAYJ9-0002v2-Js
	for mharc-qemu-trivial@gnu.org; Thu, 11 Oct 2018 06:35:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43824)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gAYJ7-0002uX-N6
	for qemu-trivial@nongnu.org; Thu, 11 Oct 2018 06:35:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gAYJ4-0001xe-J2
	for qemu-trivial@nongnu.org; Thu, 11 Oct 2018 06:35:05 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:34323)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gAYJ4-0001wI-BA
	for qemu-trivial@nongnu.org; Thu, 11 Oct 2018 06:35:02 -0400
Received: by mail-wr1-f65.google.com with SMTP id l6-v6so8670962wrt.1
	for <qemu-trivial@nongnu.org>; Thu, 11 Oct 2018 03:35:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=h8gM0DVddxE8Q47Xpt4/6FqWhXXs09QMSRWTZ/Tfx7g=;
	b=XahGwYMswnNrLPS5vEULe8XqnOPBRhv82qawHJlDN/ZFowWFox69kbQugol+JMbhrO
	BAA5pXjzP4UNV7NVCbLVvgHd4Ba1+eHzrJ2VgYC2rvcN+0VDFhUxsl639gbrbFzk3ySD
	vf/qEb6X7mqXKQq1XGsno7XEnw4fPd6JNdmfMyZtoNEn0pN+VJPy5THvpmq4GGfRItJe
	8H5ZhHiehujGJn7iJZ7OmvnXz1hZQvIPrAFMwEB8Axze3R+X499ep49h4eFoOSL/JSCd
	UQwWvo4s3EUdbJdtvpxhL6eUPXNmL6RnNPMcBNvU/KDQZAwf7p4za0K1Hbm3d5e04TRL
	ultg==
X-Gm-Message-State: ABuFfohhzx5J5g+rUC+3h74qVFpH5CcY5yK/R1RO/MhaT9Gu+vLYIZJ4
	DFHxjYSGmBRmOnogL87+ZI4d8Q==
X-Google-Smtp-Source: ACcGV62AQMTSRrindgaXxyb4K9kD2gomWTJgatJPZQ+m8gyJcyhSEORxWs1ArX33p5c6sjUbh4irDw==
X-Received: by 2002:adf:a29d:: with SMTP id
	s29-v6mr1061372wra.100.1539254101258; 
	Thu, 11 Oct 2018 03:35:01 -0700 (PDT)
Received: from [192.168.2.33] (62.red-88-24-165.staticip.rima-tde.net.
	[88.24.165.62]) by smtp.gmail.com with ESMTPSA id
	y76-v6sm10909902wmd.37.2018.10.11.03.35.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 11 Oct 2018 03:35:00 -0700 (PDT)
To: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org
Cc: mst@redhat.com
References: <20181011082508.29014-1-maozhongyi@cmss.chinamobile.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <e8a3e14b-3bac-603f-74c5-fa77b1bc26c2@redhat.com>
Date: Thu, 11 Oct 2018 12:34:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20181011082508.29014-1-maozhongyi@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.65
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] pci_bridge: fix typo in
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
X-List-Received-Date: Thu, 11 Oct 2018 10:35:06 -0000

On 11/10/2018 10:25, Mao Zhongyi wrote:
> Signed-off-by: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>  hw/pci/pci_bridge.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/pci/pci_bridge.c b/hw/pci/pci_bridge.c
> index 90f7208856..da8daa3ff2 100644
> --- a/hw/pci/pci_bridge.c
> +++ b/hw/pci/pci_bridge.c
> @@ -399,7 +399,7 @@ void pci_bridge_exitfn(PCIDevice *pci_dev)
>  
>  /*
>   * before qdev initialization(qdev_init()), this function sets bus_name and
> - * map_irq callback which are necessry for pci_bridge_initfn() to
> + * map_irq callback which are necessary for pci_bridge_initfn() to
>   * initialize bus.
>   */
>  void pci_bridge_map_irq(PCIBridge *br, const char* bus_name,
> 

