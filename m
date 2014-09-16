Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XTt8l-0007lO-Lv
	for mharc-qemu-trivial@gnu.org; Tue, 16 Sep 2014 09:49:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50769)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <soariez@gmail.com>) id 1XTlMo-00021Y-AK
	for qemu-trivial@nongnu.org; Tue, 16 Sep 2014 01:31:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <soariez@gmail.com>) id 1XTlMn-00017L-D6
	for qemu-trivial@nongnu.org; Tue, 16 Sep 2014 01:31:54 -0400
Received: from mail-vc0-x236.google.com ([2607:f8b0:400c:c03::236]:38888)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <soariez@gmail.com>)
	id 1XTlMk-00016h-UJ; Tue, 16 Sep 2014 01:31:51 -0400
Received: by mail-vc0-f182.google.com with SMTP id le20so4401483vcb.41
	for <multiple recipients>; Mon, 15 Sep 2014 22:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=xOgzEkJSYwX3eTFojhPESiGf3Gm016Ad5rrtG3rP3Q0=;
	b=o8U3htFvy4iS5Xtu7jFr6yET1KdC04tjGwFlHmKa3IWiundwN6Q26QakoxarT6xmRG
	h3wZagWz4t97CkA+adeA89q0AjTZNBj44XOjgxcTSe11A35EW38OhCbicR23xbAPJlS6
	uvNMLBnQ06CLu1bbAS6YQ4gnyjfq5/1js4vd3Ks6K4iOeH04lch8Jdjo2/UXNBX57vT6
	ylt1C41ky5L9yX3veDoFemAbHgR8KQMsl1GlTXL9SfYR/EqXg29wHaamaBOG9EMCB80T
	/tJ1oTb35ZrJrAbchSiEo1O2PL1wy60qxPLWwXkRXN6l4dv5IfYtcoHEprUA8uYZZZuX
	m2+g==
X-Received: by 10.52.61.99 with SMTP id o3mr23218635vdr.46.1410845506905; Mon,
	15 Sep 2014 22:31:46 -0700 (PDT)
MIME-Version: 1.0
Sender: soariez@gmail.com
Received: by 10.220.114.68 with HTTP; Mon, 15 Sep 2014 22:31:06 -0700 (PDT)
In-Reply-To: <1410092666-17405-1-git-send-email-zifeitong@gmail.com>
References: <1410092666-17405-1-git-send-email-zifeitong@gmail.com>
From: Zifei Tong <zifeitong@gmail.com>
Date: Tue, 16 Sep 2014 13:31:06 +0800
X-Google-Sender-Auth: E8UmVtlaokpoWcCb4Z80s1EUZwA
Message-ID: <CAJ7wx-FqAPy85ROq3cprYmA39X--z83jBaLhhpwocXRHHnqc8w@mail.gmail.com>
To: qemu-devel@nongnu.org
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400c:c03::236
X-Mailman-Approved-At: Tue, 16 Sep 2014 09:49:54 -0400
Cc: qemu-trivial@nongnu.org, Kirill Batuzov <batuzovk@ispras.ru>,
	Anthony Liguori <aliguori@amazon.com>,
	Nikolay Nikolaev <n.nikolaev@virtualopensystems.com>,
	Zifei Tong <zifeitong@gmail.com>
Subject: Re: [Qemu-trivial] [PATCH] qemu-char: Do not disconnect when
	there's data for reading
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
X-List-Received-Date: Tue, 16 Sep 2014 05:31:55 -0000

Friendly ping.

Also CC to qemu-trivial.

On Sun, Sep 7, 2014 at 8:24 PM, Zifei Tong <zifeitong@gmail.com> wrote:
> After commit 812c1057f6175ac9a9829fa2920a2b5783814193 (Handle G_IO_HUP
> in tcp_chr_read for tcp chardev), the connection is disconnected when in
> G_IO_HUP condition.
>
> However, it's possible that the channel is in G_IO_IN condition at the
> same time, meaning there is data for reading. In that case, the
> remaining data is not handled.
>
> I saw a related bug when running socat in write-only mode, with
>
>   $ echo "quit" | socat -u - UNIX-CONNECT:qemu-monitor
>
> the monitor won't not run the 'quit' command.
>
> CC: Kirill Batuzov <batuzovk@ispras.ru>
> CC: Nikolay Nikolaev <n.nikolaev@virtualopensystems.com>
> CC: Anthony Liguori <aliguori@amazon.com>
> Signed-off-by: Zifei Tong <zifeitong@gmail.com>
> ---
>  qemu-char.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/qemu-char.c b/qemu-char.c
> index 1a8d9aa..5018c3a 100644
> --- a/qemu-char.c
> +++ b/qemu-char.c
> @@ -2706,7 +2706,7 @@ static gboolean tcp_chr_read(GIOChannel *chan, GIOCondition cond, void *opaque)
>      uint8_t buf[READ_BUF_LEN];
>      int len, size;
>
> -    if (cond & G_IO_HUP) {
> +    if (!(cond & G_IO_IN) && (cond & G_IO_HUP)) {
>          /* connection closed */
>          tcp_chr_disconnect(chr);
>          return TRUE;
> --
> 2.1.0
>

