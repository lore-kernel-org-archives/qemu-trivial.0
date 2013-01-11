Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TtaI0-00029V-7Y
	for mharc-qemu-trivial@gnu.org; Fri, 11 Jan 2013 03:48:36 -0500
Received: from eggs.gnu.org ([208.118.235.92]:35610)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TtaHx-00029K-At
	for qemu-trivial@nongnu.org; Fri, 11 Jan 2013 03:48:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TtaHu-0005Kj-Dj
	for qemu-trivial@nongnu.org; Fri, 11 Jan 2013 03:48:33 -0500
Received: from mail-wi0-f171.google.com ([209.85.212.171]:32785)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1TtaHu-0005KZ-81; Fri, 11 Jan 2013 03:48:30 -0500
Received: by mail-wi0-f171.google.com with SMTP id hn14so1784494wib.10
	for <multiple recipients>; Fri, 11 Jan 2013 00:48:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=qJpem6M3PuCKmgsbTzbRkMEe8HWVpXbY2EMMQX5FtBc=;
	b=uoH4xgIwMyAKvmwAD6PCh3XrBErKpTOmhM11JnKP3KISGWfDSJrsH2cVvtGr7No3qW
	y2/ookvsKBS3tI1i64VF4wzzsvy5ftYC7Y03FXX74JPk3c57ZwhcsfYlv0oF2rKPIqHU
	xj9Ukhp0hhKPjhmEp6oRLzA4QKXB8w6iY3zcHp571bFnWgzBXyCAoNW4V9gJueFriWwu
	7qVCOf8NFFvBv2v/6xd0f6nzOBgunDyPcarVCf1Qe9zUctznjiyOAS0wf1xeWeDxlOn9
	rH7/n8IOL8wfz/9KKqltupRJ85KTkEWkX7r4HPFzTahj0a++u8/OAXM0tpiPSP5tTQj7
	GSZg==
X-Received: by 10.180.92.36 with SMTP id cj4mr13874317wib.23.1357894109131;
	Fri, 11 Jan 2013 00:48:29 -0800 (PST)
Received: from localhost (nat-pool-muc-t.redhat.com. [209.132.186.12])
	by mx.google.com with ESMTPS id bd7sm6170763wib.8.2013.01.11.00.48.27
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 11 Jan 2013 00:48:28 -0800 (PST)
Date: Fri, 11 Jan 2013 09:48:22 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Laszlo Ersek <lersek@redhat.com>
Message-ID: <20130111084822.GF23656@stefanha-thinkpad.muc.redhat.com>
References: <1357671140-21713-1-git-send-email-lersek@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1357671140-21713-1-git-send-email-lersek@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.212.171
Cc: qemu-trivial@nongnu.org, Anthony Liguori <aliguori@us.ibm.com>,
	qemu-devel@nongnu.org, kraxel@redhat.com
Subject: Re: [Qemu-trivial] [PATCH] Makefile: install the "acpi-dsdt.aml"
 and "q35-acpi-dsdt.aml" blobs too
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 11 Jan 2013 08:48:34 -0000

On Tue, Jan 08, 2013 at 07:52:20PM +0100, Laszlo Ersek wrote:
> The WARNING message from commit f7e4dd6c made me notice.
> 
> Signed-off-by: Laszlo Ersek <lersek@redhat.com>
> ---
>  Makefile |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index a7ac04b..f6626b5 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -280,6 +280,7 @@ bepo
>  ifdef INSTALL_BLOBS
>  BLOBS=bios.bin sgabios.bin vgabios.bin vgabios-cirrus.bin \
>  vgabios-stdvga.bin vgabios-vmware.bin vgabios-qxl.bin \
> +acpi-dsdt.aml q35-acpi-dsdt.aml \
>  ppc_rom.bin openbios-sparc32 openbios-sparc64 openbios-ppc \
>  pxe-e1000.rom pxe-eepro100.rom pxe-ne2k_pci.rom \
>  pxe-pcnet.rom pxe-rtl8139.rom pxe-virtio.rom \

I'm not familiar with the ACPI stuff and how we want to ship it.

Gerd or Anthony: Please review this patch.

Thanks,
Stefan

