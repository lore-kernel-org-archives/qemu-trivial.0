Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fKb2F-0004O8-13
	for mharc-qemu-trivial@gnu.org; Sun, 20 May 2018 22:58:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55379)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jasowang@redhat.com>) id 1fKb2D-0004Ms-3b
	for qemu-trivial@nongnu.org; Sun, 20 May 2018 22:58:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jasowang@redhat.com>) id 1fKb2C-0001XQ-Bf
	for qemu-trivial@nongnu.org; Sun, 20 May 2018 22:58:53 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:37952 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <jasowang@redhat.com>)
	id 1fKb26-0001VM-AS; Sun, 20 May 2018 22:58:46 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D88A9401DEA6;
	Mon, 21 May 2018 02:58:44 +0000 (UTC)
Received: from [10.72.12.38] (ovpn-12-38.pek2.redhat.com [10.72.12.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D4BF5215CDA7;
	Mon, 21 May 2018 02:58:42 +0000 (UTC)
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, qemu-trivial@nongnu.org
References: <1526401580-20535-1-git-send-email-thuth@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <a7297881-4e9b-4a41-d7e8-553afa47ce60@redhat.com>
Date: Mon, 21 May 2018 10:58:39 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <1526401580-20535-1-git-send-email-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Mon, 21 May 2018 02:58:44 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Mon, 21 May 2018 02:58:44 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'jasowang@redhat.com' RCPT:''
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [PATCH] qapi/net.json: Fix the version number of
 the "vlan" removal
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
X-List-Received-Date: Mon, 21 May 2018 02:58:54 -0000



On 2018=E5=B9=B405=E6=9C=8816=E6=97=A5 00:26, Thomas Huth wrote:
> "vlan" will be dropped in 2.13, not in 2.12. And while we're at it,
> use the better wording "dropped in" instead of "removed with" (also
> for the "dump" removal).
>
> Reported-by: Stefan Hajnoczi <stefanha@redhat.com>
> Reported-by: Eric Blake <eblake@redhat.com>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   qapi/net.json | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/qapi/net.json b/qapi/net.json
> index b4fe4b6..b8adf1f 100644
> --- a/qapi/net.json
> +++ b/qapi/net.json
> @@ -450,7 +450,7 @@
>   #
>   # Since: 2.7
>   #
> -# 'dump' - removed with 2.12
> +# 'dump': dropped in 2.12
>   ##
>   { 'enum': 'NetClientDriver',
>     'data': [ 'none', 'nic', 'user', 'tap', 'l2tpv3', 'socket', 'vde',
> @@ -498,7 +498,7 @@
>   #
>   # Since: 1.2
>   #
> -# 'vlan' - removed with 2.12
> +# 'vlan': dropped in 2.13
>   ##
>   { 'struct': 'NetLegacy',
>     'data': {

Applied.

Thanks

