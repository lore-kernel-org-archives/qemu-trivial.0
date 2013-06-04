Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UjpSp-0002h4-QZ
	for mharc-qemu-trivial@gnu.org; Tue, 04 Jun 2013 07:31:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49838)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1UjpSi-0002a3-On
	for qemu-trivial@nongnu.org; Tue, 04 Jun 2013 07:31:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1UjpSd-0002Zs-Mp
	for qemu-trivial@nongnu.org; Tue, 04 Jun 2013 07:31:36 -0400
Received: from mail-bk0-x230.google.com ([2a00:1450:4008:c01::230]:62595)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1UjpSd-0002Za-H2
	for qemu-trivial@nongnu.org; Tue, 04 Jun 2013 07:31:31 -0400
Received: by mail-bk0-f48.google.com with SMTP id jf17so62502bkc.7
	for <qemu-trivial@nongnu.org>; Tue, 04 Jun 2013 04:31:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:x-gm-message-state;
	bh=K9B84x0/qKREjfSIoMp0sn02MUElblnYY3u89trk0Ns=;
	b=SsgbxoD7+Ybqmig+t2rcEQ7ylx4IAFYtP2BfeWhWWs26WBDWYOlZ/PhTO54uQDHcQf
	7EIq3VtfMf0NvXieRfuI3TSuWYAhkQ+NF6KJWqd+Lx01lHmGA6xG2dZE/QvhNXxU0Joo
	WAlu0MclbYskWYpyOsGPiq6qBYHeQAmjBDVfjuo01tiKE77M/C9sEQoKdimADPwnNnKh
	/pqLQGJACMPUzM8VITAtMa51krSVWhjSBKYmzECeWSJdXeyHkFK1A9lWrN5Xxj1dQXXY
	XL+/Ma/lu3X8GQKWxKGLz8e+19waNFvoHUZwxk5RAcexTPsJeMbJMRqtPewW06T5d5wp
	Pskw==
MIME-Version: 1.0
X-Received: by 10.204.228.136 with SMTP id je8mr7743097bkb.93.1370345489708;
	Tue, 04 Jun 2013 04:31:29 -0700 (PDT)
Sender: peter.crosthwaite@petalogix.com
Received: by 10.204.35.136 with HTTP; Tue, 4 Jun 2013 04:31:29 -0700 (PDT)
In-Reply-To: <1369835909-35664-1-git-send-email-emaste@freebsd.org>
References: <1369835909-35664-1-git-send-email-emaste@freebsd.org>
Date: Tue, 4 Jun 2013 21:31:29 +1000
X-Google-Sender-Auth: KPTt_SzoFVmvziNvJuqa-R5M6C0
Message-ID: <CAEgOgz6KQkHtLiw9p3qreYP980L+UedhXZ5vx3sJP1-k-DfF3g@mail.gmail.com>
From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
To: Ed Maste <emaste@freebsd.org>
Content-Type: text/plain; charset=ISO-8859-1
X-Gm-Message-State: ALoCoQm4GG2XxPAnrP3mXK23Di3O5xtHxvy/44CmKwJtdLWJIJS9Jcm7XOo7beWtXXu59+qVAeTU
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4008:c01::230
Cc: qemu-trivial@nongnu.org, suneelg@xilinx.com, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] m25p80: Add Micron n25q032a
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
X-List-Received-Date: Tue, 04 Jun 2013 11:31:42 -0000

Hi Ed,

On Wed, May 29, 2013 at 11:58 PM, Ed Maste <emaste@freebsd.org> wrote:
> Based on the datasheet at
> http://www.micron.com/~/media/Documents/Products/Data%20Sheet/NOR%20Flash/Serial%20NOR/N25Q/n25q_32mb_1_8v_65nm.pdf
>
> Signed-off-by: Ed Maste <emaste@freebsd.org>
> ---
>  hw/block/m25p80.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
> index 759c84d..a927a6b 100644
> --- a/hw/block/m25p80.c
> +++ b/hw/block/m25p80.c
> @@ -123,6 +123,7 @@ static const FlashPartInfo known_devices[] = {
>      { INFO("mx25l25655e", 0xc22619,      0,  64 << 10, 512, 0) },
>
>      /* Micron */
> +    { INFO("n25q032a",    0x20bb16,      0,  64 << 10,  64, ER_4K) },

Does this have a11 and a13 variants as well?

>      { INFO("n25q128a11",  0x20bb18,      0,  64 << 10, 256, 0) },
>      { INFO("n25q128a13",  0x20ba18,      0,  64 << 10, 256, 0) },

And this looks odd, these parts don't support 4K erase as well?

Regards,
Peter

>      { INFO("n25q256a",    0x20ba19,      0,  64 << 10, 512, ER_4K) },
> --
> 1.7.11.5
>
>

