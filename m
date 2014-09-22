Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XVx2u-00008L-TE
	for mharc-qemu-trivial@gnu.org; Mon, 22 Sep 2014 02:24:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50904)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1XVx2o-0008RU-2a
	for qemu-trivial@nongnu.org; Mon, 22 Sep 2014 02:24:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1XVx2j-0002Ff-4D
	for qemu-trivial@nongnu.org; Mon, 22 Sep 2014 02:24:18 -0400
Received: from mx1.redhat.com ([209.132.183.28]:22549)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1XVx2Y-0002Dc-B3; Mon, 22 Sep 2014 02:24:02 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s8M6Npx8002473
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Mon, 22 Sep 2014 02:23:51 -0400
Received: from blackfin.pond.sub.org (ovpn-116-46.ams2.redhat.com
	[10.36.116.46])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s8M6NmDf024489
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Mon, 22 Sep 2014 02:23:50 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 02CC230403B0; Mon, 22 Sep 2014 08:23:47 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>
References: <1411097848-3900-1-git-send-email-zhang.zhanghailiang@huawei.com>
	<541D8812.1040406@msgid.tls.msk.ru>
Date: Mon, 22 Sep 2014 08:23:47 +0200
In-Reply-To: <541D8812.1040406@msgid.tls.msk.ru> (Michael Tokarev's message of
	"Sat, 20 Sep 2014 17:58:42 +0400")
Message-ID: <87ppeow4uk.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, peter.huangpeng@huawei.com, luonengjun@huawei.com,
	zhanghailiang <zhang.zhanghailiang@huawei.com>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v1] vl: Fix possible freed
	memory accessing
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
X-List-Received-Date: Mon, 22 Sep 2014 06:24:23 -0000

Michael Tokarev <mjt@tls.msk.ru> writes:

> Applied to -trivial, thank you!

Makes my 'hmp: Remove "info pcmcia"' conflict.  Either revert this one
before applying mine, or resolve the conflict and drop the paragraph
about the bug from my commit message.

