Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z2fwm-0003bo-10
	for mharc-qemu-trivial@gnu.org; Wed, 10 Jun 2015 09:21:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39515)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1Z2fwi-0003Wy-N9
	for qemu-trivial@nongnu.org; Wed, 10 Jun 2015 09:21:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1Z2fwh-0008Ia-V4
	for qemu-trivial@nongnu.org; Wed, 10 Jun 2015 09:21:32 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42737)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>)
	id 1Z2fwb-0008Aw-PQ; Wed, 10 Jun 2015 09:21:25 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (Postfix) with ESMTPS id 570F93500F7;
	Wed, 10 Jun 2015 13:21:25 +0000 (UTC)
Received: from redhat.com (ovpn-116-97.ams2.redhat.com [10.36.116.97])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with SMTP
	id t5ADLMt1005422; Wed, 10 Jun 2015 09:21:23 -0400
Date: Wed, 10 Jun 2015 15:21:22 +0200
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Shannon Zhao <shannon.zhao@linaro.org>
Message-ID: <20150610152104-mutt-send-email-mst@redhat.com>
References: <1430321049-11859-1-git-send-email-shannon.zhao@linaro.org>
	<55783923.2000203@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <55783923.2000203@linaro.org>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
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
X-List-Received-Date: Wed, 10 Jun 2015 13:21:34 -0000

On Wed, Jun 10, 2015 at 09:18:27PM +0800, Shannon Zhao wrote:
> Ping?
> Have these patches been missed?

I see them upstream. See e.g. da3e8a23492dbc13c4b70d90b6ae42970624e63a.
What's missing?

