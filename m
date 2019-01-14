Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gj0Db-0006nd-Kh
	for mharc-qemu-trivial@gnu.org; Mon, 14 Jan 2019 06:15:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36194)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mreitz@redhat.com>) id 1gj0DZ-0006lO-MY
	for qemu-trivial@nongnu.org; Mon, 14 Jan 2019 06:15:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mreitz@redhat.com>) id 1gj0DY-0004yy-KS
	for qemu-trivial@nongnu.org; Mon, 14 Jan 2019 06:15:45 -0500
Received: from mx1.redhat.com ([209.132.183.28]:36262)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mreitz@redhat.com>)
	id 1gj0DS-0004iu-2b; Mon, 14 Jan 2019 06:15:38 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 823AC86677;
	Mon, 14 Jan 2019 11:15:35 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-116-27.ams2.redhat.com
	[10.36.116.27])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8BED35D759;
	Mon, 14 Jan 2019 11:15:32 +0000 (UTC)
To: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, qemu-block@nongnu.org,
	Liu Yuan <namei.unix@gmail.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
	<f4bug@amsat.org>, Kevin Wolf <kwolf@redhat.com>,
	"Richard W.M. Jones" <rjones@redhat.com>
References: <20181213162727.17438-1-lvivier@redhat.com>
	<20181213162727.17438-2-lvivier@redhat.com>
From: Max Reitz <mreitz@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=mreitz@redhat.com; prefer-encrypt=mutual; keydata=
	mQENBFXOJlcBCADEyyhOTsoa/2ujoTRAJj4MKA21dkxxELVj3cuILpLTmtachWj7QW+TVG8U
	/PsMCFbpwsQR7oEy8eHHZwuGQsNpEtNC2G/L8Yka0BIBzv7dEgrPzIu+W3anZXQW4702+uES
	U29G8TP/NGfXRRHGlbBIH9KNUnOSUD2vRtpOLXkWsV5CN6vQFYgQfFvmp5ZpPeUe6xNplu8V
	mcTw8OSEDW/ZnxJc8TekCKZSpdzYoxfzjm7xGmZqB18VFwgJZlIibt1HE0EB4w5GsD7x5ekh
	awIe3RwoZgZDLQMdOitJ1tUc8aqaxvgA4tz6J6st8D8pS//m1gAoYJWGwwIVj1DjTYLtABEB
	AAG0HU1heCBSZWl0eiA8bXJlaXR6QHJlZGhhdC5jb20+iQFTBBMBCAA9AhsDBQkSzAMABQsJ
	CAcCBhUICQoLAgQWAgMBAh4BAheABQJVzie5FRhoa3A6Ly9rZXlzLmdudXBnLm5ldAAKCRD0
	B9sAYdXPQDcIB/9uNkbYEex1rHKz3mr12uxYMwLOOFY9fstP5aoVJQ1nWQVB6m2cfKGdcRe1
	2/nFaHSNAzT0NnKz2MjhZVmcrpyd2Gp2QyISCfb1FbT82GMtXFj1wiHmPb3CixYmWGQUUh+I
	AvUqsevLA+WihgBUyaJq/vuDVM1/K9Un+w+Tz5vpeMidlIsTYhcsMhn0L9wlCjoucljvbDy/
	8C9L2DUdgi3XTa0ORKeflUhdL4gucWoAMrKX2nmPjBMKLgU7WLBc8AtV+84b9OWFML6NEyo4
	4cP7cM/07VlJK53pqNg5cHtnWwjHcbpGkQvx6RUx6F1My3y52vM24rNUA3+ligVEgPYBuQEN
	BFXOJlcBCADAmcVUNTWT6yLWQHvxZ0o47KCP8OcLqD+67T0RCe6d0LP8GsWtrJdeDIQk+T+F
	xO7DolQPS6iQ6Ak2/lJaPX8L0BkEAiMuLCKFU6Bn3lFOkrQeKp3u05wCSV1iKnhg0UPji9V2
	W5eNfy8F4ZQHpeGUGy+liGXlxqkeRVhLyevUqfU0WgNqAJpfhHSGpBgihUupmyUg7lfUPeRM
	DzAN1pIqoFuxnN+BRHdAecpsLcbR8sQddXmDg9BpSKozO/JyBmaS1RlquI8HERQoe6EynJhd
	64aICHDfj61rp+/0jTIcevxIIAzW70IadoS/y3DVIkuhncgDBvGbF3aBtjrJVP+5ABEBAAGJ
	ASUEGAEIAA8FAlXOJlcCGwwFCRLMAwAACgkQ9AfbAGHVz0CbFwf9F/PXxQR9i4N0iipISYjU
	sxVdjJOM2TMut+ZZcQ6NSMvhZ0ogQxJ+iEQ5OjnIputKvPVd5U7WRh+4lF1lB/NQGrGZQ1ic
	alkj6ocscQyFwfib+xIe9w8TG1CVGkII7+TbS5pXHRxZH1niaRpoi/hYtgzkuOPp35jJyqT/
	/ELbqQTDAWcqtJhzxKLE/ugcOMK520dJDeb6x2xVES+S5LXby0D4juZlvUj+1fwZu+7Io5+B
	bkhSVPb/QdOVTpnz7zWNyNw+OONo1aBUKkhq2UIByYXgORPFnbfMY7QWHcjpBVw9MgC4tGeF
	R4bv+1nAMMxKmb5VvQCExr0eFhJUAHAhVg==
