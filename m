Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dJRfN-0002Or-Va
	for mharc-qemu-trivial@gnu.org; Fri, 09 Jun 2017 17:42:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57553)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dJRfJ-0002OP-P9
	for qemu-trivial@nongnu.org; Fri, 09 Jun 2017 17:41:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dJRfG-0005pN-IY
	for qemu-trivial@nongnu.org; Fri, 09 Jun 2017 17:41:57 -0400
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:36791)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dJRfG-0005p2-DU; Fri, 09 Jun 2017 17:41:54 -0400
Received: by mail-qt0-x241.google.com with SMTP id s33so17895101qtg.3;
	Fri, 09 Jun 2017 14:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=C+g0aGPvYRQRj1nnEzhjoBJ7dnRGKQeUbKG1eFiYYQ8=;
	b=SA6pOrEpUtqy70b/aOYq+kSAuvERagSYtBhPXIW7Iw+kaImzNNMVHRItERotgsx46T
	oQffR2C/A69jbNAOxf6+FCZ3X0zijQiWX4LQ4bAikVtpjJ/i8e26N7+L9g1vkBVQxNEP
	iGkl8ylwzypheSPRGH2vY1rSisKVQeiOYDM/3685V6WHUYrfUGwnfXqr46MXMedBf4iA
	sIWYgCS5CYpyGeA3ll/hJUNw3T/2w+Nb0gMCb51KW06MdJpBU/KmYpmpw/bHlt/Bi9yU
	FCUxMRMN7JFrxe/3zRpLGLsbbMES3EE3UAhyIoD4B8LeEJC6dr9FG6QzeetsN6UHplsR
	KqXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=C+g0aGPvYRQRj1nnEzhjoBJ7dnRGKQeUbKG1eFiYYQ8=;
	b=nQXQKpBJvZptUisW3d9sSLQ0+q8qMbgyMYlStgRFY1QmNNygaTEV5caAQP2R0oMEI5
	09ChfRXivwj++QJ4JKH/r4ToYqkxKnl3/7P+EYiKi6c+p3u6pZbEIRsBoyDCN4wKx1cA
	VxG04SuA2Md9QVyLmHOFhbEsN+QcJWSqKwgbc6Gpj0uC4cAxm6FqHpLyGynIqqOuRGo5
	z1XadE5/mJ1c0qFVeyLpc2PSnWYaXMbyrjpAJ/nfM7iZLW6gjOGbX6HLaIWMUmpOk8Ns
	GDWcC9Oyzp8Z9ogvL/jWYp511UpOtWCMczpR0aoPq2mifNNIjyoTUZLgAXhJ9+v5rsgc
	A2wg==
X-Gm-Message-State: AKS2vOxxDdpWMzMGfHONqaOMzJToEqeu4FZJfdma/oNTDs4fDdOyWMnL
	kGAW2AWVx/kGLA==
X-Received: by 10.55.174.66 with SMTP id x63mr49344652qke.52.1497044513282;
	Fri, 09 Jun 2017 14:41:53 -0700 (PDT)
Received: from [192.168.1.10] ([138.117.48.226])
	by smtp.gmail.com with ESMTPSA id
	c189sm1543176qkb.7.2017.06.09.14.41.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 09 Jun 2017 14:41:52 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20170609150622.4720-1-f4bug@amsat.org>
	<20170609150622.4720-3-f4bug@amsat.org> <87y3t1b11a.fsf@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Jason Wang <jasowang@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <c370216d-a64c-4297-659b-6195a40a1ee3@amsat.org>
Date: Fri, 9 Jun 2017 18:41:49 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <87y3t1b11a.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: Re: [Qemu-trivial] [PATCH v2] net/pcnet: modernise PCNET_DEBUG
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
X-List-Received-Date: Fri, 09 Jun 2017 21:42:00 -0000

