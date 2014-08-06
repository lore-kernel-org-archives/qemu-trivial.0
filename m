Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XF9Fm-0005HT-1V
	for mharc-qemu-trivial@gnu.org; Wed, 06 Aug 2014 18:00:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46931)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1XEvAp-0001eO-DY
	for qemu-trivial@nongnu.org; Wed, 06 Aug 2014 02:58:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1XEvAk-00013P-Ii
	for qemu-trivial@nongnu.org; Wed, 06 Aug 2014 02:58:11 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46442)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>)
	id 1XEvAk-00013J-AC; Wed, 06 Aug 2014 02:58:06 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s766vOYk008286
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Wed, 6 Aug 2014 02:57:25 -0400
Received: from redhat.com (ovpn-116-85.ams2.redhat.com [10.36.116.85])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with SMTP
	id s766vH0c011403; Wed, 6 Aug 2014 02:57:18 -0400
Date: Wed, 6 Aug 2014 08:57:42 +0200
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Message-ID: <20140806065742.GC19566@redhat.com>
References: <1406879176-4008-1-git-send-email-arei.gonglei@huawei.com>
	<20140805140256.GA16091@redhat.com>
	<33183CC9F5247A488A2544077AF1902086C27807@SZXEMA503-MBS.china.huawei.com>
	<874mxq2lvp.fsf@blackfin.pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <874mxq2lvp.fsf@blackfin.pond.sub.org>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
X-Mailman-Approved-At: Wed, 06 Aug 2014 18:00:11 -0400
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"peter.crosthwaite@xilinx.com" <peter.crosthwaite@xilinx.com>,
	"Huangweidong \(C\)" <weidong.huang@huawei.com>,
	"aliguori@amazon.com" <aliguori@amazon.com>,
	"marcel.a@redhat.com" <marcel.a@redhat.com>,
	"qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	Luonengjun <luonengjun@huawei.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"Huangpeng \(Peter\)" <peter.huangpeng@huawei.com>,
	"Gonglei \(Arei\)" <arei.gonglei@huawei.com>,
	"av1474@comtv.ru" <av1474@comtv.ru>,
	"kraxel@redhat.com" <kraxel@redhat.com>,
	"stefanha@redhat.com" <stefanha@redhat.com>,
	"pbonzini@redhat.com" <pbonzini@redhat.com>,
	"dmitry@daynix.com" <dmitry@daynix.com>,
	"imammedo@redhat.com" <imammedo@redhat.com>,
	"lcapitulino@redhat.com" <lcapitulino@redhat.com>,
	"afaerber@suse.de" <afaerber@suse.de>,
	"dgilbert@redhat.com" <dgilbert@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v3 for-2.2 0/8] don't use
	Yoda conditions
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
X-List-Received-Date: Wed, 06 Aug 2014 06:58:16 -0000

On Wed, Aug 06, 2014 at 08:05:46AM +0200, Markus Armbruster wrote:
> "Gonglei (Arei)" <arei.gonglei@huawei.com> writes:
> 
> > Hi,
> >
> >> >
> >> > $WHATEVER: don't use 'Yoda conditions'
> >> >
> >> > 'Yoda conditions' are not part of idiomatic QEMU coding
> >> > style, so rewrite them in the more usual order.
> >> 
> >> 
> >> OK but why stop at these files? How about this
> >> instead?
> >> 
> > I just search c files by using key words like "NULL ==" etc.
> >
> > I don't think we should change conditional statements like ">" and ">=".
> 
> Eric pointed out it's actually incorrect for NaNs.
> 
> If you want to touch inequalities, separate patch(es) please, because
> they need more thorough review, both for correctness and for style.
> 
> > BTW, just using like "value == NULL" instead of "NULL == value" in all files
> > is not a good idea, which we have discussed in my patch serials v2. So, I posted
> > v3, add change log " imitate nearby code about using '!value' or
> > value == NULL' at
> > every patch " .
> 
> Re "not a good idea": I think rewriting "NULL == value" to "value ==
> NULL" *is* a good idea, but rewriting it to "!value" where that blends
> in with surrounding code is a *better* idea.
> 
> Gonglei's patches do that, Michael's don't, but are more complete.
> Therefore:

Yes but it's unrelated to Yoda: we have x != NULL without Yoda
in a lot of places. So this seems, to me, an unrelated issue.

If people feel this == NULL -> !x is desired, it's better to do it all at
once IMHO, and do x != NULL -> x at the same time.

Easy to run another script to do it on top.

> 
> > So, maybe you can post patches for those files I have missed in the serials, 
> > but not simply instead all by semantic script IMO, thanks!
> 
> Easy: apply Gonglei's patches before you run the script.
> 
> You may have to split patches along subsystem boundaries to get them in.
> Bothersome, as it involves guessing boundaries.  Not a request from me,
> just a warning of possible misfortune :)

It's going in through trivial tree, I don't think split-up is necessary.


