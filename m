Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1U7Tj0-00053M-9p
	for mharc-qemu-trivial@gnu.org; Mon, 18 Feb 2013 11:37:54 -0500
Received: from eggs.gnu.org ([208.118.235.92]:46565)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1U7Tiw-0004rK-Bo
	for qemu-trivial@nongnu.org; Mon, 18 Feb 2013 11:37:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1U7Tiv-0002Is-1U
	for qemu-trivial@nongnu.org; Mon, 18 Feb 2013 11:37:50 -0500
Received: from mx1.redhat.com ([209.132.183.28]:57863)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1U7Tih-0002G1-J5; Mon, 18 Feb 2013 11:37:35 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r1IGbWVo030232
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 18 Feb 2013 11:37:32 -0500
Received: from blackfin.pond.sub.org (ovpn-116-36.ams2.redhat.com
	[10.36.116.36])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r1IGbUA1030061; Mon, 18 Feb 2013 11:37:31 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id C88B5200AF; Mon, 18 Feb 2013 17:37:29 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Fabien Chouteau <chouteau@adacore.com>
References: <1360160243-31611-1-git-send-email-chouteau@adacore.com>
Date: Mon, 18 Feb 2013 17:37:29 +0100
In-Reply-To: <1360160243-31611-1-git-send-email-chouteau@adacore.com> (Fabien
	Chouteau's message of "Wed, 6 Feb 2013 15:17:23 +0100")
Message-ID: <87hal98to6.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, kwolf@redhat.com, qemu-devel@nongnu.org,
	stefanha@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH V2] get_tmp_filename: add
	explicit error message
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
X-List-Received-Date: Mon, 18 Feb 2013 16:37:52 -0000

I agree with you that the existing error reporting is too unspecific in
many cases, and I applaud your attempt to do something about it, but I'm
afraid this patch creates as many problems as it solves.  Details below.

Fabien Chouteau <chouteau@adacore.com> writes:

> Signed-off-by: Fabien Chouteau <chouteau@adacore.com>
> ---
>  block.c |   15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
>
> diff --git a/block.c b/block.c
> index ba67c0d..79fe01b 100644
> --- a/block.c
> +++ b/block.c
> @@ -428,9 +428,16 @@ int get_tmp_filename(char *filename, int size)
>      /* GetTempFileName requires that its output buffer (4th param)
>         have length MAX_PATH or greater.  */
>      assert(size >= MAX_PATH);
> -    return (GetTempPath(MAX_PATH, temp_dir)
> -            && GetTempFileName(temp_dir, "qem", 0, filename)
> -            ? 0 : -GetLastError());
> +    if (GetTempPath(MAX_PATH, temp_dir) == 0) {
> +        error_report("%s: GetTempPath() error: %d\n", __func__, GetLastError());
> +        return -GetLastError();
> +    }
> +    if (GetTempFileName(temp_dir, "qem", 0, filename) == 0) {
> +        error_report("%s: GetTempFileName(%s) error: %d\n", __func__, temp_dir,
> +                GetLastError());
> +        return -GetLastError();
> +    }
> +    return 0;
>  #else
>      int fd;
>      const char *tmpdir;
> @@ -442,9 +449,11 @@ int get_tmp_filename(char *filename, int size)
>      }
>      fd = mkstemp(filename);
>      if (fd < 0) {
> +        error_report("%s: mkstemp() error: %s\n", __func__, strerror(errno));
>          return -errno;
>      }
>      if (close(fd) != 0) {
> +        error_report("%s: close() error: %s\n", __func__, strerror(errno));
>          unlink(filename);
>          return -errno;
>      }

In my review of v1, I wrote "The function's (implied) contract is to
return an error code without printing anything.  If you want to change
the contract to include reporting the error, you [...] have to
demonstrate that all callers are happy with the change of contract."  So
let's check the two callers of get_tmp_filename():

1. bdrv_open()

   Complex function, can fail in many ways.  Returns an error code.
   Does not report errors; that's left to its callers.

   Your patch effectively changes bdrv_open() to report the error in one
   of its failure modes.

   For callers that report bdrv_open() failure to the user, we then get
   two error messages: the one you add, followed by a less specific one
   from further up the call chain.  Reporting the same error multiple
   times is not nice.

   For callers that neglect to report bdrv_open() failure to the user
   even though they should (if such buggy callers exist), you fix the
   problem for one failure mode only.

   For callers that handle bdrv_open() failure without reporting it to
   the user, you add an unwanted error message.  Not good.  You haven't
   demonstrated that no such callers exist.

2. vvfat.c's enable_write_target()

   bdrv_vvfat's bdrv_file_open() method vvfat_open() is the only caller.
   It's called by bdrv_open() (covered by 1.), and by bdrv_file_open().
   Like bdrv_open(), bdrv_file_open() returns an error code, and leaves
   error reporting to its caller.  Same issues as above.

Apart from these fundamental gaps, the new error message needs polish.
Say mkstemp() fails ENOSPC.  Gets reported roughly like this:

    qemu-system-x86_64: -drive file=f16.img: get_tmp_filename: mkstemp() error: No space left on device
    qemu-system-x86_64: -drive file=f16.img: could not open disk image f16.img: No space left on device

The second message talks to the user in user terms.  That's proper.  The
first one talks source code instead.  From a user's point of view,
"get_tmp_filename" and "mkstemp() error" are gobbledygook.  At best,
they can help him guessing what the problem might be.