On 06/09/2017 01:04 PM, Alex Bennée wrote:
>
> Philippe Mathieu-Daudé <f4bug@amsat.org> writes:
>
>> Ensure the format strings are always preprocessed, so any problem get reported.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>
>> v2: Addressed review feedback from Alex Bennée
>>     No changes in *printf() calls but using qemu_log_mask() is an option.
>>
>>  hw/net/pcnet-pci.c |  13 ----
>>  hw/net/pcnet.c     | 190 +++++++++++++++++++++++++++--------------------------
>>  2 files changed, 96 insertions(+), 107 deletions(-)
>>
>> diff --git a/hw/net/pcnet-pci.c b/hw/net/pcnet-pci.c
>> index 0acf8a4879..331370a1f2 100644
>> --- a/hw/net/pcnet-pci.c
>> +++ b/hw/net/pcnet-pci.c
>> @@ -38,14 +38,6 @@
>>
>>  #include "pcnet.h"
>>
>> -//#define PCNET_DEBUG
>> -//#define PCNET_DEBUG_IO
>> -//#define PCNET_DEBUG_BCR
>> -//#define PCNET_DEBUG_CSR
>> -//#define PCNET_DEBUG_RMD
>> -//#define PCNET_DEBUG_TMD
>> -//#define PCNET_DEBUG_MATCH
>> -
>>  #define TYPE_PCI_PCNET "pcnet"
>>
>>  #define PCI_PCNET(obj) \
>> @@ -284,11 +276,6 @@ static void pci_pcnet_realize(PCIDevice *pci_dev, Error **errp)
>>      PCNetState *s = &d->state;
>>      uint8_t *pci_conf;
>>
>> -#if 0
>> -    printf("sizeof(RMD)=%d, sizeof(TMD)=%d\n",
>> -        sizeof(struct pcnet_RMD), sizeof(struct pcnet_TMD));
>> -#endif
>> -
>>      pci_conf = pci_dev->config;
>>
>>      pci_set_word(pci_conf + PCI_STATUS,
>> diff --git a/hw/net/pcnet.c b/hw/net/pcnet.c
>> index 654455355f..6e97c0b176 100644
>> --- a/hw/net/pcnet.c
>> +++ b/hw/net/pcnet.c
>> @@ -45,13 +45,13 @@
>>
>>  #include "pcnet.h"
>>
>> -//#define PCNET_DEBUG
>> -//#define PCNET_DEBUG_IO
>> -//#define PCNET_DEBUG_BCR
>> -//#define PCNET_DEBUG_CSR
>> -//#define PCNET_DEBUG_RMD
>> -//#define PCNET_DEBUG_TMD
>> -//#define PCNET_DEBUG_MATCH
>> +#define PCNET_DEBUG         0
>> +#define PCNET_DEBUG_IO      0
>> +#define PCNET_DEBUG_BCR     0
>> +#define PCNET_DEBUG_CSR     0
>> +#define PCNET_DEBUG_RMD     0
>> +#define PCNET_DEBUG_TMD     0
>> +#define PCNET_DEBUG_MATCH   0
>
> This is an aweful lot of debug knobs. Is there really such a variation
> in debug output to bother having this granularity?

Don't tell me! I just wanted to fix a format string at first then ended 
here. I believe those knobs were useful during interface model 
bootstrapping and were never used once this interface worked enough.

I'll try using the trace API it should get cleaner I hope.

The only message I ever saw is about "Bad SWSTYLE" in pcnet_bcr_writew() 
with Linux/mipsel which should get reported through 
qemu_log_mask(LOG_GUEST_ERROR).

>
>>
>>
>>  struct qemu_ether_header {
>> @@ -268,7 +268,9 @@ struct pcnet_RMD {
>>          GET_FIELD((T)->misc, TMDM, TDR),                \
>>          GET_FIELD((T)->misc, TMDM, TRC))
>>
>> -#define PRINT_RMD(R) printf(                            \
>> +
>> +#define PRINT_RMD(R) do { if (PCNET_DEBUG_RMD) {        \
>> +        printf(                                         \
>>          "RMD0 : RBADR=0x%08x\n"                         \
>>          "RMD1 : OWN=%d, ERR=%d, FRAM=%d, OFLO=%d, "     \
>>          "CRC=%d, BUFF=%d, STP=%d, ENP=%d,\n       "     \
>> @@ -292,7 +294,9 @@ struct pcnet_RMD {
>>          GET_FIELD((R)->msg_length, RMDM, RCC),          \
>>          GET_FIELD((R)->msg_length, RMDM, RPC),          \
>>          GET_FIELD((R)->msg_length, RMDM, MCNT),         \
>> -        GET_FIELD((R)->msg_length, RMDM, ZEROS))
>> +        GET_FIELD((R)->msg_length, RMDM, ZEROS)); }     \
>> +        } while (0)
>> +
>>
>>  static inline void pcnet_tmd_load(PCNetState *s, struct pcnet_TMD *tmd,
>>                                    hwaddr addr)
>> @@ -510,7 +514,7 @@ static inline void pcnet_rmd_store(PCNetState *s, struct pcnet_RMD *rmd,
>>
>>  #endif
>>
>> -#define PRINT_PKTHDR(BUF) do {                  \
>> +#define PRINT_PKTHDR(BUF) do { if (PCNET_DEBUG_MATCH) { \
>>      struct qemu_ether_header *hdr = (void *)(BUF); \
>>      printf("packet dhost=%02x:%02x:%02x:%02x:%02x:%02x, " \
>>             "shost=%02x:%02x:%02x:%02x:%02x:%02x, " \
>> @@ -520,7 +524,7 @@ static inline void pcnet_rmd_store(PCNetState *s, struct pcnet_RMD *rmd,
>>             hdr->ether_shost[0],hdr->ether_shost[1],hdr->ether_shost[2], \
>>             hdr->ether_shost[3],hdr->ether_shost[4],hdr->ether_shost[5], \
>>             be16_to_cpu(hdr->ether_type));       \
>> -} while (0)
>> +    } } while (0)
>>
>>  #define MULTICAST_FILTER_LEN 8
>>
>> @@ -623,14 +627,14 @@ static inline int padr_match(PCNetState *s, const uint8_t *buf, int size)
>>          s->csr[14] & 0xff, s->csr[14] >> 8
>>      };
>>      int result = (!CSR_DRCVPA(s)) && !memcmp(hdr->ether_dhost, padr, 6);
>> -#ifdef PCNET_DEBUG_MATCH
>> -    printf("packet dhost=%02x:%02x:%02x:%02x:%02x:%02x, "
>> -           "padr=%02x:%02x:%02x:%02x:%02x:%02x\n",
>> -           hdr->ether_dhost[0],hdr->ether_dhost[1],hdr->ether_dhost[2],
>> -           hdr->ether_dhost[3],hdr->ether_dhost[4],hdr->ether_dhost[5],
>> -           padr[0],padr[1],padr[2],padr[3],padr[4],padr[5]);
>> -    printf("padr_match result=%d\n", result);
>> -#endif
>> +    if (PCNET_DEBUG_MATCH) {
>> +        printf("packet dhost=%02x:%02x:%02x:%02x:%02x:%02x, "
>> +               "padr=%02x:%02x:%02x:%02x:%02x:%02x\n",
>> +               hdr->ether_dhost[0], hdr->ether_dhost[1], hdr->ether_dhost[2],
>> +               hdr->ether_dhost[3], hdr->ether_dhost[4], hdr->ether_dhost[5],
>> +               padr[0], padr[1], padr[2], padr[3], padr[4], padr[5]);
>> +        printf("padr_match result=%d\n", result);
>> +    }
>
> While this improves things it might be cleaner to debug helper/defines
> so we can have simpler:
>
>    debug_pcnet("foo=%x bar=%d", foo, bar)
>
> Or maybe:
>
>    debug_pci(PCNET_DEBUG_MATCH, "foo=%x, bar=%x", foo, bar)
>
> Depending on if we can rationlise the debug control knobs
>
>>      return result;
>>  }
>>
>> @@ -639,9 +643,9 @@ static inline int padr_bcast(PCNetState *s, const uint8_t *buf, int size)
>>      static const uint8_t BCAST[6] = { 0xff, 0xff, 0xff, 0xff, 0xff, 0xff };
>>      struct qemu_ether_header *hdr = (void *)buf;
>>      int result = !CSR_DRCVBC(s) && !memcmp(hdr->ether_dhost, BCAST, 6);
>> -#ifdef PCNET_DEBUG_MATCH
>> -    printf("padr_bcast result=%d\n", result);
>> -#endif
>> +    if (PCNET_DEBUG_MATCH) {
>> +        printf("padr_bcast result=%d\n", result);
>> +    }
>>      return result;
>>  }
>>
>> @@ -790,6 +794,10 @@ static void pcnet_init(PCNetState *s)
>>      uint16_t padr[3], ladrf[4], mode;
>>      uint32_t rdra, tdra;
>>
>> +    if (PCNET_DEBUG) {
>> +        printf("sizeof(RMD)=%zu, sizeof(TMD)=%zu\n",
>> +            sizeof(struct pcnet_RMD), sizeof(struct pcnet_TMD));
>> +    }
>>      trace_pcnet_init(s, PHYSADDR(s, CSR_IADR(s)));
>>
>>      if (BCR_SSIZE32(s)) {
>> @@ -858,9 +866,9 @@ static void pcnet_init(PCNetState *s)
>>
>>  static void pcnet_start(PCNetState *s)
>>  {
>> -#ifdef PCNET_DEBUG
>> -    printf("pcnet_start\n");
>> -#endif
>> +    if (PCNET_DEBUG) {
>> +        printf("pcnet_start\n");
>> +    }
>>
>>      if (!CSR_DTX(s)) {
>>          s->csr[0] |= 0x0010;    /* set TXON */
>> @@ -877,9 +885,9 @@ static void pcnet_start(PCNetState *s)
>>
>>  static void pcnet_stop(PCNetState *s)
>>  {
>> -#ifdef PCNET_DEBUG
>> -    printf("pcnet_stop\n");
>> -#endif
>> +    if (PCNET_DEBUG) {
>> +        printf("pcnet_stop\n");
>> +    }
>>      s->csr[0] &= ~0xffeb;
>>      s->csr[0] |= 0x0014;
>>      s->csr[4] &= ~0x02c2;
>> @@ -939,12 +947,13 @@ static void pcnet_rdte_poll(PCNetState *s)
>>          RMDLOAD(&rmd, PHYSADDR(s,CSR_CRDA(s)));
>>          CSR_CRBC(s) = GET_FIELD(rmd.buf_length, RMDL, BCNT);
>>          CSR_CRST(s) = rmd.status;
>> -#ifdef PCNET_DEBUG_RMD_X
>> -        printf("CRDA=0x%08x CRST=0x%04x RCVRC=%d RMDL=0x%04x RMDS=0x%04x RMDM=0x%08x\n",
>> -                PHYSADDR(s,CSR_CRDA(s)), CSR_CRST(s), CSR_RCVRC(s),
>> -                rmd.buf_length, rmd.status, rmd.msg_length);
>> +        if (PCNET_DEBUG_RMD) {
>> +            printf("CRDA=0x%08x CRST=0x%04x RCVRC=%d RMDL=0x%04x "
>> +                    "RMDS=0x%04x RMDM=0x%08x\n",
>> +                    PHYSADDR(s, CSR_CRDA(s)), CSR_CRST(s), CSR_RCVRC(s),
>> +                    rmd.buf_length, rmd.status, rmd.msg_length);
>> +        }
>>          PRINT_RMD(&rmd);
>> -#endif
>>      } else {
>>          CSR_CRBC(s) = CSR_CRST(s) = 0;
>>      }
>> @@ -1013,9 +1022,9 @@ ssize_t pcnet_receive(NetClientState *nc, const uint8_t *buf, size_t size_)
>>          (CSR_LOOP(s) && !s->looptest)) {
>>          return -1;
>>      }
>> -#ifdef PCNET_DEBUG
>> -    printf("pcnet_receive size=%d\n", size);
>> -#endif
>> +    if (PCNET_DEBUG) {
>> +        printf("pcnet_receive size=%d\n", size);
>> +    }
>>
>>      /* if too small buffer, then expand it */
>>      if (size < MIN_BUF_SIZE) {
>> @@ -1044,10 +1053,10 @@ ssize_t pcnet_receive(NetClientState *nc, const uint8_t *buf, size_t size_)
>>                      (BCR_SWSTYLE(s) ? 16 : 8 );
>>                  RMDLOAD(&rmd, nrda);
>>                  if (GET_FIELD(rmd.status, RMDS, OWN)) {
>> -#ifdef PCNET_DEBUG_RMD
>> -                    printf("pcnet - scan buffer: RCVRC=%d PREV_RCVRC=%d\n",
>> +                    if (PCNET_DEBUG_RMD) {
>> +                        printf("pcnet - scan buffer: RCVRC=%d PREV_RCVRC=%d\n",
>>                                  rcvrc, CSR_RCVRC(s));
>> -#endif
>> +                    }
>>                      CSR_RCVRC(s) = rcvrc;
>>                      pcnet_rdte_poll(s);
>>                      break;
>> @@ -1056,9 +1065,9 @@ ssize_t pcnet_receive(NetClientState *nc, const uint8_t *buf, size_t size_)
>>          }
>>
>>          if (!(CSR_CRST(s) & 0x8000)) {
>> -#ifdef PCNET_DEBUG_RMD
>> -            printf("pcnet - no buffer: RCVRC=%d\n", CSR_RCVRC(s));
>> -#endif
>> +            if (PCNET_DEBUG_RMD) {
>> +                printf("pcnet - no buffer: RCVRC=%d\n", CSR_RCVRC(s));
>> +            }
>>              s->csr[0] |= 0x1000; /* Set MISS flag */
>>              CSR_MISSC(s)++;
>>          } else {
>> @@ -1069,9 +1078,9 @@ ssize_t pcnet_receive(NetClientState *nc, const uint8_t *buf, size_t size_)
>>
>>              if (!s->looptest) {
>>                  if (size > 4092) {
>> -#ifdef PCNET_DEBUG_RMD
>> -                    fprintf(stderr, "pcnet: truncates rx packet.\n");
>> -#endif
>> +                    if (PCNET_DEBUG_RMD) {
>> +                        fprintf(stderr, "pcnet: truncates rx packet.\n");
>> +                    }
>>                      size = 4092;
>>                  }
>>                  memcpy(src, buf, size);
>> @@ -1099,9 +1108,7 @@ ssize_t pcnet_receive(NetClientState *nc, const uint8_t *buf, size_t size_)
>>                  crc_err = (*(uint32_t *)p != htonl(fcs));
>>              }
>>
>> -#ifdef PCNET_DEBUG_MATCH
>>              PRINT_PKTHDR(buf);
>> -#endif
>>
>>              RMDLOAD(&rmd, PHYSADDR(s,crda));
>>              /*if (!CSR_LAPPEN(s))*/
>> @@ -1121,16 +1128,12 @@ ssize_t pcnet_receive(NetClientState *nc, const uint8_t *buf, size_t size_)
>>              PCNET_RECV_STORE();
>>              if ((remaining > 0) && CSR_NRDA(s)) {
>>                  hwaddr nrda = CSR_NRDA(s);
>> -#ifdef PCNET_DEBUG_RMD
>>                  PRINT_RMD(&rmd);
>> -#endif
>>                  RMDLOAD(&rmd, PHYSADDR(s,nrda));
>>                  if (GET_FIELD(rmd.status, RMDS, OWN)) {
>>                      crda = nrda;
>>                      PCNET_RECV_STORE();
>> -#ifdef PCNET_DEBUG_RMD
>>                      PRINT_RMD(&rmd);
>> -#endif
>>                      if ((remaining > 0) && (nrda=CSR_NNRD(s))) {
>>                          RMDLOAD(&rmd, PHYSADDR(s,nrda));
>>                          if (GET_FIELD(rmd.status, RMDS, OWN)) {
>> @@ -1162,13 +1165,11 @@ ssize_t pcnet_receive(NetClientState *nc, const uint8_t *buf, size_t size_)
>>              RMDSTORE(&rmd, PHYSADDR(s,crda));
>>              s->csr[0] |= 0x0400;
>>
>> -#ifdef PCNET_DEBUG
>> -            printf("RCVRC=%d CRDA=0x%08x BLKS=%d\n",
>> -                CSR_RCVRC(s), PHYSADDR(s,CSR_CRDA(s)), pktcount);
>> -#endif
>> -#ifdef PCNET_DEBUG_RMD
>> +            if (PCNET_DEBUG) {
>> +                printf("RCVRC=%d CRDA=0x%08x BLKS=%d\n",
>> +                    CSR_RCVRC(s), PHYSADDR(s, CSR_CRDA(s)), pktcount);
>> +            }
>>              PRINT_RMD(&rmd);
>> -#endif
>>
>>              while (pktcount--) {
>>                  if (CSR_RCVRC(s) <= 1) {
>> @@ -1217,10 +1218,10 @@ txagain:
>>
>>          TMDLOAD(&tmd, PHYSADDR(s,CSR_CXDA(s)));
>>
>> -#ifdef PCNET_DEBUG_TMD
>> -        printf("  TMDLOAD 0x%08x\n", PHYSADDR(s,CSR_CXDA(s)));
>> -        PRINT_TMD(&tmd);
>> -#endif
>> +        if (PCNET_DEBUG_TMD) {
>> +            printf("  TMDLOAD 0x%08x\n", PHYSADDR(s, CSR_CXDA(s)));
>> +            PRINT_TMD(&tmd);
>> +        }
>>          if (GET_FIELD(tmd.status, TMDS, STP)) {
>>              s->xmit_pos = 0;
>>              xmit_cxda = PHYSADDR(s,CSR_CXDA(s));
>> @@ -1260,9 +1261,9 @@ txagain:
>>              goto txdone;
>>          }
>>
>> -#ifdef PCNET_DEBUG
>> -        printf("pcnet_transmit size=%d\n", s->xmit_pos);
>> -#endif
>> +        if (PCNET_DEBUG) {
>> +            printf("pcnet_transmit size=%d\n", s->xmit_pos);
>> +        }
>>          if (CSR_LOOP(s)) {
>>              if (BCR_SWSTYLE(s) == 1)
>>                  add_crc = !GET_FIELD(tmd.status, TMDS, NOFCS);
>> @@ -1363,9 +1364,9 @@ static void pcnet_poll_timer(void *opaque)
>>  static void pcnet_csr_writew(PCNetState *s, uint32_t rap, uint32_t new_value)
>>  {
>>      uint16_t val = new_value;
>> -#ifdef PCNET_DEBUG_CSR
>> -    printf("pcnet_csr_writew rap=%d val=0x%04x\n", rap, val);
>> -#endif
>> +    if (PCNET_DEBUG_CSR) {
>> +        printf("pcnet_csr_writew rap=%d val=0x%04x\n", rap, val);
>> +    }
>>      switch (rap) {
>>      case 0:
>>          s->csr[0] &= ~(val & 0x7f00); /* Clear any interrupt flags */
>> @@ -1491,18 +1492,18 @@ static uint32_t pcnet_csr_readw(PCNetState *s, uint32_t rap)
>>      default:
>>          val = s->csr[rap];
>>      }
>> -#ifdef PCNET_DEBUG_CSR
>> -    printf("pcnet_csr_readw rap=%d val=0x%04x\n", rap, val);
>> -#endif
>> +    if (PCNET_DEBUG_CSR) {
>> +        printf("pcnet_csr_readw rap=%d val=0x%04x\n", rap, val);
>> +    }
>>      return val;
>>  }
>>
>>  static void pcnet_bcr_writew(PCNetState *s, uint32_t rap, uint32_t val)
>>  {
>>      rap &= 127;
>> -#ifdef PCNET_DEBUG_BCR
>> -    printf("pcnet_bcr_writew rap=%d val=0x%04x\n", rap, val);
>> -#endif
>> +    if (PCNET_DEBUG_BCR) {
>> +        printf("pcnet_bcr_writew rap=%d val=0x%04x\n", rap, val);
>> +    }
>>      switch (rap) {
>>      case BCR_SWS:
>>          if (!(CSR_STOP(s) || CSR_SPND(s)))
>> @@ -1524,9 +1525,9 @@ static void pcnet_bcr_writew(PCNetState *s, uint32_t rap, uint32_t val)
>>              val = 0x0200;
>>              break;
>>          }
>> -#ifdef PCNET_DEBUG
>> -       printf("BCR_SWS=0x%04x\n", val);
>> -#endif
>> +        if (PCNET_DEBUG) {
>> +            printf("BCR_SWS=0x%04x\n", val);
>> +        }
>>          /* fall through */
>>      case BCR_LNKST:
>>      case BCR_LED1:
>> @@ -1560,9 +1561,9 @@ uint32_t pcnet_bcr_readw(PCNetState *s, uint32_t rap)
>>          val = rap < 32 ? s->bcr[rap] : 0;
>>          break;
>>      }
>> -#ifdef PCNET_DEBUG_BCR
>> -    printf("pcnet_bcr_readw rap=%d val=0x%04x\n", rap, val);
>> -#endif
>> +    if (PCNET_DEBUG_BCR) {
>> +        printf("pcnet_bcr_readw rap=%d val=0x%04x\n", rap, val);
>> +    }
>>      return val;
>>  }
>>
>> @@ -1592,9 +1593,9 @@ void pcnet_ioport_writew(void *opaque, uint32_t addr, uint32_t val)
>>  {
>>      PCNetState *s = opaque;
>>      pcnet_poll_timer(s);
>> -#ifdef PCNET_DEBUG_IO
>> -    printf("pcnet_ioport_writew addr=0x%08x val=0x%04x\n", addr, val);
>> -#endif
>> +    if (PCNET_DEBUG_IO) {
>> +        printf("pcnet_ioport_writew addr=0x%08x val=0x%04x\n", addr, val);
>> +    }
>>      if (!BCR_DWIO(s)) {
>>          switch (addr & 0x0f) {
>>          case 0x00: /* RDP */
>> @@ -1634,9 +1635,10 @@ uint32_t pcnet_ioport_readw(void *opaque, uint32_t addr)
>>          }
>>      }
>>      pcnet_update_irq(s);
>> -#ifdef PCNET_DEBUG_IO
>> -    printf("pcnet_ioport_readw addr=0x%08x val=0x%04x\n", addr, val & 0xffff);
>> -#endif
>> +    if (PCNET_DEBUG_IO) {
>> +        printf("pcnet_ioport_readw addr=0x%08x val=0x%04x\n", addr,
>> +                val & 0xffff);
>> +    }
>>      return val;
>>  }
>>
>> @@ -1644,9 +1646,9 @@ void pcnet_ioport_writel(void *opaque, uint32_t addr, uint32_t val)
>>  {
>>      PCNetState *s = opaque;
>>      pcnet_poll_timer(s);
>> -#ifdef PCNET_DEBUG_IO
>> -    printf("pcnet_ioport_writel addr=0x%08x val=0x%08x\n", addr, val);
>> -#endif
>> +    if (PCNET_DEBUG_IO) {
>> +        printf("pcnet_ioport_writel addr=0x%08x val=0x%08x\n", addr, val);
>> +    }
>>      if (BCR_DWIO(s)) {
>>          switch (addr & 0x0f) {
>>          case 0x00: /* RDP */
>> @@ -1662,9 +1664,9 @@ void pcnet_ioport_writel(void *opaque, uint32_t addr, uint32_t val)
>>      } else if ((addr & 0x0f) == 0) {
>>          /* switch device to dword i/o mode */
>>          pcnet_bcr_writew(s, BCR_BSBC, pcnet_bcr_readw(s, BCR_BSBC) | 0x0080);
>> -#ifdef PCNET_DEBUG_IO
>> -        printf("device switched into dword i/o mode\n");
>> -#endif
>> +        if (PCNET_DEBUG_IO) {
>> +            printf("device switched into dword i/o mode\n");
>> +        }
>>      }
>>      pcnet_update_irq(s);
>>  }
>> @@ -1692,9 +1694,9 @@ uint32_t pcnet_ioport_readl(void *opaque, uint32_t addr)
>>          }
>>      }
>>      pcnet_update_irq(s);
>> -#ifdef PCNET_DEBUG_IO
>> -    printf("pcnet_ioport_readl addr=0x%08x val=0x%08x\n", addr, val);
>> -#endif
>> +    if (PCNET_DEBUG_IO) {
>> +        printf("pcnet_ioport_readl addr=0x%08x val=0x%08x\n", addr, val);
>> +    }
>>      return val;
>>  }
>
>
> --
> Alex Bennée
>

