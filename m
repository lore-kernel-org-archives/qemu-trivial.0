Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XKNsV-0005S3-B1
	for mharc-qemu-trivial@gnu.org; Thu, 21 Aug 2014 04:37:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53172)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1XKNsO-0005K6-UV
	for qemu-trivial@nongnu.org; Thu, 21 Aug 2014 04:37:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1XKNsK-000211-EF
	for qemu-trivial@nongnu.org; Thu, 21 Aug 2014 04:37:44 -0400
Received: from mx1.redhat.com ([209.132.183.28]:19400)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>)
	id 1XKNsA-0001vN-Q2; Thu, 21 Aug 2014 04:37:30 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s7L8bRf6002150
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Thu, 21 Aug 2014 04:37:28 -0400
Received: from noname.redhat.com (ovpn-116-74.ams2.redhat.com [10.36.116.74])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	SMTP id s7L8bOBC003023; Thu, 21 Aug 2014 04:37:26 -0400
Date: Thu, 21 Aug 2014 10:37:24 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <20140821083724.GF4452@noname.redhat.com>
References: <1408546958-10074-1-git-send-email-mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1408546958-10074-1-git-send-email-mjt@msgid.tls.msk.ru>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org, qemu-devel@nongnu.org,
	stefanha@redhat.com
Subject: Re: [Qemu-trivial] [PATCH v2] block/vvfat.c: remove debugging code
 to reinit stderr if NULL
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
X-List-Received-Date: Thu, 21 Aug 2014 08:37:49 -0000

Am 20.08.2014 um 17:02 hat Michael Tokarev geschrieben:
> Just log to stderr unconditionally, like other similar code does.
> 
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  block/vvfat.c |    9 ---------
>  1 file changed, 9 deletions(-)
> 
> v2: also remove stderr redefinition

Thanks, applied to the block branch.

Kevin

