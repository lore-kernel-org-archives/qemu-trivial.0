Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bRs5V-0002QC-SG
	for mharc-qemu-trivial@gnu.org; Mon, 25 Jul 2016 22:27:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39138)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jasowang@redhat.com>) id 1bRs5T-0002Na-Dk
	for qemu-trivial@nongnu.org; Mon, 25 Jul 2016 22:27:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jasowang@redhat.com>) id 1bRs5S-0001eH-Fm
	for qemu-trivial@nongnu.org; Mon, 25 Jul 2016 22:27:15 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60137)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jasowang@redhat.com>)
	id 1bRs5N-0001cx-3b; Mon, 25 Jul 2016 22:27:09 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A99E8C05AA4E;
	Tue, 26 Jul 2016 02:27:08 +0000 (UTC)
Received: from [10.72.7.11] (vpn1-7-11.pek2.redhat.com [10.72.7.11])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u6Q2R3uS008854
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 25 Jul 2016 22:27:06 -0400
To: Changlong Xie <xiecl.fnst@cn.fujitsu.com>,
	Dmitry Fleytman <dmitry@daynix.com>, qemu devel <qemu-devel@nongnu.org>,
	qemu trival <qemu-trivial@nongnu.org>
References: <1469425667-20703-1-git-send-email-xiecl.fnst@cn.fujitsu.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <5796CA77.3030703@redhat.com>
Date: Tue, 26 Jul 2016 10:27:03 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <1469425667-20703-1-git-send-email-xiecl.fnst@cn.fujitsu.com>
Content-Type: text/plain; charset=utf-8; format=flowed
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Tue, 26 Jul 2016 02:27:08 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] hw/net/e1000e: Fix
 compiler warning
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
X-List-Received-Date: Tue, 26 Jul 2016 02:27:16 -0000



On 2016=E5=B9=B407=E6=9C=8825=E6=97=A5 13:47, Changlong Xie wrote:
> slave:~/.xie/qemu-colo # gcc --version
> gcc (SUSE Linux) 4.3.4 [gcc-4_3-branch revision 152973]
>
> slave:~/.xie/qemu-colo # make -j8
> CC    hw/net/e1000e_core.o
> hw/net/e1000e_core.c:56: warning: =E2=80=98e1000e_set_interrupt_cause=E2=
=80=99 declared inline after being called
> hw/net/e1000e_core.c:56: warning: previous declaration of =E2=80=98e100=
0e_set_interrupt_cause=E2=80=99 was here
> LINK  x86_64-softmmu/qemu-system-x86_64
>
> Reviewed-by: Dmitry Fleytman <dmitry@daynix.com>
> Signed-off-by: Changlong Xie <xiecl.fnst@cn.fujitsu.com>
> ---
>   hw/net/e1000e_core.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/net/e1000e_core.c b/hw/net/e1000e_core.c
> index badb1fe..e0bd31c 100644
> --- a/hw/net/e1000e_core.c
> +++ b/hw/net/e1000e_core.c
> @@ -52,7 +52,7 @@
>                                        second according to spec 10.2.4.=
2 */
>   #define E1000E_MAX_TX_FRAGS (64)
>  =20
> -static void
> +static inline void
>   e1000e_set_interrupt_cause(E1000ECore *core, uint32_t val);
>  =20
>   static inline void

Applied, thanks.

