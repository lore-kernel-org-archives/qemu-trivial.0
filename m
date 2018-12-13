Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gXN7Q-0001fW-TH
	for mharc-qemu-trivial@gnu.org; Thu, 13 Dec 2018 04:17:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51670)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gXN7N-0001eT-Qj
	for qemu-trivial@nongnu.org; Thu, 13 Dec 2018 04:17:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gXN7J-0006wN-N8
	for qemu-trivial@nongnu.org; Thu, 13 Dec 2018 04:17:17 -0500
Received: from mail-wm1-f41.google.com ([209.85.128.41]:55152)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gXN7J-0006vC-Da
	for qemu-trivial@nongnu.org; Thu, 13 Dec 2018 04:17:13 -0500
Received: by mail-wm1-f41.google.com with SMTP id a62so1527141wmh.4
	for <qemu-trivial@nongnu.org>; Thu, 13 Dec 2018 01:17:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=cIUokZqyV+zRQVcQmDT8Rc63agmg/PuYeaO+9IUMnkU=;
	b=o+NBBoVKZqaTCzY3aqMeIwJakbdxWH/pf+r5NkTVxAtprUTDF0uxThq3gFnfVRGtAH
	WdXmLO9yBk+XskvxmpZmONzxFosrvaLE3MGMcg82Wj3IcTuIArztMzXWs0QkHVoLSaDI
	lIjjehlnZGqKARWHjWxSs9nUcKn0LCaVE2JNXoUh3QcnpK1H1OokC6IbrX8oayChBfUq
	g9IM90mbfP8KuW2MLxWnE5zshadBa7n895Gl0PxxaqcBoUMbWxbQxqNruuvPF8DtgJ7H
	I++SuB/q1hr4YAh7AvBawhFQR/vyDyCIIfHppr42Yq2n0PNfponJ9XQ+Axx1xjwVwp8H
	Mv5w==
X-Gm-Message-State: AA+aEWY/TlVKtzptZ7Eq6ivuTlL+FQoqmXwB3DWgxo8B5jP7KjyIb7/h
	P7XbBArWKPnVxsLvkErIOIwRzA==
X-Google-Smtp-Source: AFSGD/VnJG7Jk/nexYDB8SMJBX9G3MVpLJUEFV1rSn5KlUUj+jdNgA/qh9dNEGkDIzgqqeT3RK+kVw==
X-Received: by 2002:a1c:de57:: with SMTP id v84mr9147970wmg.55.1544692631801; 
	Thu, 13 Dec 2018 01:17:11 -0800 (PST)
Received: from [192.168.1.34] (172.red-88-21-202.staticip.rima-tde.net.
	[88.21.202.172]) by smtp.gmail.com with ESMTPSA id
	f66sm1292209wmd.28.2018.12.13.01.17.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 13 Dec 2018 01:17:11 -0800 (PST)
To: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
	qemu-trivial@nongnu.org, "Richard W.M. Jones" <rjones@redhat.com>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Liu Yuan <namei.unix@gmail.com>, Max Reitz <mreitz@redhat.com>
References: <20181212194009.2951-1-lvivier@redhat.com>
	<20181212194009.2951-2-lvivier@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <0437051b-f816-6afb-e0d1-8f67a84dd59c@redhat.com>
Date: Thu, 13 Dec 2018 10:17:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <20181212194009.2951-2-lvivier@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.41
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/4] block/ssh: Convert from
 DPRINTF() macro to trace events
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
X-List-Received-Date: Thu, 13 Dec 2018 09:17:19 -0000

