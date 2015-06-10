Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z2h78-0005Zx-DP
	for mharc-qemu-trivial@gnu.org; Wed, 10 Jun 2015 10:36:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44480)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1Z2h72-0005SH-L6
	for qemu-trivial@nongnu.org; Wed, 10 Jun 2015 10:36:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1Z2h6y-0004vC-K9
	for qemu-trivial@nongnu.org; Wed, 10 Jun 2015 10:36:16 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55926)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>)
	id 1Z2h6s-0004fE-FE; Wed, 10 Jun 2015 10:36:06 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id A1F7A8E78A;
	Wed, 10 Jun 2015 14:36:05 +0000 (UTC)
Received: from redhat.com (ovpn-116-97.ams2.redhat.com [10.36.116.97])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with SMTP
	id t5AEa28d012005; Wed, 10 Jun 2015 10:36:03 -0400
Date: Wed, 10 Jun 2015 16:36:02 +0200
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Shannon Zhao <shannon.zhao@linaro.org>
Message-ID: <20150610163441-mutt-send-email-mst@redhat.com>
References: <1430321049-11859-1-git-send-email-shannon.zhao@linaro.org>
	<55783923.2000203@linaro.org>
	<20150610152104-mutt-send-email-mst@redhat.com>
	<55783DD0.7080307@linaro.org>
	<20150610160042-mutt-send-email-mst@redhat.com>
	<55784985.6000608@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <55784985.6000608@linaro.org>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org, zhaoshenglong@huawei.com,
	qemu-devel@nongnu.org, pbonzini@redhat.com
Subject: Re: [Qemu-trivial] [PATCH 0/7] virtio: inline private qdev
 properties into virtio devices
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
X-List-Received-Date: Wed, 10 Jun 2015 14:36:21 -0000

On Wed, Jun 10, 2015 at 10:28:21PM +0800, Shannon Zhao wrote:
> 
> 
> On 2015/6/10 22:01, Michael S. Tsirkin wrote:
> >On Wed, Jun 10, 2015 at 09:38:24PM +0800, Shannon Zhao wrote:
> >>
> >>
> >>On 2015/6/10 21:21, Michael S. Tsirkin wrote:
> >>>On Wed, Jun 10, 2015 at 09:18:27PM +0800, Shannon Zhao wrote:
> >>>>Ping?
> >>>>Have these patches been missed?
> >>>
> >>>I see them upstream. See e.g. da3e8a23492dbc13c4b70d90b6ae42970624e63a.
> >>>What's missing?
> >>>
> >>
> >>da3e8a23492dbc13c4b70d90b6ae42970624e63a is "virtio-net: Move
> >>DEFINE_VIRTIO_NET_FEATURES to virtio-net", not this patchset.
> >
> >Oh right, I just saw Cornelia sent a minor comment which wasn't
> >addressed.
> >
> Yeah, and I ask whether it needs to repin. Could you help deal the
> indentations?

Sorry I can't. Too many patches flying around, trying to make 2.4.

> >Also, I'd rather this is rebased on top of Gerd's virtio 1 tree -
> >I plan to merge them today.
> >
> 
> I pull master, apply Gerd's virtio-1 patchset "[PATCH 00/33] virtio 1.0
> patch series rebased", then apply these patches. No conflicts and compile
> pass. I guess you could apply these directly.
> 
> PS: The [PATCH 01/33] of Gerd's virtio-1 patchset is already in master.

Thanks.

> Thanks,
> 
> -- 
> Shannon

