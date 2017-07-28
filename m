Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1db1Kq-0000FO-2X
	for mharc-qemu-trivial@gnu.org; Fri, 28 Jul 2017 05:13:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56964)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1db1Kn-0000Dc-RO
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 05:13:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1db1Km-0001bu-VO
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 05:13:25 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55376)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kwolf@redhat.com>)
	id 1db1Kh-0001Wf-E1; Fri, 28 Jul 2017 05:13:19 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 756F05ECCC;
	Fri, 28 Jul 2017 09:13:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 756F05ECCC
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=kwolf@redhat.com
Received: from localhost.localdomain (ovpn-117-155.ams2.redhat.com
	[10.36.117.155])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D0EF06F42B;
	Fri, 28 Jul 2017 09:13:16 +0000 (UTC)
Date: Fri, 28 Jul 2017 11:13:15 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Cc: Alberto Garcia <berto@igalia.com>, Max Reitz <mreitz@redhat.com>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org, qemu-block@nongnu.org
Message-ID: <20170728091315.GB3983@localhost.localdomain>
References: <20170728012542.29975-1-f4bug@amsat.org>
	<20170728012542.29975-3-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20170728012542.29975-3-f4bug@amsat.org>
User-Agent: Mutt/1.8.3 (2017-05-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Fri, 28 Jul 2017 09:13:18 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH for 2.10 2/8] docs: fix broken paths to
 docs/interop/qcow2.txt
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
X-List-Received-Date: Fri, 28 Jul 2017 09:13:26 -0000

Am 28.07.2017 um 03:25 hat Philippe Mathieu-Daud=E9 geschrieben:
> Signed-off-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>

Reviewed-by: Kevin Wolf <kwolf@redhat.com>

