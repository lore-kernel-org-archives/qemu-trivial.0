Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h1T2z-0000fc-Rr
	for mharc-qemu-trivial@gnu.org; Wed, 06 Mar 2019 04:41:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44093)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1h1T2v-0000eV-Hw
	for qemu-trivial@nongnu.org; Wed, 06 Mar 2019 04:41:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1h1T2j-0001pC-GB
	for qemu-trivial@nongnu.org; Wed, 06 Mar 2019 04:40:58 -0500
Received: from mout.kundenserver.de ([212.227.126.133]:46717)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1h1T2d-0001ih-Ax; Wed, 06 Mar 2019 04:40:49 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
	1MYeV1-1gVvpT06UN-00Vl35; Wed, 06 Mar 2019 10:40:32 +0100
To: Like Xu <like.xu@linux.intel.com>, qemu-trivial@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
References: <1550640446-18788-1-git-send-email-like.xu@linux.intel.com>
From: Laurent Vivier <laurent@vivier.eu>
Openpgp: preference=signencrypt
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
	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
Message-ID: <3aebac4c-9fb7-6a2d-3083-4ead8640143b@vivier.eu>
Date: Wed, 6 Mar 2019 10:40:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <1550640446-18788-1-git-send-email-like.xu@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:PkgJ55Uoc8FIsL7fyVaGj8KAAyaZDSpSSpJoWBl7Dp9YwDnyHJu
	oOvmt9Pxe1nlHZnKjmIftqOUrlJF1b5Z4U10lq9UJwhNFE0kPJQnfH2Qy2/whMnH47HkfQD
	2zdIkFMsu7BPDoIyJXsOyYOps63CbkUct3oqanfSO865xtCFlIuoGtgwDHW8/Mcimw96cVP
	adz50vVpgZ/CsF6RsK0CQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:IY6E+Cfx1ZI=:tJEXF63C6Jt3TO4t5Dr4i6
	A/H8GtPe3EVKzQJN+uSRNef9L2/9gORMs0ymUVFBN86HLRrq8qWVcT5ufbwx8o0e/tMy7hc+i
	P0oOl/utUw7Qe14UGY4u2Xs7E8CPSxWUaWONQEuYHtN31mnV05hVXHKLAFsEb/t+gMXl+V70O
	lVpMSrN+eeuzQ6Qpiv54TtEu2el9WuH1MU77v2s7EecWB7pgFRwx/ECc7tcijuEO9pZhZMeIU
	bpy1V0vgEienYNVV825CGqh27WDTHkYA8IJPriDxvZN1WqHLKo0TXaVuAFRl3EgKeWnz6eD/5
	LKwUE/P0ba+tYGpfEbuuzin27FszLz5sy1Kz0A4+DMsG6OauY7hXyNHtRh2hWLkIsbtlLnh9X
	obe3nVBYePnWhEMIu/338egkYMd8gMwZkmv6prvzspYKGyNO87Zj1QI/9HAdw1l2qzgz3FRrs
	Dmea2y0pZ+nMZUhJG7oPsP/sRNFqhUbjUSJC9R8kY/H3pXZyqiiAyoRAQNTcx0nsM0JSO6BOm
	6gbjOISDpFPA5ZLAErysYIrMiNolDqDyktNGYv1AtPOXdoUPHD+sH3tb13lTEDMVVzDegrcx+
	Fqk+crkV4e0X45ZkFt47XEWHgFqofMobUQsR181ePYdTV39rgQyZ11NpSVQR6DhTNxuLaFFl0
	pkK9N/OOb3KEr53ruJd7zrWIlAyiNGauHE2CwtV53TmjvlcSBEHcvjCruMQI5DFN+w0OI7GJV
	U0HAz0SAkKI7DDGpCbBKZDbXSzayaiIQ9Yokw3DadwttX3NHFiQzVmD30DQ=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.133
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] doc: fix typos for
 documents in tree
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
X-List-Received-Date: Wed, 06 Mar 2019 09:41:08 -0000

