Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aPSBs-0001IS-Ta
	for mharc-qemu-trivial@gnu.org; Sat, 30 Jan 2016 04:51:36 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42470)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1aPSBq-0001Cv-ND
	for qemu-trivial@nongnu.org; Sat, 30 Jan 2016 04:51:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1aPSBp-00048E-Qu
	for qemu-trivial@nongnu.org; Sat, 30 Jan 2016 04:51:34 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:40201)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1aPSBl-00046W-2x; Sat, 30 Jan 2016 04:51:29 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id D7C0041D08;
	Sat, 30 Jan 2016 12:51:27 +0300 (MSK)
To: "Daniel P. Berrange" <berrange@redhat.com>, qemu-devel@nongnu.org
References: <1453484125-4064-1-git-send-email-berrange@redhat.com>
From: Michael Tokarev <mjt@tls.msk.ru>
Openpgp: id=6EE195D1886E8FFB810D4324457CE0A0804465C5
Organization: Telecom Service, JSC
Message-ID: <56AC879F.9020705@msgid.tls.msk.ru>
Date: Sat, 30 Jan 2016 12:51:27 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.5.0
MIME-Version: 1.0
In-Reply-To: <1453484125-4064-1-git-send-email-berrange@redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Sean Bruno <sbruno@freebsd.org>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH] char: fix parameter name / type in BSD
	codepath
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
X-List-Received-Date: Sat, 30 Jan 2016 09:51:35 -0000

22.01.2016 20:35, Daniel P. Berrange wrote:
> The BSD impl of qemu_chr_open_pp_fd had mis-declared
> its parameter type as ChardevBackend instead of
> ChardevCommon. It had also mistakenly used the variable
> name 'common' instead of 'backend'.

Applied to -trivial, fixed qemu-devel@ addres.

Thanks!

/mjt

> Tested-by: Sean Bruno <sbruno@freebsd.org>
> Signed-off-by: Daniel P. Berrange <berrange@redhat.com>
> ---
>  qemu-char.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/qemu-char.c b/qemu-char.c
> index e133f4f..aa2e660 100644
> --- a/qemu-char.c
> +++ b/qemu-char.c
> @@ -1835,12 +1835,12 @@ static int pp_ioctl(CharDriverState *chr, int cmd, void *arg)
>  }
>  
>  static CharDriverState *qemu_chr_open_pp_fd(int fd,
> -                                            ChardevBackend *backend,
> +                                            ChardevCommon *backend,
>                                              Error **errp)
>  {
>      CharDriverState *chr;
>  
> -    chr = qemu_chr_alloc(common, errp);
> +    chr = qemu_chr_alloc(backend, errp);
>      if (!chr) {
>          return NULL;
>      }
> 


