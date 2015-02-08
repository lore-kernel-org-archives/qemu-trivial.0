Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YKPSn-0003XR-Lq
	for mharc-qemu-trivial@gnu.org; Sun, 08 Feb 2015 05:51:41 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56842)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YKPSl-0003T7-AA
	for qemu-trivial@nongnu.org; Sun, 08 Feb 2015 05:51:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YKPSk-0006vM-J7
	for qemu-trivial@nongnu.org; Sun, 08 Feb 2015 05:51:39 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:35162)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YKPSe-0006uM-7z; Sun, 08 Feb 2015 05:51:34 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 2D842414D8;
	Sun,  8 Feb 2015 13:51:31 +0300 (MSK)
Message-ID: <54D73FB3.7000804@msgid.tls.msk.ru>
Date: Sun, 08 Feb 2015 13:51:31 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.4.0
MIME-Version: 1.0
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <1423045567-29855-1-git-send-email-armbru@redhat.com>
In-Reply-To: <1423045567-29855-1-git-send-email-armbru@redhat.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, arei.gonglei@huawei.com, eblake@redhat.com,
	thuth@linux.vnet.ibm.com
Subject: Re: [Qemu-trivial] [PATCH v2 0/6] Trivial cleanups around g_malloc()
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
X-List-Received-Date: Sun, 08 Feb 2015 10:51:40 -0000

04.02.2015 13:26, Markus Armbruster wrote:
> I'm routing these patches through qemu-trivial, even though some of
> them touch actively maintained code, and could go through the
> respective tree instead:
> 
> * PATCH 1 block (Kevin, Stefan)
> 
> * PATCH 3 KVM (Paolo)
> 
> * PATCH 4 migration (Juan, Amit)
> 
> * PATCH 5 VNC (Gerd)
> 
> If you want me to reroute any of them, let me know.
> 
> v2:
> * Trivially rebased, R-bys retained
> 
> Markus Armbruster (6):
>   onenand: g_malloc() can't fail, bury dead error handling
>   rtl8139: g_malloc() can't fail, bury dead error handling
>   kvm: g_malloc() can't fail, bury dead error handling
>   rdma: g_malloc0() can't fail, bury dead error handling
>   vnc: g_realloc() can't fail, bury dead error handling
>   translate-all: Use g_try_malloc() for dynamic translator buffer

Applied all to -trivial, thank you!

/mjt

