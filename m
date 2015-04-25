Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YltUw-0000Nm-V1
	for mharc-qemu-trivial@gnu.org; Sat, 25 Apr 2015 02:23:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46367)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YltUu-0000M1-FZ
	for qemu-trivial@nongnu.org; Sat, 25 Apr 2015 02:23:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YltUt-0004m2-QL
	for qemu-trivial@nongnu.org; Sat, 25 Apr 2015 02:23:28 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:54764)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YltUn-0004XC-LS; Sat, 25 Apr 2015 02:23:21 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 9698642320;
	Sat, 25 Apr 2015 09:23:20 +0300 (MSK)
Message-ID: <553B32D8.7000209@msgid.tls.msk.ru>
Date: Sat, 25 Apr 2015 09:23:20 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.6.0
MIME-Version: 1.0
To: Chih-Min Chao <cmchao@gmail.com>, qemu-devel@nongnu.org
References: <1428516254-23054-1-git-send-email-cmchao@gmail.com>
In-Reply-To: <1428516254-23054-1-git-send-email-cmchao@gmail.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, kraxel@redhat.com
Subject: Re: [Qemu-trivial] [PATCH 0/5] fix coding style and use of typedef
	type
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
X-List-Received-Date: Sat, 25 Apr 2015 06:23:29 -0000

08.04.2015 21:04, Chih-Min Chao wrote:
>     patch 1-2 
>         fix the coding style related to space indent and brance position
> 
>     patch 3-5 
>         remove the 'struct' from the type which has been typedef
> 
> Chih-Min Chao (5):
>   bitops : fix coding style
>   ui/vnc : fix coding style
>   ui/vnc : remove 'struct' of 'typedef struct'
>   ui/console : remove 'struct' from 'typedef struct' type
>   hw/display : remove 'struct' from 'typedef QXL struct'
> 
>  hw/display/qxl.c       |  2 +-
>  include/qemu/bitops.h  | 61 +++++++++++++++++++++++++-------------------------
>  ui/console.c           |  4 ++--
>  ui/spice-display.c     |  8 +++----
>  ui/vnc-auth-vencrypt.c |  8 ++++---
>  ui/vnc-tls.c           | 10 ++++-----
>  ui/vnc-ws.c            |  4 ++--
>  ui/vnc.c               |  2 +-
>  8 files changed, 51 insertions(+), 48 deletions(-)

Applied to -trivial, thank you!

/mjt


