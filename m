Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fG4d3-0006uP-OO
	for mharc-qemu-trivial@gnu.org; Tue, 08 May 2018 11:34:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37404)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jcody@redhat.com>) id 1fG4cz-0006rP-43
	for qemu-trivial@nongnu.org; Tue, 08 May 2018 11:34:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jcody@redhat.com>) id 1fG4cx-0004I1-LI
	for qemu-trivial@nongnu.org; Tue, 08 May 2018 11:34:09 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39430)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <jcody@redhat.com>)
	id 1fG4ck-0004EI-1F; Tue, 08 May 2018 11:33:54 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 30682300238D;
	Tue,  8 May 2018 15:33:53 +0000 (UTC)
Received: from localhost (ovpn-117-144.phx2.redhat.com [10.3.117.144])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BCDB35D70C;
	Tue,  8 May 2018 15:33:46 +0000 (UTC)
Date: Tue, 8 May 2018 11:33:45 -0400
From: Jeff Cody <jcody@redhat.com>
To: John Snow <jsnow@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, qemu-trivial@nongnu.org
Message-ID: <20180508153345.GB6722@localhost.localdomain>
References: <20180503225648.13153-1-jsnow@redhat.com>
	<20180503225648.13153-3-jsnow@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180503225648.13153-3-jsnow@redhat.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.47]);
	Tue, 08 May 2018 15:33:53 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-block] [PATCH 2/5] qemu-img.texi: fix
 command ordering
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
X-List-Received-Date: Tue, 08 May 2018 15:34:11 -0000

On Thu, May 03, 2018 at 06:56:45PM -0400, John Snow wrote:
> This should match the summary ordering, which is alphabetical.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---

Reviewed-by: Jeff Cody <jcody@redhat.com>

>  qemu-img.texi | 58 ++++++++++++++++++++++++++++++----------------------------
>  1 file changed, 30 insertions(+), 28 deletions(-)
> 
> diff --git a/qemu-img.texi b/qemu-img.texi
> index 8a26400adb..adf5176902 100644
> --- a/qemu-img.texi
> +++ b/qemu-img.texi
> @@ -193,6 +193,12 @@ sets the number of input blocks to skip
>  Command description:
>  
>  @table @option
> +
> +@item amend [-p] [-f @var{fmt}] [-t @var{cache}] -o @var{options} @var{filename}
> +
> +Amends the image format specific @var{options} for the image file
> +@var{filename}. Not all file formats support this operation.
> +
>  @item bench [-c @var{count}] [-d @var{depth}] [-f @var{fmt}] [--flush-interval=@var{flush_interval}] [-n] [--no-drain] [-o @var{offset}] [--pattern=@var{pattern}] [-q] [-s @var{buffer_size}] [-S @var{step_size}] [-t @var{cache}] [-w] @var{filename}
>  
>  Run a simple sequential I/O benchmark on the specified image. If @code{-w} is
> @@ -253,30 +259,6 @@ If @code{-r} is specified, exit codes representing the image state refer to the
>  state after (the attempt at) repairing it. That is, a successful @code{-r all}
>  will yield the exit code 0, independently of the image state before.
>  
> -@item create [-f @var{fmt}] [-b @var{backing_file}] [-F @var{backing_fmt}] [-u] [-o @var{options}] @var{filename} [@var{size}]
> -
> -Create the new disk image @var{filename} of size @var{size} and format
> -@var{fmt}. Depending on the file format, you can add one or more @var{options}
> -that enable additional features of this format.
> -
> -If the option @var{backing_file} is specified, then the image will record
> -only the differences from @var{backing_file}. No size needs to be specified in
> -this case. @var{backing_file} will never be modified unless you use the
> -@code{commit} monitor command (or qemu-img commit).
> -
> -If a relative path name is given, the backing file is looked up relative to
> -the directory containing @var{filename}.
> -
> -Note that a given backing file will be opened to check that it is valid. Use
> -the @code{-u} option to enable unsafe backing file mode, which means that the
> -image will be created even if the associated backing file cannot be opened. A
> -matching backing file must be created or additional options be used to make the
> -backing file specification valid when you want to use an image created this
> -way.
> -
> -The size can also be specified using the @var{size} option with @code{-o},
> -it doesn't need to be specified separately in this case.
> -
>  @item commit [-q] [-f @var{fmt}] [-t @var{cache}] [-b @var{base}] [-d] [-p] @var{filename}
>  
>  Commit the changes recorded in @var{filename} in its base image or backing file.
> @@ -381,6 +363,30 @@ creating compressed images.
>  @var{num_coroutines} specifies how many coroutines work in parallel during
>  the convert process (defaults to 8).
>  
> +@item create [-f @var{fmt}] [-b @var{backing_file}] [-F @var{backing_fmt}] [-u] [-o @var{options}] @var{filename} [@var{size}]
> +
> +Create the new disk image @var{filename} of size @var{size} and format
> +@var{fmt}. Depending on the file format, you can add one or more @var{options}
> +that enable additional features of this format.
> +
> +If the option @var{backing_file} is specified, then the image will record
> +only the differences from @var{backing_file}. No size needs to be specified in
> +this case. @var{backing_file} will never be modified unless you use the
> +@code{commit} monitor command (or qemu-img commit).
> +
> +If a relative path name is given, the backing file is looked up relative to
> +the directory containing @var{filename}.
> +
> +Note that a given backing file will be opened to check that it is valid. Use
> +the @code{-u} option to enable unsafe backing file mode, which means that the
> +image will be created even if the associated backing file cannot be opened. A
> +matching backing file must be created or additional options be used to make the
> +backing file specification valid when you want to use an image created this
> +way.
> +
> +The size can also be specified using the @var{size} option with @code{-o},
> +it doesn't need to be specified separately in this case.
> +
>  @item dd [-f @var{fmt}] [-O @var{output_fmt}] [bs=@var{block_size}] [count=@var{blocks}] [skip=@var{blocks}] if=@var{input} of=@var{output}
>  
>  Dd copies from @var{input} file to @var{output} file converting it from
> @@ -585,10 +591,6 @@ how the additional image area should be allocated on the host.  See the format
>  description in the @code{NOTES} section which values are allowed.  Using this
>  option may result in slightly more data being allocated than necessary.
>  
> -@item amend [-p] [-f @var{fmt}] [-t @var{cache}] -o @var{options} @var{filename}
> -
> -Amends the image format specific @var{options} for the image file
> -@var{filename}. Not all file formats support this operation.
>  @end table
>  @c man end
>  
> -- 
> 2.14.3
> 
> 