On 12/12/18 8:40 PM, Laurent Vivier wrote:
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> ---
>  block/ssh.c        | 46 +++++++++++++++++-----------------------------
>  block/trace-events | 17 +++++++++++++++++
>  2 files changed, 34 insertions(+), 29 deletions(-)
> 
> diff --git a/block/ssh.c b/block/ssh.c
> index 7fbc27abdf..bbc513e095 100644
> --- a/block/ssh.c
> +++ b/block/ssh.c
> @@ -41,27 +41,17 @@
>  #include "qapi/qmp/qstring.h"
>  #include "qapi/qobject-input-visitor.h"
>  #include "qapi/qobject-output-visitor.h"
> +#include "trace.h"
>  
> -/* DEBUG_SSH=1 enables the DPRINTF (debugging printf) statements in
> - * this block driver code.
> - *
> +/*
>   * TRACE_LIBSSH2=<bitmask> enables tracing in libssh2 itself.  Note
>   * that this requires that libssh2 was specially compiled with the
>   * `./configure --enable-debug' option, so most likely you will have
>   * to compile it yourself.  The meaning of <bitmask> is described
>   * here: http://www.libssh2.org/libssh2_trace.html
>   */
> -#define DEBUG_SSH     0
>  #define TRACE_LIBSSH2 0 /* or try: LIBSSH2_TRACE_SFTP */
>  
> -#define DPRINTF(fmt, ...)                           \
> -    do {                                            \
> -        if (DEBUG_SSH) {                            \
> -            fprintf(stderr, "ssh: %-15s " fmt "\n", \
> -                    __func__, ##__VA_ARGS__);       \
> -        }                                           \
> -    } while (0)
> -
>  typedef struct BDRVSSHState {
>      /* Coroutine. */
>      CoMutex lock;
> @@ -336,7 +326,7 @@ static int check_host_key_knownhosts(BDRVSSHState *s,
>      switch (r) {
>      case LIBSSH2_KNOWNHOST_CHECK_MATCH:
>          /* OK */
> -        DPRINTF("host key OK: %s", found->key);
> +        trace_ssh_check_host_key_knownhosts(found->key);
>          break;
>      case LIBSSH2_KNOWNHOST_CHECK_MISMATCH:
>          ret = -EINVAL;
> @@ -721,8 +711,7 @@ static int connect_to_ssh(BDRVSSHState *s, BlockdevOptionsSsh *opts,
>      }
>  
>      /* Open the remote file. */
> -    DPRINTF("opening file %s flags=0x%x creat_mode=0%o",
> -            opts->path, ssh_flags, creat_mode);
> +    trace_ssh_connect_to_ssh(opts->path, ssh_flags, creat_mode);
>      s->sftp_handle = libssh2_sftp_open(s->sftp, opts->path, ssh_flags,
>                                         creat_mode);
>      if (!s->sftp_handle) {
> @@ -890,7 +879,7 @@ static int coroutine_fn ssh_co_create_opts(const char *filename, QemuOpts *opts,
>      /* Get desired file size. */
>      ssh_opts->size = ROUND_UP(qemu_opt_get_size_del(opts, BLOCK_OPT_SIZE, 0),
>                                BDRV_SECTOR_SIZE);
> -    DPRINTF("total_size=%" PRIi64, ssh_opts->size);
> +    trace_ssh_co_create_opts(ssh_opts->size);
>  
>      uri_options = qdict_new();
>      ret = parse_uri(filename, uri_options, errp);
> @@ -946,7 +935,7 @@ static void restart_coroutine(void *opaque)
>      BDRVSSHState *s = bs->opaque;
>      AioContext *ctx = bdrv_get_aio_context(bs);
>  
> -    DPRINTF("co=%p", restart->co);
> +    trace_ssh_restart_coroutine(restart->co);
>      aio_set_fd_handler(ctx, s->sock, false, NULL, NULL, NULL, NULL);
>  
>      aio_co_wake(restart->co);
> @@ -974,13 +963,12 @@ static coroutine_fn void co_yield(BDRVSSHState *s, BlockDriverState *bs)
>          wr_handler = restart_coroutine;
>      }
>  
> -    DPRINTF("s->sock=%d rd_handler=%p wr_handler=%p", s->sock,
> -            rd_handler, wr_handler);
> +    trace_ssh_co_yield(s->sock, rd_handler, wr_handler);
>  
>      aio_set_fd_handler(bdrv_get_aio_context(bs), s->sock,
>                         false, rd_handler, wr_handler, NULL, &restart);
>      qemu_coroutine_yield();
> -    DPRINTF("s->sock=%d - back", s->sock);
> +    trace_ssh_co_yield_back(s->sock);
>  }
>  
>  /* SFTP has a function `libssh2_sftp_seek64' which seeks to a position
> @@ -1003,7 +991,7 @@ static void ssh_seek(BDRVSSHState *s, int64_t offset, int flags)
>      bool force = (flags & SSH_SEEK_FORCE) != 0;
>  
>      if (force || op_read != s->offset_op_read || offset != s->offset) {
> -        DPRINTF("seeking to offset=%" PRIi64, offset);
> +        trace_ssh_seek(offset);
>          libssh2_sftp_seek64(s->sftp_handle, offset);
>          s->offset = offset;
>          s->offset_op_read = op_read;
> @@ -1019,7 +1007,7 @@ static coroutine_fn int ssh_read(BDRVSSHState *s, BlockDriverState *bs,
>      char *buf, *end_of_vec;
>      struct iovec *i;
>  
> -    DPRINTF("offset=%" PRIi64 " size=%zu", offset, size);
> +    trace_ssh_read(offset, size);
>  
>      ssh_seek(s, offset, SSH_SEEK_READ);
>  
> @@ -1038,9 +1026,9 @@ static coroutine_fn int ssh_read(BDRVSSHState *s, BlockDriverState *bs,
>       */
>      for (got = 0; got < size; ) {
>      again:
> -        DPRINTF("sftp_read buf=%p size=%zu", buf, end_of_vec - buf);
> +        trace_ssh_read_buf(buf, end_of_vec - buf);
>          r = libssh2_sftp_read(s->sftp_handle, buf, end_of_vec - buf);
> -        DPRINTF("sftp_read returned %zd", r);
> +        trace_ssh_read_return(r);
>  
>          if (r == LIBSSH2_ERROR_EAGAIN || r == LIBSSH2_ERROR_TIMEOUT) {
>              co_yield(s, bs);
> @@ -1094,7 +1082,7 @@ static int ssh_write(BDRVSSHState *s, BlockDriverState *bs,
>      char *buf, *end_of_vec;
>      struct iovec *i;
>  
> -    DPRINTF("offset=%" PRIi64 " size=%zu", offset, size);
> +    trace_ssh_write(offset, size);
>  
>      ssh_seek(s, offset, SSH_SEEK_WRITE);
>  
> @@ -1108,9 +1096,9 @@ static int ssh_write(BDRVSSHState *s, BlockDriverState *bs,
>  
>      for (written = 0; written < size; ) {
>      again:
> -        DPRINTF("sftp_write buf=%p size=%zu", buf, end_of_vec - buf);
> +        trace_ssh_write_buf(buf, end_of_vec - buf);
>          r = libssh2_sftp_write(s->sftp_handle, buf, end_of_vec - buf);
> -        DPRINTF("sftp_write returned %zd", r);
> +        trace_ssh_write_return(r);
>  
>          if (r == LIBSSH2_ERROR_EAGAIN || r == LIBSSH2_ERROR_TIMEOUT) {
>              co_yield(s, bs);
> @@ -1187,7 +1175,7 @@ static coroutine_fn int ssh_flush(BDRVSSHState *s, BlockDriverState *bs)
>  {
>      int r;
>  
> -    DPRINTF("fsync");
> +    trace_ssh_flush();
>   again:
>      r = libssh2_sftp_fsync(s->sftp_handle);
>      if (r == LIBSSH2_ERROR_EAGAIN || r == LIBSSH2_ERROR_TIMEOUT) {
> @@ -1238,7 +1226,7 @@ static int64_t ssh_getlength(BlockDriverState *bs)
>  
>      /* Note we cannot make a libssh2 call here. */
>      length = (int64_t) s->attrs.filesize;
> -    DPRINTF("length=%" PRIi64, length);
> +    trace_ssh_getlength(length);
>  
>      return length;
>  }
> diff --git a/block/trace-events b/block/trace-events
> index 3e8c47bb24..b13b1e9706 100644
> --- a/block/trace-events
> +++ b/block/trace-events
> @@ -156,3 +156,20 @@ nvme_cmd_map_qiov_iov(void *s, int i, void *page, int pages) "s %p iov[%d] %p pa
>  
>  # block/iscsi.c
>  iscsi_xcopy(void *src_lun, uint64_t src_off, void *dst_lun, uint64_t dst_off, uint64_t bytes, int ret) "src_lun %p offset %"PRIu64" dst_lun %p offset %"PRIu64" bytes %"PRIu64" ret %d"
> +
> +# block/ssh.c
> +ssh_restart_coroutine(void *co) "co=%p"
> +ssh_flush(void) "fsync"
> +ssh_check_host_key_knownhosts(const char *key) "host key OK: %s"
> +ssh_connect_to_ssh(char *path, int flags, int mode) "opening file %s flags=0x%x creat_mode=0%o"
> +ssh_co_yield(int sock, void *rd_handler, void *wr_handler) "s->sock=%d rd_handler=%p wr_handler=%p"
> +ssh_co_yield_back(int sock) "s->sock=%d - back"
> +ssh_getlength(int64_t length) "length=%" PRIi64
> +ssh_co_create_opts(uint64_t size) "total_size=%" PRIu64
> +ssh_read(int64_t offset, size_t size) "offset=%" PRIi64 " size=%zu"
> +ssh_read_buf(void *buf, size_t size) "sftp_read buf=%p size=%zu"
> +ssh_read_return(size_t ret) "sftp_read returned %zd"
> +ssh_write(int64_t offset, size_t size) "offset=%" PRIi64 " size=%zu"
> +ssh_write_buf(void *buf, size_t size) "sftp_write buf=%p size=%zu"
> +ssh_write_return(size_t ret) "sftp_write returned %zd"

%zu?

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> +ssh_seek(uint64_t offset) "seeking to offset=%" PRIi64
> 

