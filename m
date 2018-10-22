Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gEjw3-0008D7-N8
	for mharc-qemu-trivial@gnu.org; Mon, 22 Oct 2018 19:48:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52124)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gEjvx-0008CN-I3
	for qemu-trivial@nongnu.org; Mon, 22 Oct 2018 19:48:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gEjsw-0006Xs-Nl
	for qemu-trivial@nongnu.org; Mon, 22 Oct 2018 19:45:27 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:43664)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gEjsv-0006X5-Uf
	for qemu-trivial@nongnu.org; Mon, 22 Oct 2018 19:45:22 -0400
Received: by mail-wr1-f67.google.com with SMTP id t10-v6so5195112wrn.10
	for <qemu-trivial@nongnu.org>; Mon, 22 Oct 2018 16:45:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=EexC4d30QJznOjf0cEkGcmVP+rLcETIkTtxmtkpvAJY=;
	b=W28PojjSEZvPl4vJaIdJcM/+7rUnixqHiV1uOA2/UB4tzk9F9ZksziCvkb5KF5zqFN
	zEPCNzmroE2UK9sCQbJFagssnctFPCyfe2jeeOKJF0Kmi0+NfJRVj1t2f5D9mNRna9Kr
	xFLXyEAs/CBUSId+41IxS2XeBSeCqbsVXHMvglB7MXjy0ZLMB/11FaHSyVu8VJ0TgpSn
	9+sUjlwCcG0jMnwrUvu6CMFGWkyyxE4BRA5GXm+elUnMfdpIvjoa670wHBsBMs3kaXAq
	pFEwgI38XQIvpEpF8ODmp0l17FFoCejM+F4MS1WyWh7l0axzKcRCts0kGXGRWYymRVEV
	iqHw==
X-Gm-Message-State: ABuFfoh2AoFG1vZxbEEW934Sl+f3r8okxRdAt2COYCEXEL1b8wE93oSV
	Z6OINyIsUDlGarKJ8XWiuu/DY4g2iWE=
X-Google-Smtp-Source: ACcGV62jmNErFhvR5HEW1TvLzmUI6xOWuPnumt3EgzKhk0y+h0iM93zT8eQOYozoVAGC383IWV3XKA==
X-Received: by 2002:adf:bc84:: with SMTP id
	g4-v6mr50332203wrh.250.1540251920876; 
	Mon, 22 Oct 2018 16:45:20 -0700 (PDT)
Received: from [172.29.28.213] ([185.30.24.106])
	by smtp.gmail.com with ESMTPSA id
	j46-v6sm60815294wre.91.2018.10.22.16.45.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 22 Oct 2018 16:45:20 -0700 (PDT)
To: yuchenlin@synology.com, qemu-devel@nongnu.org
Cc: kraxel@redhat.com, qemu-trivial@nongnu.org
References: <20181022080053.9379-1-yuchenlin@synology.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <adce4765-3ff4-0898-168d-7d55606720f4@redhat.com>
Date: Tue, 23 Oct 2018 01:45:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181022080053.9379-1-yuchenlin@synology.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.67
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] vga_int: remove unused
 function protype
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
X-List-Received-Date: Mon, 22 Oct 2018 23:48:34 -0000

On 22/10/18 10:00, yuchenlin--- via Qemu-devel wrote:
> From: yuchenlin <yuchenlin@synology.com>
> 
> Signed-off-by: yuchenlin <yuchenlin@synology.com>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>   hw/display/vga_int.h | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/hw/display/vga_int.h b/hw/display/vga_int.h
> index 6e4fa48a79..55c418eab5 100644
> --- a/hw/display/vga_int.h
> +++ b/hw/display/vga_int.h
> @@ -166,7 +166,6 @@ MemoryRegion *vga_init_io(VGACommonState *s, Object *obj,
>                             const MemoryRegionPortio **vbe_ports);
>   void vga_common_reset(VGACommonState *s);
>   
> -void vga_sync_dirty_bitmap(VGACommonState *s);
>   void vga_dirty_log_start(VGACommonState *s);
>   void vga_dirty_log_stop(VGACommonState *s);
>   
> 

