Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fpC0y-0004Hc-Gg
	for mharc-qemu-trivial@gnu.org; Mon, 13 Aug 2018 08:32:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46057)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1fpC0q-0004GT-MM
	for qemu-trivial@nongnu.org; Mon, 13 Aug 2018 08:31:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1fpC0p-0005JU-TM
	for qemu-trivial@nongnu.org; Mon, 13 Aug 2018 08:31:56 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:60412 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1fpC0k-0005Fu-OD; Mon, 13 Aug 2018 08:31:50 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1FDE187A50;
	Mon, 13 Aug 2018 12:31:50 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-117-62.ams2.redhat.com
	[10.36.117.62])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E56A92142F20;
	Mon, 13 Aug 2018 12:31:49 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id A0164113864F; Mon, 13 Aug 2018 14:31:48 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org, Harald Hoyer <harald@redhat.com>
References: <1534161104-8253-1-git-send-email-thuth@redhat.com>
Date: Mon, 13 Aug 2018 14:31:48 +0200
In-Reply-To: <1534161104-8253-1-git-send-email-thuth@redhat.com> (Thomas
	Huth's message of "Mon, 13 Aug 2018 13:51:44 +0200")
Message-ID: <87y3da5txn.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Mon, 13 Aug 2018 12:31:50 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Mon, 13 Aug 2018 12:31:50 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'armbru@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qemu-options: Fix bad
 "macaddr" property in the documentation
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
X-List-Received-Date: Mon, 13 Aug 2018 12:32:00 -0000

Thomas Huth <thuth@redhat.com> writes:

> When using the "-device" option, the property is called "mac".
> "macaddr" is only used for the legacy "-net nic" option.

Indeed:

    #define DEFINE_NIC_PROPERTIES(_state, _conf)                            \
--->    DEFINE_PROP_MACADDR("mac",   _state, _conf.macaddr),                \
        DEFINE_PROP_NETDEV("netdev", _state, _conf.peers)

> Reported-by: Harald Hoyer <harald@redhat.com>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  qemu-options.hx | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/qemu-options.hx b/qemu-options.hx
> index b1bf0f4..3495531 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -2345,7 +2345,7 @@ qemu-system-i386 linux.img \
>                   -netdev socket,id=n2,mcast=230.0.0.1:1234
>  # launch yet another QEMU instance on same "bus"
>  qemu-system-i386 linux.img \
> -                 -device e1000,netdev=n3,macaddr=52:54:00:12:34:58 \
> +                 -device e1000,netdev=n3,mac=52:54:00:12:34:58 \
>                   -netdev socket,id=n3,mcast=230.0.0.1:1234
>  @end example

Reviewed-by: Markus Armbruster <armbru@redhat.com>

