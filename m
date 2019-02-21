Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gwrdG-0003wy-4b
	for mharc-qemu-trivial@gnu.org; Thu, 21 Feb 2019 11:55:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54671)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1gwrdE-0003t3-8w
	for qemu-trivial@nongnu.org; Thu, 21 Feb 2019 11:55:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1gwrdC-0004Oc-6K
	for qemu-trivial@nongnu.org; Thu, 21 Feb 2019 11:55:31 -0500
Received: from mail-qt1-f193.google.com ([209.85.160.193]:37172)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <mst@redhat.com>) id 1gwrdA-0004La-IV
	for qemu-trivial@nongnu.org; Thu, 21 Feb 2019 11:55:28 -0500
Received: by mail-qt1-f193.google.com with SMTP id a48so32277955qtb.4
	for <qemu-trivial@nongnu.org>; Thu, 21 Feb 2019 08:55:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=RiIIbndCzbJyJ2ojAb35twvkfjLdmOEJvtzQc0HEe7A=;
	b=SNt+o+H3suLnKVihCyHaOth8GDBYUz70OT+v0oL5iJf+G++yDUgTlgJ0S6ZdwJO4Hb
	4WDGum9UEXPl9lmWC1cs83N0zmCfY/GWiXGppN0J0wDWrrPA/BhrFI2Ad3OVWzlfLQtt
	WurK8tAx/lugOoo8T1ixvPjMRDNBNoQRWuNLidsJdfZxyLeQWqQv5Y1QMot9m48f00Gj
	RWSvVQvMB3wb0swquK5q2KOJu71ViS3mPMu1z1+SI/aRz1U4FFmpEbhaHMH5sJRwk6Xd
	Arq8O740Cjb+tDjCE2WNI5A8lXSDmtWF0wC/rPuKi4l+pwryCAFF7eqh9NBaKiS+lfhb
	BICQ==
X-Gm-Message-State: AHQUAuaFGeJXxT6dMBGyM5WP1v6EkMU8WbLO/hcsNMuUT7oV0yNCnKFB
	EvdA2HCDGV9YcJeuOhfcgyk2rw==
X-Google-Smtp-Source: AHgI3IaCltI/ua4JdjCsVJZcgquPlomRCbSJy4uCmLAX5v3YbLjHevk9kzDOgyhfnVdx1yw+dCxMqw==
X-Received: by 2002:ac8:1102:: with SMTP id c2mr32593153qtj.195.1550768124276; 
	Thu, 21 Feb 2019 08:55:24 -0800 (PST)
Received: from redhat.com (pool-173-76-246-42.bstnma.fios.verizon.net.
	[173.76.246.42]) by smtp.gmail.com with ESMTPSA id
	g189sm12562767qkb.3.2019.02.21.08.55.22
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 21 Feb 2019 08:55:23 -0800 (PST)
Date: Thu, 21 Feb 2019 11:55:20 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org, yang.zhong@intel.com, pbonzini@redhat.com
Message-ID: <20190221115446-mutt-send-email-mst@kernel.org>
References: <1550592459-7286-1-git-send-email-thuth@redhat.com>
	<20190219151825-mutt-send-email-mst@kernel.org>
	<bfdc4037-4017-a501-4e1f-e8da8949e672@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bfdc4037-4017-a501-4e1f-e8da8949e672@redhat.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.160.193
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
X-List-Received-Date: Thu, 21 Feb 2019 16:55:33 -0000

On Wed, Feb 20, 2019 at 07:24:00AM +0100, Thomas Huth wrote:
> On 19/02/2019 21.19, Michael S. Tsirkin wrote:
> > On Tue, Feb 19, 2019 at 05:07:39PM +0100, Thomas Huth wrote:
> >> Some machines have an AHCI adapter, but no PCI. To be able to
> >> compile hw/ide/ahci.c without CONFIG_PCI, we still need the two
> >> functions msi_enabled() and msi_notify() for linking.
> >> This is required for the upcoming Kconfig-like build system, if
> >> a user wants to compile a QEMU binary with just one machine that
> >> has AHCI, but no PCI, like the ARM "cubieboard" for example.
> >>
> >> Signed-off-by: Thomas Huth <thuth@redhat.com>
> > 
> > Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> 
> Thanks!
> 
> > Do you want me to merge this or do you prefer to
> > merge it with kconfig patches?
> 
> If you plan a pci pull request soon, feel free to take it. Otherwise, I
> can also add it to my Kconfig-for-arm patch series where I need it.
> 
>  Thomas

Feel free to include but please talk to Paolo about his
ideas for abstracting it out.

Thanks!

-- 
MST

