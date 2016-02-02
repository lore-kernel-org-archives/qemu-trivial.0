Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aQW7P-00076M-Jh
	for mharc-qemu-trivial@gnu.org; Tue, 02 Feb 2016 03:15:23 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50791)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1aQW7N-00073L-ML
	for qemu-trivial@nongnu.org; Tue, 02 Feb 2016 03:15:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1aQW7K-000685-5h
	for qemu-trivial@nongnu.org; Tue, 02 Feb 2016 03:15:21 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:40292)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1aQW7B-00066t-2w; Tue, 02 Feb 2016 03:15:09 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 1498040188;
	Tue,  2 Feb 2016 11:15:07 +0300 (MSK)
To: Cao jin <caoj.fnst@cn.fujitsu.com>, qemu-devel@nongnu.org
References: <1454309636-18263-1-git-send-email-caoj.fnst@cn.fujitsu.com>
	<1454309636-18263-2-git-send-email-caoj.fnst@cn.fujitsu.com>
From: Michael Tokarev <mjt@tls.msk.ru>
Openpgp: id=6EE195D1886E8FFB810D4324457CE0A0804465C5
Organization: Telecom Service, JSC
Message-ID: <56B0658A.20605@msgid.tls.msk.ru>
Date: Tue, 2 Feb 2016 11:15:06 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.5.0
MIME-Version: 1.0
In-Reply-To: <1454309636-18263-2-git-send-email-caoj.fnst@cn.fujitsu.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial <qemu-trivial@nongnu.org>, kraxel@redhat.com
Subject: Re: [Qemu-trivial] [PATCH 1/2] Emulated CCID card: QOMify
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
X-List-Received-Date: Tue, 02 Feb 2016 08:15:22 -0000

01.02.2016 09:53, Cao jin wrote:
> Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
> ---
>  hw/usb/ccid-card-emulated.c | 20 +++++++++-----------
>  hw/usb/ccid.h               |  4 ++++
>  2 files changed, 13 insertions(+), 11 deletions(-)
> 
> diff --git a/hw/usb/ccid-card-emulated.c b/hw/usb/ccid-card-emulated.c
> index 869a63c..0b05260 100644
> --- a/hw/usb/ccid-card-emulated.c
> +++ b/hw/usb/ccid-card-emulated.c
> @@ -42,8 +42,6 @@ do {\
>      } \
>  } while (0)
>  
> -#define EMULATED_DEV_NAME "ccid-card-emulated"


> --- a/hw/usb/ccid.h
> +++ b/hw/usb/ccid.h
> +#define TYPE_EMULATED_CCID "ccid-card-emulated"
> +#define EMULATED_CCID_CARD(obj) \
> +     OBJECT_CHECK(EmulatedState, (obj), TYPE_EMULATED_CCID)

Why did you move the type definition from .c to .h file?
It is only referenced in .c, no?

Ditto for the second patch in this series.

Thanks,

/mjt


