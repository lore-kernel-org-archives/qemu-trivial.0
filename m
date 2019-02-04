Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gqbOp-0007Lb-CF
	for mharc-qemu-trivial@gnu.org; Mon, 04 Feb 2019 05:22:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32883)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1gqbOm-0007JP-Oy
	for qemu-trivial@nongnu.org; Mon, 04 Feb 2019 05:22:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1gqbOV-0004lz-Kj
	for qemu-trivial@nongnu.org; Mon, 04 Feb 2019 05:22:35 -0500
Received: from mx1.redhat.com ([209.132.183.28]:53566)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <berrange@redhat.com>)
	id 1gqbOR-0004Pt-3a; Mon, 04 Feb 2019 05:22:23 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A638F8E5BD;
	Mon,  4 Feb 2019 10:22:20 +0000 (UTC)
Received: from redhat.com (unknown [10.42.16.175])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C88CB838F6;
	Mon,  4 Feb 2019 10:22:15 +0000 (UTC)
Date: Mon, 4 Feb 2019 10:22:13 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Message-ID: <20190204102213.GF1905@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <1549268045-11861-1-git-send-email-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1549268045-11861-1-git-send-email-thuth@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Mon, 04 Feb 2019 10:22:20 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] ui/sdl_keysym: Remove obsolete SDL1.2
 related code
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
X-List-Received-Date: Mon, 04 Feb 2019 10:22:45 -0000

On Mon, Feb 04, 2019 at 09:14:05AM +0100, Thomas Huth wrote:
> Support for SDL1.2 has been removed recently in commit:
> 
>   0015ca5cbabe0b31d31610ddfaafd90a9e5911a4
>   ("ui: remove support for SDL1.2 in favour of SDL2")
> 
> So we can drop the SDL1.2-specific code in sdl_keysym.h now, too.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  ui/sdl_keysym.h | 73 ---------------------------------------------------------
>  1 file changed, 73 deletions(-)
> 
> diff --git a/ui/sdl_keysym.h b/ui/sdl_keysym.h
> index 599d9fc..6994180 100644
> --- a/ui/sdl_keysym.h
> +++ b/ui/sdl_keysym.h
> @@ -200,79 +200,6 @@ static const name2keysym_t name2keysym[]={
>  { "yacute",               0x0fd},
>  { "thorn",                0x0fe},
>  { "ydiaeresis",           0x0ff},
> -#if SDL_MAJOR_VERSION == 1

Don't why this was ever here, because this file is never used by SDL2.
SDL1 passed window system native scan codes, while SDL2 always passes
USB HID scancodes.

IOW, you can delete this whole file.

> -{"EuroSign", SDLK_EURO},
>  
> -    /* modifiers */
> -{"Control_L", SDLK_LCTRL},
> -{"Control_R", SDLK_RCTRL},
> -{"Alt_L", SDLK_LALT},
> -{"Alt_R", SDLK_RALT},
> -{"Caps_Lock", SDLK_CAPSLOCK},
> -{"Meta_L", SDLK_LMETA},
> -{"Meta_R", SDLK_RMETA},
> -{"Shift_L", SDLK_LSHIFT},
> -{"Shift_R", SDLK_RSHIFT},
> -{"Super_L", SDLK_LSUPER},
> -{"Super_R", SDLK_RSUPER},
> -
> -    /* special keys */
> -{"BackSpace", SDLK_BACKSPACE},
> -{"Tab", SDLK_TAB},
> -{"Return", SDLK_RETURN},
> -{"Right", SDLK_RIGHT},
> -{"Left", SDLK_LEFT},
> -{"Up", SDLK_UP},
> -{"Down", SDLK_DOWN},
> -{"Page_Down", SDLK_PAGEDOWN},
> -{"Page_Up", SDLK_PAGEUP},
> -{"Insert", SDLK_INSERT},
> -{"Delete", SDLK_DELETE},
> -{"Home", SDLK_HOME},
> -{"End", SDLK_END},
> -{"Scroll_Lock", SDLK_SCROLLOCK},
> -{"F1", SDLK_F1},
> -{"F2", SDLK_F2},
> -{"F3", SDLK_F3},
> -{"F4", SDLK_F4},
> -{"F5", SDLK_F5},
> -{"F6", SDLK_F6},
> -{"F7", SDLK_F7},
> -{"F8", SDLK_F8},
> -{"F9", SDLK_F9},
> -{"F10", SDLK_F10},
> -{"F11", SDLK_F11},
> -{"F12", SDLK_F12},
> -{"F13", SDLK_F13},
> -{"F14", SDLK_F14},
> -{"F15", SDLK_F15},
> -{"Sys_Req", SDLK_SYSREQ},
> -{"KP_0", SDLK_KP0},
> -{"KP_1", SDLK_KP1},
> -{"KP_2", SDLK_KP2},
> -{"KP_3", SDLK_KP3},
> -{"KP_4", SDLK_KP4},
> -{"KP_5", SDLK_KP5},
> -{"KP_6", SDLK_KP6},
> -{"KP_7", SDLK_KP7},
> -{"KP_8", SDLK_KP8},
> -{"KP_9", SDLK_KP9},
> -{"KP_Add", SDLK_KP_PLUS},
> -{"KP_Decimal", SDLK_KP_PERIOD},
> -{"KP_Divide", SDLK_KP_DIVIDE},
> -{"KP_Enter", SDLK_KP_ENTER},
> -{"KP_Equal", SDLK_KP_EQUALS},
> -{"KP_Multiply", SDLK_KP_MULTIPLY},
> -{"KP_Subtract", SDLK_KP_MINUS},
> -{"help", SDLK_HELP},
> -{"Menu", SDLK_MENU},
> -{"Power", SDLK_POWER},
> -{"Print", SDLK_PRINT},
> -{"Mode_switch", SDLK_MODE},
> -{"Multi_Key", SDLK_COMPOSE},
> -{"Num_Lock", SDLK_NUMLOCK},
> -{"Pause", SDLK_PAUSE},
> -{"Escape", SDLK_ESCAPE},
> -#endif
>  {NULL, 0},
>  };
> -- 
> 1.8.3.1
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

