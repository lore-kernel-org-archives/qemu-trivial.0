Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ag9vH-00053L-A6
	for mharc-qemu-trivial@gnu.org; Wed, 16 Mar 2016 07:47:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60563)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ag9vB-0004vt-Ot
	for qemu-trivial@nongnu.org; Wed, 16 Mar 2016 07:47:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ag9v5-0006b4-RT
	for qemu-trivial@nongnu.org; Wed, 16 Mar 2016 07:47:25 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:37139)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1ag9v0-0006Zd-Vs; Wed, 16 Mar 2016 07:47:15 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id BDEEA40EBF;
	Wed, 16 Mar 2016 14:47:13 +0300 (MSK)
To: Wei Jiangang <weijg.fnst@cn.fujitsu.com>, qemu-devel@nongnu.org
References: <1458121240-2490-1-git-send-email-weijg.fnst@cn.fujitsu.com>
From: Michael Tokarev <mjt@tls.msk.ru>
Openpgp: id=6EE195D1886E8FFB810D4324457CE0A0804465C5
Organization: Telecom Service, JSC
Message-ID: <56E947C0.8050109@msgid.tls.msk.ru>
Date: Wed, 16 Mar 2016 14:47:12 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.6.0
MIME-Version: 1.0
In-Reply-To: <1458121240-2490-1-git-send-email-weijg.fnst@cn.fujitsu.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, aliguori@us.ibm.com,
	ehabkost@redhat.com
Subject: Re: [Qemu-trivial] [PATCH] vl: fix comment about when parsing cpu
	definitions
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
X-List-Received-Date: Wed, 16 Mar 2016 11:47:30 -0000

16.03.2016 12:40, Wei Jiangang wrote:
> machine->init() was replaced with machine_class->init().

Applied to -trivial, adding the commit id where this happened.

Thanks,

/mjt

