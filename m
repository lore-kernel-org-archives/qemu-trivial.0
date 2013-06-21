Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Uq6CF-0003fI-N8
	for mharc-qemu-trivial@gnu.org; Fri, 21 Jun 2013 14:36:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58077)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Uq6CC-0003a5-HG
	for qemu-trivial@nongnu.org; Fri, 21 Jun 2013 14:36:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Uq6CB-0001VK-JD
	for qemu-trivial@nongnu.org; Fri, 21 Jun 2013 14:36:28 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:58685)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Uq6C9-0001U9-8w; Fri, 21 Jun 2013 14:36:25 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 51AAB41DEF;
	Fri, 21 Jun 2013 22:36:22 +0400 (MSK)
Message-ID: <51C49D24.1000809@msgid.tls.msk.ru>
Date: Fri, 21 Jun 2013 22:36:20 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:17.0) Gecko/20130529 Icedove/17.0.5
MIME-Version: 1.0
To: Gerd Hoffmann <kraxel@redhat.com>
References: <1371811105-730-1-git-send-email-kraxel@redhat.com>
	<1371811105-730-10-git-send-email-kraxel@redhat.com>
In-Reply-To: <1371811105-730-10-git-send-email-kraxel@redhat.com>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Anthony Liguori <aliguori@us.ibm.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH 09/13] qemu-char: use ChardevBackendKind
 in in CharDriver
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
X-List-Received-Date: Fri, 21 Jun 2013 18:36:29 -0000

21.06.2013 14:38, Gerd Hoffmann wrote:
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  qemu-char.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/qemu-char.c b/qemu-char.c
> index 5751391..1c0903f 100644
> --- a/qemu-char.c
> +++ b/qemu-char.c
> @@ -3127,7 +3127,7 @@ typedef struct CharDriver {
>      /* old, pre qapi */
>      CharDriverState *(*open)(QemuOpts *opts);
>      /* new, qapi-based */
> -    int kind;
> +    ChardevBackendKind kind;
>      void (*parse)(QemuOpts *opts, ChardevBackend *backend, Error **errp);
>  } CharDriver;

How about switching argument of register_char_driver_qapi() to the same
type as well?

Thanks,

/mjt

