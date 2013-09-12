Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VKByq-000350-Nc
	for mharc-qemu-trivial@gnu.org; Thu, 12 Sep 2013 14:51:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59853)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VKByj-00034o-Pq
	for qemu-trivial@nongnu.org; Thu, 12 Sep 2013 14:51:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VKByc-0004kY-Vk
	for qemu-trivial@nongnu.org; Thu, 12 Sep 2013 14:50:57 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:47348)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VKByc-0004kC-OS
	for qemu-trivial@nongnu.org; Thu, 12 Sep 2013 14:50:50 -0400
Received: from gandalf.local (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 24D7840ECD;
	Thu, 12 Sep 2013 22:50:48 +0400 (MSK)
Message-ID: <52320D08.7010606@msgid.tls.msk.ru>
Date: Thu, 12 Sep 2013 22:50:48 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130827 Icedove/17.0.8
MIME-Version: 1.0
To: =?UTF-8?B?SsOhbiBWZXNlbMO9?= <jano.vesely@gmail.com>
References: <CA+K+NcRuDrKRLNzCuvHkdkj=dNyvj_swbpgiuMi-vH8nx6+kfg@mail.gmail.com>
In-Reply-To: <CA+K+NcRuDrKRLNzCuvHkdkj=dNyvj_swbpgiuMi-vH8nx6+kfg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: QEMU <qemu-trivial@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] configure: Undef _FORTIFY_SOURCE before
 redefining it
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
X-List-Received-Date: Thu, 12 Sep 2013 18:51:03 -0000

04.09.2013 05:56, J=C3=A1n Vesel=C3=BD wrote:
> This patch fixes the following  warning/error with compilers that
> define _FORTIFY_SOURE by default:
> <command-line>:0:0: error: "_FORTIFY_SOURCE" redefined [-Werror]
> stubs/dump.c:1:0: note: this is the location of the previous definition

Thanks, applied to the trivial-patches queue (combined with the
similar patch by Michal Privoznik).

/mjt

