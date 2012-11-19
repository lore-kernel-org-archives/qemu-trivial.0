Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TaPZS-0003IU-Ki
	for mharc-qemu-trivial@gnu.org; Mon, 19 Nov 2012 06:31:22 -0500
Received: from eggs.gnu.org ([208.118.235.92]:55174)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TaPZO-0003HW-DU
	for qemu-trivial@nongnu.org; Mon, 19 Nov 2012 06:31:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TaPZL-0006gD-B2
	for qemu-trivial@nongnu.org; Mon, 19 Nov 2012 06:31:18 -0500
Received: from mail-bk0-f45.google.com ([209.85.214.45]:55075)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1TaPZL-0006g1-3i; Mon, 19 Nov 2012 06:31:15 -0500
Received: by mail-bk0-f45.google.com with SMTP id jk13so866045bkc.4
	for <multiple recipients>; Mon, 19 Nov 2012 03:31:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=mLqw3zQ+I36xYOY/hez8GMBxeF+7RC8We834kJoe+1k=;
	b=WGR0MzR7g22q4mI4srjA2OqWVGId4ooG67jMhqb+cOaquoYgx4vyijPCaeuviLgCRR
	k3q/BRLZTbhjs8Nrp84/AsIQ/1rN1YOXP5FYKGEQN2rJUYgdJUv99Ey2FbM8miTaSFFf
	54wWuCqG2+kDPL0MnRs6djHLZJssvOjbJrB0SiZrXTdcF46sD4M3fd533L7mgc9sCL3W
	Gj0S7+uSaXkXyr8jPCFBvmbvrBHD6xo/O1ZMo71Y96erKN+nHFZjbX+0kvekxg5GlBA5
	SpzTBugrvt/KqtSYEKdTnrrHQEDAy2Xtyr2XMweUiKX7OLaMMaK+pIiS5Hz0lfJoAEx9
	fA3Q==
Received: by 10.204.157.144 with SMTP id b16mr4570934bkx.19.1353324673579;
	Mon, 19 Nov 2012 03:31:13 -0800 (PST)
Received: from localhost (178-26-141-215-dynip.superkabel.de. [178.26.141.215])
	by mx.google.com with ESMTPS id a5sm2062009bkw.8.2012.11.19.03.31.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 19 Nov 2012 03:31:12 -0800 (PST)
Date: Mon, 19 Nov 2012 12:31:11 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20121119113111.GA21658@stefanha-thinkpad.redhat.com>
References: <1353227175-24596-1-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1353227175-24596-1-git-send-email-sw@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.214.45
Cc: qemu-trivial@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	Jim Meyering <meyering@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] block: Fix regression for MinGW
 (assertion caused by short string)
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
X-List-Received-Date: Mon, 19 Nov 2012 11:31:21 -0000

On Sun, Nov 18, 2012 at 09:26:15AM +0100, Stefan Weil wrote:
> The local string tmp_filename is passed to function get_tmp_filename
> which expects a string with minimum size MAX_PATH for w32 hosts.
> 
> MAX_PATH is 260 and PATH_MAX is 259, so tmp_filename was too short.
> 
> Commit eba25057b9a5e19d10ace2bc7716667a31297169 introduced this
> regression.
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  block.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/block.c b/block.c
> index 49dd6bb..8739635 100644
> --- a/block.c
> +++ b/block.c
> @@ -787,7 +787,7 @@ int bdrv_open(BlockDriverState *bs, const char *filename, int flags,
>                BlockDriver *drv)
>  {
>      int ret;
> -    char tmp_filename[PATH_MAX];
> +    char tmp_filename[PATH_MAX + 1];

This is not maintainable - the patch is making an assumption about the relative
values of MAX_PATH and PATH_MAX.  There is no comment explaining this so it's
likely to be changed and break in the future again.

A clean solution is to change get_tmp_filename() so the caller doesn't need to
pass in a fixed size:

/*
 * Create a uniquely-named empty temporary file.
 * Return 0 upon success, otherwise a negative errno value.
 *
 * The filename must be freed with g_free() when it is no longer needed.
 */
int get_tmp_filename(char **filename)

The existing get_tmp_filename() code has another problem.  Here is the Windows
get_tmp_filename() code:

    char temp_dir[MAX_PATH];
    /* GetTempFileName requires that its output buffer (4th param)
       have length MAX_PATH or greater.  */
    assert(size >= MAX_PATH);
    return (GetTempPath(MAX_PATH, temp_dir)
            && GetTempFileName(temp_dir, "qem", 0, filename)
            ? 0 : -GetLastError());

The assert has an off-by-one error because the documentation says:

  "This buffer should be MAX_PATH characters to accommodate the path plus the
   terminating null character."
  http://msdn.microsoft.com/en-us/library/windows/desktop/aa364991(v=vs.85).aspx

Since the function returns -errno the assert could be turned into:

  /* GetTempFileName requires that its output buffer (4th param)
     have length MAX_PATH + 1 or greater.  */
  if (size < MAX_PATH + 1) {
      return -ENOSPC;
  }

Stefan

