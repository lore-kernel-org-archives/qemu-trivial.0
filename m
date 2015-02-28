Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YRdde-00073P-Kr
	for mharc-qemu-trivial@gnu.org; Sat, 28 Feb 2015 04:24:46 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44587)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YRddc-00070h-OX
	for qemu-trivial@nongnu.org; Sat, 28 Feb 2015 04:24:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YRddb-0002WW-TH
	for qemu-trivial@nongnu.org; Sat, 28 Feb 2015 04:24:44 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:55771)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YRddX-0002Ug-8s; Sat, 28 Feb 2015 04:24:39 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 9DDCB43EE1;
	Sat, 28 Feb 2015 12:24:38 +0300 (MSK)
Message-ID: <54F18956.8080008@msgid.tls.msk.ru>
Date: Sat, 28 Feb 2015 12:24:38 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.4.0
MIME-Version: 1.0
To: arei.gonglei@huawei.com, qemu-devel@nongnu.org
References: <1425112403-10988-1-git-send-email-arei.gonglei@huawei.com>
In-Reply-To: <1425112403-10988-1-git-send-email-arei.gonglei@huawei.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Wang Xin <wangxinxin.wang@huawei.com>,
	peter.huangpeng@huawei.com, kraxel@redhat.com
Subject: Re: [Qemu-trivial] [PATCH v2 0/2] Fix key 'numerosign' missing in
	Russian keyboard
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
X-List-Received-Date: Sat, 28 Feb 2015 09:24:45 -0000

28.02.2015 11:33, arei.gonglei@huawei.com wrote:
> From: Wang Xin <wangxinxin.wang@huawei.com>
> 
> Add the keysym and keycode of 'numerosign' in Russian keyboard layout
> to VNC keysyms table and keymap.
> 
> v2->v1:
>  Remove the key 'numbersign' from Russian keymap as it is not exsit
>  in Russian keyboard layout.
> 
> Wang Xin (2):
>   qemu-char: add cyrillic characters 'numerosign' to VNC keysyms
>   qemu-char: add cyrillic key 'numerosign' to Russian keymap

Applied to -trivial, with slight grammar fixes in commit comments,
thank you!

/mjt

