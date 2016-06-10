Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bBMOr-00075d-7U
	for mharc-qemu-trivial@gnu.org; Fri, 10 Jun 2016 09:23:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55130)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bBMOo-000740-Qc
	for qemu-trivial@nongnu.org; Fri, 10 Jun 2016 09:22:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bBMOn-0005Em-UV
	for qemu-trivial@nongnu.org; Fri, 10 Jun 2016 09:22:58 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:52566)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1bBMOg-00058c-QV; Fri, 10 Jun 2016 09:22:50 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id C169C4100D;
	Fri, 10 Jun 2016 16:22:35 +0300 (MSK)
Received: from [192.168.177.7] (wh.tls.msk.ru [192.168.177.7])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id 4F7EFB0B;
	Fri, 10 Jun 2016 16:22:34 +0300 (MSK)
To: Changlong Xie <xiecl.fnst@cn.fujitsu.com>,
	qemu devel <qemu-devel@nongnu.org>, qemu trival <qemu-trivial@nongnu.org>, 
	Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <famz@redhat.com>,
	Max Reitz <mreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
	Jeff Cody <jcody@redhat.com>
References: <1465348292-26750-1-git-send-email-xiecl.fnst@cn.fujitsu.com>
Cc: Wen Congyang <wency@cn.fujitsu.com>,
	zhanghailiang <zhang.zhanghailiang@huawei.com>,
	qemu block <qemu-block@nongnu.org>, Eric Blake <eblake@redhat.com>,
	Jiang Yunhong <yunhong.jiang@intel.com>,
	Dong Eddie <eddie.dong@intel.com>, 
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Markus Armbruster <armbru@redhat.com>, Gonglei <arei.gonglei@huawei.com>,
	Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <575ABF1A.5010009@msgid.tls.msk.ru>
Date: Fri, 10 Jun 2016 16:22:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.8.0
MIME-Version: 1.0
In-Reply-To: <1465348292-26750-1-git-send-email-xiecl.fnst@cn.fujitsu.com>
Content-Type: text/plain; charset=koi8-r
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH v20 00/10] Block replication for
 continuous checkpoints
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 10 Jun 2016 13:22:59 -0000

08.06.2016 04:11, Changlong Xie wrote:
> Block replication is a very important feature which is used for
> continuous checkpoints(for example: COLO).
...

I'm not sure I understand why this has been sent to qemu-trivial? :)

Thanks

/mjt

