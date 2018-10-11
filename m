Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gAZvL-0001o1-9h
	for mharc-qemu-trivial@gnu.org; Thu, 11 Oct 2018 08:18:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39394)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gAZvH-0001m6-3h
	for qemu-trivial@nongnu.org; Thu, 11 Oct 2018 08:18:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gAZvB-0007YV-WF
	for qemu-trivial@nongnu.org; Thu, 11 Oct 2018 08:18:35 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:37018)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gAZvB-0007Xx-PD
	for qemu-trivial@nongnu.org; Thu, 11 Oct 2018 08:18:29 -0400
Received: by mail-wm1-f66.google.com with SMTP id 185-v6so9223709wmt.2
	for <qemu-trivial@nongnu.org>; Thu, 11 Oct 2018 05:18:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=nvrHzPVeZsz4vRKfQNjXnFDvNkMFNCnPyJ2YedawZbA=;
	b=hyP7hPcfeEGy5InTa4NUTvhWdKJdTAXkY9eNunhv32ND3uPCU6gtz8Y2yKXWh+H2DF
	xzMTNY2el2F9KNJtxT/ptJCX0w0+0y447IIylrb3EyiJ2UlCEUngbWnBB9qjrpGYCeeI
	Kvzr0TMBcN9AURMJkag1IgdPcqByV/FVlnpV0krPHKV2mwrJraitvZw8kHuRWU/9XWgN
	7Ttw04/N+FKuyr9DoW+FuUfVZSlnFjYyl0HwVdHdzimHXD9j/b+8THjpq1j9Eyfr1+qC
	rzefhaajfc7Taq/JKxm9sTLivbFg7PwuAaZtnPgdAwLToujKEgnwd5gASWn6oaNp8kIM
	lS2w==
X-Gm-Message-State: ABuFfoidIoW31hSdtmhDY5ZsbEOpI4kr1NqY+xsr/9B35vOPnbdUOrg2
	LAMSGaoNHYY6ysBKaRJpM7SmIxJrhVY=
X-Google-Smtp-Source: ACcGV61DFlk8q71q/E3qy1xJgrzAH5o6Y4/SocEd3DIawS6SSQ7jhhnOFL0gjpvZIHTtrkGeGNvl2Q==
X-Received: by 2002:a1c:540d:: with SMTP id
	i13-v6mr1555207wmb.149.1539260308739; 
	Thu, 11 Oct 2018 05:18:28 -0700 (PDT)
Received: from [192.168.2.33] (62.red-88-24-165.staticip.rima-tde.net.
	[88.24.165.62]) by smtp.gmail.com with ESMTPSA id
	b71-v6sm24407381wma.13.2018.10.11.05.18.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 11 Oct 2018 05:18:28 -0700 (PDT)
To: Li Qiang <liq3ea@gmail.com>, mst@redhat.com, marcel.apfelbaum@gmail.com
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
References: <1539260043-4264-1-git-send-email-liq3ea@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <309b17e0-0353-86b6-ed4f-e80b8a4ea384@redhat.com>
Date: Thu, 11 Oct 2018 14:18:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <1539260043-4264-1-git-send-email-liq3ea@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.66
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] i440fx: use ARRAY_SIZE for
 pam_regions
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
X-List-Received-Date: Thu, 11 Oct 2018 12:18:37 -0000

On 11/10/2018 14:14, Li Qiang wrote:
> Cc: qemu-trivial@nongnu.org 
> 
> Signed-off-by: Li Qiang <liq3ea@gmail.com>

Good cleanup!

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>  hw/pci-host/piix.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/pci-host/piix.c b/hw/pci-host/piix.c
> index 0e608347c1..230d5d2ea3 100644
> --- a/hw/pci-host/piix.c
> +++ b/hw/pci-host/piix.c
> @@ -142,7 +142,7 @@ static void i440fx_update_memory_mappings(PCII440FXState *d)
>      PCIDevice *pd = PCI_DEVICE(d);
>  
>      memory_region_transaction_begin();
> -    for (i = 0; i < 13; i++) {
> +    for (i = 0; i < ARRAY_SIZE(d->pam_regions); i++) {
>          pam_update(&d->pam_regions[i], i,
>                     pd->config[I440FX_PAM + (DIV_ROUND_UP(i, 2))]);
>      }
> @@ -401,7 +401,7 @@ PCIBus *i440fx_init(const char *host_type, const char *pci_type,
>  
>      init_pam(dev, f->ram_memory, f->system_memory, f->pci_address_space,
>               &f->pam_regions[0], PAM_BIOS_BASE, PAM_BIOS_SIZE);
> -    for (i = 0; i < 12; ++i) {
> +    for (i = 0; i < ARRAY_SIZE(f->pam_regions) - 1; ++i) {
>          init_pam(dev, f->ram_memory, f->system_memory, f->pci_address_space,
>                   &f->pam_regions[i+1], PAM_EXPAN_BASE + i * PAM_EXPAN_SIZE,
>                   PAM_EXPAN_SIZE);
> 

