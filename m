Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1d5sbt-0003W0-1v
	for mharc-qemu-trivial@gnu.org; Wed, 03 May 2017 07:38:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44571)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1d5sbq-0003U1-8R
	for qemu-trivial@nongnu.org; Wed, 03 May 2017 07:38:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1d5sbp-0003va-Fn
	for qemu-trivial@nongnu.org; Wed, 03 May 2017 07:38:18 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39392)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1d5sbj-0003t1-CC; Wed, 03 May 2017 07:38:11 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7D0B83B714;
	Wed,  3 May 2017 11:38:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 7D0B83B714
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=armbru@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 7D0B83B714
Received: from blackfin.pond.sub.org (ovpn-116-149.ams2.redhat.com
	[10.36.116.149])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4757717107;
	Wed,  3 May 2017 11:38:09 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id A1D5E1138646; Wed,  3 May 2017 13:38:07 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org,  qemu-trivial@nongnu.org,  leon.alrae@imgtec.com
References: <20170503104441.1349-1-pbonzini@redhat.com>
Date: Wed, 03 May 2017 13:38:07 +0200
In-Reply-To: <20170503104441.1349-1-pbonzini@redhat.com> (Paolo Bonzini's
	message of "Wed, 3 May 2017 12:44:41 +0200")
Message-ID: <874lx21880.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Wed, 03 May 2017 11:38:09 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] jazz_led: fix bad snprintf
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
X-List-Received-Date: Wed, 03 May 2017 11:38:19 -0000

Paolo Bonzini <pbonzini@redhat.com> writes:

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

Since we're only every interested in the first two characters, the
truncation is totally harmless.  Thus, your patch cleans doesn't really
"fix bad snprintf", it cleans up an unclean one.  Consider rewording the
commit message accordingly.

Regardless,
Reviewed-by: Markus Armbruster <armbru@redhat.com>

