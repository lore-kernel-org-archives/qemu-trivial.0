Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hTTMF-0007l9-Tg
	for mharc-qemu-trivial@gnu.org; Wed, 22 May 2019 11:40:47 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47642)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1hTTMB-0006e9-RO
	for qemu-trivial@nongnu.org; Wed, 22 May 2019 11:40:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1hTT7m-0002j8-Jy
	for qemu-trivial@nongnu.org; Wed, 22 May 2019 11:25:52 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:36681)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1hTT7m-0001lp-3q; Wed, 22 May 2019 11:25:50 -0400
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
	1MmU1H-1glIXQ3zBR-00iXHu; Wed, 22 May 2019 17:24:58 +0200
To: Li Qiang <liq3ea@163.com>, alex.williamson@redhat.com, lvivier@redhat.com
Cc: qemu-trivial@nongnu.org, philmd@redhat.com, liq3ea@gmail.com,
	qemu-devel@nongnu.org
References: <20190521151543.92274-1-liq3ea@163.com>
	<20190521151543.92274-2-liq3ea@163.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <95569030-88c3-bc93-3ca2-0df3cacfa87c@vivier.eu>
Date: Wed, 22 May 2019 17:24:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20190521151543.92274-2-liq3ea@163.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:YYxbT559wrmEiZSJXIiVTlz4XEHXiwJmOK1UTWuFTaGOwN+1KFO
	wNgJvJ99l5T0GEnNhNmdJW8bEmz0/dxMjwQ/h7qeH9kZG+FZmz1K4KlFEq72bmNCQGfvkC8
	hSBxou2f6cf8w/EupdmuzMP3USpf0tH7LuVxybJGcuJQVoWSfZLQNd0dbzz0jlq96OGUXsP
	jBQ5TZj3o6J9mwRictxKw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:QdWpZOooA34=:lbNjkF3IW9KFWZMyR9kbre
	T9GuLeL69crLGUMqYDeGYRNNupR6jun7L4fmAohQhw4v/PhE1MudV1i17RM1k8j6LxC2VJI1A
	Zv0qaGsx/wlDx9PPfze4v1v8TFZ2Xn1Z0UXEuOP/BOxclRQVMeyeUbQIEPtsIxziHoToEoVfu
	mv8HwlO4z6+IqgAPioUxpSmPKoHmDCJdgTOOaEcvyVI7tQLDC2324QLYKOltHGqUhJM8wl6Uv
	6ntE/juQXxzhz0kjqZkL+lFZhhegEo9vS1CFtrMeLZx86PBTCE7upKV3bZyrv8uKTUbhUNh5c
	xmy1fCHEjHJ/HDM8uV+/dLTcjXcEgsJIp+Zc3S+EVouL2P5aGghea81PLTbd1sHcr/WQ61SDQ
	jX3tq9EzzmTF6HX3QO2CYvBW7VsNi7d9WOQzjeKkKMDYE7l26Uc5JvwzRAQQqln4kGbxf88FB
	2KR/ACmHS0MrYSIEF4JrUSaxkUZC3hjwAowv4Otuf1KOW60ApLkRQdP2aXJYcD93SFYyZ8RCb
	U4S6rBjPTNYojMXv6lKCSLssFoBNZhQI0s7gjYHD8YSfJjXut8fSwA/ooN0FyeQbAHhXxwizH
	bFderINdVIstOr73JHrZX/SgkVeQAgEp49PYE7EDqonKp6HBgnI8QpS1yXahilSKaI+/kd+T/
	3YXVtn/j5nsYM1qPCQVgRp+tS3zK6frZoO+BosCsUxHZPbeL/jJxNH2s8Cbao7qAY36ddP/Zj
	skQEF4cVCdBcaSpkHR84rf4agpm1X7pYzN02s2HDVSmjbxtIQNZEatEvmxc=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 217.72.192.74
Subject: Re: [Qemu-trivial] [PATCH v2 1/4] vfio: pci: make
 "vfio-pci-nohotplug" as MACRO
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
X-List-Received-Date: Wed, 22 May 2019 15:40:45 -0000

On 21/05/2019 17:15, Li Qiang wrote:
> The QOMConventions recommends we should use TYPE_FOO
> for a TypeInfo's name. Though "vfio-pci-nohotplug" is not
> used in other parts, for consistency we should make this change.
> 
> CC: qemu-trivial@nongnu.org
> Signed-off-by: Li Qiang <liq3ea@163.com>
> ---
>   hw/vfio/pci.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> index 8cecb53d5c..08729e5875 100644
> --- a/hw/vfio/pci.c
> +++ b/hw/vfio/pci.c
> @@ -40,6 +40,8 @@
>   #define TYPE_VFIO_PCI "vfio-pci"
>   #define PCI_VFIO(obj)    OBJECT_CHECK(VFIOPCIDevice, obj, TYPE_VFIO_PCI)
>   
> +#define TYPE_VIFO_PCI_NOHOTPLUG "vfio-pci-nohotplug"
> +
>   static void vfio_disable_interrupts(VFIOPCIDevice *vdev);
>   static void vfio_mmap_set_enabled(VFIOPCIDevice *vdev, bool enabled);
>   
> @@ -3304,8 +3306,8 @@ static void vfio_pci_nohotplug_dev_class_init(ObjectClass *klass, void *data)
>   }
>   
>   static const TypeInfo vfio_pci_nohotplug_dev_info = {
> -    .name = "vfio-pci-nohotplug",
> -    .parent = "vfio-pci",
> +    .name = TYPE_VIFO_PCI_NOHOTPLUG,
> +    .parent = TYPE_VFIO_PCI,
>       .instance_size = sizeof(VFIOPCIDevice),
>       .class_init = vfio_pci_nohotplug_dev_class_init,
>   };
> 

Applied to my trivial-patches branch.

Thanks,
Laurent

