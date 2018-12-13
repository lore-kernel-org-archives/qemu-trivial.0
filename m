Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gXNDX-0005Fe-G8
	for mharc-qemu-trivial@gnu.org; Thu, 13 Dec 2018 04:23:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55460)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gXNDU-0005F5-6X
	for qemu-trivial@nongnu.org; Thu, 13 Dec 2018 04:23:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gXNDN-0004Lm-Pq
	for qemu-trivial@nongnu.org; Thu, 13 Dec 2018 04:23:35 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:38992)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gXNDN-0004EL-CA
	for qemu-trivial@nongnu.org; Thu, 13 Dec 2018 04:23:29 -0500
Received: by mail-wr1-f68.google.com with SMTP id t27so1201235wra.6
	for <qemu-trivial@nongnu.org>; Thu, 13 Dec 2018 01:23:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=JORHoMB8RKWDlTkrHb2mau+01no+Fd1KcFevqlSx6Ok=;
	b=S6JT3IuWcBtgBOa78Ek4eeYNCed0/8Oc5Dj8ibh7wrfmOFJXn4L6OOAeGBAHxJefrl
	MNPVg6iBiK2Kxoc/0FC2LAlBo+HGhgdfGnXVvdoiGn4cV/1CvJvXPMdH96opF/vbI7o0
	zoXBRWErBBRJMQ+K3VpgQ/GQ1Mup7ZeS27dt+t1YtIFzMaXkm5H2KiJy/Ef0+5RYpckY
	w5kJLURRfFLrwsEv5E/SC32aUnqkv9PclmaUILM/lY5ORE3dNHxWVyn0GbbD+x62I+5X
	lqNDqfrabx9UCCOMV/jBPxOKDNYVFTQ6LzSceQVYtqDzuAoQNJg+/yjAJuT9NhBHF9qR
	C+9w==
X-Gm-Message-State: AA+aEWbdJDEnW33kxmtmt1fSJYNkUnOZTMK9ABlbyminJQotJjma/oaW
	k6wIMy6b96UDDOdjQLPavnKtnA==
X-Google-Smtp-Source: AFSGD/W+Mbf//pjJPcVm5WJahwEOqANxvZof6P2FWthQU2HrgS8MaOTAtQIATJfj49X8GUn8U1E3IQ==
X-Received: by 2002:a5d:4b01:: with SMTP id v1mr19459625wrq.5.1544693000550;
	Thu, 13 Dec 2018 01:23:20 -0800 (PST)
Received: from [192.168.1.34] (172.red-88-21-202.staticip.rima-tde.net.
	[88.21.202.172]) by smtp.gmail.com with ESMTPSA id
	y13sm1599550wrn.73.2018.12.13.01.23.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 13 Dec 2018 01:23:19 -0800 (PST)
To: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
	qemu-trivial@nongnu.org, "Richard W.M. Jones" <rjones@redhat.com>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Liu Yuan <namei.unix@gmail.com>, Max Reitz <mreitz@redhat.com>
References: <20181212194009.2951-1-lvivier@redhat.com>
	<20181212194009.2951-3-lvivier@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <958ac1e5-f3ee-3d91-98b5-d253f9b27c6d@redhat.com>
Date: Thu, 13 Dec 2018 10:23:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <20181212194009.2951-3-lvivier@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.68
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 2/4] block/curl: Convert
 from DPRINTF() macro to trace events
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
X-List-Received-Date: Thu, 13 Dec 2018 09:23:38 -0000

