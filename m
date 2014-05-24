Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Wo5yR-000897-Lw
	for mharc-qemu-trivial@gnu.org; Sat, 24 May 2014 03:02:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54398)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Wo5yK-0007zH-Dq
	for qemu-trivial@nongnu.org; Sat, 24 May 2014 03:02:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Wo5yF-00085b-7u
	for qemu-trivial@nongnu.org; Sat, 24 May 2014 03:02:24 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:49142)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Wo5y4-00081t-Mx; Sat, 24 May 2014 03:02:08 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 8E75D42B94;
	Sat, 24 May 2014 11:02:05 +0400 (MSK)
Message-ID: <538043ED.20200@msgid.tls.msk.ru>
Date: Sat, 24 May 2014 11:02:05 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.5.0
MIME-Version: 1.0
To: Andrew Oates <andrew@aoates.org>, qemu-devel@nongnu.org
References: <1400890569-30822-1-git-send-email-andrew@aoates.org>
In-Reply-To: <1400890569-30822-1-git-send-email-andrew@aoates.org>
X-Enigmail-Version: 1.6
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] input (curses): mask
 keycodes to remove modifier bits
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
X-List-Received-Date: Sat, 24 May 2014 07:02:29 -0000

24.05.2014 04:16, Andrew Oates wrote:
> Without the mask, control bits are passed on in the keycode, generating
> incorrect PS/2 sequences when SHIFT, ALT, etc are held down.

While the patch itself appears to be trivial, it may have
non-trivial effect.  Cc'ing Gerd for comments.

Thank you!

/mjt

> Signed-off-by: Andrew Oates <andrew@aoates.org>
> ---
>  ui/curses.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/ui/curses.c b/ui/curses.c
> index b044790..de85f76 100644
> --- a/ui/curses.c
> +++ b/ui/curses.c
> @@ -288,8 +288,8 @@ static void curses_refresh(DisplayChangeListener *dcl)
>                  qemu_input_event_send_key_number(NULL, GREY | ALT_CODE, true);
>              }
>  
> -            qemu_input_event_send_key_number(NULL, keycode, true);
> -            qemu_input_event_send_key_number(NULL, keycode, false);
> +            qemu_input_event_send_key_number(NULL, keycode & KEY_MASK, true);
> +            qemu_input_event_send_key_number(NULL, keycode & KEY_MASK, false);
>  
>              if (keycode & ALTGR) {
>                  qemu_input_event_send_key_number(NULL, GREY | ALT_CODE, false);
> 


