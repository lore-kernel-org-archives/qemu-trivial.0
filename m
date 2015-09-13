Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZbDiS-00048j-TP
	for mharc-qemu-trivial@gnu.org; Sun, 13 Sep 2015 16:17:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35307)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1ZbDiQ-00045B-DA
	for qemu-trivial@nongnu.org; Sun, 13 Sep 2015 16:17:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1ZbDiP-0005Kx-E4
	for qemu-trivial@nongnu.org; Sun, 13 Sep 2015 16:17:34 -0400
Received: from mail-wi0-x230.google.com ([2a00:1450:400c:c05::230]:35037)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1ZbDiN-0005Kd-2u; Sun, 13 Sep 2015 16:17:31 -0400
Received: by wicge5 with SMTP id ge5so118179140wic.0;
	Sun, 13 Sep 2015 13:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=Le8WYqkHaEK6pM9g90WQgS4t0gybJNutlatBYd1oo/4=;
	b=SI6igOh7nh+hXhSlEspWUovQtjmFqQwN0lvTfZxy/QAubnLJxhf4aoRL6U4lIMo+pH
	ba1lQAgigwdWI/DNpE+gqR7RCkCpZIDP2ABhgPmFRoh6B4hm+tu+DbT9oLghrpHQESQq
	eDxHOWYictEqq7J0YjF497bUuPPgOPkHxSVtfgfs1j1KM/MDNHMV2WSfgaKhyEKHrhSl
	X4oYchay8UidVqL7CZnblVIKHR9TCysoCoL0ZNHytASTg/NKhF8vxnoJbbkGLDts8tGG
	s5whSzgTfwgs7RDExlZxakZPDm0Df9PKT+Lqr4dxeRcTXfnNaPyie7lOB5MWFZ+uTvLJ
	d+ow==
MIME-Version: 1.0
X-Received: by 10.180.216.108 with SMTP id op12mr19156397wic.43.1442175450314; 
	Sun, 13 Sep 2015 13:17:30 -0700 (PDT)
Received: by 10.28.134.18 with HTTP; Sun, 13 Sep 2015 13:17:30 -0700 (PDT)
In-Reply-To: <55F284A8.8060404@msgid.tls.msk.ru>
References: <1440085955-27951-1-git-send-email-linux@roeck-us.net>
	<55F284A8.8060404@msgid.tls.msk.ru>
Date: Sun, 13 Sep 2015 13:17:30 -0700
Message-ID: <CAPokK=oHBqhrwXgx5VM3xHFqu2KTtBfOikhQbSUy5azRTO2LsA@mail.gmail.com>
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>,
	Jean-Christophe Dubois <jcd@tribudubois.net>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c05::230
Cc: qemu-trivial@nongnu.org, Peter Chubb <peter.chubb@nicta.com.au>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Guenter Roeck <linux@roeck-us.net>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] imx_serial: Generate
 interrupt on tx empty if enabled
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
X-List-Received-Date: Sun, 13 Sep 2015 20:17:35 -0000

On Fri, Sep 11, 2015 at 12:37 AM, Michael Tokarev <mjt@tls.msk.ru> wrote:
>
> Can we please have some r-b or ACK for this? :)
>
> 20.08.2015 18:52, Guenter Roeck wrote:
>> Generate an interrupt if the tx buffer is empty and the tx empty interrupt
>> is enabled. This fixes a problem seen when running a Linux image since
>> Linux commit 55c3cb1358e ("serial: imx: remove unneeded imx_transmit_buffer()
>> from imx_start_tx()"). Linux now waits for the tx empty interrupt before
>> starting to send data, causing transmit stalls until there is an interrupt
>> for another reason.
>>
>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>


Looks right, Jean-Christophe may know more though.

Reviewed-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>

>> ---
>>  hw/char/imx_serial.c | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/char/imx_serial.c b/hw/char/imx_serial.c
>> index f3fbc77..8dc791d 100644
>> --- a/hw/char/imx_serial.c
>> +++ b/hw/char/imx_serial.c
>> @@ -145,7 +145,9 @@ static void imx_update(IMXSerialState *s)
>>      uint32_t flags;
>>
>>      flags = (s->usr1 & s->ucr1) & (USR1_TRDY|USR1_RRDY);
>> -    if (!(s->ucr1 & UCR1_TXMPTYEN)) {
>> +    if (s->ucr1 & UCR1_TXMPTYEN) {
>> +        flags |= (s->uts1 & UTS1_TXEMPTY);
>> +    } else {
>>          flags &= ~USR1_TRDY;

Out of scope, but this conditional looks wrong (in original code too).
Why does TXMPTYEN gate TRDY?

Regards,
Peter

>>      }
>>
>>
>
>

