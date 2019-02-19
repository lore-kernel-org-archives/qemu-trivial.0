Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gwBrR-0005KC-Ti
	for mharc-qemu-trivial@gnu.org; Tue, 19 Feb 2019 15:19:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49434)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1gwBrN-0005IW-PN
	for qemu-trivial@nongnu.org; Tue, 19 Feb 2019 15:19:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1gwBrL-0000nn-KG
	for qemu-trivial@nongnu.org; Tue, 19 Feb 2019 15:19:20 -0500
Received: from mail-qk1-f196.google.com ([209.85.222.196]:37257)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <mst@redhat.com>) id 1gwBrL-0000nT-Ga
	for qemu-trivial@nongnu.org; Tue, 19 Feb 2019 15:19:19 -0500
Received: by mail-qk1-f196.google.com with SMTP id m9so521708qkl.4
	for <qemu-trivial@nongnu.org>; Tue, 19 Feb 2019 12:19:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=CZwP3NqXCtUOU4XcZDfDAqdFp8PDQ/0xqVJhWTdWFQ4=;
	b=T+lECxMZboL9PEdNLZcGAocXlTh2zfFQQX2MwxBxO2gaDxaAXenab/rObzsxqyLNAR
	+DHKOmR4bWl25vpRZgmXfRep+SOLUWACf8OlpzY38P9MpgQ3e38oFxnh9BpDZXEs7hs3
	e9AgPbUu7M+8S0xvT3zuE7YnX2HhoA/stqkji2s7WxnsNAnDmO+WEy1TQ4aXJF25xtVj
	fLbvD0Woveco0zKgUwFkAazzhd38dwmfic3EnD4y0VRefPDLG5VDYh+4ccQczbMF4W/Z
	gw3dhQwBeV7VD++1q8gw8dyfOCFaktCQjhqUhNBv/ZSYSJkRCNrNGr6oxH8809Qiwfpn
	+4OQ==
X-Gm-Message-State: AHQUAuavnKYJCr7dXoGos0mia79yxZA7v09KQeiM0qAWMiQgabrdRL0n
	36UWLYHRQNBmpdit2f+mHRlK3w==
X-Google-Smtp-Source: AHgI3IZkvgbP1NCAebBtqbTmb0826qQcKEMTj1z0WXZkl9qIGA8SqlRw2tf+/0w5FwXor+BibX0jYA==
X-Received: by 2002:a37:7b01:: with SMTP id w1mr22367750qkc.122.1550607553479; 
	Tue, 19 Feb 2019 12:19:13 -0800 (PST)
Received: from redhat.com (pool-173-76-246-42.bstnma.fios.verizon.net.
	[173.76.246.42])
	by smtp.gmail.com with ESMTPSA id 18sm6372754qkm.29.2019.02.19.12.19.12
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 19 Feb 2019 12:19:12 -0800 (PST)
Date: Tue, 19 Feb 2019 15:19:10 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org, yang.zhong@intel.com, pbonzini@redhat.com
Message-ID: <20190219151825-mutt-send-email-mst@kernel.org>
References: <1550592459-7286-1-git-send-email-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1550592459-7286-1-git-send-email-thuth@redhat.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.222.196
Subject: Re: [Qemu-trivial] [PATCH] hw/pci/pci-stub: Add msi_enabled() and
 msi_notify() to the pci stubs
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
X-List-Received-Date: Tue, 19 Feb 2019 20:19:24 -0000

On Tue, Feb 19, 2019 at 05:07:39PM +0100, Thomas Huth wrote:
> Some machines have an AHCI adapter, but no PCI. To be able to
> compile hw/ide/ahci.c without CONFIG_PCI, we still need the two
> functions msi_enabled() and msi_notify() for linking.
> This is required for the upcoming Kconfig-like build system, if
> a user wants to compile a QEMU binary with just one machine that
> has AHCI, but no PCI, like the ARM "cubieboard" for example.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

Do you want me to merge this or do you prefer to
merge it with kconfig patches?

> ---
>  hw/pci/pci-stub.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/hw/pci/pci-stub.c b/hw/pci/pci-stub.c
> index b941a0e..c04a5df 100644
> --- a/hw/pci/pci-stub.c
> +++ b/hw/pci/pci-stub.c
> @@ -53,3 +53,14 @@ uint16_t pci_requester_id(PCIDevice *dev)
>      g_assert(false);
>      return 0;
>  }
> +
> +/* Required by ahci.c */
> +bool msi_enabled(const PCIDevice *dev)
> +{
> +    return false;
> +}
> +
> +void msi_notify(PCIDevice *dev, unsigned int vector)
> +{
> +    g_assert_not_reached();
> +}
> -- 
> 1.8.3.1

