Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TUBUK-0004Bf-52
	for mharc-qemu-trivial@gnu.org; Fri, 02 Nov 2012 03:16:20 -0400
Received: from eggs.gnu.org ([208.118.235.92]:36556)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TUBUI-00046u-E0
	for qemu-trivial@nongnu.org; Fri, 02 Nov 2012 03:16:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TUBUH-0006V7-EH
	for qemu-trivial@nongnu.org; Fri, 02 Nov 2012 03:16:18 -0400
Received: from mail-lb0-f173.google.com ([209.85.217.173]:45653)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1TUBUF-0006UQ-Ba; Fri, 02 Nov 2012 03:16:15 -0400
Received: by mail-lb0-f173.google.com with SMTP id gj3so2310359lbb.4
	for <multiple recipients>; Fri, 02 Nov 2012 00:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=2YK+HqAXrJSa8dMnhQsaO0XkkhOwNcO7UoaCcG6mCwk=;
	b=XZrvdpT+u6/SgXcbAF+WLo0OHc0ikA7UB5Db+rPNPOJcwVKSQOjG0iOQhIUhi/QkU5
	YMglnKOxgiO485y/gB+rNm260/GVLNg8nQRSXgrEJ/XEA2nLVpW4ebKAlmi+xl+91CVQ
	joHXZ7MQQfyhmMol1GQkFBnf2KX8osxNLFnLhmRU9pfJm8crlN43fbvM5s2laAVNzTqv
	O2WghbPRM5kyq/oaglgzIRqLbA3omor+wtwR34P8ayTKVkHxEnsWW4GHJQAWqpK89yBE
	mewO7r+KEzm0trGLoTUwk94JeFvr91y13tGVdtfcP1aV20TpBImaboPJhpU+3dNNQdrg
	SLCQ==
MIME-Version: 1.0
Received: by 10.112.48.74 with SMTP id j10mr390060lbn.94.1351840574168; Fri,
	02 Nov 2012 00:16:14 -0700 (PDT)
Received: by 10.112.23.37 with HTTP; Fri, 2 Nov 2012 00:16:14 -0700 (PDT)
In-Reply-To: <1351833082-26633-1-git-send-email-lig.fnst@cn.fujitsu.com>
References: <1351833082-26633-1-git-send-email-lig.fnst@cn.fujitsu.com>
Date: Fri, 2 Nov 2012 08:16:14 +0100
Message-ID: <CAJSP0QXiLvzW5wUDCwVfnR6UXMv52Nb23314WnCC8-sv4vU_1g@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
To: liguang <lig.fnst@cn.fujitsu.com>
Content-Type: text/plain; charset=ISO-8859-1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.217.173
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Kevin Wolf <kwolf@redhat.com>,
	qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v3] correct error message
	qemu-img reported
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
X-List-Received-Date: Fri, 02 Nov 2012 07:16:19 -0000

On Fri, Nov 2, 2012 at 6:11 AM, liguang <lig.fnst@cn.fujitsu.com> wrote:
> diff --git a/qemu-img.c b/qemu-img.c
> index b41e670..d4ea800 100644
> --- a/qemu-img.c
> +++ b/qemu-img.c
> @@ -337,10 +337,15 @@ static int img_create(int argc, char **argv)
>
>      /* Get image size, if specified */
>      if (optind < argc) {
> -        int64_t sval;
> +        int64_t sval = 0;

sval is assigned below so there is no need for this change.

>          char *end;
>          sval = strtosz_suffix(argv[optind++], &end, STRTOSZ_DEFSUFFIX_B);
> -        if (sval < 0 || *end) {
> +        if (sval < 0) {
> +            error_report("image size is too large!");

I suggest being specific about the upper limit so the user knows which
values are valid:
"Image size must be less than 8 exabytes!"

Stefan

