Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T9CCz-0006QE-Qr
	for mharc-qemu-trivial@gnu.org; Wed, 05 Sep 2012 05:47:41 -0400
Received: from eggs.gnu.org ([208.118.235.92]:34081)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1T9CCx-0006Iq-8x
	for qemu-trivial@nongnu.org; Wed, 05 Sep 2012 05:47:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1T9CCt-0006Um-7H
	for qemu-trivial@nongnu.org; Wed, 05 Sep 2012 05:47:39 -0400
Received: from mail-wg0-f53.google.com ([74.125.82.53]:56326)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1T9CCk-0006TX-1O; Wed, 05 Sep 2012 05:47:26 -0400
Received: by wgbfm10 with SMTP id fm10so320324wgb.10
	for <multiple recipients>; Wed, 05 Sep 2012 02:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=dl9FLkwvE9Jc6BYWb+f8I+eI8KS0vzUyc83L8MOjgO0=;
	b=vtfggL6qZVoFeImaB45XSByX/gfQGwoByv60394zJPd1izvFM+Y2n78Fo+usp4mVjw
	fa4MzB/OIq3FhLTkqA+okEnynGOtkusxvo0zv17F1FUh8ZoMvrfc1mK7M79bzYsGQL6K
	1beSl9qLFzHn/IqPJ4yNdIEwuXsGlwPfxAniwQsMJemaDEu5wTfEnSIGA0ILJ9rr3f+1
	NDus0RLumExKUWvGwOM4E28MfVISW2zyIobPeBkPA9XJ0eOXpXEMKJJTV+XRXoXMndFU
	ZhjoHQciLc4Q4D/XBxVP32H3jk2JQj5wCwoV86WjV2nImVmMVUwHxL3YRU7u11UZxfdl
	7g8A==
Received: by 10.180.74.133 with SMTP id t5mr36951269wiv.2.1346838005570;
	Wed, 05 Sep 2012 02:40:05 -0700 (PDT)
Received: from localhost ([109.224.133.37])
	by mx.google.com with ESMTPS id el6sm28171884wib.8.2012.09.05.02.40.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 05 Sep 2012 02:40:04 -0700 (PDT)
Date: Wed, 5 Sep 2012 10:40:03 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: riegamaths@gmail.com
Message-ID: <20120905094003.GD4786@stefanha-thinkpad.localdomain>
References: <1346833574-26193-1-git-send-email-riegamaths@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1346833574-26193-1-git-send-email-riegamaths@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 74.125.82.53
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] block: output more error messages if
 failed to create temporary snapshot
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
X-List-Received-Date: Wed, 05 Sep 2012 09:47:40 -0000

On Wed, Sep 05, 2012 at 04:26:14PM +0800, riegamaths@gmail.com wrote:
> From: Dunrong Huang <riegamaths@gmail.com>
> 
> If we failed to create temporary snapshot, the error message did not match
> with the error, for example:
> 
> $ TMPDIR=/tmp/bad_path qemu-system-x86_64 -enable-kvm debian.qcow2 -snapshot
> qemu-system-x86_64: -enable-kvm: could not open disk image /home/mathslinux/Images/debian.qcow2: No such file or directory
> 
> Indeed, the file which cant be created is /tmp/bad_path/vl.xxxxxx,  not
> debian.qcow2. so the error message makes users feel confused.
> 
> Signed-off-by: Dunrong Huang <riegamaths@gmail.com>
> ---
>  block.c | 2 ++
>  1 个文件被修改，插入 2 行(+)
> 
> diff --git a/block.c b/block.c
> index 470bdcc..c9e5140 100644
> --- a/block.c
> +++ b/block.c
> @@ -434,6 +434,8 @@ int get_tmp_filename(char *filename, int size)
>      }
>      fd = mkstemp(filename);
>      if (fd < 0 || close(fd)) {
> +        fprintf(stderr, "Could not create temporary snapshot in %s directory: "
> +                "%s\n", tmpdir, strerror(errno));

The error message is fine for fd < 0 but not for close(0) != 0.  Also,
close(2) is allowed to change errno (even on success) so this is not
portable and could clobber the errno value.

Please split into:

if (fd < 0) {
    ...
}
if (close(fd) != 0) {
    ...
}

Stefan

