Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WsAua-0003D8-8R
	for mharc-qemu-trivial@gnu.org; Wed, 04 Jun 2014 09:07:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34263)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1WsAuT-00030T-Gp
	for qemu-trivial@nongnu.org; Wed, 04 Jun 2014 09:07:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1WsAuO-00021i-W5
	for qemu-trivial@nongnu.org; Wed, 04 Jun 2014 09:07:17 -0400
Received: from mail-vc0-f177.google.com ([209.85.220.177]:36325)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1WsAuO-000212-SR
	for qemu-trivial@nongnu.org; Wed, 04 Jun 2014 09:07:12 -0400
Received: by mail-vc0-f177.google.com with SMTP id hy4so5515026vcb.8
	for <qemu-trivial@nongnu.org>; Wed, 04 Jun 2014 06:07:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=nEbQhRPY3DPZ2OKKA1nd53f+wx0A2AdfYLRUrJQ3SKQ=;
	b=BoXqsLKBbbv/U7Ouq7MpcBB2wVl4m/VNGHfPqdyV5TxlpoVTXt9Y3obJZumpGbzsJU
	dtPGVXLXx6wtxZzHN23T4T0Bf4J2AnjxV0zlkXl8r6MDhH0vtfm+TVJeqjVF/jwFdKUX
	BldCZVVHlouAoX3+BqrIboGbpqSWjEi7Vqj5P8roRxbydupxvYhCWyDrdTc1wUt+331D
	QyLV/QX/l+R83ZDT7vDI6GP8Vh5OjW5bDvmOBt+bJSRsR7htAErS8whFYpE2CjupiTXT
	k9R/Fl7C0xdvyMrFEDZDXt+bXGV2l3pWbxCEIgCdwDuQYzYkSXyLozsfH5HSxZ5YKaE3
	CfQA==
X-Gm-Message-State: ALoCoQmEy0kUZM3y/Ok0bY0wMxJzko20zABhWaM5u7ushuCHQ+uJKOTD5Aw1IQJOlqXfWWeSSIto
MIME-Version: 1.0
X-Received: by 10.52.139.101 with SMTP id qx5mr36429256vdb.17.1401887232396;
	Wed, 04 Jun 2014 06:07:12 -0700 (PDT)
Sender: peter.crosthwaite@petalogix.com
Received: by 10.220.176.137 with HTTP; Wed, 4 Jun 2014 06:07:12 -0700 (PDT)
In-Reply-To: <1401816541-1522-1-git-send-email-peter.maydell@linaro.org>
References: <1401816541-1522-1-git-send-email-peter.maydell@linaro.org>
Date: Wed, 4 Jun 2014 23:07:12 +1000
X-Google-Sender-Auth: PvsSFFhiR2QjmuXBbT3JpZjdYHA
Message-ID: <CAEgOgz79hkmzx==Rtre2BQ1VqWRisZrURfcsbFiOx0ruupj2Lg@mail.gmail.com>
From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.220.177
Cc: qemu-trivial <qemu-trivial@nongnu.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Patch Tracking <patches@linaro.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] hw/sd/sd.c: Drop unused
	sd_acmd_type[] array
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
X-List-Received-Date: Wed, 04 Jun 2014 13:07:22 -0000

On Wed, Jun 4, 2014 at 3:29 AM, Peter Maydell <peter.maydell@linaro.org> wrote:
> Drop the sd_acmd_type[] array: it is never used. (The equivalent
> sd_cmd_type[] array for normal commands is used to identify
> those commands whose argument includes the card address in the
> top 16 bits; but for app commands the card address is passed
> with the APP_CMD prefix, not with the argument to the app command
> itself.)
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>

> ---
> clang 3.4 warns about this unused variable. If we ever turn out to
> need the information it's all in the sd card spec anyway.
>
>  hw/sd/sd.c | 11 -----------
>  1 file changed, 11 deletions(-)
>
> diff --git a/hw/sd/sd.c b/hw/sd/sd.c
> index 4502ad1..5efe8c1 100644
> --- a/hw/sd/sd.c
> +++ b/hw/sd/sd.c
> @@ -151,17 +151,6 @@ static const sd_cmd_type_t sd_cmd_type[64] = {
>      sd_adtc, sd_none, sd_none, sd_none, sd_none, sd_none, sd_none, sd_none,
>  };
>
> -static const sd_cmd_type_t sd_acmd_type[64] = {
> -    sd_none, sd_none, sd_none, sd_none, sd_none, sd_none, sd_ac,   sd_none,
> -    sd_none, sd_none, sd_none, sd_none, sd_none, sd_adtc, sd_none, sd_none,
> -    sd_none, sd_none, sd_none, sd_none, sd_none, sd_none, sd_adtc, sd_ac,
> -    sd_none, sd_none, sd_none, sd_none, sd_none, sd_none, sd_none, sd_none,
> -    sd_none, sd_none, sd_none, sd_none, sd_none, sd_none, sd_none, sd_none,
> -    sd_none, sd_bcr,  sd_ac,   sd_none, sd_none, sd_none, sd_none, sd_none,
> -    sd_none, sd_none, sd_none, sd_adtc, sd_none, sd_none, sd_none, sd_none,
> -    sd_none, sd_none, sd_none, sd_none, sd_none, sd_none, sd_none, sd_none,
> -};
> -
>  static const int sd_cmd_class[64] = {
>      0,  0,  0,  0,  0,  9, 10,  0,  0,  0,  0,  1,  0,  0,  0,  0,
>      2,  2,  2,  2,  3,  3,  3,  3,  4,  4,  4,  4,  6,  6,  6,  6,
> --
> 1.9.2
>
>

