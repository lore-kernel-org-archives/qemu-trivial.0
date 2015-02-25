Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YQWHq-0001xL-VV
	for mharc-qemu-trivial@gnu.org; Wed, 25 Feb 2015 02:21:38 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55449)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YQWHj-0001og-Ti
	for qemu-trivial@nongnu.org; Wed, 25 Feb 2015 02:21:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YQWHf-0002PS-7h
	for qemu-trivial@nongnu.org; Wed, 25 Feb 2015 02:21:31 -0500
Received: from szxga02-in.huawei.com ([119.145.14.65]:41497)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1YQWHd-0002Or-Mc; Wed, 25 Feb 2015 02:21:27 -0500
Received: from 172.24.2.119 (EHLO szxeml426-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CHQ56484; Wed, 25 Feb 2015 15:21:12 +0800 (CST)
Received: from [127.0.0.1] (10.177.19.102) by szxeml426-hub.china.huawei.com
	(10.82.67.181) with Microsoft SMTP Server id 14.3.158.1;
	Wed, 25 Feb 2015 15:21:01 +0800
Message-ID: <54ED77C0.7040402@huawei.com>
Date: Wed, 25 Feb 2015 15:20:32 +0800
From: Gonglei <arei.gonglei@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Gerd Hoffmann <kraxel@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>
References: <1424059258-11024-1-git-send-email-arei.gonglei@huawei.com>			
	<1424059258-11024-3-git-send-email-arei.gonglei@huawei.com>		
	<1424075329.3722.0.camel@nilsson.home.kraxel.org>		
	<54E1AB64.3070303@msgid.tls.msk.ru> <54E1AFF2.2070706@huawei.com>	
	<1424081886.3722.9.camel@nilsson.home.kraxel.org>	
	<54E1C60F.2040602@msgid.tls.msk.ru>
	<1424084529.3722.20.camel@nilsson.home.kraxel.org>
In-Reply-To: <1424084529.3722.20.camel@nilsson.home.kraxel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
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
X-List-Received-Date: Wed, 25 Feb 2015 07:21:37 -0000

On 2015/2/16 19:02, Gerd Hoffmann wrote:
> On Mo, 2015-02-16 at 13:27 +0300, Michael Tokarev wrote:
>> 16.02.2015 13:18, Gerd Hoffmann wrote:
>> []
>>> But the russian keymap needs numerosign only, right?
>>> Or does a russian keyboard have *both*?
>>
>> Now maybe I don't understand how keymap works.
>>
>> When switching my keyboard to russian (cyrillic) layout,
>> I can't type # without switching back to latin layout.
>> Both symbols are produced by the same key - it is key
>> with number 3 on it, when used with Shift.  On latin
>> layout it produces #, on cyrillic layout it produces №.
> 
> As the patch description suggests.  Thanks for confirming.
> 
>> Does it mean the layout does not have # key?
> 
> It might be somewhere else, in theory.  Seems not to be the case for the
> russian layout though.
> 
> On a german keyboard shift-3 is '§', and the number sign is somewhere
> else.  So I can get '#' with both 'us' and 'de' layouts, but I have to
> use different keys ...
> 
I think the number sign(#) should be deleted from russian keymap file, for
the following reasons:
(1) In standard Russian keyboard layout we can not find key '#'[1][2];
(2) on the other hand, '№' is Russian number sign[3], so there is no need '#'
    in Russian input mode.

  [1] http://en.wikipedia.org/wiki/Keyboard_layout#Russian
  [2] http://kbd-intl.narod.ru/english/layouts
  [3] http://en.wikipedia.org/wiki/Numero_sign

Any thoughts?

Regards,
-Gonglei



