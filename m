Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cPLVP-0002KS-Lt
	for mharc-qemu-trivial@gnu.org; Thu, 05 Jan 2017 22:47:51 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55135)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jasowang@redhat.com>) id 1cPLVM-0002HU-39
	for qemu-trivial@nongnu.org; Thu, 05 Jan 2017 22:47:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jasowang@redhat.com>) id 1cPLVL-0004N2-Ds
	for qemu-trivial@nongnu.org; Thu, 05 Jan 2017 22:47:48 -0500
Received: from mx1.redhat.com ([209.132.183.28]:40616)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <jasowang@redhat.com>)
	id 1cPLVH-0004KQ-1e; Thu, 05 Jan 2017 22:47:43 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 04DD664098;
	Fri,  6 Jan 2017 03:47:42 +0000 (UTC)
Received: from [10.72.5.59] (vpn1-5-59.pek2.redhat.com [10.72.5.59])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v063lYvZ003238
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 5 Jan 2017 22:47:37 -0500
To: Zhang Chen <zhangchen.fnst@cn.fujitsu.com>
References: <1480575357-25056-1-git-send-email-zhangchen.fnst@cn.fujitsu.com>
	<a1593129-ddb9-8e74-5865-b1e8400c991d@redhat.com>
	<8b90a1da-a129-f2cb-4545-355348387925@cn.fujitsu.com>
	<063dfa33-2015-e566-c623-d59578c20fcd@redhat.com>
	<13aed710-c5d1-b1de-5922-52e3e53029f9@cn.fujitsu.com>
	<956d6c43-0904-e094-1adb-bb7c584967d0@vivier.eu>
	<20161207133049.GA32099@stefanha-x1.localdomain>
	<fc30a10e-10d5-6b53-d098-f00780cdbe16@cn.fujitsu.com>
	<5dd2f20f-07dd-5120-13bf-ea5700880ecf@cn.fujitsu.com>
	<2c9fbac0-0169-b7fb-ce0b-ce3408834531@cn.fujitsu.com>
Cc: Laurent Vivier <lvivier@redhat.com>,
	QEMU Trivial <qemu-trivial@nongnu.org>, Stefan Hajnoczi
	<stefanha@gmail.com>,
	qemu devel <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>, 
	Stefan Weil <sw@weilnetz.de>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <0b08c3a0-f519-c308-6fe7-99ba152611f2@redhat.com>
Date: Fri, 6 Jan 2017 11:47:35 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <2c9fbac0-0169-b7fb-ce0b-ce3408834531@cn.fujitsu.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Fri, 06 Jan 2017 03:47:42 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH for-2.9] docs: Fix
 description of the sentence
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
X-List-Received-Date: Fri, 06 Jan 2017 03:47:50 -0000



On 2017=E5=B9=B401=E6=9C=8806=E6=97=A5 11:33, Zhang Chen wrote:
> Ping....

Applied to -net. Thanks