On 20/02/2019 06:27, Like Xu wrote:
> Signed-off-by: Like Xu <like.xu@linux.intel.com>
> ---
>  docs/COLO-FT.txt               | 2 +-
>  docs/amd-memory-encryption.txt | 2 +-
>  docs/can.txt                   | 2 +-
>  docs/colo-proxy.txt            | 6 +++---
>  docs/cpu-hotplug.rst           | 2 +-
>  docs/qcow2-cache.txt           | 2 +-
>  docs/qemu-block-drivers.texi   | 2 +-
>  docs/qemu-cpu-models.texi      | 8 ++++----
>  docs/rdma.txt                  | 4 ++--
>  docs/replay.txt                | 2 +-
>  docs/vfio-ap.txt               | 2 +-
>  11 files changed, 17 insertions(+), 17 deletions(-)
> 
> diff --git a/docs/COLO-FT.txt b/docs/COLO-FT.txt
> index e2686bb..ad24680 100644
> --- a/docs/COLO-FT.txt
> +++ b/docs/COLO-FT.txt
> @@ -102,7 +102,7 @@ to make sure the state of VM in Secondary side is always consistent with VM in
>  Primary side.
>  
>  COLO Proxy:
> -Delivers packets to Primary and Seconday, and then compare the responses from
> +Delivers packets to Primary and Secondary, and then compare the responses from
>  both side. Then decide whether to start a checkpoint according to some rules.
>  Please refer to docs/colo-proxy.txt for more information.
>  
> diff --git a/docs/amd-memory-encryption.txt b/docs/amd-memory-encryption.txt
> index f483795..43bf3ee 100644
> --- a/docs/amd-memory-encryption.txt
> +++ b/docs/amd-memory-encryption.txt
> @@ -97,7 +97,7 @@ References
>  AMD Memory Encryption whitepaper:
>  http://amd-dev.wpengine.netdna-cdn.com/wordpress/media/2013/12/AMD_Memory_Encryption_Whitepaper_v7-Public.pdf
>  
> -Secure Encrypted Virutualization Key Management:
> +Secure Encrypted Virtualization Key Management:
>  [1] http://support.amd.com/TechDocs/55766_SEV-KM API_Specification.pdf
>  
>  KVM Forum slides:
> diff --git a/docs/can.txt b/docs/can.txt
> index 7ba23b2..9fa6ed5 100644
> --- a/docs/can.txt
> +++ b/docs/can.txt
> @@ -99,7 +99,7 @@ Links to other resources
>       https://gitlab.fel.cvut.cz/canbus/qemu-canbus
>   (3) RTEMS page describing project
>       https://devel.rtems.org/wiki/Developer/Simulators/QEMU/CANEmulation
> - (4) RTLWS 2015 article about the projevt and its use with CANopen emulation
> + (4) RTLWS 2015 article about the project and its use with CANopen emulation
>       http://rtime.felk.cvut.cz/publications/public/rtlws2015-qemu-can.pdf
>       Slides
>       http://rtime.felk.cvut.cz/publications/public/rtlws2015-qemu-can-slides.pdf
> diff --git a/docs/colo-proxy.txt b/docs/colo-proxy.txt
> index 1f8e4b4..fa1cef0 100644
> --- a/docs/colo-proxy.txt
> +++ b/docs/colo-proxy.txt
> @@ -41,7 +41,7 @@ Below is a COLO proxy ascii figure:
>  |         |  +------------------------------------------------------+  |                        |        |                              |
>  |netfilter|  |                       |                         |    |  |   netfilter            |        |                              |
>  | +----------+ +----------------------------+                  |    |  |  +-----------------------------------------------------------+ |
> -| |       |  |                       |      |        out       |    |  |  |                     |        |  filter excute order       | |
> +| |       |  |                       |      |        out       |    |  |  |                     |        |  filter execute order      | |
>  | |       |  |          +-----------------------------+        |    |  |  |                     |        | +------------------->      | |
>  | |       |  |          |            |      |         |        |    |  |  |                     |        |   TCP                      | |
>  | | +-----+--+-+  +-----v----+ +-----v----+ |pri +----+----+sec|    |  |  | +------------+  +---+----+---v+rewriter++  +------------+ | |
> @@ -53,7 +53,7 @@ Below is a COLO proxy ascii figure:
>  | |      |   tx        |   rx           rx  |                  |  |    |  |            tx                        all       |  rx      | |
>  | |      |             |                    |                  |  |    |  +-----------------------------------------------------------+ |
>  | |      |             +--------------+     |                  |  |    |                                                   |            |
> -| |      |   filter excute order      |     |                  |  |    |                                                   |            |
> +| |      |   filter execute order     |     |                  |  |    |                                                   |            |
>  | |      |  +---------------->        |     |                  |  +--------------------------------------------------------+            |
>  | +-----------------------------------------+                  |       |                                                                |
>  |        |                            |                        |       |                                                                |
> @@ -92,7 +92,7 @@ but do nothing, just pass to next filter.
>  
>  Redirect Server Filter --> COLO-Compare
>  COLO-compare receive primary guest packet then
> -waiting scondary redirect packet to compare it.
> +waiting secondary redirect packet to compare it.
>  If packet same,send queued primary packet and clear
>  queued secondary packet, Otherwise send primary packet
>  and do checkpoint.
> diff --git a/docs/cpu-hotplug.rst b/docs/cpu-hotplug.rst
> index 1c268e0..cfeb79f 100644
> --- a/docs/cpu-hotplug.rst
> +++ b/docs/cpu-hotplug.rst
> @@ -137,6 +137,6 @@ From the 'qmp-shell', invoke the QMP ``device_del`` command::
>      vCPU hot-unplug requires guest cooperation; so the ``device_del``
>      command above does not guarantee vCPU removal -- it's a "request to
>      unplug".  At this point, the guest will get a System Control
> -    Interupt (SCI) and calls the ACPI handler for the affected vCPU
> +    Interrupt (SCI) and calls the ACPI handler for the affected vCPU
>      device.  Then the guest kernel will bring the vCPU offline and tell
>      QEMU to unplug it.
> diff --git a/docs/qcow2-cache.txt b/docs/qcow2-cache.txt
> index c459bf5..c1e7751 100644
> --- a/docs/qcow2-cache.txt
> +++ b/docs/qcow2-cache.txt
> @@ -55,7 +55,7 @@ value can improve the I/O performance significantly.
>  
>  The refcount blocks
>  -------------------
> -The qcow2 format also mantains a reference count for each cluster.
> +The qcow2 format also maintains a reference count for each cluster.
>  Reference counts are used for cluster allocation and internal
>  snapshots. The data is stored in a two-level structure similar to the
>  L1/L2 tables described above.
> diff --git a/docs/qemu-block-drivers.texi b/docs/qemu-block-drivers.texi
> index 38e9f34..da06a9b 100644
> --- a/docs/qemu-block-drivers.texi
> +++ b/docs/qemu-block-drivers.texi
> @@ -632,7 +632,7 @@ qemu-system-i386 -drive file=iscsi://127.0.0.1/iqn.qemu.test/1 \
>  @end example
>  
>  
> -Howto set up a simple iSCSI target on loopback and accessing it via QEMU:
> +How to set up a simple iSCSI target on loopback and access it via QEMU:
>  @example
>  This example shows how to set up an iSCSI target with one CDROM and one DISK
>  using the Linux STGT software target. This target is available on Red Hat based
> diff --git a/docs/qemu-cpu-models.texi b/docs/qemu-cpu-models.texi
> index 475d434..1b72584 100644
> --- a/docs/qemu-cpu-models.texi
> +++ b/docs/qemu-cpu-models.texi
> @@ -49,7 +49,7 @@ live migration safe.
>  The information that follows provides recommendations for configuring
>  CPU models on x86 hosts. The goals are to maximise performance, while
>  protecting guest OS against various CPU hardware flaws, and optionally
> -enabling live migration between hosts with hetergeneous CPU models.
> +enabling live migration between hosts with heterogeneous CPU models.
>  
>  @menu
>  * preferred_cpu_models_intel_x86::       Preferred CPU models for Intel x86 hosts
> @@ -287,7 +287,7 @@ Must be explicitly turned on for all AMD CPU models.
>  This provides higher performance than virt-ssbd so should be
>  exposed to guests whenever available in the host. virt-ssbd
>  should none the less also be exposed for maximum guest
> -compatability as some kernels only know about virt-ssbd.
> +compatibility as some kernels only know about virt-ssbd.
>  
>  
>  @item @code{amd-no-ssb}
> @@ -296,7 +296,7 @@ Recommended to indicate the host is not vulnerable CVE-2018-3639
>  
>  Not included by default in any AMD CPU model.
>  
> -Future hardware genarations of CPU will not be vulnerable to
> +Future hardware generations of CPU will not be vulnerable to
>  CVE-2018-3639, and thus the guest should be told not to enable
>  its mitigations, by exposing amd-no-ssb. This is mutually
>  exclusive with virt-ssbd and amd-ssbd.
> @@ -451,7 +451,7 @@ MIPS64 Processor (Release 6, 2014)
>  
>  @item @code{Loongson-2F}
>  
> -MIPS64 Processor (Longsoon 2, 2008)
> +MIPS64 Processor (Loongson 2, 2008)
>  
>  
>  @item @code{Loongson-2E}
> diff --git a/docs/rdma.txt b/docs/rdma.txt
> index e6f9902..a86e992 100644
> --- a/docs/rdma.txt
> +++ b/docs/rdma.txt
> @@ -30,7 +30,7 @@ of the significantly lower latency and higher throughput over TCP/IP. This is
>  because the RDMA I/O architecture reduces the number of interrupts and
>  data copies by bypassing the host networking stack. In particular, a TCP-based
>  migration, under certain types of memory-bound workloads, may take a more
> -unpredicatable amount of time to complete the migration if the amount of
> +unpredictable amount of time to complete the migration if the amount of
>  memory tracked during each live migration iteration round cannot keep pace
>  with the rate of dirty memory produced by the workload.
>  
> @@ -408,7 +408,7 @@ socket is broken during a non-RDMA based migration.
>  TODO:
>  =====
>  1. Currently, 'ulimit -l' mlock() limits as well as cgroups swap limits
> -   are not compatible with infinband memory pinning and will result in
> +   are not compatible with infiniband memory pinning and will result in
>     an aborted migration (but with the source VM left unaffected).
>  2. Use of the recent /proc/<pid>/pagemap would likely speed up
>     the use of KSM and ballooning while using RDMA.
> diff --git a/docs/replay.txt b/docs/replay.txt
> index 3497585..ee6aee9 100644
> --- a/docs/replay.txt
> +++ b/docs/replay.txt
> @@ -290,7 +290,7 @@ E.g., '-serial stdio' in record mode, and '-serial null' in replay mode.
>  Replay log format
>  -----------------
>  
> -Record/replay log consits of the header and the sequence of execution
> +Record/replay log consists of the header and the sequence of execution
>  events. The header includes 4-byte replay version id and 8-byte reserved
>  field. Version is updated every time replay log format changes to prevent
>  using replay log created by another build of qemu.
> diff --git a/docs/vfio-ap.txt b/docs/vfio-ap.txt
> index 1233968..30f3c66 100644
> --- a/docs/vfio-ap.txt
> +++ b/docs/vfio-ap.txt
> @@ -624,7 +624,7 @@ These are the steps:
>        -> IOMMU Hardware Support
>           select S390 AP IOMMU Support
>        -> VFIO Non-Privileged userspace driver framework
> -         -> Mediated device driver frramework
> +         -> Mediated device driver framework
>              -> VFIO driver for Mediated devices
>     -> I/O subsystem
>        -> VFIO support for AP devices
> 

Applied to my trivial-patches branch.

Thanks,
Laurent

