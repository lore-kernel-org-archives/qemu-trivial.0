Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XF9Fm-0005ID-CZ
	for mharc-qemu-trivial@gnu.org; Wed, 06 Aug 2014 18:00:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47094)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1XEvBz-0002kB-J8
	for qemu-trivial@nongnu.org; Wed, 06 Aug 2014 02:59:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1XEvBv-00019j-8g
	for qemu-trivial@nongnu.org; Wed, 06 Aug 2014 02:59:23 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44472)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>)
	id 1XEvBj-00018y-GY; Wed, 06 Aug 2014 02:59:07 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s766rV6i001233
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Wed, 6 Aug 2014 02:53:32 -0400
Received: from redhat.com (ovpn-116-85.ams2.redhat.com [10.36.116.85])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with SMTP
	id s766rPT0031422; Wed, 6 Aug 2014 02:53:26 -0400
Date: Wed, 6 Aug 2014 08:53:51 +0200
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eric Blake <eblake@redhat.com>
Message-ID: <20140806065351.GB19566@redhat.com>
References: <1406879176-4008-1-git-send-email-arei.gonglei@huawei.com>
	<20140805140256.GA16091@redhat.com> <53E18AAF.1090902@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <53E18AAF.1090902@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
X-Mailman-Approved-At: Wed, 06 Aug 2014 18:00:11 -0400
Cc: peter.maydell@linaro.org, peter.crosthwaite@xilinx.com,
	weidong.huang@huawei.com, stefanha@redhat.com,
	marcel.a@redhat.com, qemu-trivial@nongnu.org,
	luonengjun@huawei.com, qemu-devel@nongnu.org, armbru@redhat.com,
	arei.gonglei@huawei.com, av1474@comtv.ru, kraxel@redhat.com,
	aliguori@amazon.com, imammedo@redhat.com, dmitry@daynix.com,
	pbonzini@redhat.com, peter.huangpeng@huawei.com,
	lcapitulino@redhat.com, afaerber@suse.de, dgilbert@redhat.com
Subject: Re: [Qemu-trivial] [PATCH v3 for-2.2 0/8] don't use Yoda conditions
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
X-List-Received-Date: Wed, 06 Aug 2014 06:59:28 -0000

On Tue, Aug 05, 2014 at 07:53:51PM -0600, Eric Blake wrote:
> On 08/05/2014 08:02 AM, Michael S. Tsirkin wrote:
> > On Fri, Aug 01, 2014 at 03:46:08PM +0800, arei.gonglei@huawei.com wrote:
> >> From: Gonglei <arei.gonglei@huawei.com>
> >>
> >> $WHATEVER: don't use 'Yoda conditions'
> >>
> >> 'Yoda conditions' are not part of idiomatic QEMU coding
> >> style, so rewrite them in the more usual order.
> > 
> > 
> > OK but why stop at these files? How about this
> > instead?
> > 
> 
> > @ disable commeq @
> > expression E;
> > constant C;
> > @@
> > - C == E
> > + E == C
> > @ disable commeq @
> > expression E;
> > constant C;
> > @@
> > - C == E
> > + E == C
> 
> Why is this listed twice?
> 
> > @ disable gtr_lss @
> > expression E;
> > constant C;
> > @@
> > - C > E
> > + E < C
> 
> This is wrong for floating point (think NaN); you'd have to audit the
> results to make sure only integers are commuted.

I did, take a look at the results :)

> > @ disable gtr_lss_eq @
> > expression E;
> > constant C;
> > @@
> > - C >= E
> > + E <= C
> 
> Ditto.
> 
> > 
> > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> 
> The idea seems okay to me, but I haven't closely reviewed the patch yet.
> 
> -- 
> Eric Blake   eblake redhat com    +1-919-301-3266
> Libvirt virtualization library http://libvirt.org
> 



