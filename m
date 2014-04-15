Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WZssm-0007vw-Bt
	for mharc-qemu-trivial@gnu.org; Mon, 14 Apr 2014 22:13:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53959)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1WZsse-0007rk-49
	for qemu-trivial@nongnu.org; Mon, 14 Apr 2014 22:13:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1WZssV-00009K-V2
	for qemu-trivial@nongnu.org; Mon, 14 Apr 2014 22:13:48 -0400
Received: from mail-wi0-f170.google.com ([209.85.212.170]:52015)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1WZssV-000092-OJ
	for qemu-trivial@nongnu.org; Mon, 14 Apr 2014 22:13:39 -0400
Received: by mail-wi0-f170.google.com with SMTP id bs8so6194013wib.1
	for <qemu-trivial@nongnu.org>; Mon, 14 Apr 2014 19:13:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=SIntJuv2Ih/eTd3KyOPrrxwGo8ZHTgHcrRfO3MdUbgA=;
	b=eoV1og7Gvy/pqds350ZkWxqfSDHyPVKbry/QU2jebVgcuAZlS+NeCGzSOGKXArucR1
	oBrCOQpUwuyFlPAc4cwCWOSKvTY+HMQGdfYTeWaumGSfNZsxO0tCbWtS33Y/dkQPkVz3
	ezj9fXh6vBnMyMYrxYJpqcJd0J5UHu9LCRIHLFOkVjLT8MUzgQFRMYFb0+cmU6EPoask
	+IHWbw92FQ/nhQIizgZgq5fbzPnDAd37QtR0WbwM4m7/MX3IYGC05UDXzr8PdEIW5DJ5
	VqsuESV6Vf/QMn2sadTqu3pRAyxfq6334oYPyB/TLilFZze/6dFEI0GUNMmmQWYh1L4M
	nuOQ==
X-Gm-Message-State: ALoCoQm8oA4YtGF1WUcHrMo9XL+ESiygbT/GkOt3RE1oUhg+Bi9EiQcxaYWaF0DQMKplD6ugzlyn
MIME-Version: 1.0
X-Received: by 10.180.89.211 with SMTP id bq19mr11895178wib.58.1397528019015; 
	Mon, 14 Apr 2014 19:13:39 -0700 (PDT)
Sender: peter.crosthwaite@petalogix.com
Received: by 10.227.128.131 with HTTP; Mon, 14 Apr 2014 19:13:38 -0700 (PDT)
In-Reply-To: <5343E571.60407@gmail.com>
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
	<5343E516.3020103@gmail.com> <5343E571.60407@gmail.com>
Date: Tue, 15 Apr 2014 12:13:38 +1000
X-Google-Sender-Auth: 73N-MpLARSNdPxTaWxc3K7EvQlY
Message-ID: <CAEgOgz7gEi7s2paSDo+AnO67LT+T+K0_SZ_MnBEZCdpHZgaJrA@mail.gmail.com>
From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
To: Chen Gang <gang.chen.5i5j@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.212.170
Cc: Peter Maydell <peter.maydell@linaro.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, Michael Tokarev <mjt@tls.msk.ru>,
	Markus Armbruster <armbru@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Anthony Liguori <aliguori@amazon.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH trivial 2/3] vl: remove
 redundant local variable 'res'
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
X-List-Received-Date: Tue, 15 Apr 2014 02:13:54 -0000

On Tue, Apr 8, 2014 at 10:02 PM, Chen Gang <gang.chen.5i5j@gmail.com> wrote:
> In function, if no additional resources to free before quit, commonly,
> need not use additional local variable 'res' to notice about it. So
> remove it to simplify code.
>

Styling wise, there is a school of thought that functions should only
have one return statement which is probably the original authors
intention.

Regards,
Peter

> Signed-off-by: Chen Gang <gang.chen.5i5j@gmail.com>
> ---
>  vl.c |    6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/vl.c b/vl.c
> index 7505002..377f962 100644
> --- a/vl.c
> +++ b/vl.c
> @@ -1188,18 +1188,16 @@ DeviceState *get_boot_device(uint32_t position)
>  {
>      uint32_t counter = 0;
>      FWBootEntry *i = NULL;
> -    DeviceState *res = NULL;
>
>      if (!QTAILQ_EMPTY(&fw_boot_order)) {
>          QTAILQ_FOREACH(i, &fw_boot_order, link) {
>              if (counter == position) {
> -                res = i->dev;
> -                break;
> +                return i->dev;
>              }
>              counter++;
>          }
>      }
> -    return res;
> +    return NULL;
>  }
>
>  /*
> --
> 1.7.9.5
>

