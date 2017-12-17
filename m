Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eQNKZ-0001LQ-0h
	for mharc-qemu-trivial@gnu.org; Sat, 16 Dec 2017 20:01:27 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56984)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eQNKW-0001Kq-3A
	for qemu-trivial@nongnu.org; Sat, 16 Dec 2017 20:01:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eQNKT-0007cr-2t
	for qemu-trivial@nongnu.org; Sat, 16 Dec 2017 20:01:24 -0500
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:38972)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eQNKS-0007c0-Ui; Sat, 16 Dec 2017 20:01:21 -0500
Received: by mail-qk0-x241.google.com with SMTP id u184so14593894qkd.6;
	Sat, 16 Dec 2017 17:01:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=3vlDKQd5CfirDqdD2jHDHHXoUo9bkSg7T3Wqm8gsf6Y=;
	b=YavtdBh9nEGN5FciCDuQmnbZ8Ou8NYXnPvEgdIxrpZJlvfwaVJEAsGhFi+pO/OCPoq
	QfuI4qyqJUy5xWWxbMPctlrlW9muFQZrvCmGyw9h5lnwZIor5k4lds3tiU1oLc4qGWWw
	dnOH+RfpphA37+WAsGKi9VIVgofU+p6dgdfW0KrUGnnP9d7uq+EaNjhlcLSrH3Plkw5k
	yQyRSzQ+89D74e9+59vikrb2MfHBcZctu+vXlk5rGRdrNqA+EdgRn4eJTqf5aCz6LqPI
	f1thcN8SG1f5QYpuLp2fyMmuo2uSnhQ+IWQEhTEguL0F5IPAYVYMkeokhWDYG/RFJUGV
	qPSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=3vlDKQd5CfirDqdD2jHDHHXoUo9bkSg7T3Wqm8gsf6Y=;
	b=dZ8rYXGgs2AtdGIY8a1VEk1KAel0EacejN701Wlb6BMaRODcxn5vyBm80tF6F0NiTt
	iLum2H6fZ4OZBd3oY9n1PH4VQuPRGCV/FLAQo+LgrMFV5zZqZBtQsxKoxqC3x6sBCppK
	iDGvHueSJyqpInyieGhOBX/nhR+8ZfofxoocjOEp081j4B1f8izkJvM6rYmQDH5oVbWK
	erGmmDju6xBm0goWYGhjkpHRyX1P7FAnmXsJHyDSrlKh2tmMA7+BrHaM37yfBvWJNzQl
	QPmKKTSq2g0Y5EaVesOR4IydNgZpqHDklsQ14aw/Wo3JzinNGkhyfLvEJjGBbSclf/Ac
	tYtw==
X-Gm-Message-State: AKGB3mIy9yvgEUq8aiSWOqMV0f9sMiXF0lO6yz6MTbVda5ca4x0Gg4K1
	OXH00ikExhs8VaoBVpQxgfY=
X-Google-Smtp-Source: ACJfBotYY7PyamLajlMbdUl5a8zaQPXj9HhAI1ZYGw7fB/BNpysSmjh3yzFDHcmBdvJfLhAVV566dA==
X-Received: by 10.55.5.143 with SMTP id 137mr24827532qkf.231.1513472480076;
	Sat, 16 Dec 2017 17:01:20 -0800 (PST)
Received: from [192.168.1.11] ([138.117.48.211])
	by smtp.gmail.com with ESMTPSA id
	v17sm6188494qkl.36.2017.12.16.17.01.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 16 Dec 2017 17:01:19 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>
References: <cover.1513465066.git.balaton@eik.bme.hu>
	<4a19707d5b6554dda851b5da07e0276634b50900.1513465066.git.balaton@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <aa2dc73d-7475-a886-fc82-016fde4e4417@amsat.org>
Date: Sat, 16 Dec 2017 22:01:15 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <4a19707d5b6554dda851b5da07e0276634b50900.1513465066.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: Re: [Qemu-trivial] [PATCH 1/2] sm501: Add panel hardware cursor
 registers also to read function
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
X-List-Received-Date: Sun, 17 Dec 2017 01:01:25 -0000

On 12/16/2017 07:57 PM, BALATON Zoltan wrote:
> These were forgotten when adding panel layer support.

 ... in ffd39257018.

> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>

with reference to commit:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  hw/display/sm501.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/hw/display/sm501.c b/hw/display/sm501.c
> index 7f18224..b9b6111 100644
> --- a/hw/display/sm501.c
> +++ b/hw/display/sm501.c
> @@ -956,6 +956,19 @@ static uint64_t sm501_disp_ctrl_read(void *opaque, hwaddr addr,
>          ret = s->dc_panel_v_sync;
>          break;
>  
> +    case SM501_DC_PANEL_HWC_ADDR:
> +        ret = s->dc_panel_hwc_addr;
> +        break;
> +    case SM501_DC_PANEL_HWC_LOC:
> +        ret = s->dc_panel_hwc_location;
> +        break;
> +    case SM501_DC_PANEL_HWC_COLOR_1_2:
> +        ret = s->dc_panel_hwc_color_1_2;
> +        break;
> +    case SM501_DC_PANEL_HWC_COLOR_3:
> +        ret = s->dc_panel_hwc_color_3;
> +        break;
> +
>      case SM501_DC_VIDEO_CONTROL:
>          ret = s->dc_video_control;
>          break;
> 

