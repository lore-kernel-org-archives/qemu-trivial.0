Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YNH7m-0006Ay-4k
	for mharc-qemu-trivial@gnu.org; Mon, 16 Feb 2015 03:33:50 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49452)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YNH7j-000676-JH
	for qemu-trivial@nongnu.org; Mon, 16 Feb 2015 03:33:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YNH7i-0003ja-Qq
	for qemu-trivial@nongnu.org; Mon, 16 Feb 2015 03:33:47 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:51417)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YNH7c-0003g4-Qb; Mon, 16 Feb 2015 03:33:40 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 30B3742370;
	Mon, 16 Feb 2015 11:33:40 +0300 (MSK)
Message-ID: <54E1AB64.3070303@msgid.tls.msk.ru>
Date: Mon, 16 Feb 2015 11:33:40 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.4.0
MIME-Version: 1.0
To: Gerd Hoffmann <kraxel@redhat.com>, arei.gonglei@huawei.com
References: <1424059258-11024-1-git-send-email-arei.gonglei@huawei.com>	
	<1424059258-11024-3-git-send-email-arei.gonglei@huawei.com>
	<1424075329.3722.0.camel@nilsson.home.kraxel.org>
In-Reply-To: <1424075329.3722.0.camel@nilsson.home.kraxel.org>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Wang Xin <wangxinxin.wang@huawei.com>,
	qemu-devel@nongnu.org, peter.huangpeng@huawei.com
Subject: Re: [Qemu-trivial] [PATCH 2/2] qemu-char: add cyrillic key
 'numerosign' to Russian keymap
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
X-List-Received-Date: Mon, 16 Feb 2015 08:33:48 -0000

16.02.2015 11:28, Gerd Hoffmann wrote:
>> 'numerosign' is the numbersign key of Russian keyboard layout, we
>> get this key with press 'shift + 3'. It's missing in current
>> Russian keymap file, this patch fix it.
> 
> 
>>  quotedbl 0x03 shift altgr
>>  numbersign 0x04 shift
> 
> Looks like this line should be removed.

Or alternatively, it should be kept but the patch 1/2 should introduce
"numbersign" not "numerosign".  But I don't know the official name of
this sign.

/mjt

