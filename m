Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dwPHK-00036t-Ed
	for mharc-qemu-trivial@gnu.org; Mon, 25 Sep 2017 05:02:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55777)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1dwPHG-00033t-Nw
	for qemu-trivial@nongnu.org; Mon, 25 Sep 2017 05:02:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1dwPHB-0004im-2V
	for qemu-trivial@nongnu.org; Mon, 25 Sep 2017 05:02:10 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42452)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <stefanha@redhat.com>)
	id 1dwPGz-0004bz-KC; Mon, 25 Sep 2017 05:01:53 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A6EA08764C;
	Mon, 25 Sep 2017 09:01:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com A6EA08764C
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=stefanha@redhat.com
Received: from localhost (ovpn-117-160.ams2.redhat.com [10.36.117.160])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8C33F5C3FA;
	Mon, 25 Sep 2017 09:01:45 +0000 (UTC)
Date: Mon, 25 Sep 2017 10:01:44 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	=?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, Zhang Chen <zhangckid@gmail.com>,
	Li Zhijian <lizhijian@cn.fujitsu.com>, Jason Wang <jasowang@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Michael Roth <mdroth@linux.vnet.ibm.com>,
	Ben Warren <ben@skyportsystems.com>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Message-ID: <20170925090144.GB14140@stefanha-x1.localdomain>
References: <20170922154014.29350-1-f4bug@amsat.org>
	<20170922154014.29350-5-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20170922154014.29350-5-f4bug@amsat.org>
User-Agent: Mutt/1.8.3 (2017-05-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Mon, 25 Sep 2017 09:01:52 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH 04/34] misc: remove headers implicitly
 included
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
X-List-Received-Date: Mon, 25 Sep 2017 09:02:13 -0000

On Fri, Sep 22, 2017 at 12:39:44PM -0300, Philippe Mathieu-Daud=E9 wrote:
> applied using ./scripts/clean-includes
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
> ---
>  hw/audio/fmopl.h             | 1 -
>  bsd-user/main.c              | 1 -
>  chardev/wctablet.c           | 4 ----
>  hw/scsi/vhost-user-scsi.c    | 1 -
>  linux-user/main.c            | 1 -
>  net/colo-compare.c           | 1 -
>  tests/test-aio-multithread.c | 1 -
>  tests/test-clone-visitor.c   | 1 -
>  tests/vmgenid-test.c         | 3 ---
>  9 files changed, 14 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

