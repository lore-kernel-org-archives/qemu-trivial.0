Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jfxvX-0000Mi-GF
	for mharc-qemu-trivial@gnu.org; Mon, 01 Jun 2020 23:49:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1jfxvV-0000KP-9I
 for qemu-trivial@nongnu.org; Mon, 01 Jun 2020 23:49:21 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:58750
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1jfxvT-0005Fa-77
 for qemu-trivial@nongnu.org; Mon, 01 Jun 2020 23:49:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591069757;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ExLd1Z+1FIxt0ntrrBRLTV4rcrryp6L3gYgD3JMEe7Y=;
 b=NBW72FDhpLe52v1SNV4xZxz7ETgpbVoM3nIswTun+gGALr12gJT6LUgiw7MJ3cHcfeQm85
 KxuhG4vInCiXzLemhm3NFPfU0BKeDgjF/dOwKC4HfQ40lJKltjnhaMQpEFvdnTs3kuGePW
 d1ZkPilbswuTPfodPk0smjD72ZZFUhk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-17-KUxWMsXLPv6AwOJbETDBNw-1; Mon, 01 Jun 2020 23:49:16 -0400
X-MC-Unique: KUxWMsXLPv6AwOJbETDBNw-1
Received: by mail-wr1-f70.google.com with SMTP id l1so820449wrc.8
 for <qemu-trivial@nongnu.org>; Mon, 01 Jun 2020 20:49:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=UPZhIAGyj/VLbIsoUlC2KngQ5PLwTgQRP4hRk68ZAN8=;
 b=nqNahtkdJRlXo46cxuRtIVionKZgxDoZTHZfu3lWxbHW1PTBLeBnKL8mqVyT+4ER9O
 6TpgVDI/LwXIoKhFO8LVFRWYzAWx/YPzQFo6M3Gl3SBhgjqDNxIPeia7RO3PIEpcURVy
 qL9pTYcZ+yMWt2HLFTdQcdUIYa/xei/mbfk7x1uBHUgq+LmNpBGzPypWiT5r7CUOrzFI
 CX5yTKSVDc0GXBSdaGk4hxZ6g/dJB5CJR/FcjDT42kdP774w+h1vpdEzd3O+A6ZNP+Al
 MX+MkV737ldPOy25oUBvKAATqbV+GxkM3Rd1Pc625vE62Bh02BP3lCyZkpq9dwZbsU6x
 bQjg==
X-Gm-Message-State: AOAM531ieh44EE+978MhWp1cuSjecfijNJH81Ug12dk47UFrJ6RLoYQV
 yLYSzu1O/lwKDQI0dlNVjwrL0siY+q/HgjWiMNjp6jO28S1jxj5Bxlb/SVQ6W2nzPJHfpW3ph0o
 5z6ULsRaRhFpKw2FqZg==
X-Received: by 2002:a5d:4a43:: with SMTP id v3mr25958783wrs.115.1591069755289; 
 Mon, 01 Jun 2020 20:49:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwbFuz2uv/TDCU4M0qN37P/g2y+Wa4iddh/8yNcs/CsBmvsOG4NKyvS+2vtx6Nf23TXqpMcXQ==
X-Received: by 2002:a5d:4a43:: with SMTP id v3mr25958746wrs.115.1591069754999; 
 Mon, 01 Jun 2020 20:49:14 -0700 (PDT)
Received: from redhat.com (bzq-109-64-41-91.red.bezeqint.net. [109.64.41.91])
 by smtp.gmail.com with ESMTPSA id
 g18sm1578601wme.17.2020.06.01.20.49.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jun 2020 20:49:14 -0700 (PDT)
Date: Mon, 1 Jun 2020 23:49:11 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org, xen-devel@lists.xenproject.org,
 Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?iso-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>,
 Helge Deller <deller@gmx.de>, qemu-arm@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Paul Durrant <paul@xen.org>,
 Andrew Jeffery <andrew@aj.id.au>, qemu-trivial@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Joel Stanley <joel@jms.id.au>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 qemu-ppc@nongnu.org, Richard Henderson <rth@twiddle.net>
Subject: Re: [PATCH v2 0/8] hw: Fix some incomplete memory region size
Message-ID: <20200601234822-mutt-send-email-mst@kernel.org>
References: <20200601142930.29408-1-f4bug@amsat.org>
MIME-Version: 1.0
In-Reply-To: <20200601142930.29408-1-f4bug@amsat.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.120; envelope-from=mst@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/01 23:49:17
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Tue, 02 Jun 2020 03:49:21 -0000

On Mon, Jun 01, 2020 at 04:29:22PM +0200, Philippe Mathieu-Daudé wrote:
> Series fully reviewed.
> 
> Since v1:
> - Add parenthesis on the Xen patch (Paul Durrant)
> - Add Peter's R-b tags


PCI things:

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

I'll queue pci patches in my tree.

> memory_region_set_size() handle the 16 Exabytes limit by
> special-casing the UINT64_MAX value.
> This is not a problem for the 32-bit maximum, 4 GiB, but
> in some places we incorrectly use UINT32_MAX instead of
> 4 GiB, and end up missing 1 byte in the memory region.
> 
> This series fixes the cases I encountered.
> Also included few patches while reviewing, I replaced some
> magic values by the IEC binary prefix equivalent.
> 
> Regards,
> 
> Phil.
> 
> Philippe Mathieu-Daudé (8):
>   hw/arm/aspeed: Correct DRAM container region size
>   hw/pci-host/prep: Correct RAVEN bus bridge memory region size
>   hw/pci/pci_bridge: Correct pci_bridge_io memory region size
>   hw/pci/pci_bridge: Use the IEC binary prefix definitions
>   hw/pci-host: Use the IEC binary prefix definitions
>   hw/hppa/dino: Use the IEC binary prefix definitions
>   hw/i386/xen/xen-hvm: Use the IEC binary prefix definitions
>   target/i386/cpu: Use the IEC binary prefix definitions
> 
>  hw/arm/aspeed.c         | 2 +-
>  hw/hppa/dino.c          | 4 ++--
>  hw/i386/xen/xen-hvm.c   | 3 ++-
>  hw/pci-host/i440fx.c    | 3 ++-
>  hw/pci-host/prep.c      | 2 +-
>  hw/pci-host/q35.c       | 2 +-
>  hw/pci-host/versatile.c | 5 +++--
>  hw/pci/pci_bridge.c     | 7 ++++---
>  target/i386/cpu.c       | 2 +-
>  9 files changed, 17 insertions(+), 13 deletions(-)
> 
> -- 
> 2.21.3


