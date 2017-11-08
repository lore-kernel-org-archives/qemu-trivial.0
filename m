Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eCPnU-0000L1-E8
	for mharc-qemu-trivial@gnu.org; Wed, 08 Nov 2017 07:49:36 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50618)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eCPnS-0000Kq-2d
	for qemu-trivial@nongnu.org; Wed, 08 Nov 2017 07:49:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eCPnO-0001cz-Qx
	for qemu-trivial@nongnu.org; Wed, 08 Nov 2017 07:49:34 -0500
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:52903)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eCPnO-0001ct-Kg; Wed, 08 Nov 2017 07:49:30 -0500
Received: by mail-qt0-x242.google.com with SMTP id 31so3086805qtz.9;
	Wed, 08 Nov 2017 04:49:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=N128/x80zpjmo584wyfoy3EUZOz17Xkzhb88g/ISWSI=;
	b=b8r6S4qpMrSAmnD8goxSoHAvfsjP6jFfD4fo9N7hFWSIEJe0O4HIJmFdw4VSY9vF5s
	jSVbTNMMAKhXEgLetaadlttUWWVDan4tZd8tVnhjBindF0iyzPRB817Q3yJMoarek8F7
	WAPGtXpZZK7dBcrYHqWfLrbfI8erj+PyD9MCGOas/JjIIMBEEtlLyxq1Zwr6E9ElCilL
	BpBuq9RqymtrBbyyigwohMmEvQWQ0i3nM2d+xnR4EU8dD8XX8KNSLox/I95yctU0YNHF
	brmaJV8YkmV0RDEFtoN4tfburNRe9TvEh0E1S6I5VK+Wne+v7zvNLeAz1Y9KEk2GYN+T
	Y8lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=N128/x80zpjmo584wyfoy3EUZOz17Xkzhb88g/ISWSI=;
	b=pg1QxyZtuRJM9bjgkdPT/mAeGsXh7Z0wyZqe0Jt6sAWQZY3YhhLOfYfS/mf5F57TIX
	eZdUDn33hvUzHw39IZ7Tjra4X6tb3VT/AAcf6spdg+u2l0++diXZmExCFY/IWXhuuAYp
	41590dHDZ8Ec5JpeIM5RB2krZ8p2Y9hptck6cDGnOK66YJQEoTLymvPCgC+z5q/9JGPI
	T3JSNXtwpySy4i646BQ4zeZ316A1YqjzxVIeh6cTpixx5VlWFqeOc5Wy4ZclP/TbKfdg
	jgV60HgVU0Q218ZL36tdwJLtKKZ2mPPB2jYL16l+SYtShFeOewEQ5kDT6PtWqWhyBjTb
	p9Ew==
X-Gm-Message-State: AJaThX6ORxv1dXB7TklXPzzbWLcwe4RexucEve3nmLY7yOElPx2OfCXo
	4mDjTaMbT/eQXRkxDO6k9uc=
X-Google-Smtp-Source: ABhQp+R6ahEBBxMSfMi2QLnaHYY97d2E58vB/gcvLPjLxStjCH5sOAdIE9ZvzDDHsZO0tVcQaLwTOQ==
X-Received: by 10.237.62.53 with SMTP id l50mr596464qtf.270.1510145370014;
	Wed, 08 Nov 2017 04:49:30 -0800 (PST)
Received: from [192.168.1.240] ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id c4sm2588906qth.6.2017.11.08.04.49.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 Nov 2017 04:49:29 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: Anthoine Bourgeois <anthoine.bourgeois@gmail.com>,
	Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Anthoine Bourgeois <anthoine.bourgeois@blade-group.com>
References: <20171002124052.13829-1-anthoine.bourgeois@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <4f219f7b-d680-7a46-8832-5a1aaf509783@amsat.org>
Date: Wed, 8 Nov 2017 09:49:26 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <20171002124052.13829-1-anthoine.bourgeois@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] gtk: fix wrong id between
 texture and framebuffer
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
X-List-Received-Date: Wed, 08 Nov 2017 12:49:35 -0000

Hi Anthoine,

Cc'ing Gerd Hoffmann who is the maintainer of this file.

See
https://wiki.qemu.org/Contribute/SubmitAPatch#CC_the_relevant_maintainer:

$ ./scripts/get_maintainer.pl -f ui/gtk-gl-area.c
Gerd Hoffmann <kraxel@redhat.com> (odd fixer:Graphics)

On 10/02/2017 09:40 AM, Anthoine Bourgeois wrote:
> From: Anthoine Bourgeois <anthoine.bourgeois@blade-group.com>
> 
> The gd_gl_area_scanout_texture must destroy framebuffer if there is
> no texture id instead of no framebuffer id.
> The effect was a black screen with "-vga virtio -display gtk,gl=on"
> options.
> The bug was introduce by a4f113fd "gtk: use framebuffer helper functions."
> 
> Signed-off-by: Anthoine Bourgeois <anthoine.bourgeois@blade-group.com>
> ---
>  ui/gtk-gl-area.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/ui/gtk-gl-area.c b/ui/gtk-gl-area.c
> index 18b298f..026b7d7 100644
> --- a/ui/gtk-gl-area.c
> +++ b/ui/gtk-gl-area.c
> @@ -178,8 +178,7 @@ void gd_gl_area_scanout_texture(DisplayChangeListener *dcl,
>  
>      gtk_gl_area_make_current(GTK_GL_AREA(vc->gfx.drawing_area));
>  
> -    if (vc->gfx.guest_fb.framebuffer  == 0 ||
> -        vc->gfx.w == 0 || vc->gfx.h == 0) {
> +    if (backing_id == 0 || vc->gfx.w == 0 || vc->gfx.h == 0) {
>          gtk_gl_area_set_scanout_mode(vc, false);
>          return;
>      }
> 

