Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YNHRE-0003Db-MU
	for mharc-qemu-trivial@gnu.org; Mon, 16 Feb 2015 03:53:56 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52185)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YNHR9-0003AT-Qt
	for qemu-trivial@nongnu.org; Mon, 16 Feb 2015 03:53:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YNHR6-0008Di-LV
	for qemu-trivial@nongnu.org; Mon, 16 Feb 2015 03:53:51 -0500
Received: from szxga03-in.huawei.com ([119.145.14.66]:57636)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1YNHR6-0008DL-2d; Mon, 16 Feb 2015 03:53:48 -0500
Received: from 172.24.2.119 (EHLO szxeml430-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id BBZ70471; Mon, 16 Feb 2015 16:53:39 +0800 (CST)
Received: from [127.0.0.1] (10.177.19.102) by szxeml430-hub.china.huawei.com
	(10.82.67.185) with Microsoft SMTP Server id 14.3.158.1;
	Mon, 16 Feb 2015 16:53:28 +0800
Message-ID: <54E1AFF2.2070706@huawei.com>
Date: Mon, 16 Feb 2015 16:53:06 +0800
From: Gonglei <arei.gonglei@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>, Gerd Hoffmann <kraxel@redhat.com>
References: <1424059258-11024-1-git-send-email-arei.gonglei@huawei.com>	
	<1424059258-11024-3-git-send-email-arei.gonglei@huawei.com>
	<1424075329.3722.0.camel@nilsson.home.kraxel.org>
	<54E1AB64.3070303@msgid.tls.msk.ru>
In-Reply-To: <54E1AB64.3070303@msgid.tls.msk.ru>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020206.54E1B014.00B0, ss=1, re=0.001, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 012d4fcddc97610bf8343fe010a15939
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
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
X-List-Received-Date: Mon, 16 Feb 2015 08:53:53 -0000

On 2015/2/16 16:33, Michael Tokarev wrote:
> 16.02.2015 11:28, Gerd Hoffmann wrote:
>>> 'numerosign' is the numbersign key of Russian keyboard layout, we
>>> get this key with press 'shift + 3'. It's missing in current
>>> Russian keymap file, this patch fix it.
>>
>>
>>>  quotedbl 0x03 shift altgr
>>>  numbersign 0x04 shift
>>
>> Looks like this line should be removed.
> 
> Or alternatively, it should be kept but the patch 1/2 should introduce
> "numbersign" not "numerosign".  But I don't know the official name of
> this sign.
> 
Both "numbersign" and "numerosign" needed. Although they have the same
keymap characters, their keysym in vnc_keysym.h are different:

static const name2keysym_t name2keysym[]={
...
     { "numbersign",           0x023},
...
    +{"numerosign",                    0x06b0},  /* U+2116 NUMERO SIGN */
...
Please see the provenance:
 http://www.cl.cam.ac.uk/~mgk25/ucs/keysymdef.h
#define XK_numbersign                    0x0023  /* U+0023 NUMBER SIGN */
#define XK_numerosign                    0x06b0  /* U+2116 NUMERO SIGN */

Regards,
-Gonglei


