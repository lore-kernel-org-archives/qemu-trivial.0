Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aQBYL-0004bc-Vr
	for mharc-qemu-trivial@gnu.org; Mon, 01 Feb 2016 05:17:50 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49479)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1aQBYJ-0004Zt-0U
	for qemu-trivial@nongnu.org; Mon, 01 Feb 2016 05:17:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1aQBYI-0000ue-6s
	for qemu-trivial@nongnu.org; Mon, 01 Feb 2016 05:17:46 -0500
Received: from mx1.redhat.com ([209.132.183.28]:56318)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>)
	id 1aQBYC-0000ty-A1; Mon, 01 Feb 2016 05:17:40 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id DC30419CBED;
	Mon,  1 Feb 2016 10:17:39 +0000 (UTC)
Received: from nial.brq.redhat.com (dhcp-1-118.brq.redhat.com [10.34.1.118])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u11AHbaG002857; Mon, 1 Feb 2016 05:17:38 -0500
Date: Mon, 1 Feb 2016 11:17:36 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Wei Huang <wei@redhat.com>
Message-ID: <20160201111736.155e82fa@nial.brq.redhat.com>
In-Reply-To: <56AB818B.1060500@redhat.com>
References: <1454005340-15682-1-git-send-email-wei@redhat.com>
	<CAM2+HU4Z39LoKjXqMRDQYbozQAi2-tqdo=d8TLrvVrJ6v6HHyQ@mail.gmail.com>
	<56AB78A6.7070505@redhat.com> <56AB7B48.9020007@linaro.org>
	<CAFEAcA9MYCFf-GCTnzHWUkaf6=_QCh=dsceaSg+4j8m3qgucpw@mail.gmail.com>
	<56AB818B.1060500@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	"zhaoshenglong@huawei.com" <zhaoshenglong@huawei.com>,
	Shannon Zhao <shannon.zhao@linaro.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/1] arm: virt: change GPIO
 trigger interrupt to pulse
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
X-List-Received-Date: Mon, 01 Feb 2016 10:17:48 -0000

On Fri, 29 Jan 2016 09:13:15 -0600
Wei Huang <wei@redhat.com> wrote:

> On 01/29/2016 08:50 AM, Peter Maydell wrote:
> > On 29 January 2016 at 14:46, Shannon Zhao <shannon.zhao@linaro.org> wrote:  
> >> On 2016/1/29 22:35, Wei Huang wrote:  
> >>> On 01/29/2016 04:10 AM, Shannon Zhao wrote:  
> >>>> This makes ACPI work well but makes DT not work. The reason is systemd or
> >>>> acpid open /dev/input/event0 failed. So the interrupt could be injected
> >>>> and
> >>>> could see under /proc/interrupts but guest doesn't have any action. I'll
> >>>> investigate why it opens failed later.  
> >>>
> >>>
> >>> That is interesting. Could you try it with the following? This reverses
> >>> the order to down-up and worked on ACPI case.
> >>>  
> >> Yeah, that's very weird.
> >>  
> >>> qemu_set_irq(qdev_get_gpio_in(pl061_dev, 3), 0);
> >>> qemu_set_irq(qdev_get_gpio_in(pl061_dev, 3), 1);
> >>>  
> >> I'll try this tomorrow. But even if this works, it's still weird.  
> > 
> > I wonder if we should be asserting the GPIO pin in the powerdown-request
> > hook and then deasserting it on system reset somewhere...  
> 
> This is another possibility. We can try to reset the pl061 state by
> hooking up with dc->reset and see what happens.
I think that's what we do on x86.

> 
> > 
> > thanks
> > -- PMM
> >   
> 


