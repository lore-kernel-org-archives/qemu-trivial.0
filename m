Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gwLW0-0000Gs-TD
	for mharc-qemu-trivial@gnu.org; Wed, 20 Feb 2019 01:37:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59971)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1gwLVz-0000Gj-KZ
	for qemu-trivial@nongnu.org; Wed, 20 Feb 2019 01:37:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1gwLVy-00043l-Ef
	for qemu-trivial@nongnu.org; Wed, 20 Feb 2019 01:37:55 -0500
Received: from mga09.intel.com ([134.134.136.24]:49357)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
	id 1gwLVv-00040g-Uq; Wed, 20 Feb 2019 01:37:53 -0500
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Feb 2019 22:37:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,388,1544515200"; d="scan'208";a="127809511"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
	by orsmga003.jf.intel.com with ESMTP; 19 Feb 2019 22:37:46 -0800
Date: Wed, 20 Feb 2019 14:37:23 +0800
From: Wei Yang <richardw.yang@linux.intel.com>
To: Thomas Huth <thuth@redhat.com>
Cc: John Snow <jsnow@redhat.com>, qemu-block@nongnu.org,
	qemu-trivial@nongnu.org, yang.zhong@intel.com,
	qemu-devel@nongnu.org, pbonzini@redhat.com
Message-ID: <20190220063723.GA28876@richard>
Reply-To: Wei Yang <richardw.yang@linux.intel.com>
References: <1550591757-6192-1-git-send-email-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1550591757-6192-1-git-send-email-thuth@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 134.134.136.24
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] hw/ide/ich: Compile ich.c
 only if CONFIG_PCI is also set
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
X-List-Received-Date: Wed, 20 Feb 2019 06:37:56 -0000

On Tue, Feb 19, 2019 at 04:55:57PM +0100, Thomas Huth wrote:
>With the upcoming Kconfig-like build system, it will be easy to
>build also version of QEMU that only contain a single machine. Some

Sorry for my poor English.

What is also version?

>of these machines (like the ARM cubieboard) use CONFIG_AHCI for an
>AHCI sysbus device, but do not use CONFIG_PCI since they do not feature
>a PCI bus. In this case linking fails:
>
>../hw/ide/ich.o: In function `pci_ich9_ahci_realize':
>hw/ide/ich.c:124: undefined reference to `pci_allocate_irq'
>hw/ide/ich.c:126: undefined reference to `pci_register_bar'
>hw/ide/ich.c:128: undefined reference to `pci_register_bar'
>hw/ide/ich.c:131: undefined reference to `pci_add_capability'
>hw/ide/ich.c:147: undefined reference to `msi_init'
>../hw/ide/ich.o: In function `pci_ich9_uninit':
>hw/ide/ich.c:158: undefined reference to `msi_uninit'
>../hw/ide/ich.o:(.data.rel+0x50): undefined reference to `vmstate_pci_device'
>
>Thus we must only compile ich.c if CONFIG_PCI is also set.
>
>Signed-off-by: Thomas Huth <thuth@redhat.com>
>---
> hw/ide/Makefile.objs | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/hw/ide/Makefile.objs b/hw/ide/Makefile.objs
>index a142add..dfe53af 100644
>--- a/hw/ide/Makefile.objs
>+++ b/hw/ide/Makefile.objs
>@@ -9,6 +9,6 @@ common-obj-$(CONFIG_IDE_MMIO) += mmio.o
> common-obj-$(CONFIG_IDE_VIA) += via.o
> common-obj-$(CONFIG_MICRODRIVE) += microdrive.o
> common-obj-$(CONFIG_AHCI) += ahci.o
>-common-obj-$(CONFIG_AHCI) += ich.o
>+common-obj-$(call land,$(CONFIG_AHCI),$(CONFIG_PCI)) += ich.o
> common-obj-$(CONFIG_ALLWINNER_A10) += ahci-allwinner.o
> common-obj-$(CONFIG_IDE_SII3112) += sii3112.o
>-- 
>1.8.3.1
>

-- 
Wei Yang
Help you, Help me

