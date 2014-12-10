Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XydJD-0004LH-8u
	for mharc-qemu-trivial@gnu.org; Wed, 10 Dec 2014 04:11:47 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48825)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XydJ5-0004B6-HT
	for qemu-trivial@nongnu.org; Wed, 10 Dec 2014 04:11:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XydIz-0005En-8K
	for qemu-trivial@nongnu.org; Wed, 10 Dec 2014 04:11:39 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:58093)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XydIm-0005CF-OP; Wed, 10 Dec 2014 04:11:20 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 32E62419AF;
	Wed, 10 Dec 2014 12:11:18 +0300 (MSK)
Message-ID: <54880E36.9080701@msgid.tls.msk.ru>
Date: Wed, 10 Dec 2014 12:11:18 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.2.0
MIME-Version: 1.0
To: Antony Pavlov <antonynpavlov@gmail.com>, qemu-devel@nongnu.org
References: <1417976445-18860-1-git-send-email-antonynpavlov@gmail.com>
In-Reply-To: <1417976445-18860-1-git-send-email-antonynpavlov@gmail.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH] pflash_cfi02.c: associate "cfi.pflash02"
 to "Storage devices" category
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
X-List-Received-Date: Wed, 10 Dec 2014 09:11:46 -0000

07.12.2014 21:20, Antony Pavlov wrote:
> Signed-off-by: Antony Pavlov <antonynpavlov@gmail.com>
> ---
>  hw/block/pflash_cfi02.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
> index 8513a17..389b4aa 100644
> --- a/hw/block/pflash_cfi02.c
> +++ b/hw/block/pflash_cfi02.c
> @@ -744,6 +744,7 @@ static void pflash_cfi02_class_init(ObjectClass *klass, void *data)
>  
>      dc->realize = pflash_cfi02_realize;
>      dc->props = pflash_cfi02_properties;
> +    set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
>  }
>  
>  static const TypeInfo pflash_cfi02_info = {

Hm.  While the patch itself is trivial, and it _seems_ it
fixes a bug, I'm not sure of possible effects of this.

What prob it has now, does this device work?  If yes,
why it needs fixing?  Do we care about compatibility
with previous versions, about migration?

Cc'ing block device people...

Thanks,

/mjt


