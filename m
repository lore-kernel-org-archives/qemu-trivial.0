Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1U7R41-0005ZN-Kq
	for mharc-qemu-trivial@gnu.org; Mon, 18 Feb 2013 08:47:25 -0500
Received: from eggs.gnu.org ([208.118.235.92]:53834)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1U7R3s-0005YZ-GC
	for qemu-trivial@nongnu.org; Mon, 18 Feb 2013 08:47:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1U7R3o-0003pu-KV
	for qemu-trivial@nongnu.org; Mon, 18 Feb 2013 08:47:16 -0500
Received: from mx1.redhat.com ([209.132.183.28]:50993)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>)
	id 1U7R3o-0003pc-Cf; Mon, 18 Feb 2013 08:47:12 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r1IDl9JD023544
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 18 Feb 2013 08:47:09 -0500
Received: from localhost (ovpn-112-30.ams2.redhat.com [10.36.112.30])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r1IDl7Zw008003; Mon, 18 Feb 2013 08:47:09 -0500
Date: Mon, 18 Feb 2013 14:47:07 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Fabien Chouteau <chouteau@adacore.com>
Message-ID: <20130218134707.GC10700@stefanha-thinkpad.redhat.com>
References: <1360160243-31611-1-git-send-email-chouteau@adacore.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1360160243-31611-1-git-send-email-chouteau@adacore.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, kwolf@redhat.com, qemu-devel@nongnu.org,
	armbru@redhat.com
Subject: Re: [Qemu-trivial] [PATCH V2] get_tmp_filename: add explicit error
	message
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
X-List-Received-Date: Mon, 18 Feb 2013 13:47:24 -0000

On Wed, Feb 06, 2013 at 03:17:23PM +0100, Fabien Chouteau wrote:
> Signed-off-by: Fabien Chouteau <chouteau@adacore.com>
> ---
>  block.c |   15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)

Markus: Any more feedback on this patch?

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
> -- 
> 1.7.9.5
> 

