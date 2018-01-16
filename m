Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ebKbh-0007N1-24
	for mharc-qemu-trivial@gnu.org; Tue, 16 Jan 2018 01:20:25 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41732)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jasowang@redhat.com>) id 1ebKbe-0007L9-Ij
	for qemu-trivial@nongnu.org; Tue, 16 Jan 2018 01:20:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jasowang@redhat.com>) id 1ebKbd-0006IK-Kt
	for qemu-trivial@nongnu.org; Tue, 16 Jan 2018 01:20:22 -0500
Received: from mx1.redhat.com ([209.132.183.28]:34350)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <jasowang@redhat.com>)
	id 1ebKbY-0006GJ-Az; Tue, 16 Jan 2018 01:20:16 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 78B478762C;
	Tue, 16 Jan 2018 06:20:15 +0000 (UTC)
Received: from [10.72.12.132] (ovpn-12-132.pek2.redhat.com [10.72.12.132])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7C9285D96E;
	Tue, 16 Jan 2018 06:20:02 +0000 (UTC)
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
References: <1516002017-4981-1-git-send-email-thuth@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <8655aba8-9d63-b101-e3fc-2dbc446ec2c3@redhat.com>
Date: Tue, 16 Jan 2018 14:20:00 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <1516002017-4981-1-git-send-email-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Tue, 16 Jan 2018 06:20:15 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] qemu-doc: Get rid of "vlan=X" example in
 the documentation
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
X-List-Received-Date: Tue, 16 Jan 2018 06:20:23 -0000



On 2018=E5=B9=B401=E6=9C=8815=E6=97=A5 15:40, Thomas Huth wrote:
> The vlan concept is marked as deprecated, so we should not use
> this for examples in the documentation anymore.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   qemu-options.hx | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 130016c..d0c8b06 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -2257,8 +2257,8 @@ qemu-system-i386 linux.img -net nic -net tap
>   #launch a QEMU instance with two NICs, each one connected
>   #to a TAP device
>   qemu-system-i386 linux.img \
> -                 -net nic,vlan=3D0 -net tap,vlan=3D0,ifname=3Dtap0 \
> -                 -net nic,vlan=3D1 -net tap,vlan=3D1,ifname=3Dtap1
> +        -netdev tap,id=3Dnd0,ifname=3Dtap0 -device e1000,netdev=3Dnd0 =
\
> +        -netdev tap,id=3Dnd1,ifname=3Dtap1 -device rtl8139,netdev=3Dnd=
1
>   @end example
>  =20
>   @example

Applied.

Thanks

