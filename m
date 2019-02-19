Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gw97I-0006dW-Hh
	for mharc-qemu-trivial@gnu.org; Tue, 19 Feb 2019 12:23:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36507)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gw97D-0006bC-1M
	for qemu-trivial@nongnu.org; Tue, 19 Feb 2019 12:23:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gw97B-0003IY-6b
	for qemu-trivial@nongnu.org; Tue, 19 Feb 2019 12:23:30 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:38844)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gw97A-0003Fq-BD
	for qemu-trivial@nongnu.org; Tue, 19 Feb 2019 12:23:29 -0500
Received: by mail-wr1-f68.google.com with SMTP id v13so22860483wrw.5
	for <qemu-trivial@nongnu.org>; Tue, 19 Feb 2019 09:23:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=WrafdI/nja7YZSyZd+KooMk+zhi7M85vwtjxStYANIE=;
	b=dxHg9fqHP4LEhZiCD+4O3XR2ToLWelleVRRs/NUL2kHWpmGvaNHQQ4NTU8aAywXgsu
	AHg8W4NsIKMPq/6taKtFTIAy6WlCW84sGymfCitXLfEn0QerTuEx0INn4Ww6eK24a4le
	wE2xGAv0cUmouGJ0lVjYewtkDNU/wpFncTSyf5Gg1PazLQsHR9rEAuHL7ZnZYRn6T+PQ
	QNGanI6DePP6Jdvzvg9PaIAcum7ZMh6ZrNI8hHOeaFObVoIAohG//IZby4/etMp5sl2f
	rOo780fexVi/ZkscXZPux8v5QMcN4fRCq0uQ9F0yzrQTRiWCeZK3fpUn8m8kLi+0RkFB
	oUEQ==
X-Gm-Message-State: AHQUAuZCbtaD54jC6yVBwxRGQdaLs+UW9fdEsgbTYvZ3D35YHYjEdTzd
	HA7ukrnSr4v62IVGdCMcKy1ueA==
X-Google-Smtp-Source: AHgI3IY/VomAquuHwuH72Qvrt9gl3plDASJ5dYICJ92U6IMxpAX5NBJ+1d57BVjKbhFlBxkt/vswtg==
X-Received: by 2002:a5d:604d:: with SMTP id j13mr14064011wrt.194.1550597006581;
	Tue, 19 Feb 2019 09:23:26 -0800 (PST)
Received: from [192.168.1.37] (109.red-83-53-160.dynamicip.rima-tde.net.
	[83.53.160.109]) by smtp.gmail.com with ESMTPSA id
	e6sm19520072wrt.14.2019.02.19.09.23.25
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Feb 2019 09:23:26 -0800 (PST)
To: Thomas Huth <thuth@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	"Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-trivial@nongnu.org, yang.zhong@intel.com, qemu-devel@nongnu.org,
	pbonzini@redhat.com
References: <1550592459-7286-1-git-send-email-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <c633e9de-7219-57a8-0530-079034e4e6f2@redhat.com>
Date: Tue, 19 Feb 2019 18:23:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <1550592459-7286-1-git-send-email-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.68
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] hw/pci/pci-stub: Add
 msi_enabled() and msi_notify() to the pci stubs
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
X-List-Received-Date: Tue, 19 Feb 2019 17:23:34 -0000

On 2/19/19 5:07 PM, Thomas Huth wrote:
> Some machines have an AHCI adapter, but no PCI. To be able to
> compile hw/ide/ahci.c without CONFIG_PCI, we still need the two
> functions msi_enabled() and msi_notify() for linking.
> This is required for the upcoming Kconfig-like build system, if
> a user wants to compile a QEMU binary with just one machine that
> has AHCI, but no PCI, like the ARM "cubieboard" for example.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

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
> 

