Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1d5rsT-0004He-5i
	for mharc-qemu-trivial@gnu.org; Wed, 03 May 2017 06:51:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60742)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1d5rsN-0004GN-Mv
	for qemu-trivial@nongnu.org; Wed, 03 May 2017 06:51:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1d5rsM-0005s6-SM
	for qemu-trivial@nongnu.org; Wed, 03 May 2017 06:51:19 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54324)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lvivier@redhat.com>)
	id 1d5rsH-0005ls-OF; Wed, 03 May 2017 06:51:13 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A2B07C04B328;
	Wed,  3 May 2017 10:51:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com A2B07C04B328
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=lvivier@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com A2B07C04B328
Received: from [10.36.117.10] (ovpn-117-10.ams2.redhat.com [10.36.117.10])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 94D085C3FD;
	Wed,  3 May 2017 10:51:11 +0000 (UTC)
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, leon.alrae@imgtec.com
References: <20170503104441.1349-1-pbonzini@redhat.com>
From: Laurent Vivier <lvivier@redhat.com>
Message-ID: <b1a33b8f-8a36-1481-af0a-a10c4212af1e@redhat.com>
Date: Wed, 3 May 2017 12:51:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.0
MIME-Version: 1.0
In-Reply-To: <20170503104441.1349-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Wed, 03 May 2017 10:51:12 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] jazz_led: fix bad snprintf
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
X-List-Received-Date: Wed, 03 May 2017 10:51:23 -0000

On 03/05/2017 12:44, Paolo Bonzini wrote:
> Detected by GCC 7's -Wformat-truncation.  snprintf writes at most
> 2 bytes here including the terminating NUL, so the result is
> truncated.  In addition, the newline at the end is pointless.
> Fix the buffer size and the format string.
> ---
>  hw/display/jazz_led.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/display/jazz_led.c b/hw/display/jazz_led.c
> index b72fdb1717..3c97d56434 100644
> --- a/hw/display/jazz_led.c
> +++ b/hw/display/jazz_led.c
> @@ -227,13 +227,13 @@ static void jazz_led_invalidate_display(void *opaque)
>  static void jazz_led_text_update(void *opaque, console_ch_t *chardata)
>  {
>      LedState *s = opaque;
> -    char buf[2];
> +    char buf[3];
>  
>      dpy_text_cursor(s->con, -1, -1);
>      qemu_console_resize(s->con, 2, 1);
>  
>      /* TODO: draw the segments */
> -    snprintf(buf, 2, "%02hhx\n", s->segments);
> +    snprintf(buf, 3, "%02hhx", s->segments);
>      console_write_ch(chardata++, ATTR2CHTYPE(buf[0], QEMU_COLOR_BLUE,
>                                               QEMU_COLOR_BLACK, 1));
>      console_write_ch(chardata++, ATTR2CHTYPE(buf[1], QEMU_COLOR_BLUE,

Reviewed-by: Laurent Vivier <lvivier@redhat.com>


