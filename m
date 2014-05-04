Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Wh3zn-0004xj-NU
	for mharc-qemu-trivial@gnu.org; Sun, 04 May 2014 17:30:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44181)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aurelien@aurel32.net>) id 1Wh3zl-0004x2-Ok
	for qemu-trivial@nongnu.org; Sun, 04 May 2014 17:30:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aurelien@aurel32.net>) id 1Wh3zl-0002of-0F
	for qemu-trivial@nongnu.org; Sun, 04 May 2014 17:30:49 -0400
Received: from hall.aurel32.net ([2001:bc8:30d7:101::1]:37497)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aurelien@aurel32.net>)
	id 1Wh3zk-0002ZJ-Ga; Sun, 04 May 2014 17:30:48 -0400
Received: from aurel32 by hall.aurel32.net with local (Exim 4.80)
	(envelope-from <aurelien@aurel32.net>)
	id 1Wh3zZ-00040Y-VB; Sun, 04 May 2014 23:30:38 +0200
Date: Sun, 4 May 2014 23:30:37 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20140504213037.GA25769@hall.aurel32.net>
References: <1399062573-2769-1-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
In-Reply-To: <1399062573-2769-1-git-send-email-sw@weilnetz.de>
X-Mailer: Mutt 1.5.21 (2010-09-15)
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: Aurelien Jarno <aurelien@aurel32.net>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2001:bc8:30d7:101::1
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] hw/mips: Add missing 'static' and
	'const' attributes
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
X-List-Received-Date: Sun, 04 May 2014 21:30:50 -0000

On Fri, May 02, 2014 at 10:29:33PM +0200, Stefan Weil wrote:
> This fixes a warning from the static code analysis (smatch).
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  hw/mips/mips_fulong2e.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/mips/mips_fulong2e.c b/hw/mips/mips_fulong2e.c
> index e1551aa..30d9f19 100644
> --- a/hw/mips/mips_fulong2e.c
> +++ b/hw/mips/mips_fulong2e.c
> @@ -211,7 +211,7 @@ static void main_cpu_reset(void *opaque)
>      }
>  }
>  
> -uint8_t eeprom_spd[0x80] = {
> +static const uint8_t eeprom_spd[0x80] = {
>      0x80,0x08,0x07,0x0d,0x09,0x02,0x40,0x00,0x04,0x70,
>      0x70,0x00,0x82,0x10,0x00,0x01,0x0e,0x04,0x0c,0x01,
>      0x02,0x20,0x80,0x75,0x70,0x00,0x00,0x50,0x3c,0x50,

Acked-by: Aurelien Jarno <aurelien@aurel32.net>

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                 http://www.aurel32.net

