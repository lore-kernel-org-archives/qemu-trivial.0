Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VGtE5-0003MZ-Dz
	for mharc-qemu-trivial@gnu.org; Tue, 03 Sep 2013 12:13:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54404)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.williamson@redhat.com>) id 1VGtDx-0003Ao-PB
	for qemu-trivial@nongnu.org; Tue, 03 Sep 2013 12:13:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.williamson@redhat.com>) id 1VGtDr-0000Mx-Ks
	for qemu-trivial@nongnu.org; Tue, 03 Sep 2013 12:13:01 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34913)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.williamson@redhat.com>)
	id 1VGtDf-0008Ua-2S; Tue, 03 Sep 2013 12:12:43 -0400
Received: from int-mx02.intmail.prod.int.phx2.redhat.com
	(int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r83GCfPU013257
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Tue, 3 Sep 2013 12:12:41 -0400
Received: from [10.3.113.8] ([10.3.113.8])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r83GCeO4019803; Tue, 3 Sep 2013 12:12:40 -0400
Message-ID: <1378224760.3246.45.camel@ul30vt.home>
From: Alex Williamson <alex.williamson@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 03 Sep 2013 10:12:40 -0600
In-Reply-To: <CAFEAcA_MN9jv3QnHGm1785kp2aqKgO1k-R_3QmR39094FbwsZQ@mail.gmail.com>
References: <1378196857-27541-1-git-send-email-aik@ozlabs.ru>
	<CAFEAcA8Jp=SQsC3RpxahF1RFRtX2nHOS2690XiT9Jnpn0jGk_g@mail.gmail.com>
	<5225AC9A.2090601@ozlabs.ru> <5225BD32.8030001@siemens.com>
	<52260025.3050704@ozlabs.ru>
	<CAFEAcA8b26fm17sUZ=aUeETVD9q2AahkXQDLQWuRJGM9JMMqkQ@mail.gmail.com>
	<5226048E.2090004@ozlabs.ru> <1378223912.3246.36.camel@ul30vt.home>
	<CAFEAcA_MN9jv3QnHGm1785kp2aqKgO1k-R_3QmR39094FbwsZQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.12
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: kvm-devel <kvm@vger.kernel.org>, Gleb Natapov <gleb@redhat.com>,
	Alexey Kardashevskiy <aik@ozlabs.ru>, Jan Kiszka <jan.kiszka@siemens.com>,
	Michael Tokarev <mjt@tls.msk.ru>, QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] linux-headers: update to
	3.11
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
X-List-Received-Date: Tue, 03 Sep 2013 16:13:07 -0000

On Tue, 2013-09-03 at 17:03 +0100, Peter Maydell wrote:
> On 3 September 2013 16:58, Alex Williamson <alex.williamson@redhat.com> wrote:
> > I was under the impression that we were only ever updating linux-headers
> > from mainline, never from kvm-next.
> 
> Looking at the git history, it's variable. Four of the
> last 10 updates were from somewhere other than mainline.
> In any case this is the kind of policy decision that
> means updates should go via the QEMU KVM maintainers :-)

Seems like every update except ppc has come from mainline.  Personally,
I don't think it makes sense anymore.  QEMU has scope beyond KVM and it
makes about as much sense to snapshot kvm.git as it does to snapshot my
vfio next branch or Michael's virtio queue.  If we only pull from
mainline we never have to worry about regressing something that isn't
actually upstream yet.  Thanks,

Alex


