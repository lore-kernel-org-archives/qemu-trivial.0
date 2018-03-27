Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1f0f0t-0001By-3K
	for mharc-qemu-trivial@gnu.org; Mon, 26 Mar 2018 23:11:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34153)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1f0f0r-0001AC-Bt
	for qemu-trivial@nongnu.org; Mon, 26 Mar 2018 23:11:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1f0f0o-0007EG-6p
	for qemu-trivial@nongnu.org; Mon, 26 Mar 2018 23:11:05 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:38806 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <famz@redhat.com>)
	id 1f0f0d-00077m-Jv; Mon, 26 Mar 2018 23:10:51 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E83CC401DE71;
	Tue, 27 Mar 2018 03:10:45 +0000 (UTC)
Received: from localhost (ovpn-12-30.pek2.redhat.com [10.72.12.30])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 808DB219AAC2;
	Tue, 27 Mar 2018 03:10:40 +0000 (UTC)
Date: Tue, 27 Mar 2018 11:10:37 +0800
From: Fam Zheng <famz@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Cc: qemu-devel@nongnu.org, Alexander Graf <agraf@suse.de>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-block@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, qemu-trivial@nongnu.org,
	Alberto Garcia <berto@igalia.com>, qemu-ppc@nongnu.org,
	Kevin Wolf <kwolf@redhat.com>,
	Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
	Max Reitz <mreitz@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	qemu-arm@nongnu.org, Yongbok Kim <yongbok.kim@mips.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Markus Armbruster <armbru@redhat.com>, Jason Wang <jasowang@redhat.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Eduardo Habkost <ehabkost@redhat.com>, Eric Blake <eblake@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <rth@twiddle.net>
Message-ID: <20180327031037.GI31422@lemon.usersys.redhat.com>
References: <20180323143202.28879-1-lvivier@redhat.com>
	<20180323143202.28879-5-lvivier@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180323143202.28879-5-lvivier@redhat.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Tue, 27 Mar 2018 03:10:46 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Tue, 27 Mar 2018 03:10:46 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'famz@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [PATCH v2 4/5] qdict: remove useless cast
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
X-List-Received-Date: Tue, 27 Mar 2018 03:11:06 -0000

On Fri, 03/23 15:32, Laurent Vivier wrote:
> Re-run Coccinelle script scripts/coccinelle/qobject.cocci
> 
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>

This time for the right revision of the patch:

Acked-by: Fam Zheng <famz@redhat.com>

