Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ghBC5-0005xn-2Z
	for mharc-qemu-trivial@gnu.org; Wed, 09 Jan 2019 05:34:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37917)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1ghBC2-0005tV-2i
	for qemu-trivial@nongnu.org; Wed, 09 Jan 2019 05:34:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1ghBC0-0004Ra-K4
	for qemu-trivial@nongnu.org; Wed, 09 Jan 2019 05:34:37 -0500
Received: from mout.kundenserver.de ([217.72.192.74]:44955)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1ghBC0-0004JR-9h; Wed, 09 Jan 2019 05:34:36 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue108 [212.227.15.183]) with ESMTPSA (Nemesis) id
	1N3bfB-1hPHNZ0Ce3-010gUl; Wed, 09 Jan 2019 11:34:10 +0100
To: Li Qiang <liq3ea@163.com>, mst@redhat.com, marcel.apfelbaum@gmail.com,
	pbonzini@redhat.com, rth@twiddle.net, ehabkost@redhat.com
Cc: qemu-trivial@nongnu.org, lvivier@redhat.com, qemu-devel@nongnu.org
References: <20190105023831.66910-1-liq3ea@163.com>
From: Laurent Vivier <laurent@vivier.eu>
Openpgp: preference=signencrypt
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
	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
Message-ID: <a2c4b0e3-f850-8e8b-eeb9-25e77d06cfb6@vivier.eu>
Date: Wed, 9 Jan 2019 11:34:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20190105023831.66910-1-liq3ea@163.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:Le9s2/9FwJUNmL3pBpUaO3ty3l7Zef+lYg/+t7KWb+qmSetRFJB
	AFUkKQ1JcQRR48tNDej64mmd02jLfSepGbNwh/3iLt8W6ibl7CtH0G/KfSHy0WhYBtdYyMx
	MDnQTc+15l1eEFlmrwLap60qgel1755Xz/RCyQ6pfUjdgBe/PmbJtzxVOqMDIg188aDB/6M
	nskNwsYbp+6EJIoSGWkdg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:FSTi9gRicpc=:GIQ/9ZfXqjJaD5tmojklsV
	u7R6pT1wo+zrRzUwZ8+kpp8gRgFpcOQQgQ83Isb/irSeNrfWwuVBNRCufjLgKqvQ+GLNfxQE3
	NpafZUH5WPrq+uTqrSz9k9EVBa1VeCbAbhBuE2t9VstFNYYjnIzLW7YeCqu7pIswdGXmTS9MY
	Db6BrphovyMnqu38qZ2Nd6JbLapydRQtwgydC7qsG4grzuBZ/aDaf/AKXZKhGZIcPcz+0mlAy
	hd80uiLeBU+oJSRSwizZ4xWKEGil+OYbUp+FoilbCUb9z9Jn8oWvDeRom10a+Fo7q4duXOmdX
	uZF0OLvUalfeNzHI+ltZUvqZg5ryPEp+/Y2D0Aex0Op0Svndk1KdLCriTpFKA0P14R3AzGsMn
	2NHfQqt4IyDsLAzrP2Q1/PNE4rw/ZiAHZ7yx78UBMqjseLnvxE5Y2ryPwzboT8HS2Y9+2O6Lk
	mcOcUco8YmlQ5w1Gy557MPjVdLRq0FWpqbCWHb5Nu9FzGBtjy8pn3lpMXNFMA440SAhXBcxLQ
	u5robBst5cpEZqz+VsCVPqJwBTXaIFPYVdDwPscCsiSN7NAhHwHBgI4YzH/oTn9WrY8o+uV2s
	FVSoRRDrkLCk46zNkMtAEQl3K7cEd0E/7LVfbrRUNux6y+eu3F5nMm+u2I9SUM7GWlLCEbIIl
	5yBRvsJTLxjmt4dZW5PKPJ6Bvwun19BDpvlT3YBABtfcQ2gwNPirS8OJc1e23+7wSjd3cgeEt
	Rgku3kvhGa7d5ke7runcK3pgOlEtdxOKs4Kno00Pyrj4HHXLn6j0DLHSX98=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 217.72.192.74
Subject: Re: [Qemu-trivial] [PATCH] ioapic: use TYPE_FOO MACRO than constant
 string
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
X-List-Received-Date: Wed, 09 Jan 2019 10:34:39 -0000

On 05/01/2019 03:38, Li Qiang wrote:
> Make them more QOMConventional.
> Cc:qemu-trivial@nongnu.org
> 
> Signed-off-by: Li Qiang <liq3ea@163.com>
> ---
>  hw/i386/kvm/ioapic.c     | 2 +-
>  hw/i386/pc.c             | 4 ++--
>  hw/intc/ioapic.c         | 2 +-
>  include/hw/i386/ioapic.h | 3 +++
>  4 files changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/i386/kvm/ioapic.c b/hw/i386/kvm/ioapic.c
> index 5b40d75439..e453692199 100644
> --- a/hw/i386/kvm/ioapic.c
> +++ b/hw/i386/kvm/ioapic.c
> @@ -163,7 +163,7 @@ static void kvm_ioapic_class_init(ObjectClass *klass, void *data)
>  }
>  
>  static const TypeInfo kvm_ioapic_info = {
> -    .name  = "kvm-ioapic",
> +    .name  = TYPE_KVM_IOAPIC,
>      .parent = TYPE_IOAPIC_COMMON,
>      .instance_size = sizeof(KVMIOAPICState),
>      .class_init = kvm_ioapic_class_init,
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index f248662e97..af68a61615 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -1665,9 +1665,9 @@ void ioapic_init_gsi(GSIState *gsi_state, const char *parent_name)
>      unsigned int i;
>  
>      if (kvm_ioapic_in_kernel()) {
> -        dev = qdev_create(NULL, "kvm-ioapic");
> +        dev = qdev_create(NULL, TYPE_KVM_IOAPIC);
>      } else {
> -        dev = qdev_create(NULL, "ioapic");
> +        dev = qdev_create(NULL, TYPE_IOAPIC);
>      }
>      if (parent_name) {
>          object_property_add_child(object_resolve_path(parent_name, NULL),
> diff --git a/hw/intc/ioapic.c b/hw/intc/ioapic.c
> index 4e529729b4..9d75f84d3b 100644
> --- a/hw/intc/ioapic.c
> +++ b/hw/intc/ioapic.c
> @@ -429,7 +429,7 @@ static void ioapic_class_init(ObjectClass *klass, void *data)
>  }
>  
>  static const TypeInfo ioapic_info = {
> -    .name          = "ioapic",
> +    .name          = TYPE_IOAPIC,
>      .parent        = TYPE_IOAPIC_COMMON,
>      .instance_size = sizeof(IOAPICCommonState),
>      .class_init    = ioapic_class_init,
> diff --git a/include/hw/i386/ioapic.h b/include/hw/i386/ioapic.h
> index 9c8816f11f..59fcb158a7 100644
> --- a/include/hw/i386/ioapic.h
> +++ b/include/hw/i386/ioapic.h
> @@ -23,6 +23,9 @@
>  #define IOAPIC_NUM_PINS 24
>  #define IO_APIC_DEFAULT_ADDRESS 0xfec00000
>  
> +#define TYPE_KVM_IOAPIC "kvm-ioapic"
> +#define TYPE_IOAPIC "ioapic"
> +
>  void ioapic_eoi_broadcast(int vector);
>  
>  #endif /* HW_IOAPIC_H */
> 

Applied to my trivial-patches branch.

Thanks,
Laurent

