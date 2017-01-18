Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cTfmu-0008MM-1M
	for mharc-qemu-trivial@gnu.org; Tue, 17 Jan 2017 21:15:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48452)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1cTfmq-0008JH-OT
	for qemu-trivial@nongnu.org; Tue, 17 Jan 2017 21:15:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1cTfmp-0005Ur-Ty
	for qemu-trivial@nongnu.org; Tue, 17 Jan 2017 21:15:44 -0500
Received: from mx1.redhat.com ([209.132.183.28]:52402)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <famz@redhat.com>)
	id 1cTfmk-0005TF-EY; Tue, 17 Jan 2017 21:15:38 -0500
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 994C48F039;
	Wed, 18 Jan 2017 02:15:38 +0000 (UTC)
Received: from localhost (ovpn-8-17.pek2.redhat.com [10.72.8.17])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v0I2FYHO017035; Tue, 17 Jan 2017 21:15:37 -0500
Date: Wed, 18 Jan 2017 10:15:29 +0800
From: Fam Zheng <famz@redhat.com>
To: Ziyue Yang <skiver.cloud.yzy@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
	Ziyue Yang <yzylivezh@hotmail.com>, Anthony Liguori <aliguori@us.ibm.com>
Message-ID: <20170118021529.GC31883@lemon.Home>
References: <1484702885-11437-1-git-send-email-skiver.cloud.yzy@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1484702885-11437-1-git-send-email-skiver.cloud.yzy@gmail.com>
User-Agent: Mutt/1.7.1 (2016-10-04)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Wed, 18 Jan 2017 02:15:38 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v3] gdbstub.c: fix GDB
 connection segfault caused by empty machines
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
X-List-Received-Date: Wed, 18 Jan 2017 02:15:46 -0000

On Wed, 01/18 09:28, Ziyue Yang wrote:
> Also some updates from fprintf(stderr, ...) to error_report.

Looks like they belong to a separate patch.

Fam

