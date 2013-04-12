Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UQbxW-0007xA-7E
	for mharc-qemu-trivial@gnu.org; Fri, 12 Apr 2013 07:15:58 -0400
Received: from eggs.gnu.org ([208.118.235.92]:40243)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1UQbxT-0007wH-Ik
	for qemu-trivial@nongnu.org; Fri, 12 Apr 2013 07:15:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1UQbxS-0002l4-9L
	for qemu-trivial@nongnu.org; Fri, 12 Apr 2013 07:15:55 -0400
Received: from mail-wi0-x230.google.com ([2a00:1450:400c:c05::230]:40969)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1UQbxS-0002kW-23
	for qemu-trivial@nongnu.org; Fri, 12 Apr 2013 07:15:54 -0400
Received: by mail-wi0-f176.google.com with SMTP id hm14so1461721wib.15
	for <qemu-trivial@nongnu.org>; Fri, 12 Apr 2013 04:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=7QqRZudPH+h++twCD4LOl1YuTzLugGVgD9BjdHSqOXY=;
	b=QcGbW3wxqJjz8IWckO2whyS/lMAL6K/K9+XztK1ztQwSBbdPUY3quTzHoT3Wv1SwD5
	q/309G2QtLBmPPfqJ4+vdJnLW+MN1V0ovtChZfAuh9gP9AMKurR0KXc83kd4bohgmF5y
	7/i4TmZEO2yTr71ADZ5mPTYmBL6k8NcvHnZKwDG2Csgff24C7rgyZpSQsaQyqFN+0DvL
	0f/yHWad01LRHqRVTFKPLL1FC+NR6y/DNGHqrqG4jjtWZwq/PH08QNXCrKej4Rt5l8mf
	YIo8ynlHB33STq2wbUe8vI0dQIepiWGmgf+/b+yt04GpHrrGDnPmVKmWMvuIbvPoU/tc
	IQKA==
X-Received: by 10.180.92.97 with SMTP id cl1mr3295407wib.19.1365765353266;
	Fri, 12 Apr 2013 04:15:53 -0700 (PDT)
Received: from localhost ([2a02:810d:ec0:195:495e:8c2d:3047:9ee5])
	by mx.google.com with ESMTPS id j4sm2639311wiz.10.2013.04.12.04.15.51
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 12 Apr 2013 04:15:52 -0700 (PDT)
Date: Fri, 12 Apr 2013 13:15:50 +0200
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Ben Leslie <benno@benno.id.au>
Message-ID: <20130412111550.GA9747@stefanha-thinkpad.redhat.com>
References: <CABZ0LtBxD4CvG4wFAE_S+Zr8OeWuq1PGGt+d7MZJ61DNKYTNdg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABZ0LtBxD4CvG4wFAE_S+Zr8OeWuq1PGGt+d7MZJ61DNKYTNdg@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c05::230
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] configure: Detect --disable-system and
 --target-list conflicts.
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
X-List-Received-Date: Fri, 12 Apr 2013 11:15:57 -0000

On Sun, Apr 07, 2013 at 03:20:44PM +1000, Ben Leslie wrote:
> The user should not be allowed to configure a softmmu target
> when --disable-system is selected.
> 
> Signed-off-by: Ben Leslie <benno@benno.id.au>
> ---
>  configure | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/configure b/configure
> index d685275..e4288ed 100755
> --- a/configure
> +++ b/configure
> @@ -1353,7 +1353,13 @@ else
>  fi
>  # see if system emulation was really requested
>  case " $target_list " in
> -  *"-softmmu "*) softmmu=yes
> +  *"-softmmu "*)
> +    if test "$softmmu" = "no"; then
> +      echo "ERROR: System emulation disabled (via --disable-system),
> however a "
> +      echo "       system emulation target specified in --target-list."
> +      exit 1
> +    fi
> +    softmmu=yes

Please use the new error_exit function.  Fine otherwise.

Stefan

