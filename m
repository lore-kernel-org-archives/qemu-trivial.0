Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZoBQt-0000w6-9W
	for mharc-qemu-trivial@gnu.org; Mon, 19 Oct 2015 10:29:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55590)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1ZoBQn-0000q1-HV
	for qemu-trivial@nongnu.org; Mon, 19 Oct 2015 10:29:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1ZoBQj-0007Ar-HI
	for qemu-trivial@nongnu.org; Mon, 19 Oct 2015 10:28:57 -0400
Received: from mail-wi0-x22d.google.com ([2a00:1450:400c:c05::22d]:38331)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1ZoBQc-00079E-Or; Mon, 19 Oct 2015 10:28:46 -0400
Received: by wicll6 with SMTP id ll6so8602956wic.1;
	Mon, 19 Oct 2015 07:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=gho1a/7NTskuguxdMpLkLdSb+X752WgsxVx+FEenIfs=;
	b=cBaZXmZtH68sn6fPsVwSVP5OZIVN53MgWg05H8kD+5ehdQ6IgeSX5zqdpUibqLJXWc
	Iwn3MpIPjOQ6FFEzK6QwTPOkvxsuKJS+7dy7esjY88ZZOgfalslPa2wY9waNybGpdExw
	iz1mYiTzS8u2FQ3Wpv8ar9K0k6xf5KhZEeHDa9PYlLoYfquOtw67jPJN8388EkDJXv1Q
	dp92Vv5m1JBopXVz4djzbHGkO0EtrlRpToOXAhi+LWdDGBRozclEQ7jPrrtRban3yGS/
	/Sv7hWnIGSG7z7ukKdN3RuXxlL9s3vvIZuDVa81TnFXnlPInm7D95SLgEfokys4+8g22
	epRQ==
X-Received: by 10.194.216.228 with SMTP id ot4mr33544099wjc.156.1445264926255; 
	Mon, 19 Oct 2015 07:28:46 -0700 (PDT)
Received: from [192.168.10.165] (94-39-171-91.adsl-ull.clienti.tiscali.it.
	[94.39.171.91]) by smtp.googlemail.com with ESMTPSA id
	uj4sm40552082wjc.34.2015.10.19.07.28.44
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 19 Oct 2015 07:28:44 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
To: Stefan Weil <sw@weilnetz.de>, QEMU Trivial <qemu-trivial@nongnu.org>
References: <1426345935-7721-1-git-send-email-sw@weilnetz.de>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <5624FE1B.7010202@redhat.com>
Date: Mon, 19 Oct 2015 16:28:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1426345935-7721-1-git-send-email-sw@weilnetz.de>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c05::22d
Cc: Riku Voipio <riku.voipio@iki.fi>, QEMU Developer <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] linux-user: Add missing check for return
 value of lock_user
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
X-List-Received-Date: Mon, 19 Oct 2015 14:29:00 -0000



On 14/03/2015 16:12, Stefan Weil wrote:
> This fixes a warning from Coverity:
> "Dereference null return value (NULL_RETURNS)"
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  linux-user/flatload.c |    8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/linux-user/flatload.c b/linux-user/flatload.c
> index 566a7a8..56ac790 100644
> --- a/linux-user/flatload.c
> +++ b/linux-user/flatload.c
> @@ -97,11 +97,13 @@ static int target_pread(int fd, abi_ulong ptr, abi_ulong len,
>                          abi_ulong offset)
>  {
>      void *buf;
> -    int ret;
> +    int ret = -TARGET_EFAULT;
>  
>      buf = lock_user(VERIFY_WRITE, ptr, len, 0);
> -    ret = pread(fd, buf, len, offset);
> -    unlock_user(buf, ptr, len);
> +    if (buf) {
> +        ret = pread(fd, buf, len, offset);
> +        unlock_user(buf, ptr, len);
> +    }
>      return ret;
>  }
>  /****************************************************************************/
> 

Hi Stefan,

are you going to update and resend this patch?

Thanks,

Paolo

