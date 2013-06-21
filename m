Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Uq5us-0003Tb-2G
	for mharc-qemu-trivial@gnu.org; Fri, 21 Jun 2013 14:18:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54580)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Uq5uq-0003Qe-KN
	for qemu-trivial@nongnu.org; Fri, 21 Jun 2013 14:18:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Uq5up-0004oT-Mv
	for qemu-trivial@nongnu.org; Fri, 21 Jun 2013 14:18:32 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:50544)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Uq5un-0004ll-Vt; Fri, 21 Jun 2013 14:18:30 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id A72A941DEF;
	Fri, 21 Jun 2013 22:18:28 +0400 (MSK)
Message-ID: <51C498F3.50608@msgid.tls.msk.ru>
Date: Fri, 21 Jun 2013 22:18:27 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:17.0) Gecko/20130529 Icedove/17.0.5
MIME-Version: 1.0
To: Gerd Hoffmann <kraxel@redhat.com>
References: <1371811105-730-1-git-send-email-kraxel@redhat.com>
	<1371811105-730-4-git-send-email-kraxel@redhat.com>
In-Reply-To: <1371811105-730-4-git-send-email-kraxel@redhat.com>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH 03/13] qemu-socket: catch monitor_get_fd
 failures
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
X-List-Received-Date: Fri, 21 Jun 2013 18:18:33 -0000

21.06.2013 14:38, Gerd Hoffmann wrote:
>      case SOCKET_ADDRESS_KIND_FD:
>          fd = monitor_get_fd(cur_mon, addr->fd->str, errp);
> +        if (fd < 0) {
> +            break;
> +        }
>          if (callback) {
>              qemu_set_nonblock(fd);
>              callback(fd, opaque);

     case SOCKET_ADDRESS_KIND_FD:
         fd = monitor_get_fd(cur_mon, addr->fd->str, errp);
-        if (callback) {
+        if (fd >= 0 && callback) {
             qemu_set_nonblock(fd);
             callback(fd, opaque);
         }

?

Thanks,

/mjt

