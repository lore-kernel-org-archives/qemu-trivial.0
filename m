Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dek8x-0005X5-IX
	for mharc-qemu-trivial@gnu.org; Mon, 07 Aug 2017 11:40:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37484)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eterrell@redhat.com>) id 1deiv6-0003nq-J6
	for qemu-trivial@nongnu.org; Mon, 07 Aug 2017 10:22:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eterrell@redhat.com>) id 1deiv5-0005oM-ID
	for qemu-trivial@nongnu.org; Mon, 07 Aug 2017 10:22:12 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54168)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eterrell@redhat.com>)
	id 1deiv0-0005iU-Qp; Mon, 07 Aug 2017 10:22:06 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8E0B97AE97;
	Mon,  7 Aug 2017 14:16:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 8E0B97AE97
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=eterrell@redhat.com
Received: from bluepex.com (ovpn-116-251.ams2.redhat.com [10.36.116.251])
	by smtp.corp.redhat.com (Postfix) with SMTP id 83B637FE80;
	Mon,  7 Aug 2017 14:16:06 +0000 (UTC)
Date: Mon, 7 Aug 2017 16:16:05 +0200
From: Eduardo Otubo <eterrell@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: Eduardo Otubo <otubo@redhat.com>, qemu-trivial@nongnu.org,
	thuth@redhat.com, gxt@mprc.pku.edu.cn, qemu-devel@nongnu.org
Message-ID: <20170807141604.GA14212@bluepex.com>
Mail-Followup-To: Michael Tokarev <mjt@tls.msk.ru>,
	Eduardo Otubo <otubo@redhat.com>, qemu-trivial@nongnu.org,
	thuth@redhat.com, gxt@mprc.pku.edu.cn, qemu-devel@nongnu.org
References: <20170728115131.31725-1-otubo@redhat.com>
	<a6feb869-e73e-ffd3-278e-23fef4ae6a0c@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a6feb869-e73e-ffd3-278e-23fef4ae6a0c@msgid.tls.msk.ru>
User-Agent: Mutt/1.8.3 (2017-05-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Mon, 07 Aug 2017 14:16:23 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
X-Mailman-Approved-At: Mon, 07 Aug 2017 11:40:34 -0400
Subject: Re: [Qemu-trivial] [PATCH] unicore32: abort when entering "x 0" on
 the monitor
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
X-List-Received-Date: Mon, 07 Aug 2017 14:22:13 -0000

On Mon, Jul 31, 2017 at 01:17:03PM +0300, Michael Tokarev wrote:
> 28.07.2017 14:51, Eduardo Otubo wrote:
> > Starting Qemu with "qemu-system-unicore32 -M puv3,accel=qtest -S -nographic"
> > and entering "x 0 " at the monitor prompt leads to abort():
> 
> Applied to -trivial, thanks!
> 

Hi Michael, you missed this patch in the latest pull request. Care to
take it on the next one? I'm planning to send some other small fixes
until this Friday.

Regards,

-- 
Eduardo Otubo
Senior Software Engineer @ RedHat

