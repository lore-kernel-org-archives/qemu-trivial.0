Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iopIw-0001pq-Ng
	for mharc-qemu-trivial@gnu.org; Tue, 07 Jan 2020 08:53:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55624)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groug@kaod.org>) id 1iopIs-0001Ym-2k
 for qemu-trivial@nongnu.org; Tue, 07 Jan 2020 08:53:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groug@kaod.org>) id 1iopIq-0002Yw-Mr
 for qemu-trivial@nongnu.org; Tue, 07 Jan 2020 08:53:49 -0500
Received: from 8.mo4.mail-out.ovh.net ([188.165.33.112]:56302)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <groug@kaod.org>) id 1iopIq-0002Wh-H2
 for qemu-trivial@nongnu.org; Tue, 07 Jan 2020 08:53:48 -0500
Received: from player789.ha.ovh.net (unknown [10.109.146.132])
 by mo4.mail-out.ovh.net (Postfix) with ESMTP id 04F8321E10C
 for <qemu-trivial@nongnu.org>; Tue,  7 Jan 2020 14:53:45 +0100 (CET)
Received: from kaod.org (deibp9eh1--blueice1n4.emea.ibm.com [195.212.29.166])
 (Authenticated sender: groug@kaod.org)
 by player789.ha.ovh.net (Postfix) with ESMTPSA id 2CF13DF96870;
 Tue,  7 Jan 2020 13:53:43 +0000 (UTC)
Date: Tue, 7 Jan 2020 14:53:40 +0100
From: Greg Kurz <groug@kaod.org>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Subject: Re: [PATCH v1 44/59] 9p-local.c: remove unneeded label in
 local_unlinkat_common()
Message-ID: <20200107145340.60698c46@bahia.lan>
In-Reply-To: <20200106182425.20312-45-danielhb413@gmail.com>
References: <20200106182425.20312-1-danielhb413@gmail.com>
 <20200106182425.20312-45-danielhb413@gmail.com>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 10189675636031199494
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrvdehgedguddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtgfesthejredtredtvdenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecukfhppedtrddtrddtrddtpdduleehrddvuddvrddvledrudeiieenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeekledrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdqthhrihhvihgrlhesnhhonhhgnhhurdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 188.165.33.112
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 07 Jan 2020 13:53:53 -0000

On Mon,  6 Jan 2020 15:24:10 -0300
Daniel Henrique Barboza <danielhb413@gmail.com> wrote:

> 'err_out' can be replaced by 'return ret' in the error conditions
> the jump was being made.
> 
> CC: Greg Kurz <groug@kaod.org>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>  hw/9pfs/9p-local.c | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)
> 
> diff --git a/hw/9pfs/9p-local.c b/hw/9pfs/9p-local.c
> index ca641390fb..f9bdd2ad7c 100644
> --- a/hw/9pfs/9p-local.c
> +++ b/hw/9pfs/9p-local.c
> @@ -1094,12 +1094,12 @@ static int local_unlinkat_common(FsContext *ctx, int dirfd, const char *name,
>  
>              fd = openat_dir(dirfd, name);
>              if (fd == -1) {
> -                goto err_out;
> +                return ret;
>              }
>              ret = unlinkat(fd, VIRTFS_META_DIR, AT_REMOVEDIR);
>              close_preserve_errno(fd);
>              if (ret < 0 && errno != ENOENT) {
> -                goto err_out;
> +                return ret;
>              }
>          }
>          map_dirfd = openat_dir(dirfd, VIRTFS_META_DIR);
> @@ -1107,16 +1107,14 @@ static int local_unlinkat_common(FsContext *ctx, int dirfd, const char *name,
>              ret = unlinkat(map_dirfd, name, 0);
>              close_preserve_errno(map_dirfd);
>              if (ret < 0 && errno != ENOENT) {
> -                goto err_out;
> +                return ret;
>              }
>          } else if (errno != ENOENT) {
> -            goto err_out;
> +            return ret;

Ouch... I now realize we can get there with ret == 0 when unlinking a
directory in mapped-file mode. The function will wrongly return success
despite the failure.... Since this function is supposed to return -1
on error, I suggest to do that instead of return ret, and to drop the
initialization of ret to -1, which wouldn't be needed anymore.

Since this would fix a bug it makes sense to post it separately from
this series. Rewrite the title/changelog accordingly and I'll merge
it via the 9p tree.

>          }
>      }
>  
> -    ret = unlinkat(dirfd, name, flags);
> -err_out:
> -    return ret;
> +    return unlinkat(dirfd, name, flags);
>  }
>  
>  static int local_remove(FsContext *ctx, const char *path)


