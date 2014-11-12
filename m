Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XoYMo-00038Y-L3
	for mharc-qemu-trivial@gnu.org; Wed, 12 Nov 2014 08:53:50 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40997)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <syeon.hwang@samsung.com>) id 1XoSaY-0000xw-0O
	for qemu-trivial@nongnu.org; Wed, 12 Nov 2014 02:43:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <syeon.hwang@samsung.com>) id 1XoSaR-0005Ts-MC
	for qemu-trivial@nongnu.org; Wed, 12 Nov 2014 02:43:37 -0500
Received: from mailout3.samsung.com ([203.254.224.33]:58823)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <syeon.hwang@samsung.com>)
	id 1XoSaE-0005SD-Nw; Wed, 12 Nov 2014 02:43:18 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
	by mailout3.samsung.com
	(Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit
	(built Nov
	17 2011)) with ESMTP id <0NEX004981FVNE10@mailout3.samsung.com>; Wed,
	12 Nov 2014 16:43:07 +0900 (KST)
X-AuditID: cbfee61a-f79c06d000004e71-ee-54630f8b9afd
Received: from epmmp1.local.host ( [203.254.227.16])
	by epcpsbgm1.samsung.com (EPCPMTA) with SMTP id E3.C0.20081.B8F03645;
	Wed, 12 Nov 2014 16:43:07 +0900 (KST)
Received: from caramiswin7PC ([182.198.1.3])
	by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
	(7.0.4.24.0) 64bit (built Nov 17 2011))
	with ESMTPA id <0NEX00HEZ1FUERB0@mmp1.samsung.com>; Wed,
	12 Nov 2014 16:43:07 +0900 (KST)
From: SeokYeon Hwang <syeon.hwang@samsung.com>
To: 'Markus Armbruster' <armbru@redhat.com>
References: <1415775949-4528-1-git-send-email-syeon.hwang@samsung.com>
	<87egt8c1qn.fsf@blackfin.pond.sub.org>
In-reply-to: <87egt8c1qn.fsf@blackfin.pond.sub.org>
Date: Wed, 12 Nov 2014 16:43:06 +0900
Message-id: <027b01cffe4c$4c809ae0$e581d0a0$@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7bit
X-Mailer: Microsoft Outlook 14.0
Thread-index: AQH7zw5ufzSxyAHnhebIzdp994zZeALwz36km+1z52A=
Content-language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrCLMWRmVeSWpSXmKPExsVy+t9jAd1u/uQQg7PXNC3mr73PYjGp8wqb
	xbxbyhb/f71itZh0bCqbxfHeHSwWa8/MZXVg99g56y67x5Nrm5k83u+7yhbAHMVlk5Kak1mW
	WqRvl8CVseBHP2PBXO6KJ51rGBsYv3B0MXJwSAiYSHyaIdDFyAlkiklcuLeerYuRi0NIYBGj
	xPXz11khnD+MEj82PWADqWIT0JPYsOwAI4gtIqAt8fFrA1gRM0jHrY8LmUCmCgnkS0zazA1S
	wylgLDF51xewXmGBRIlN628zgpSwCKhKXPtmCxLmFbCUOHLwAzuELSjxY/I9FhCbWUBLYv3O
	40wQtrzE5jVvmSEOVZDYcfY11AlWEp+P3mSHqBGR2PfiHeMERqFZSEbNQjJqFpJRs5C0LGBk
	WcUomlqQXFCclJ5rqFecmFtcmpeul5yfu4kRHBfPpHYwrmywOMQowMGoxMObuCYpRIg1say4
	MvcQowQHs5II76evQCHelMTKqtSi/Pii0pzU4kOM0hwsSuK8B1qtA4UE0hNLUrNTUwtSi2Cy
	TBycUg2MnnXf5iUaLWVuObHj0nKtJ/d3LxL3dUkvyDb66dildiC94dDv87su3xJ7nHO2+tOx
	N+I2+89q2v4yZXdbu3YB31tf07TU1iMPKu9K/1O5VTr9+t19EQE8V/OmKLSbrGur237tzb3V
	K48e5o4qTWWf9XHdnOJ3DWEBYWu+fjr7hOlf/4KHUhl9fEosxRmJhlrMRcWJAMa3oiKHAgAA
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 203.254.224.33
X-Mailman-Approved-At: Wed, 12 Nov 2014 08:53:48 -0500
Cc: "'Michael S. Tsirkin'" <mst@redhat.com>, qemu-trivial@nongnu.org,
	kongjianjun@gmail.com, paolo.bonzini@gmail.com,
	qemu-devel@nongnu.org, mreitz@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH for-2.2] pci: Don't pass
 negative errno to 'error_set_errno()'
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
X-List-Received-Date: Wed, 12 Nov 2014 07:43:44 -0000

> -----Original Message-----
> From: Markus Armbruster [mailto:armbru@redhat.com]
> Sent: Wednesday, November 12, 2014 4:33 PM
> To: SeokYeon Hwang
> Cc: qemu-devel@nongnu.org; kongjianjun@gmail.com; paolo.bonzini@gmail.com;
> mreitz@redhat.com; qemu-trivial@nongnu.org; Michael S. Tsirkin
> Subject: Re: [Qemu-devel] [PATCH for-2.2] pci: Don't pass negative errno
> to 'error_set_errno()'
> 
> Copying maintainer and -trivial.
> 
> In the future, please copy maintainers.  You can use
> "scripts/get_maintainer.pl --no-git-fallback" to find them.

Thank you for your help.

> 
> SeokYeon Hwang <syeon.hwang@samsung.com> writes:
> 
> > Signed-off-by: SeokYeon Hwang <syeon.hwang@samsung.com>
> > ---
> >  hw/pci/pcie.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c index 58455bd..2902f7d
> > 100644
> > --- a/hw/pci/pcie.c
> > +++ b/hw/pci/pcie.c
> > @@ -229,7 +229,7 @@ static void pcie_cap_slot_hotplug_common(PCIDevice
> *hotplug_dev,
> >          /* the slot is electromechanically locked.
> >           * This error is propagated up to qdev and then to HMP/QMP.
> >           */
> > -        error_setg_errno(errp, -EBUSY, "slot is electromechanically
> locked");
> > +        error_setg_errno(errp, EBUSY, "slot is electromechanically
> > + locked");
> >      }
> >  }
> 
> Reviewed-by: Markus Armbruster <armbru@redhat.com>


