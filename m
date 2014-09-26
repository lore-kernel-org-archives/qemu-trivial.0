Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XXZE7-0007ii-Cn
	for mharc-qemu-trivial@gnu.org; Fri, 26 Sep 2014 13:22:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60946)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XXZE0-0007Zj-Qm
	for qemu-trivial@nongnu.org; Fri, 26 Sep 2014 13:22:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XXZDv-0008MT-Bx
	for qemu-trivial@nongnu.org; Fri, 26 Sep 2014 13:22:32 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:46068)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XXZDk-0008DN-PO; Fri, 26 Sep 2014 13:22:16 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 2AA6146F3D;
	Fri, 26 Sep 2014 21:22:11 +0400 (MSK)
Message-ID: <5425A0C3.40409@msgid.tls.msk.ru>
Date: Fri, 26 Sep 2014 21:22:11 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.7.0
MIME-Version: 1.0
To: arei.gonglei@huawei.com, qemu-devel@nongnu.org
References: <1411719272-9788-1-git-send-email-arei.gonglei@huawei.com>
In-Reply-To: <1411719272-9788-1-git-send-email-arei.gonglei@huawei.com>
X-Enigmail-Version: 1.6
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: peter.maydell@linaro.org, weidong.huang@huawei.com, qemu-trivial@nongnu.org,
	armbru@redhat.com, pbonzini@redhat.com, eblake@redhat.com
Subject: Re: [Qemu-trivial] [PATCH 0/3] os-posix: improve the error message
 printing
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
X-List-Received-Date: Fri, 26 Sep 2014 17:22:37 -0000

26.09.2014 12:14, arei.gonglei@huawei.com wrote:
> From: Gonglei <arei.gonglei@huawei.com>
> 
> The patches mainly improve the error message printing.
> And adjust coding style of os-posix.c.
> 
> Daemonize the QEMU process after initialization, QEMU will not detach from
> standard IO until it is ready to receive connections on any of its devices.
> So, using fprintf print error.
> 
> Cc: Eric Blake <eblake@redhat.com>
> 
> Gonglei (3):
>   os-posix: change tab to space avoid violating coding style
>   os-posix: remove confused errno
>   os-posix: report error message when lock file failed

Applied all 3 to -trivial, thank you!

/mjt


