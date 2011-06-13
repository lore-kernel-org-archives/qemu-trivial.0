Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QWCkH-0006ym-48
	for mharc-qemu-trivial@gnu.org; Mon, 13 Jun 2011 15:24:21 -0400
Received: from eggs.gnu.org ([140.186.70.92]:49890)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1QWCkD-0006xD-Fl
	for qemu-trivial@nongnu.org; Mon, 13 Jun 2011 15:24:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1QWCkC-0004sM-BA
	for qemu-trivial@nongnu.org; Mon, 13 Jun 2011 15:24:17 -0400
Received: from mail-fx0-f46.google.com ([209.85.161.46]:41348)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>)
	id 1QWCk9-0004nL-1C; Mon, 13 Jun 2011 15:24:13 -0400
Received: by mail-fx0-f46.google.com with SMTP id 17so4865284fxm.33
	for <multiple recipients>; Mon, 13 Jun 2011 12:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=afsNeUNDGKALJpH3Ip36vvUBFMGrqAI49OH8YHHcxfk=;
	b=riObeWSu8y50D2tSHVXt4Qt/kcnoGbnKYv3CPWZbBvn/kUYSwRNU9gJzIAyIUV3J8T
	M/23FuENyQQOG52nwWGafoHXzI9yy4/Mc6VxMQrM4BJsQuS14JQiD/k5LrqTGkY3muIr
	eQsQvHfeL4RCCuQ/6DII5Yd5kJsO3v9KqGZSc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=blQkESLICtfdRWIwXygi3KSm2nmlyqzdGKwG5jgcI7PqIDchZPDkTAeiCsB5qiL+SO
	khtqB4QlKFtm24rYVnk3UjNEluk4PAdY4MSwloHmeQx2xMEs+xdLf0847QlLXOKw9SEq
	belOmhma+9eXtMGVuHDlh9WR/Cn9Lxk6NkkHY=
Received: by 10.223.78.140 with SMTP id l12mr2005439fak.147.1307993052316;
	Mon, 13 Jun 2011 12:24:12 -0700 (PDT)
Received: from localhost (h59ec3266.selukar.dyn.perspektivbredband.net
	[89.236.50.102])
	by mx.google.com with ESMTPS id 11sm2191435fax.36.2011.06.13.12.24.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 13 Jun 2011 12:24:10 -0700 (PDT)
Date: Mon, 13 Jun 2011 21:24:08 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20110613192408.GG29885@laped.lan>
References: <1307656469-29424-1-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1307656469-29424-1-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.161.46
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] configure: Detect and don't
 try to use older libcurl
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
X-List-Received-Date: Mon, 13 Jun 2011 19:24:19 -0000

On Thu, Jun 09, 2011 at 10:54:29PM +0100, Peter Maydell wrote:
> Older versions of libcurl don't have some of the features we try to
> use, in particular curl_multi_setopt(). Check for this in the 'is
> libcurl available?' configure test so we disable curl support if the
> library is too old.

Applied, thanks.


> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  configure |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/configure b/configure
> index d38b952..03d693a 100755
> --- a/configure
> +++ b/configure
> @@ -1709,7 +1709,7 @@ fi
>  if test "$curl" != "no" ; then
>    cat > $TMPC << EOF
>  #include <curl/curl.h>
> -int main(void) { return curl_easy_init(); }
> +int main(void) { curl_easy_init(); curl_multi_setopt(0, 0, 0); return 0; }
>  EOF
>    curl_cflags=`$curlconfig --cflags 2>/dev/null`
>    curl_libs=`$curlconfig --libs 2>/dev/null`
> -- 
> 1.7.1
> 
> 

