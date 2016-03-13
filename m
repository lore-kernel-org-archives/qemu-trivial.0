Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1afBIu-0005rE-Hy
	for mharc-qemu-trivial@gnu.org; Sun, 13 Mar 2016 15:03:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58569)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@web.de>) id 1afBIr-0005n3-Nm
	for qemu-trivial@nongnu.org; Sun, 13 Mar 2016 15:03:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jan.kiszka@web.de>) id 1afBIm-0003bw-EX
	for qemu-trivial@nongnu.org; Sun, 13 Mar 2016 15:03:49 -0400
Received: from mout.web.de ([212.227.15.3]:58880)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@web.de>)
	id 1afBIm-0003bS-4J; Sun, 13 Mar 2016 15:03:44 -0400
Received: from md1f2u6c.ww002.siemens.net ([95.157.58.223]) by smtp.web.de
	(mrweb001) with ESMTPSA (Nemesis) id 0Lsy7e-1ZiE222l58-012cDc;
	Sun, 13 Mar 2016 20:03:40 +0100
To: Mriyam Tamuli <mbtamuli@gmail.com>, qemu-devel@nongnu.org
References: <1457895406-22196-1-git-send-email-mbtamuli@gmail.com>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <56E5B98C.6030909@web.de>
Date: Sun, 13 Mar 2016 20:03:40 +0100
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
	Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <1457895406-22196-1-git-send-email-mbtamuli@gmail.com>
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K0:CjWeq9lbyQs9kJD2mLjchy8uEsK1zjT6p6Z/wSCg093qmB/WIL0
	7yC7AscdFimDZnjEdZuczdMP/LPgTEQmiAfNnSoPBcMdAmqPjDeX+EfobUKLzDMJImRxyte
	zra5mAXX+rUH41bqvVD9Jk8eGt/QROR3k0xv6NH/Pu/KPsmkY87mkp6SKi54jVQ9Zp3gSMM
	O6dyjQyKkqG118nXWW6vw==
X-UI-Out-Filterresults: notjunk:1;V01:K0:Nd4VJtzuXqc=:IGkFvZfulW2ADkJ23xkLQ9
	xieJnmP4T5PT0Xc6iOTvwcA70+QgFvX7UGLVAt6KBQ3zc3TVCeZtRT7XotoYIiJQlVq5vXwau
	cILXgumCtwuWxQ9VAM6pteVrN3odyeIhUAkaiK6DElb8wOZXIWdMfy93JjDgdRTg3U+TV3n2v
	1d8kRUT4wRK54sVzHb4CLq/DsfX0DXNM4wgkE8x1y0/hlhKAU578xGjNbgQiNhC/I7AIkuE5D
	mKsOeB17m/nEt2mueU+QCoqnrNCJyqaOxrN180D6IOwo1thKCP1WTG9hk2Lv2zyTuTNWJaLiT
	PauOiOdkfYMc9+6A5JzLGIdTr0wwV7bQac5q+Fq07VhZe1DbMhRpXjyfrXlLPXWOaRtQ5K+MP
	YY4PXEzglj2V+MUxc0eLvF7wRf23umpTnVk/tpj02iWk/NbhU4CS2g6oD2bFGbPSCenuSrazg
	2FN3koFpFI0bF0jjaoFQUY7EbwU9i6mH32/PLFy/jmmWxmrTlJ/quhoCoI9W/jyVWmSzEKV+C
	HfqJTR7U25sZwQz+fYSqf6xbIZaQhdWR8uYgS8S9NpdpCKKL+Ze6f7OMRxmGWrMyeVAHW1WZM
	Ep13+jGoCruqSsZYcIA3D+0dvm4zezVfDhkCUugkW1LB+1TC8ZNjF+orzAuW1mhckmbm2wRmC
	s/V+mX3/8KkfJCyvfzXE4PEOg3ELTpelwvk8UUqq1Ej4m5yQMyhZPmBFnTQRoJma6SVR64QjZ
	xsB0KdgQiS/1Ippuxy14m+DdbWCDcDJfVHHi/itiLpEYTGNVjWVT9V0FaecmkoEqVTd3wwYRP
	cUwm2u4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.15.3
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org, balrogg@gmail.com
Subject: Re: [Qemu-trivial] [PATCH 2/5] address_space: replaced function
	calls
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
X-List-Received-Date: Sun, 13 Mar 2016 19:03:51 -0000

On 2016-03-13 19:56, Mriyam Tamuli wrote:
> replaced calls named cpu_physical_memory_* with address_space_*

Hmm, did you check if the signatures of both calls are identical? If
not, did you try to build the result of the patch? I'm afraid there is a
bit more work to do.

Jan

