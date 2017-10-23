Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e6kPq-0002T1-JF
	for mharc-qemu-trivial@gnu.org; Mon, 23 Oct 2017 17:37:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36643)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rjones@redhat.com>) id 1e6kPo-0002Qy-0O
	for qemu-trivial@nongnu.org; Mon, 23 Oct 2017 17:37:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rjones@redhat.com>) id 1e6kPn-0002kV-7t
	for qemu-trivial@nongnu.org; Mon, 23 Oct 2017 17:37:44 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39950)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <rjones@redhat.com>)
	id 1e6kPi-0002iv-QJ; Mon, 23 Oct 2017 17:37:38 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 93048624A8;
	Mon, 23 Oct 2017 21:37:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 93048624A8
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=rjones@redhat.com
Received: from localhost (ovpn-117-112.ams2.redhat.com [10.36.117.112])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B4B8260BEB;
	Mon, 23 Oct 2017 21:37:34 +0000 (UTC)
Date: Mon, 23 Oct 2017 22:37:33 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Cc: BALATON Zoltan <balaton@eik.bme.hu>,
	=?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
	Stefan Berger <stefanb@linux.vnet.ibm.com>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org,
	=?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@gmail.com>
Message-ID: <20171023213732.GX18285@redhat.com>
References: <20171023213359.23025-1-f4bug@amsat.org>
	<20171023213359.23025-4-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171023213359.23025-4-f4bug@amsat.org>
User-Agent: Mutt/1.5.20 (2009-12-10)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Mon, 23 Oct 2017 21:37:37 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH 3/3] vl: remove unnecessary #ifdef
 CONFIG_TPM
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
X-List-Received-Date: Mon, 23 Oct 2017 21:37:45 -0000


The series fixes the build for me, thanks :-)

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
virt-df lists disk usage of guests without needing to install any
software inside the virtual machine.  Supports Linux and Windows.
http://people.redhat.com/~rjones/virt-df/

