Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gw96L-0005sC-OE
	for mharc-qemu-trivial@gnu.org; Tue, 19 Feb 2019 12:22:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35929)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gw96J-0005pv-7d
	for qemu-trivial@nongnu.org; Tue, 19 Feb 2019 12:22:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gw96H-0002Wd-Tw
	for qemu-trivial@nongnu.org; Tue, 19 Feb 2019 12:22:35 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:38791)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gw96D-0002Sv-3J
	for qemu-trivial@nongnu.org; Tue, 19 Feb 2019 12:22:31 -0500
Received: by mail-wm1-f68.google.com with SMTP id v26so3630325wmh.3
	for <qemu-trivial@nongnu.org>; Tue, 19 Feb 2019 09:22:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=b24qLcPssHO6EZvWIh9L/wcRSRZRp8DVrW/zD2hWDJI=;
	b=D+KAlrK5oJ0U27wHpO6W9qMw9oSb5sNFX5pOi8W6xg+WRtjZmVRNSbdl0CJ60/q+ud
	Fwq69Jpb06N549BD5oEMf5TxANHYvO608715lm1H8pHT8wz96eSDIN8c9TprNseEwHqR
	0h4NFxkwYZb0SQzkl3PKaiBPsAg4C3FWKdkM6vXV2MYXhh1lCER6cWfrKCTvNXSK9Mry
	sDXLZQlaPvrvz5dMMmU5/BcePBRx1H2x+6IqLYOTU+cHaEY8qJiTWDPwKEp0UFGclgSM
	ojkSV9GHai2sjMuMkia14Fu3WXDDFjJEAvYaYqJcM/Nh1dMj4UwkeyJpEy9KDhj2EWGP
	Ahyg==
X-Gm-Message-State: AHQUAuacT/UEC+nsE7mNo6d4dO+1FsGGUnDfqm9i7lOYlGAFtcPIyfWn
	h4tC+RipWnAzjI4TixlEXgePnw==
X-Google-Smtp-Source: AHgI3IZym/210p+VLNLgqRgFKirlvnDbkPWBF/Ypa5Vv2CQgCGu/2OSS9z2087w11DnLZBZoDkTmbQ==
X-Received: by 2002:a1c:f613:: with SMTP id w19mr3636698wmc.0.1550596945752;
	Tue, 19 Feb 2019 09:22:25 -0800 (PST)
Received: from [192.168.1.37] (109.red-83-53-160.dynamicip.rima-tde.net.
	[83.53.160.109]) by smtp.gmail.com with ESMTPSA id
	s127sm3353948wmf.39.2019.02.19.09.22.24
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Feb 2019 09:22:25 -0800 (PST)
To: Stephen Checkoway <stephen.checkoway@oberlin.edu>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	"open list:Block layer core" <qemu-block@nongnu.org>,
	Max Reitz <mreitz@redhat.com>, Markus Armbruster <armbru@redhat.com>
References: <20190219153727.62279-1-stephen.checkoway@oberlin.edu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <94a5fb9b-0e86-fe7b-9a29-f62838300420@redhat.com>
Date: Tue, 19 Feb 2019 18:22:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <20190219153727.62279-1-stephen.checkoway@oberlin.edu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.68
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] block/pflash_cfi02: Fix
 memory leak and potential use-after-free
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
X-List-Received-Date: Tue, 19 Feb 2019 17:22:36 -0000

On 2/19/19 4:37 PM, Stephen Checkoway wrote:
> Don't dynamically allocate the pflash's timer. But do use timer_del in
> an unrealize function to make sure that the timer can't fire after the
> pflash_t has been freed.
> 
> Signed-off-by: Stephen Checkoway <stephen.checkoway@oberlin.edu>
> ---
>  hw/block/pflash_cfi02.c | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
> index 0f8b7b8c7b..1588aeff5a 100644
> --- a/hw/block/pflash_cfi02.c
> +++ b/hw/block/pflash_cfi02.c
> @@ -84,7 +84,7 @@ struct pflash_t {
>      uint16_t unlock_addr0;
>      uint16_t unlock_addr1;
>      uint8_t cfi_table[0x52];
> -    QEMUTimer *timer;
> +    QEMUTimer timer;
>      /* The device replicates the flash memory across its memory space.  Emulate
>       * that by having a container (.mem) filled with an array of aliases
>       * (.mem_mappings) pointing to the flash memory (.orig_mem).
> @@ -429,7 +429,7 @@ static void pflash_write (pflash_t *pfl, hwaddr offset,
>              }
>              pfl->status = 0x00;
>              /* Let's wait 5 seconds before chip erase is done */
> -            timer_mod(pfl->timer, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
> +            timer_mod(&pfl->timer, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
>                        (NANOSECONDS_PER_SECOND * 5));
>              break;
>          case 0x30:
> @@ -444,7 +444,7 @@ static void pflash_write (pflash_t *pfl, hwaddr offset,
>              }
>              pfl->status = 0x00;
>              /* Let's wait 1/2 second before sector erase is done */
> -            timer_mod(pfl->timer, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
> +            timer_mod(&pfl->timer, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
>                        (NANOSECONDS_PER_SECOND / 2));
>              break;
>          default:
> @@ -596,7 +596,7 @@ static void pflash_cfi02_realize(DeviceState *dev, Error **errp)
>      pfl->rom_mode = 1;
>      sysbus_init_mmio(SYS_BUS_DEVICE(dev), &pfl->mem);
>  
> -    pfl->timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, pflash_timer, pfl);
> +    timer_init_ns(&pfl->timer, QEMU_CLOCK_VIRTUAL, pflash_timer, pfl);

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

>      pfl->wcycle = 0;
>      pfl->cmd = 0;
>      pfl->status = 0;
> @@ -695,11 +695,18 @@ static Property pflash_cfi02_properties[] = {
>      DEFINE_PROP_END_OF_LIST(),
>  };
>  
> +static void pflash_cfi02_unrealize(DeviceState *dev, Error **errp)
> +{
> +    pflash_t *pfl = CFI_PFLASH02(dev);
> +    timer_del(&pfl->timer);
> +}
> +
>  static void pflash_cfi02_class_init(ObjectClass *klass, void *data)
>  {
>      DeviceClass *dc = DEVICE_CLASS(klass);
>  
>      dc->realize = pflash_cfi02_realize;
> +    dc->unrealize = pflash_cfi02_unrealize;
>      dc->props = pflash_cfi02_properties;
>      set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
>  }
> 

