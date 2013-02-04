Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1U2Ha5-0002uV-8a
	for mharc-qemu-trivial@gnu.org; Mon, 04 Feb 2013 03:39:13 -0500
Received: from eggs.gnu.org ([208.118.235.92]:59071)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1U2Ha0-0002uJ-Aa
	for qemu-trivial@nongnu.org; Mon, 04 Feb 2013 03:39:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1U2HZx-0001hA-S5
	for qemu-trivial@nongnu.org; Mon, 04 Feb 2013 03:39:08 -0500
Received: from mx1.redhat.com ([209.132.183.28]:8378)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>)
	id 1U2HZx-0001h4-Kg; Mon, 04 Feb 2013 03:39:05 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r148d2GT007629
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 4 Feb 2013 03:39:02 -0500
Received: from localhost (ovpn-112-30.ams2.redhat.com [10.36.112.30])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r148d00n029906; Mon, 4 Feb 2013 03:39:01 -0500
Date: Mon, 4 Feb 2013 09:39:00 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Fabien Chouteau <chouteau@adacore.com>
Message-ID: <20130204083900.GB5216@stefanha-thinkpad.redhat.com>
References: <1359738831-7232-1-git-send-email-chouteau@adacore.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1359738831-7232-1-git-send-email-chouteau@adacore.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, kwolf@redhat.com, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] get_tmp_filename: add explicit error
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
X-List-Received-Date: Mon, 04 Feb 2013 08:39:12 -0000

On Fri, Feb 01, 2013 at 06:13:51PM +0100, Fabien Chouteau wrote:
> 
> Signed-off-by: Fabien Chouteau <chouteau@adacore.com>
> ---
>  block.c |   13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)

Hi Fabien,
Please always CC qemu-devel@nongnu.org.  All patches must be on
qemu-devel so that the community can review them - not everyone
subscribes to qemu-trivial.

Thanks,
Stefan

> diff --git a/block.c b/block.c
> index ba67c0d..3bf8eda 100644
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
> +        fprintf(stderr, "GetTempPath() error: %d\n", GetLastError());
> +        return -GetLastError();
> +    }
> +    if (GetTempFileName(temp_dir, "qem", 0, filename) == 0) {
> +        fprintf(stderr, "GetTempFileName(%s) error: %d\n", temp_dir,
> +                GetLastError());
> +        return -GetLastError();
> +    }
> +    return 0;
>  #else
>      int fd;
>      const char *tmpdir;
> -- 
> 1.7.9.5
> 

