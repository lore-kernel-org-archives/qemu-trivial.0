Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hT6pm-00042s-QH
	for mharc-qemu-trivial@gnu.org; Tue, 21 May 2019 11:37:46 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59185)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.williamson@redhat.com>) id 1hT6pl-000420-AU
	for qemu-trivial@nongnu.org; Tue, 21 May 2019 11:37:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.williamson@redhat.com>) id 1hT6pk-0000tG-JV
	for qemu-trivial@nongnu.org; Tue, 21 May 2019 11:37:45 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50601)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alex.williamson@redhat.com>)
	id 1hT6ph-0000s5-0J; Tue, 21 May 2019 11:37:42 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9F941307CDEA;
	Tue, 21 May 2019 15:37:39 +0000 (UTC)
Received: from x1.home (ovpn-117-92.phx2.redhat.com [10.3.117.92])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 192EE19C71;
	Tue, 21 May 2019 15:37:37 +0000 (UTC)
Date: Tue, 21 May 2019 09:37:36 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Li Qiang <liq3ea@163.com>
Cc: lvivier@redhat.com, qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	liq3ea@gmail.com, philmd@redhat.com
Message-ID: <20190521093736.417e8940@x1.home>
In-Reply-To: <20190521151543.92274-1-liq3ea@163.com>
References: <20190521151543.92274-1-liq3ea@163.com>
Organization: Red Hat
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.49]);
	Tue, 21 May 2019 15:37:39 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH v2 0/4] hw: vfio: some trivial fix
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
X-List-Received-Date: Tue, 21 May 2019 15:37:46 -0000

On Tue, 21 May 2019 08:15:39 -0700
Li Qiang <liq3ea@163.com> wrote:

> These patchset fix some trivial issues,
> The first patch makes the code more QOMConventions.
> The second decouples VMStateDescription's name with
> QOM TypeInfo's name.
> The third fixes a typo.
> The fourth reduce duplicated code.
> 
> Change since v1:
> Add more commit message.

Thank you for making this series 'trivial' by providing explanation and
justification for each change.  If trivial wants to include this, for
series:

Acked-by: Alex Williamson <alex.williamson@redhat.com>