Message-ID: <7aef3078-085d-b020-e89d-ae30082381b4@redhat.com>
Date: Mon, 14 Jan 2019 12:15:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20181213162727.17438-2-lvivier@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Mon, 14 Jan 2019 11:15:35 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH v2 1/4] block/ssh: Convert from DPRINTF()
 macro to trace events
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
X-List-Received-Date: Mon, 14 Jan 2019 11:15:46 -0000

On 13.12.18 17:27, Laurent Vivier wrote:
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> Reviewed-by: Richard W.M. Jones <rjones@redhat.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>=20
> Notes:
>     v2: use %zu with size_t
>         change an uint64_t to int64_t to match % PRIi64
>=20
>  block/ssh.c        | 46 +++++++++++++++++-----------------------------
>  block/trace-events | 17 +++++++++++++++++
>  2 files changed, 34 insertions(+), 29 deletions(-)
>=20
> diff --git a/block/ssh.c b/block/ssh.c
> index 7fbc27abdf..bbc513e095 100644
> --- a/block/ssh.c
> +++ b/block/ssh.c

[...]

> @@ -1038,9 +1026,9 @@ static coroutine_fn int ssh_read(BDRVSSHState *s,=
 BlockDriverState *bs,
>       */
>      for (got =3D 0; got < size; ) {
>      again:
> -        DPRINTF("sftp_read buf=3D%p size=3D%zu", buf, end_of_vec - buf=
);
> +        trace_ssh_read_buf(buf, end_of_vec - buf);
>          r =3D libssh2_sftp_read(s->sftp_handle, buf, end_of_vec - buf)=
;
> -        DPRINTF("sftp_read returned %zd", r);
> +        trace_ssh_read_return(r);

(Here...

> =20
>          if (r =3D=3D LIBSSH2_ERROR_EAGAIN || r =3D=3D LIBSSH2_ERROR_TI=
MEOUT) {
>              co_yield(s, bs);

[...]

> @@ -1108,9 +1096,9 @@ static int ssh_write(BDRVSSHState *s, BlockDriver=
State *bs,
> =20
>      for (written =3D 0; written < size; ) {
>      again:
> -        DPRINTF("sftp_write buf=3D%p size=3D%zu", buf, end_of_vec - bu=
f);
> +        trace_ssh_write_buf(buf, end_of_vec - buf);
>          r =3D libssh2_sftp_write(s->sftp_handle, buf, end_of_vec - buf=
);
> -        DPRINTF("sftp_write returned %zd", r);
> +        trace_ssh_write_return(r);

...and here r is of type ssize_t)

> =20
>          if (r =3D=3D LIBSSH2_ERROR_EAGAIN || r =3D=3D LIBSSH2_ERROR_TI=
MEOUT) {
>              co_yield(s, bs);

[...]

> diff --git a/block/trace-events b/block/trace-events
> index 3e8c47bb24..e1dfd9713a 100644
> --- a/block/trace-events
> +++ b/block/trace-events
> @@ -156,3 +156,20 @@ nvme_cmd_map_qiov_iov(void *s, int i, void *page, =
int pages) "s %p iov[%d] %p pa
> =20
>  # block/iscsi.c
>  iscsi_xcopy(void *src_lun, uint64_t src_off, void *dst_lun, uint64_t d=
st_off, uint64_t bytes, int ret) "src_lun %p offset %"PRIu64" dst_lun %p =
offset %"PRIu64" bytes %"PRIu64" ret %d"
> +
> +# block/ssh.c
> +ssh_restart_coroutine(void *co) "co=3D%p"
> +ssh_flush(void) "fsync"
> +ssh_check_host_key_knownhosts(const char *key) "host key OK: %s"
> +ssh_connect_to_ssh(char *path, int flags, int mode) "opening file %s f=
lags=3D0x%x creat_mode=3D0%o"
> +ssh_co_yield(int sock, void *rd_handler, void *wr_handler) "s->sock=3D=
%d rd_handler=3D%p wr_handler=3D%p"
> +ssh_co_yield_back(int sock) "s->sock=3D%d - back"
> +ssh_getlength(int64_t length) "length=3D%" PRIi64
> +ssh_co_create_opts(uint64_t size) "total_size=3D%" PRIu64
> +ssh_read(int64_t offset, size_t size) "offset=3D%" PRIi64 " size=3D%zu=
"
> +ssh_read_buf(void *buf, size_t size) "sftp_read buf=3D%p size=3D%zu"
> +ssh_read_return(size_t ret) "sftp_read returned %zu"

Shouldn't this be ssize_t and %zi/%zd?

> +ssh_write(int64_t offset, size_t size) "offset=3D%" PRIi64 " size=3D%z=
u"
> +ssh_write_buf(void *buf, size_t size) "sftp_write buf=3D%p size=3D%zu"
> +ssh_write_return(size_t ret) "sftp_write returned %zu"

Same here.

Max

> +ssh_seek(int64_t offset) "seeking to offset=3D%" PRIi6