On 12/12/18 8:40 PM, Laurent Vivier wrote:
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> ---
>  block/curl.c       | 29 ++++++++---------------------
>  block/trace-events |  9 +++++++++
>  2 files changed, 17 insertions(+), 21 deletions(-)
> 
> diff --git a/block/curl.c b/block/curl.c
> index db5d2bd8ef..b7ac265d3a 100644
> --- a/block/curl.c
> +++ b/block/curl.c
> @@ -32,22 +32,10 @@
>  #include "crypto/secret.h"
>  #include <curl/curl.h>
>  #include "qemu/cutils.h"
> +#include "trace.h"
>  
> -// #define DEBUG_CURL
>  // #define DEBUG_VERBOSE
>  
> -#ifdef DEBUG_CURL
> -#define DEBUG_CURL_PRINT 1
> -#else
> -#define DEBUG_CURL_PRINT 0
> -#endif
> -#define DPRINTF(fmt, ...)                                            \
> -    do {                                                             \
> -        if (DEBUG_CURL_PRINT) {                                      \
> -            fprintf(stderr, fmt, ## __VA_ARGS__);                    \
> -        }                                                            \
> -    } while (0)
> -
>  #if LIBCURL_VERSION_NUM >= 0x071000
>  /* The multi interface timer callback was introduced in 7.16.0 */
>  #define NEED_CURL_TIMER_CALLBACK
> @@ -154,7 +142,7 @@ static int curl_timer_cb(CURLM *multi, long timeout_ms, void *opaque)
>  {
>      BDRVCURLState *s = opaque;
>  
> -    DPRINTF("CURL: timer callback timeout_ms %ld\n", timeout_ms);
> +    trace_curl_timer_cb(timeout_ms);
>      if (timeout_ms == -1) {
>          timer_del(&s->timer);
>      } else {
> @@ -193,7 +181,7 @@ static int curl_sock_cb(CURL *curl, curl_socket_t fd, int action,
>      }
>      socket = NULL;
>  
> -    DPRINTF("CURL (AIO): Sock action %d on fd %d\n", action, (int)fd);
> +    trace_curl_sock_cb(action, (int)fd);
>      switch (action) {
>          case CURL_POLL_IN:
>              aio_set_fd_handler(s->aio_context, fd, false,
> @@ -238,7 +226,7 @@ static size_t curl_read_cb(void *ptr, size_t size, size_t nmemb, void *opaque)
>      size_t realsize = size * nmemb;
>      int i;
>  
> -    DPRINTF("CURL: Just reading %zd bytes\n", realsize);
> +    trace_curl_read_cb(realsize);
>  
>      if (!s || !s->orig_buf) {
>          goto read_end;
> @@ -777,7 +765,7 @@ static int curl_open(BlockDriverState *bs, QDict *options, int flags,
>          }
>      }
>  
> -    DPRINTF("CURL: Opening %s\n", file);
> +    trace_curl_open(file);
>      qemu_co_queue_init(&s->free_state_waitq);
>      s->aio_context = bdrv_get_aio_context(bs);
>      s->url = g_strdup(file);
> @@ -830,7 +818,7 @@ static int curl_open(BlockDriverState *bs, QDict *options, int flags,
>                  "Server does not support 'range' (byte ranges).");
>          goto out;
>      }
> -    DPRINTF("CURL: Size = %" PRIu64 "\n", s->len);
> +    trace_curl_open_size(s->len);
>  
>      qemu_mutex_lock(&s->mutex);
>      curl_clean_state(state);
> @@ -908,8 +896,7 @@ static void curl_setup_preadv(BlockDriverState *bs, CURLAIOCB *acb)
>      state->acb[0] = acb;
>  
>      snprintf(state->range, 127, "%" PRIu64 "-%" PRIu64, start, end);
> -    DPRINTF("CURL (AIO): Reading %" PRIu64 " at %" PRIu64 " (%s)\n",
> -            acb->bytes, start, state->range);
> +    trace_curl_setup_preadv(acb->bytes, start, state->range);
>      curl_easy_setopt(state->curl, CURLOPT_RANGE, state->range);
>  
>      curl_multi_add_handle(s->multi, state->curl);
> @@ -943,7 +930,7 @@ static void curl_close(BlockDriverState *bs)
>  {
>      BDRVCURLState *s = bs->opaque;
>  
> -    DPRINTF("CURL: Close\n");
> +    trace_curl_close();
>      curl_detach_aio_context(bs);
>      qemu_mutex_destroy(&s->mutex);
>  
> diff --git a/block/trace-events b/block/trace-events
> index b13b1e9706..5b83280b02 100644
> --- a/block/trace-events
> +++ b/block/trace-events
> @@ -173,3 +173,12 @@ ssh_write(int64_t offset, size_t size) "offset=%" PRIi64 " size=%zu"
>  ssh_write_buf(void *buf, size_t size) "sftp_write buf=%p size=%zu"
>  ssh_write_return(size_t ret) "sftp_write returned %zd"
>  ssh_seek(uint64_t offset) "seeking to offset=%" PRIi64
> +
> +# block/curl.c
> +curl_timer_cb(long timeout_ms) "timer callback timeout_ms %ld"
> +curl_sock_cb(int action, int fd) "sock action %d on fd %d"
> +curl_read_cb(size_t realsize) "just reading %zd bytes"

%zu

> +curl_open(const char *file) "opening %s"
> +curl_open_size(uint64_t size) "size = %" PRIu64
> +curl_setup_preadv(uint64_t bytes, uint64_t start, const char *range) "reading %" PRIu64 " at %" PRIu64 " (%s)"
> +curl_close(void) "close"
> 

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

