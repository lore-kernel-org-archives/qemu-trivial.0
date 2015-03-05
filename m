Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YTSK9-0002Se-Od
	for mharc-qemu-trivial@gnu.org; Thu, 05 Mar 2015 04:44:09 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52726)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YTSK6-0002Ll-4R
	for qemu-trivial@nongnu.org; Thu, 05 Mar 2015 04:44:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YTSK1-0000eJ-1C
	for qemu-trivial@nongnu.org; Thu, 05 Mar 2015 04:44:06 -0500
Received: from szxga03-in.huawei.com ([119.145.14.66]:29846)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1YTSK0-0000b2-8q; Thu, 05 Mar 2015 04:44:00 -0500
Received: from 172.24.2.119 (EHLO szxeml433-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id BCQ59596; Thu, 05 Mar 2015 17:43:43 +0800 (CST)
Received: from [127.0.0.1] (10.177.19.102) by szxeml433-hub.china.huawei.com
	(10.82.67.210) with Microsoft SMTP Server id 14.3.158.1; Thu, 5 Mar 2015
	17:43:35 +0800
Message-ID: <54F82535.1050903@huawei.com>
Date: Thu, 5 Mar 2015 17:43:17 +0800
From: Gonglei <arei.gonglei@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Markus Armbruster <armbru@redhat.com>
References: <1425023419-12244-1-git-send-email-arei.gonglei@huawei.com>	<1425023419-12244-3-git-send-email-arei.gonglei@huawei.com>	<54F705B0.8040308@msgid.tls.msk.ru>
	<54F7BEC9.1060204@huawei.com>
	<87oao7zv8m.fsf@blackfin.pond.sub.org>
In-Reply-To: <87oao7zv8m.fsf@blackfin.pond.sub.org>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020201.54F82551.0070, ss=1, re=0.001, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 406bb2d8c6b263b749a9cd1411e78e9a
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org,
	peter.huangpeng@huawei.com
Subject: Re: [Qemu-trivial] [Qemu-devel]  [PATCH 2/9] arm: fix memory leak
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
X-List-Received-Date: Thu, 05 Mar 2015 09:44:06 -0000

On 2015/3/5 16:47, Markus Armbruster wrote:
> Hard-won personal experience: the more trivial a change is, the more
> likely I am to screw it up in some stupid way.
> 
> In other words: no change is too trivial to screw it up.
> 
> Corollary: no change is trivial enough to skip testing.
I can't agree any more.    Never again. :(

Regards,
-Gonglei