> 
> hw/arm/armv7m.c
> hw/arm/boot.c
> hw/arm/musicpal.c
> hw/arm/nseries.c
> ---
>  hw/arm/armv7m.c   | 18 +++++++++---------
>  hw/arm/boot.c     |  8 ++++----
>  hw/arm/musicpal.c | 14 +++++++-------
>  hw/arm/nseries.c  |  8 ++++----
>  4 files changed, 24 insertions(+), 24 deletions(-)
> 
> diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
> index ed7d97f..5275e3a 100644
> --- a/hw/arm/armv7m.c
> +++ b/hw/arm/armv7m.c
> @@ -31,7 +31,7 @@ static inline uint32_t bitband_addr(void * opaque, uint32_t addr)
>  static uint32_t bitband_readb(void *opaque, hwaddr offset)
>  {
>      uint8_t v;
> -    cpu_physical_memory_read(bitband_addr(opaque, offset), &v, 1);
> +    address_space_read(bitband_addr(opaque, offset), &v, 1);
>      return (v & (1 << ((offset >> 2) & 7))) != 0;
>  }
>  
> @@ -43,12 +43,12 @@ static void bitband_writeb(void *opaque, hwaddr offset,
>      uint8_t v;
>      addr = bitband_addr(opaque, offset);
>      mask = (1 << ((offset >> 2) & 7));
> -    cpu_physical_memory_read(addr, &v, 1);
> +    address_space_read(addr, &v, 1);
>      if (value & 1)
>          v |= mask;
>      else
>          v &= ~mask;
> -    cpu_physical_memory_write(addr, &v, 1);
> +    address_space_write(addr, &v, 1);
>  }
>  
>  static uint32_t bitband_readw(void *opaque, hwaddr offset)
> @@ -59,7 +59,7 @@ static uint32_t bitband_readw(void *opaque, hwaddr offset)
>      addr = bitband_addr(opaque, offset) & ~1;
>      mask = (1 << ((offset >> 2) & 15));
>      mask = tswap16(mask);
> -    cpu_physical_memory_read(addr, &v, 2);
> +    address_space_read(addr, &v, 2);
>      return (v & mask) != 0;
>  }
>  
> @@ -72,12 +72,12 @@ static void bitband_writew(void *opaque, hwaddr offset,
>      addr = bitband_addr(opaque, offset) & ~1;
>      mask = (1 << ((offset >> 2) & 15));
>      mask = tswap16(mask);
> -    cpu_physical_memory_read(addr, &v, 2);
> +    address_space_read(addr, &v, 2);
>      if (value & 1)
>          v |= mask;
>      else
>          v &= ~mask;
> -    cpu_physical_memory_write(addr, &v, 2);
> +    address_space_write(addr, &v, 2);
>  }
>  
>  static uint32_t bitband_readl(void *opaque, hwaddr offset)
> @@ -88,7 +88,7 @@ static uint32_t bitband_readl(void *opaque, hwaddr offset)
>      addr = bitband_addr(opaque, offset) & ~3;
>      mask = (1 << ((offset >> 2) & 31));
>      mask = tswap32(mask);
> -    cpu_physical_memory_read(addr, &v, 4);
> +    address_space_read(addr, &v, 4);
>      return (v & mask) != 0;
>  }
>  
> @@ -101,12 +101,12 @@ static void bitband_writel(void *opaque, hwaddr offset,
>      addr = bitband_addr(opaque, offset) & ~3;
>      mask = (1 << ((offset >> 2) & 31));
>      mask = tswap32(mask);
> -    cpu_physical_memory_read(addr, &v, 4);
> +    address_space_read(addr, &v, 4);
>      if (value & 1)
>          v |= mask;
>      else
>          v &= ~mask;
> -    cpu_physical_memory_write(addr, &v, 4);
> +    address_space_write(addr, &v, 4);
>  }
>  
>  static const MemoryRegionOps bitband_ops = {
> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> index 8ba0e42..c89b533 100644
> --- a/hw/arm/boot.c
> +++ b/hw/arm/boot.c
> @@ -281,8 +281,8 @@ static void set_kernel_args(const struct arm_boot_info *info)
>          int cmdline_size;
>  
>          cmdline_size = strlen(info->kernel_cmdline);
> -        cpu_physical_memory_write(p + 8, info->kernel_cmdline,
> -                                  cmdline_size + 1);
> +        address_space_write(p + 8, info->kernel_cmdline,
> +                            cmdline_size + 1);
>          cmdline_size = (cmdline_size >> 2) + 1;
>          WRITE_WORD(p, cmdline_size + 2);
>          WRITE_WORD(p, 0x54410009);
> @@ -296,7 +296,7 @@ static void set_kernel_args(const struct arm_boot_info *info)
>          atag_board_len = (info->atag_board(info, atag_board_buf) + 3) & ~3;
>          WRITE_WORD(p, (atag_board_len + 8) >> 2);
>          WRITE_WORD(p, 0x414f4d50);
> -        cpu_physical_memory_write(p, atag_board_buf, atag_board_len);
> +        address_space_write(p, atag_board_buf, atag_board_len);
>          p += atag_board_len;
>      }
>      /* ATAG_END */
> @@ -372,7 +372,7 @@ static void set_kernel_args_old(const struct arm_boot_info *info)
>      }
>      s = info->kernel_cmdline;
>      if (s) {
> -        cpu_physical_memory_write(p, s, strlen(s) + 1);
> +        address_space_write(p, s, strlen(s) + 1);
>      } else {
>          WRITE_WORD(p, 0);
>      }
> diff --git a/hw/arm/musicpal.c b/hw/arm/musicpal.c
> index 54548f3..e624d51 100644
> --- a/hw/arm/musicpal.c
> +++ b/hw/arm/musicpal.c
> @@ -175,12 +175,12 @@ static void eth_rx_desc_put(uint32_t addr, mv88w8618_rx_desc *desc)
>      cpu_to_le16s(&desc->buffer_size);
>      cpu_to_le32s(&desc->buffer);
>      cpu_to_le32s(&desc->next);
> -    cpu_physical_memory_write(addr, desc, sizeof(*desc));
> +    address_space_write(addr, desc, sizeof(*desc));
>  }
>  
>  static void eth_rx_desc_get(uint32_t addr, mv88w8618_rx_desc *desc)
>  {
> -    cpu_physical_memory_read(addr, desc, sizeof(*desc));
> +    address_space_read(addr, desc, sizeof(*desc));
>      le32_to_cpus(&desc->cmdstat);
>      le16_to_cpus(&desc->bytes);
>      le16_to_cpus(&desc->buffer_size);
> @@ -203,8 +203,8 @@ static ssize_t eth_receive(NetClientState *nc, const uint8_t *buf, size_t size)
>          do {
>              eth_rx_desc_get(desc_addr, &desc);
>              if ((desc.cmdstat & MP_ETH_RX_OWN) && desc.buffer_size >= size) {
> -                cpu_physical_memory_write(desc.buffer + s->vlan_header,
> -                                          buf, size);
> +                address_space_write(desc.buffer + s->vlan_header,
> +                                    buf, size);
>                  desc.bytes = size + s->vlan_header;
>                  desc.cmdstat &= ~MP_ETH_RX_OWN;
>                  s->cur_rx[i] = desc.next;
> @@ -229,12 +229,12 @@ static void eth_tx_desc_put(uint32_t addr, mv88w8618_tx_desc *desc)
>      cpu_to_le16s(&desc->bytes);
>      cpu_to_le32s(&desc->buffer);
>      cpu_to_le32s(&desc->next);
> -    cpu_physical_memory_write(addr, desc, sizeof(*desc));
> +    address_space_write(addr, desc, sizeof(*desc));
>  }
>  
>  static void eth_tx_desc_get(uint32_t addr, mv88w8618_tx_desc *desc)
>  {
> -    cpu_physical_memory_read(addr, desc, sizeof(*desc));
> +    address_space_read(addr, desc, sizeof(*desc));
>      le32_to_cpus(&desc->cmdstat);
>      le16_to_cpus(&desc->res);
>      le16_to_cpus(&desc->bytes);
> @@ -256,7 +256,7 @@ static void eth_send(mv88w8618_eth_state *s, int queue_index)
>          if (desc.cmdstat & MP_ETH_TX_OWN) {
>              len = desc.bytes;
>              if (len < 2048) {
> -                cpu_physical_memory_read(desc.buffer, buf, len);
> +                address_space_read(desc.buffer, buf, len);
>                  qemu_send_packet(qemu_get_queue(s->nic), buf, len);
>              }
>              desc.cmdstat &= ~MP_ETH_TX_OWN;
> diff --git a/hw/arm/nseries.c b/hw/arm/nseries.c
> index d9e61f7..1745d21 100644
> --- a/hw/arm/nseries.c
> +++ b/hw/arm/nseries.c
> @@ -990,8 +990,8 @@ static void n800_gpmc_init(struct n800_s *s)
>              (1 << 6) |		/* CSVALID */
>              (4 << 0);		/* BASEADDRESS */
>  
> -    cpu_physical_memory_write(0x6800a078,		/* GPMC_CONFIG7_0 */
> -                              &config7, sizeof(config7));
> +    address_space_write(0x6800a078, /* GPMC_CONFIG7_0 */
> +                        &config7, sizeof(config7));
>  }
>  
>  /* Setup sequence done by the bootloader */
> @@ -1003,7 +1003,7 @@ static void n8x0_boot_init(void *opaque)
>      /* PRCM setup */
>  #define omap_writel(addr, val)	\
>      buf = (val);			\
> -    cpu_physical_memory_write(addr, &buf, sizeof(buf))
> +    address_space_write(addr, &buf, sizeof(buf))
>  
>      omap_writel(0x48008060, 0x41);		/* PRCM_CLKSRC_CTRL */
>      omap_writel(0x48008070, 1);			/* PRCM_CLKOUT_CTRL */
> @@ -1381,7 +1381,7 @@ static void n8x0_init(MachineState *machine,
>                              sdram_size - 0x400000);
>  
>          n800_setup_nolo_tags(nolo_tags);
> -        cpu_physical_memory_write(OMAP2_SRAM_BASE, nolo_tags, 0x10000);
> +        address_space_write(OMAP2_SRAM_BASE, nolo_tags, 0x10000);
>      }
>  }
>  
> 


