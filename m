Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WZsqF-0005TZ-Ar
	for mharc-qemu-trivial@gnu.org; Mon, 14 Apr 2014 22:11:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53509)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1WZsq8-00059S-RG
	for qemu-trivial@nongnu.org; Mon, 14 Apr 2014 22:11:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1WZsq0-0007aJ-KX
	for qemu-trivial@nongnu.org; Mon, 14 Apr 2014 22:11:12 -0400
Received: from mail-we0-f177.google.com ([74.125.82.177]:59689)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1WZsq0-0007a8-ES
	for qemu-trivial@nongnu.org; Mon, 14 Apr 2014 22:11:04 -0400
Received: by mail-we0-f177.google.com with SMTP id u57so8915464wes.36
	for <qemu-trivial@nongnu.org>; Mon, 14 Apr 2014 19:11:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=dU+h8uy2F5+Zno8thfssDVgv7xdmP+08qJSwKJ96KoI=;
	b=jyojOs7cQ1ptDeJEiLoQjEgeiZvWrjrJ2Z3QgWN1Z4xnx2zFmSFtXTw9WgC3I8Bvu4
	NcQS62pqNLYN6TpmVxEMaqGTXMYs4dweylILYvJKyxBe4CxGa5cBsSDUz1nNtHXlNMLt
	BX9lrIIRDKn3+xXFGKFYma7FHcfCubGsMqkY8J3oHgYXzychc4Fhi2BPkhM71U9hh2Kq
	NpwE4ZNxAaqWzuJ2Upbw4Y6SnVpSCSGRiur9Q7JkdImiXcj+8dxqmBgXVEbXYjzaKDYd
	QsBCXSwNid716mRmIEfhS0GQnuiarMxe9hIZNjq8mxyArDJ3GS+etuv9Y8HIDnukVzDP
	vbWw==
X-Gm-Message-State: ALoCoQmmQxnIPzSmbk9DxcieVvvtFj71HGVGODDU0lLLsYmKxEq6eqao/5mUNNF0yojg0rY5sFCV
MIME-Version: 1.0
X-Received: by 10.180.188.134 with SMTP id ga6mr156922wic.58.1397527863553;
	Mon, 14 Apr 2014 19:11:03 -0700 (PDT)
Sender: peter.crosthwaite@petalogix.com
Received: by 10.227.128.131 with HTTP; Mon, 14 Apr 2014 19:11:03 -0700 (PDT)
In-Reply-To: <5343E516.3020103@gmail.com>
References: <53337BEB.90305@gmail.com> <87wqfgrp83.fsf@blackfin.pond.sub.org>
	<5333F6E2.9080202@gmail.com> <53382DDD.8050001@gmail.com>
	<87fvlylf02.fsf@blackfin.pond.sub.org> <53396545.805@gmail.com>
	<CAFEAcA-GL7bnZ-Pkga9PzDq7DpwPf8Gx0Wezzkm_CCbSUB1W8A@mail.gmail.com>
	<533969AB.4010505@gmail.com>
	<CAFEAcA_w=35e9dVL_Zo84MoxZqCUH9qJ76v=Pn=XQ0FZq8g_-g@mail.gmail.com>
	<53396CE9.9090405@gmail.com>
	<CAFEAcA9dk3991gc+FK0qp9QwhWkjxO0vK=X1TxS37Y1sXD5RNw@mail.gmail.com>
	<533E7DD5.3090203@gmail.com> <5340F4FD.7040305@msgid.tls.msk.ru>
	<53414941.5040908@gmail.com> <5343E4D4.6070305@gmail.com>
	<5343E516.3020103@gmail.com>
Date: Tue, 15 Apr 2014 12:11:03 +1000
X-Google-Sender-Auth: 434EL5Eft6QsYqgHgpL-bIahvqc
Message-ID: <CAEgOgz7ey1BCwEoewVGhUtcx34=P8POmKOkNJY=VdfJZHFiJmQ@mail.gmail.com>
From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
To: Chen Gang <gang.chen.5i5j@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 74.125.82.177
Cc: Peter Maydell <peter.maydell@linaro.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, Michael Tokarev <mjt@tls.msk.ru>,
	Markus Armbruster <armbru@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Anthony Liguori <aliguori@amazon.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH trivial 1/3] vl: remove
	useless 'continue'
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
X-List-Received-Date: Tue, 15 Apr 2014 02:11:18 -0000

On Tue, Apr 8, 2014 at 10:01 PM, Chen Gang <gang.chen.5i5j@gmail.com> wrote:
> Normal "if (...) {...} else {...}" is enough in "while(...) {...}", not
> need additional useless 'continue'.
>

Only in the case where the if-else is not followed by any code. Which
is the case here. I found this sentance slightly confusing and TBH id
just drop it or say something less codey like:

"This if else has no code between it and the end of the enclosing
while loop. This makes this continue redundant."

> Signed-off-by: Chen Gang <gang.chen.5i5j@gmail.com>

But patch is good:

Reviewed-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>

> ---
>  vl.c |    1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/vl.c b/vl.c
> index 9975e5a..7505002 100644
> --- a/vl.c
> +++ b/vl.c
> @@ -3034,7 +3034,6 @@ int main(int argc, char **argv, char **envp)
>          if (argv[optind][0] != '-') {
>              /* disk image */
>              optind++;
> -            continue;
>          } else {
>              const QEMUOption *popt;
>
> --
> 1.7.9.5
>

