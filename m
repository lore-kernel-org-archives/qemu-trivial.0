Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aYr0e-0000KT-FF
	for mharc-qemu-trivial@gnu.org; Thu, 25 Feb 2016 03:10:52 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37406)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1aYr0Q-0008V7-6f
	for qemu-trivial@nongnu.org; Thu, 25 Feb 2016 03:10:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1aYr01-0005f3-DC
	for qemu-trivial@nongnu.org; Thu, 25 Feb 2016 03:10:37 -0500
Received: from [59.151.112.132] (port=10851 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>)
	id 1aYqyx-0004cR-77; Thu, 25 Feb 2016 03:09:12 -0500
X-IronPort-AV: E=Sophos;i="5.20,346,1444665600"; 
   d="scan'208";a="3909906"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 25 Feb 2016 16:08:50 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id D638C421917E;
	Thu, 25 Feb 2016 16:08:47 +0800 (CST)
Received: from [10.167.226.69] (10.167.226.69) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Thu, 25 Feb 2016 16:08:47 +0800
To: <qemu-devel@nongnu.org>
References: <1456305167-19457-1-git-send-email-caoj.fnst@cn.fujitsu.com>
From: Cao jin <caoj.fnst@cn.fujitsu.com>
Message-ID: <56CEB6CB.3080600@cn.fujitsu.com>
Date: Thu, 25 Feb 2016 16:09:47 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <1456305167-19457-1-git-send-email-caoj.fnst@cn.fujitsu.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.167.226.69]
X-yoursite-MailScanner-ID: D638C421917E.A820F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: caoj.fnst@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Cc: qemu-trivial <qemu-trivial@nongnu.org>, mjt@tls.msk.ru
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] loader: fix potential
	memory leak
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
X-List-Received-Date: Thu, 25 Feb 2016 08:10:51 -0000

sorry, It just came to me that I forgot to cc qemu-trivial

On 02/24/2016 05:12 PM, Cao jin wrote:
> Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
> ---
>   hw/core/loader.c | 6 ++++++
>   1 file changed, 6 insertions(+)
>
> diff --git a/hw/core/loader.c b/hw/core/loader.c
> index 3a57415..24fea65 100644
> --- a/hw/core/loader.c
> +++ b/hw/core/loader.c
> @@ -827,10 +827,16 @@ int rom_add_file(const char *file, const char *fw_dir,
>   err:
>       if (fd != -1)
>           close(fd);
> +
>       g_free(rom->data);
>       g_free(rom->path);
>       g_free(rom->name);
> +    if (fw_dir) {
> +        g_free(rom->fw_dir);
> +        g_free(rom->fw_file);
> +    }
>       g_free(rom);
> +
>       return -1;
>   }
>
>

-- 
Yours Sincerely,

Cao jin



