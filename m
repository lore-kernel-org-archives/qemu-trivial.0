Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TaAeb-0001f4-0O
	for mharc-qemu-trivial@gnu.org; Sun, 18 Nov 2012 14:35:41 -0500
Received: from eggs.gnu.org ([208.118.235.92]:57360)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1TaAeW-0001RN-1o
	for qemu-trivial@nongnu.org; Sun, 18 Nov 2012 14:35:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1TaAeS-00084H-U5
	for qemu-trivial@nongnu.org; Sun, 18 Nov 2012 14:35:35 -0500
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:55573)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1TaAeM-00083u-GG; Sun, 18 Nov 2012 14:35:26 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	E56D0728003A; Sun, 18 Nov 2012 20:35:25 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id l9bEvxOseHM2; Sun, 18 Nov 2012 20:35:25 +0100 (CET)
Received: from flocke.fritz.box (p54ADBD8C.dip.t-dialin.net [84.173.189.140])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	52271728002F; Sun, 18 Nov 2012 20:35:25 +0100 (CET)
Received: from localhost ([127.0.0.1] ident=stefan)
	by flocke.fritz.box with esmtp (Exim 4.72)
	(envelope-from <sw@weilnetz.de>)
	id 1TaAeK-00017p-RP; Sun, 18 Nov 2012 20:35:24 +0100
Message-ID: <50A9387C.3040808@weilnetz.de>
Date: Sun, 18 Nov 2012 20:35:24 +0100
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.16) Gecko/20121027 Iceowl/1.0b1 Icedove/3.0.11
MIME-Version: 1.0
To: Anthony Liguori <aliguori@us.ibm.com>
References: <1351840452-481-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1351840452-481-1-git-send-email-sw@weilnetz.de>
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] Fix spelling (prefered -> preferred)
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
X-List-Received-Date: Sun, 18 Nov 2012 19:35:39 -0000

Am 02.11.2012 08:14, schrieb Stefan Weil:
> Signed-off-by: Stefan Weil<sw@weilnetz.de>
> ---
>   configure       |    2 +-
>   net/tap-win32.c |    7 ++++---
>   2 files changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/configure b/configure
> index 79701ea..860859b 100755
> --- a/configure
> +++ b/configure
> @@ -2115,7 +2115,7 @@ if test "$pixman" = "system"; then
>   else
>     if test ! -d ${source_path}/pixman/pixman; then
>       echo "ERROR: pixman not present. Your options:"
> -    echo "  (1) Prefered: Install the pixman devel package (any recent"
> +    echo "  (1) Preferred: Install the pixman devel package (any recent"
>       echo "      distro should have packages as Xorg needs pixman too)."
>       echo "  (2) Fetch the pixman submodule, using:"
>       echo "      git submodule update --init pixman"
> diff --git a/net/tap-win32.c b/net/tap-win32.c
> index 8d2d32b..f9bd741 100644
> --- a/net/tap-win32.c
> +++ b/net/tap-win32.c
> @@ -565,7 +565,7 @@ static void tap_win32_free_buffer(tap_win32_overlapped_t *overlapped,
>   }
>
>   static int tap_win32_open(tap_win32_overlapped_t **phandle,
> -                          const char *prefered_name)
> +                          const char *preferred_name)
>   {
>       char device_path[256];
>       char device_guid[0x100];
> @@ -581,8 +581,9 @@ static int tap_win32_open(tap_win32_overlapped_t **phandle,
>       DWORD version_len;
>       DWORD idThread;
>
> -    if (prefered_name != NULL)
> -        snprintf(name_buffer, sizeof(name_buffer), "%s", prefered_name);
> +    if (preferred_name != NULL) {
> +        snprintf(name_buffer, sizeof(name_buffer), "%s", preferred_name);
> +    }
>
>       rc = get_device_guid(device_guid, sizeof(device_guid), name_buffer, sizeof(name_buffer));
>       if (rc)
>    

ping?

