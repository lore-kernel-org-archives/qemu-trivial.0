Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Xo9fW-0006Ye-Vc
	for mharc-qemu-trivial@gnu.org; Tue, 11 Nov 2014 06:31:30 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43196)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@hotmail.com>) id 1Xo9fQ-0006QM-77
	for qemu-trivial@nongnu.org; Tue, 11 Nov 2014 06:31:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@hotmail.com>) id 1Xo9fK-0006HU-AV
	for qemu-trivial@nongnu.org; Tue, 11 Nov 2014 06:31:24 -0500
Received: from blu004-omc2s9.hotmail.com ([65.55.111.84]:63838)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@hotmail.com>)
	id 1Xo9f8-0006GH-9P; Tue, 11 Nov 2014 06:31:06 -0500
Received: from BLU437-SMTP108 ([65.55.111.71]) by BLU004-OMC2S9.hotmail.com
	over TLS secured channel with Microsoft SMTPSVC(7.5.7601.22751);
	Tue, 11 Nov 2014 03:31:05 -0800
X-TMN: [96kI4GNxFVRi5/+J2keC/H3Q6l27PjQk]
X-Originating-Email: [arei.gonglei@hotmail.com]
Message-ID: <BLU437-SMTP108B9EC73EA8FC2EB3651719F810@phx.gbl>
From: Gonglei <arei.gonglei@hotmail.com>
To: "'Markus Armbruster'" <armbru@redhat.com>,
	<arei.gonglei@huawei.com>
References: <1415698679-4264-1-git-send-email-arei.gonglei@huawei.com>
	<87bnoegj1p.fsf@blackfin.pond.sub.org>
In-Reply-To: <87bnoegj1p.fsf@blackfin.pond.sub.org>
Date: Tue, 11 Nov 2014 19:30:13 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Office Outlook 12.0
Thread-Index: Ac/9lX3TGzWJ8nF2TcCv1hLH/SO/1QADPnug
Content-Language: zh-cn
X-OriginalArrivalTime: 11 Nov 2014 11:31:03.0362 (UTC)
	FILETIME=[F9BF3220:01CFFDA2]
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 65.55.111.84
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] sysbus: Correct
	SYSTEM_BUS(obj) defines
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
X-List-Received-Date: Tue, 11 Nov 2014 11:31:30 -0000

> Subject: Re: [Qemu-devel] [PATCH] sysbus: Correct SYSTEM_BUS(obj) defines
> 
> <arei.gonglei@huawei.com> writes:
> 
> > From: Gonglei <arei.gonglei@huawei.com>
> >
> > Signed-off-by: Gonglei <arei.gonglei@huawei.com>
> > ---
> >  include/hw/sysbus.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/include/hw/sysbus.h b/include/hw/sysbus.h
> > index 6175bf9..d1f3f00 100644
> > --- a/include/hw/sysbus.h
> > +++ b/include/hw/sysbus.h
> > @@ -10,7 +10,7 @@
> >  #define QDEV_MAX_PIO 32
> >
> >  #define TYPE_SYSTEM_BUS "System"
> > -#define SYSTEM_BUS(obj) OBJECT_CHECK(IDEBus, (obj), TYPE_IDE_BUS)
> > +#define SYSTEM_BUS(obj) OBJECT_CHECK(BusState, (obj),
> TYPE_SYSTEM_BUS)
> >
> >  typedef struct SysBusDevice SysBusDevice;
> 
> Has never been used, so this is "only" an unexploded landmine.  Hope
> it's the only one of this kind.
> 
Yes, indeed.

> Reviewed-by: Markus Armbruster <armbru@redhat.com>

Thanks. :)

Best regards,
-Gonglei


