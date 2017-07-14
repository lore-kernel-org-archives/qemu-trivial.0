Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dVs8V-0007Hc-JB
	for mharc-qemu-trivial@gnu.org; Fri, 14 Jul 2017 00:23:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52883)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dVs8S-0007FY-Bq
	for qemu-trivial@nongnu.org; Fri, 14 Jul 2017 00:23:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dVs8P-0002UP-7Q
	for qemu-trivial@nongnu.org; Fri, 14 Jul 2017 00:23:24 -0400
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:34273)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dVs8P-0002UG-2z; Fri, 14 Jul 2017 00:23:21 -0400
Received: by mail-qk0-x241.google.com with SMTP id q66so10786901qki.1;
	Thu, 13 Jul 2017 21:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=dB+BtXv5Na5OnYfb1h2qRNCHnAwenrL8hZuID6ODDKo=;
	b=K0iTc/icNPD1ST81w56Rkgs0tWU2dZkaq9+mhSMICdTm4RekHLmIYYoSAJfP7d5Lyg
	SFf6BcemJO035IFW2qvvOvi84F1l1Ee3ZyrIKCuW5aNhblP4nJ92RHtOTYWZeCm0hycc
	IbaNkksfVLRuckI6z8D7O0RC15c1jV8ZRPxECeLu4gGgTbn+OAKI55OaIbBS3fwLGE3p
	T1gWA3Wix6d+CxHxF7cUb8m1rHtfpgGppKsK+GoOszbWY7cG4kiw7EV/NuX4PClTIEtO
	h8bVi93Td2A/rZAfs/DGZ5TSjM1gEwuU4ZxbXJm4RNvT/BRnl/ClKOsS+O3nUG27Knw8
	504A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=dB+BtXv5Na5OnYfb1h2qRNCHnAwenrL8hZuID6ODDKo=;
	b=SPkyc5YGAmn6MmXM8u+KGF/eN8beAA+U3dqmbYmsi3suQvV1FPpWLGgg+7tx5Gucy/
	Hbsx49uNKfNuH6wKZAsX6sVEzaA7eSzBeRnbkK9OhOEis64MUCdkxndz6wBlvSdM/tAp
	KPAk7ME8LrJQ+w099CHRT6fL79EC/qm5RH5LCbe7AYWmQGZAKjG9hR9SF7Nrl64gEwTB
	GLCW6KLrZoSiWxitvm3NII33T7vNqOghlTPJZX9F9Xm9PPdQBbf/7bANKKEX050mbTij
	Sk50h7jDg4GOgrl9+MQyQfImQdoup3pghyuvTaNUofn+LQ751nI5RF7VCgQPxaHPFGjn
	jZtw==
X-Gm-Message-State: AIVw110ivxwr69+DPaBR3MzUfr0K5IUfFNpgbnrQmhbPjoblfPq//w8c
	AlTR5a3QJ0erJw==
X-Received: by 10.55.143.134 with SMTP id r128mr8552619qkd.129.1500006200559; 
	Thu, 13 Jul 2017 21:23:20 -0700 (PDT)
Received: from [192.168.1.240] ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	p56sm6076880qta.34.2017.07.13.21.23.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 13 Jul 2017 21:23:19 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org,
	"Michael S. Tsirkin" <mst@redhat.com>
References: <20170713163219.9024-1-marcandre.lureau@redhat.com>
	<20170713163219.9024-15-marcandre.lureau@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <8cc501aa-5551-ad6f-e81b-83153b327e9b@amsat.org>
Date: Fri, 14 Jul 2017 01:23:17 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170713163219.9024-15-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: Re: [Qemu-trivial] [PATCH v2 14/29] virtio-gpu: use DIV_ROUND_UP
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
X-List-Received-Date: Fri, 14 Jul 2017 04:23:25 -0000

On 07/13/2017 01:32 PM, Marc-André Lureau wrote:
> I used the clang-tidy qemu-round check to generate the fix:
> https://github.com/elmarco/clang-tools-extra
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>   hw/display/virtio-gpu.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
> index 0506d2c1b0..669f36f8bb 100644
> --- a/hw/display/virtio-gpu.c
> +++ b/hw/display/virtio-gpu.c
> @@ -408,7 +408,7 @@ static void virtio_gpu_transfer_to_host_2d(VirtIOGPU *g,
>       }
>   
>       format = pixman_image_get_format(res->image);
> -    bpp = (PIXMAN_FORMAT_BPP(format) + 7) / 8;
> +    bpp = DIV_ROUND_UP(PIXMAN_FORMAT_BPP(format), 8);
>       stride = pixman_image_get_stride(res->image);
>   
>       if (t2d.offset || t2d.r.x || t2d.r.y ||
> @@ -570,7 +570,7 @@ static void virtio_gpu_set_scanout(VirtIOGPU *g,
>       scanout = &g->scanout[ss.scanout_id];
>   
>       format = pixman_image_get_format(res->image);
> -    bpp = (PIXMAN_FORMAT_BPP(format) + 7) / 8;
> +    bpp = DIV_ROUND_UP(PIXMAN_FORMAT_BPP(format), 8);
>       offset = (ss.r.x * bpp) + ss.r.y * pixman_image_get_stride(res->image);
>       if (!scanout->ds || surface_data(scanout->ds)
>           != ((uint8_t *)pixman_image_get_data(res->image) + offset) ||
> 

