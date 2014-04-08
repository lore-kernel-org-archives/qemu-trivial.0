Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WXOkr-00071v-Up
	for mharc-qemu-trivial@gnu.org; Tue, 08 Apr 2014 01:39:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58109)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1WXOkl-00070g-Dk
	for qemu-trivial@nongnu.org; Tue, 08 Apr 2014 01:39:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1WXOkg-0003zB-Tj
	for qemu-trivial@nongnu.org; Tue, 08 Apr 2014 01:39:23 -0400
Received: from mail-we0-f173.google.com ([74.125.82.173]:44715)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1WXOkg-0003yz-NN
	for qemu-trivial@nongnu.org; Tue, 08 Apr 2014 01:39:18 -0400
Received: by mail-we0-f173.google.com with SMTP id w61so410284wes.4
	for <qemu-trivial@nongnu.org>; Mon, 07 Apr 2014 22:39:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=CnNwRVkUbTsqndT6O9Y3OzYC5sYmzpkljH9OFuqkVkM=;
	b=OZz7lmeUploiy3lzu/Ceb1pHiKy//IfJeaSUrgzRwymrtMJ0duQqCcpaXkG4N+1N/N
	U187AHnIKsDWvenB1Sb4PSZS901NjVnxO1uczsJyo9yx2/OPYPh3aJpsAHgTk1ajr9rw
	NzfjWk/sUGN4+sa21yHi7fZ1KOuP+P5Kr6oxVJDpGghyjtDGceJFO/tVNoundoBDs5yG
	nogAOYq32Qi21bOocSwpP/om6Z20FJDerTIqy9AmyqMGpYrzXivecCWqd1j6m7wLzmsG
	KBEI/ksUE86CJ3QeaCLG1ZZpxcS6GRKCM7aweLgnnE7WX2hcYh4nPs/i84x4Iy0zm6Xk
	5qWA==
X-Gm-Message-State: ALoCoQk3oWbygMYtqqgWLH7oZ6XAF6IVSFPC6cimBBeQDpLxyqA3Ul3zJ7yLvPfSkooEcuc8/ML1
MIME-Version: 1.0
X-Received: by 10.180.75.45 with SMTP id z13mr2487732wiv.41.1396935557688;
	Mon, 07 Apr 2014 22:39:17 -0700 (PDT)
Sender: peter.crosthwaite@petalogix.com
Received: by 10.227.128.131 with HTTP; Mon, 7 Apr 2014 22:39:17 -0700 (PDT)
In-Reply-To: <1396892580-3216-1-git-send-email-sw@weilnetz.de>
References: <1396892580-3216-1-git-send-email-sw@weilnetz.de>
Date: Tue, 8 Apr 2014 15:39:17 +1000
X-Google-Sender-Auth: _cBWrhmYDs32xrFYvJMjYOGzNt0
Message-ID: <CAEgOgz60XK=y1GP0peBVwxyZsQ4w2H_HGeAbCnNuXKMaLRbLAw@mail.gmail.com>
From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
To: Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset=ISO-8859-1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 74.125.82.173
Cc: qemu-trivial <qemu-trivial@nongnu.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Fix grammar in comment
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
X-List-Received-Date: Tue, 08 Apr 2014 05:39:28 -0000

On Tue, Apr 8, 2014 at 3:42 AM, Stefan Weil <sw@weilnetz.de> wrote:
> Signed-off-by: Stefan Weil <sw@weilnetz.de>

Reviewed-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>

> ---
>  hw/i2c/smbus_eeprom.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/i2c/smbus_eeprom.c b/hw/i2c/smbus_eeprom.c
> index 86f35c1..72c09cb 100644
> --- a/hw/i2c/smbus_eeprom.c
> +++ b/hw/i2c/smbus_eeprom.c
> @@ -71,7 +71,7 @@ static void eeprom_write_data(SMBusDevice *dev, uint8_t cmd, uint8_t *buf, int l
>      printf("eeprom_write_byte: addr=0x%02x cmd=0x%02x val=0x%02x\n",
>             dev->i2c.address, cmd, buf[0]);
>  #endif
> -    /* An page write operation is not a valid SMBus command.
> +    /* A page write operation is not a valid SMBus command.
>         It is a block write without a length byte.  Fortunately we
>         get the full block anyway.  */
>      /* TODO: Should this set the current location?  */
> --
> 1.7.10.4
>
>

