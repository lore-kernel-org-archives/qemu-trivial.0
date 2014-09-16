Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XTkGR-0001I3-DJ
	for mharc-qemu-trivial@gnu.org; Tue, 16 Sep 2014 00:21:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42507)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XTkGL-0001AB-4z
	for qemu-trivial@nongnu.org; Tue, 16 Sep 2014 00:21:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XTkGG-0002E7-12
	for qemu-trivial@nongnu.org; Tue, 16 Sep 2014 00:21:09 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:55408)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XTkG5-0002D9-T5; Tue, 16 Sep 2014 00:20:54 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 456F44463C;
	Tue, 16 Sep 2014 08:20:49 +0400 (MSK)
Message-ID: <5417BAA0.6070607@msgid.tls.msk.ru>
Date: Tue, 16 Sep 2014 08:20:48 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.7.0
MIME-Version: 1.0
To: Li Liu <john.liuli@huawei.com>, armbru@redhat.com
References: <1410261588-8360-1-git-send-email-john.liuli@huawei.com>
	<5416E094.9070500@msgid.tls.msk.ru>
	<5416E22B.9060002@msgid.tls.msk.ru> <5417950C.1040004@huawei.com>
In-Reply-To: <5417950C.1040004@huawei.com>
X-Enigmail-Version: 1.6
OpenPGP: id=804465C5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, kraxel@redhat.com, qemu-devel@nongnu.org,
	peter.huangpeng@huawei.com
Subject: Re: [Qemu-trivial] [PATCH v2] qemu-char: fix terminal crash when
 using "-monitor stdio -nographic"
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
X-List-Received-Date: Tue, 16 Sep 2014 04:21:14 -0000

16.09.2014 05:40, Li Liu wrote:
> Thanks four your comments! Can you help do this when applying
> incidentally? Or I will resend it again?

http://git.corpit.ru/?p=qemu.git;a=commit;h=6dbc7173f25747b2ed9f3f322ac9697feffe4bf7 --
applied yesteday :)

Thanks,

/mjt

