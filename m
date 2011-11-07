Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RNLOW-000723-B4
	for mharc-qemu-trivial@gnu.org; Mon, 07 Nov 2011 04:21:32 -0500
Received: from eggs.gnu.org ([140.186.70.92]:34664)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RNLOT-0006rp-2K
	for qemu-trivial@nongnu.org; Mon, 07 Nov 2011 04:21:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RNLOR-0001Mg-RA
	for qemu-trivial@nongnu.org; Mon, 07 Nov 2011 04:21:29 -0500
Received: from mail-fx0-f45.google.com ([209.85.161.45]:56270)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RNLOR-0001L3-Gs
	for qemu-trivial@nongnu.org; Mon, 07 Nov 2011 04:21:27 -0500
Received: by mail-fx0-f45.google.com with SMTP id p15so5986632faa.4
	for <qemu-trivial@nongnu.org>; Mon, 07 Nov 2011 01:21:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=Bppd8Fot1GtN/luRO0BTQVKJQfa0CLEeraFIN1vOnyo=;
	b=eWF/4NxEx+h6glm7XHsjiWAv/KUrjbUooCI11ckyhrYgm4XGUqHHlEFeiDAagC3j2k
	hxBgsJZtWEN/qQS4Tu+4jfL5dzWbfiEv/4VEQO9y73DtsywrEG/kjoINaFoNXBCHs6Wn
	ub8i7VmNlT7NfRNp75nAlWiXimX+Mjy9S+AjE=
Received: by 10.223.14.197 with SMTP id h5mr7426625faa.2.1320657687170;
	Mon, 07 Nov 2011 01:21:27 -0800 (PST)
Received: from localhost (gbibp9ph1--blueice3n2.emea.ibm.com. [195.212.29.84])
	by mx.google.com with ESMTPS id
	g25sm30506623fae.16.2011.11.07.01.21.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 07 Nov 2011 01:21:26 -0800 (PST)
Date: Mon, 7 Nov 2011 08:15:17 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: =?utf-8?B?6Zmz6Z+L5Lu7?= <chenwj@iis.sinica.edu.tw>
Message-ID: <20111107081517.GD9450@stefanha-thinkpad.localdomain>
References: <20111104193331.GA37125@cs.nctu.edu.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20111104193331.GA37125@cs.nctu.edu.tw>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.161.45
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] configure: Show --cpu option on the help
 list
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
X-List-Received-Date: Mon, 07 Nov 2011 09:21:30 -0000

On Sat, Nov 05, 2011 at 03:33:31AM +0800, 陳韋任 wrote:
>   Although there is a "--cpu" option, it doesn't show up on the --help
> list. Add "--cpu=CPU" option and its default value on the help list.
> 
> Signed-off-by: chenwj <chenwj@cs.nctu.edu.tw>
> ---
>  configure |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/configure b/configure
> index 9e5da44..aa44f09 100755
> --- a/configure
> +++ b/configure
> @@ -1036,6 +1036,7 @@ echo "  --fmod-lib               path to FMOD library"
>  echo "  --fmod-inc               path to FMOD includes"
>  echo "  --oss-lib                path to OSS library"
>  echo "  --enable-uname-release=R Return R for uname -r in usermode emulation"
> +echo "  --cpu=CPU                Build qemu for CPU [$cpu]"

Please say "Build for host CPU [$cpu]" so that it's 100% clear that this
is the host architecture and not the target.

Thanks,
Stefan

