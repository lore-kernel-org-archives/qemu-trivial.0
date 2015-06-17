Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z5IzY-0005Wk-P6
	for mharc-qemu-trivial@gnu.org; Wed, 17 Jun 2015 15:27:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55715)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Z5IzW-0005RA-8d
	for qemu-trivial@nongnu.org; Wed, 17 Jun 2015 15:27:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Z5IzV-0002Ju-FM
	for qemu-trivial@nongnu.org; Wed, 17 Jun 2015 15:27:18 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:33837)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Z5IzP-0002Cq-7x; Wed, 17 Jun 2015 15:27:11 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 63D854186B;
	Wed, 17 Jun 2015 22:27:10 +0300 (MSK)
Message-ID: <5581CA0E.6080906@msgid.tls.msk.ru>
Date: Wed, 17 Jun 2015 22:27:10 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.7.0
MIME-Version: 1.0
To: Frediano Ziglio <fziglio@redhat.com>, 
 Gerd Hoffmann <kraxel@redhat.com>
References: <1434028677-26160-1-git-send-email-fziglio@redhat.com>
	<1434028677-26160-2-git-send-email-fziglio@redhat.com>
In-Reply-To: <1434028677-26160-2-git-send-email-fziglio@redhat.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH 2/2] Check value for invalid negative
	values
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
X-List-Received-Date: Wed, 17 Jun 2015 19:27:19 -0000

11.06.2015 16:17, Frediano Ziglio wrote:
> In qxl_v2n check that value is not negative.

Why do you think it is necessary?

Thanks,

/mjt

> Signed-off-by: Frediano Ziglio <fziglio@redhat.com>
> ---
>  hw/display/qxl-logger.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/display/qxl-logger.c b/hw/display/qxl-logger.c
> index d944d3f..faed869 100644
> --- a/hw/display/qxl-logger.c
> +++ b/hw/display/qxl-logger.c
> @@ -93,7 +93,7 @@ static const char *const spice_cursor_type[] = {
>  
>  static const char *qxl_v2n(const char *const n[], size_t l, int v)
>  {
> -    if (v >= l || !n[v]) {
> +    if (v < 0 || v >= l || !n[v]) {
>          return "???";
>      }
>      return n[v];



