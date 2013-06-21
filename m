Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Uq5sY-00085m-Nd
	for mharc-qemu-trivial@gnu.org; Fri, 21 Jun 2013 14:16:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54107)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Uq5sV-00080v-VQ
	for qemu-trivial@nongnu.org; Fri, 21 Jun 2013 14:16:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Uq5sU-0003yn-J3
	for qemu-trivial@nongnu.org; Fri, 21 Jun 2013 14:16:07 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:46799)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Uq5sN-0003xM-Vs; Fri, 21 Jun 2013 14:16:00 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id D1D3541DEF;
	Fri, 21 Jun 2013 22:15:58 +0400 (MSK)
Message-ID: <51C4985E.1020204@msgid.tls.msk.ru>
Date: Fri, 21 Jun 2013 22:15:58 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:17.0) Gecko/20130529 Icedove/17.0.5
MIME-Version: 1.0
To: Gerd Hoffmann <kraxel@redhat.com>
References: <1371811105-730-1-git-send-email-kraxel@redhat.com>
	<1371811105-730-2-git-send-email-kraxel@redhat.com>
In-Reply-To: <1371811105-730-2-git-send-email-kraxel@redhat.com>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH 01/13] qemu-socket: zero-initialize
	SocketAddress
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
X-List-Received-Date: Fri, 21 Jun 2013 18:16:08 -0000

21.06.2013 14:38, Gerd Hoffmann wrote:
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  util/qemu-sockets.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
> index fdd8dc4..364bd8c 100644
> --- a/util/qemu-sockets.c
> +++ b/util/qemu-sockets.c
> @@ -855,7 +855,7 @@ SocketAddress *socket_parse(const char *str, Error **errp)
>  {
>      SocketAddress *addr = NULL;
>  
> -    addr = g_new(SocketAddress, 1);
> +    addr = g_new0(SocketAddress, 1);

While at it we can remove the =NULL assignment too, guess, someting like this:

--- a/util/qemu-sockets.c
+++ b/util/qemu-sockets.c
@@ -848,9 +848,7 @@ int unix_nonblocking_connect(const char *path,

 SocketAddress *socket_parse(const char *str, Error **errp)
 {
-    SocketAddress *addr = NULL;
-
-    addr = g_new(SocketAddress, 1);
+    SocketAddress *addr = addr = g_new0(SocketAddress, 1);
     if (strstart(str, "unix:", NULL)) {
         if (str[5] == '\0') {
             error_setg(errp, "invalid Unix socket address");

Is that okay with you? :)

Not that it matter much actually (I guess gcc may optimize it
out entirely by its own already).

And not that the original issue is a big issue really, because
in each case each relevant field is initialized.  It's still
nice to see stuff clean in debugger and other places, but the
code which actually uses this struct should work fine without
the change.

/mjt

