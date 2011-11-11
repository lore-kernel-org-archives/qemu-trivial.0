Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ROx2S-0003PK-7P
	for mharc-qemu-trivial@gnu.org; Fri, 11 Nov 2011 14:45:24 -0500
Received: from eggs.gnu.org ([140.186.70.92]:52144)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1ROx2N-00037y-HQ
	for qemu-trivial@nongnu.org; Fri, 11 Nov 2011 14:45:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1ROx2M-0001y4-EU
	for qemu-trivial@nongnu.org; Fri, 11 Nov 2011 14:45:19 -0500
Received: from mail-gx0-f173.google.com ([209.85.161.173]:50025)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>)
	id 1ROx2K-0001vy-47; Fri, 11 Nov 2011 14:45:16 -0500
Received: by ggnp2 with SMTP id p2so5183544ggn.4
	for <multiple recipients>; Fri, 11 Nov 2011 11:45:15 -0800 (PST)
Received: by 10.50.194.229 with SMTP id hz5mr14242718igc.36.1321040715205;
	Fri, 11 Nov 2011 11:45:15 -0800 (PST)
Received: from [192.168.0.103] (cpe-70-123-132-139.austin.res.rr.com.
	[70.123.132.139])
	by mx.google.com with ESMTPS id a6sm9477267igc.3.2011.11.11.11.45.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 11 Nov 2011 11:45:14 -0800 (PST)
Message-ID: <4EBD7B48.1060407@codemonkey.ws>
Date: Fri, 11 Nov 2011 13:45:12 -0600
From: Anthony Liguori <anthony@codemonkey.ws>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.21) Gecko/20110831 Lightning/1.0b2 Thunderbird/3.1.13
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <1320867268-10015-1-git-send-email-peter.maydell@linaro.org>
In-Reply-To: <1320867268-10015-1-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.161.173
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] hw/tc58128.c: Remove
 unnecessary check for g_malloc failure
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
X-List-Received-Date: Fri, 11 Nov 2011 19:45:21 -0000

On 11/09/2011 01:34 PM, Peter Maydell wrote:
> Remove a check for g_malloc failing: this never happens.
> Also use g_malloc rather than g_malloc0 as we immediately
> memset the entire region and so zero-initialising it is pointless.
> Spotted by Coverity (see bug 887883).
>
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>

Applied.  Thanks.

Regards,

Anthony Liguori

> ---
>   hw/tc58128.c |    6 +-----
>   1 files changed, 1 insertions(+), 5 deletions(-)
>
> diff --git a/hw/tc58128.c b/hw/tc58128.c
> index ee3ecad..4ce80b1 100644
> --- a/hw/tc58128.c
> +++ b/hw/tc58128.c
> @@ -30,12 +30,8 @@ static void init_dev(tc58128_dev * dev, const char *filename)
>       int ret, blocks;
>
>       dev->state = WAIT;
> -    dev->flash_contents = g_malloc0(FLASH_SIZE);
> +    dev->flash_contents = g_malloc(FLASH_SIZE);
>       memset(dev->flash_contents, 0xff, FLASH_SIZE);
> -    if (!dev->flash_contents) {
> -	fprintf(stderr, "could not alloc memory for flash\n");
> -	exit(1);
> -    }
>       if (filename) {
>   	/* Load flash image skipping the first block */
>   	ret = load_image(filename, dev->flash_contents + 528 * 32);


