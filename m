Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YpZfK-0003Fc-QM
	for mharc-qemu-trivial@gnu.org; Tue, 05 May 2015 06:01:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56298)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1YpZfE-00033r-5P
	for qemu-trivial@nongnu.org; Tue, 05 May 2015 06:01:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1YpZf6-00017i-UT
	for qemu-trivial@nongnu.org; Tue, 05 May 2015 06:01:20 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43262)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>)
	id 1YpZeQ-0000qy-JJ; Tue, 05 May 2015 06:00:30 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t459tIm0023303
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Tue, 5 May 2015 05:55:19 -0400
Received: from [10.36.116.78] (ovpn-116-78.ams2.redhat.com [10.36.116.78])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t459tBOM021038; Tue, 5 May 2015 05:55:13 -0400
Message-ID: <1430819710.28106.5.camel@nilsson.home.kraxel.org>
From: Gerd Hoffmann <kraxel@redhat.com>
To: Gonglei <arei.gonglei@huawei.com>
Date: Tue, 05 May 2015 11:55:10 +0200
In-Reply-To: <55408699.5030201@huawei.com>
References: <1430212264-9672-1-git-send-email-arei.gonglei@huawei.com>
	<1430212264-9672-3-git-send-email-arei.gonglei@huawei.com>
	<55407ED3.102@msgid.tls.msk.ru> <55408699.5030201@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Hans de Goede <hdegoede@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 2/3] xhci: remove unused code
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
X-List-Received-Date: Tue, 05 May 2015 10:01:25 -0000

  Hi,


> > So, I think if we were to drop this assignment, we should
> > remove the initializer too.  But before doing this, I think
> > we should try to remember _why_ this assignment is here in
> > the first place. The code looks like after the loop, this
> > ep variable was supposed to be used for something.  Or is
> > it just a leftover from 518ad5f2a075 (Cc'ing the author)?
> > 
> I can't agree with you more. :)

Yes, certainly looks like a 518ad5f2a075 leftover.
Should be ok to cleanup.

cheers,
  Gerd



