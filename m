Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1S5GBk-0001cc-DS
	for mharc-qemu-trivial@gnu.org; Wed, 07 Mar 2012 07:41:52 -0500
Received: from eggs.gnu.org ([208.118.235.92]:59344)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1S5GBY-0001UY-VE
	for qemu-trivial@nongnu.org; Wed, 07 Mar 2012 07:41:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1S5GBK-0001d7-97
	for qemu-trivial@nongnu.org; Wed, 07 Mar 2012 07:41:40 -0500
Received: from mail-lpp01m010-f45.google.com ([209.85.215.45]:42601)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1S5GAI-0001Kt-HV; Wed, 07 Mar 2012 07:40:22 -0500
Received: by lahe6 with SMTP id e6so8000159lah.4
	for <multiple recipients>; Wed, 07 Mar 2012 04:40:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=AtyL9FusJuqsl6oNA+N3tgJNteFHrT8opmhz7tO+jIs=;
	b=PNe3Lq/pExblAVpnK4jJSXzHMuQVFheNsvkMRfkOt3gwffNtdv5Qct1mPXYy+ZqREp
	nhwOkOyD1rdmZRx7bU9qv4HY1uOlCcQwdTWq1yRaliO05L7XUg9V9jk6hvmSr1TRe6UR
	tpnwfmD9WnRGQyR+qPwyi8/p5OBBCKLKU0qus8sWr3gIohgHxbwe0sSYpMUOQpG/thc4
	/zIncu83u0+NsO/kGSpA11HpAMCFRjm2v5nuywArg2ITq4ViMMTtibUMkN+WjbDnu7+X
	VZQuTPumYWc3K+pBgjzgwlfN1q9XhHVSgDvYkymyV7A4IVkUsb009IxFsBISEIk60NOs
	5tDA==
MIME-Version: 1.0
Received: by 10.112.25.40 with SMTP id z8mr658424lbf.11.1331124019414; Wed, 07
	Mar 2012 04:40:19 -0800 (PST)
Received: by 10.112.63.132 with HTTP; Wed, 7 Mar 2012 04:40:19 -0800 (PST)
In-Reply-To: <1331122589-15717-1-git-send-email-peter.maydell@linaro.org>
References: <1331122589-15717-1-git-send-email-peter.maydell@linaro.org>
Date: Wed, 7 Mar 2012 12:40:19 +0000
Message-ID: <CAJSP0QVjZ_YqRNrf5dVPHTQmkLwPJeo_M1G2z7gfVHBY_-Z33w@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.215.45
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] configure: Quote the
 configure args printed in config.log
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
X-List-Received-Date: Wed, 07 Mar 2012 12:41:51 -0000

On Wed, Mar 7, 2012 at 12:16 PM, Peter Maydell <peter.maydell@linaro.org> w=
rote:
> Use the same mechanism we use for printing the configure command
> line to config-host.mak to print it to config.log. This fixes a
> bug where the config.log version didn't quote arguments with spaces.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> If I'd noticed when I was adding the banner to config.log that we already
> printed this in config-host.mak I'd have done it this way to start with..=
.
>
> =A0configure | =A0 =A04 +++-
> =A01 files changed, 3 insertions(+), 1 deletions(-)
>
> diff --git a/configure b/configure
> index a5eb832..1b63436 100755
> --- a/configure
> +++ b/configure
> @@ -22,7 +22,9 @@ rm -f config.log
>
> =A0# Print a helpful header at the top of config.log
> =A0echo "# QEMU configure log $(date)" >> config.log
> -echo "# produced by $0 $*" >> config.log
> +printf "# Configured with:" >> config.log
> +printf " '%s'" "$0" "$@" >> config.log

You use an interesting feature of printf(1)- it applies the (short)
format string as long as there are arguments.  I checked that this is
in the specification:
http://pubs.opengroup.org/onlinepubs/9699919799/utilities/printf.html

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

