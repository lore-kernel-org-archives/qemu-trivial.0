Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1abS7Z-0002hf-AV
	for mharc-qemu-trivial@gnu.org; Thu, 03 Mar 2016 07:12:45 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32989)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1abS7R-0002XY-FW
	for qemu-trivial@nongnu.org; Thu, 03 Mar 2016 07:12:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1abS7Q-0006Ln-O9
	for qemu-trivial@nongnu.org; Thu, 03 Mar 2016 07:12:37 -0500
Received: from mx1.redhat.com ([209.132.183.28]:53147)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1abS7M-0006J8-He; Thu, 03 Mar 2016 07:12:32 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (Postfix) with ESMTPS id 1E00780518;
	Thu,  3 Mar 2016 12:12:32 +0000 (UTC)
Received: from [10.36.112.61] (ovpn-112-61.ams2.redhat.com [10.36.112.61])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u23CCSNJ024867
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 3 Mar 2016 07:12:30 -0500
To: "Gonglei (Arei)" <arei.gonglei@huawei.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <1456998223-12356-1-git-send-email-arei.gonglei@huawei.com>
	<1456998223-12356-3-git-send-email-arei.gonglei@huawei.com>
	<56D81D57.4040605@redhat.com>
	<33183CC9F5247A488A2544077AF19020B02EC39F@SZXEMA503-MBS.china.huawei.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <56D82A2C.6000607@redhat.com>
Date: Thu, 3 Mar 2016 13:12:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <33183CC9F5247A488A2544077AF19020B02EC39F@SZXEMA503-MBS.china.huawei.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH 2/6] sheepdog: fix possible resouce leak
 and out-of-bounds access
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
X-List-Received-Date: Thu, 03 Mar 2016 12:12:42 -0000



On 03/03/2016 13:00, Gonglei (Arei) wrote:
>>> > >
>>> > > -    ret = find_vdi_name(s, s->name, snap_id, snap_tag, &vid, true,
>>> > > +    ret = find_vdi_name(s, s->name, hdr.snapid, snap_tag, &vid, true,
>>> > >                          &local_err);
>>> > >      if (ret) {
>>> > > +        error_report_err(local_err);
>>> > >          return ret;
>>> > >      }
>>> > >
>>> > >
>> > 
>> > A patch for this has been posted yesterday by Jeff Cody.
>> > 
> OK, I found it. And Max's comments is right, Jef can use hdr.snapid instead of snap_tag
> to invoke find_vdi_name().
> 
> But, except that fix, My patch also fixed a memory leak, did you see that?

No, I didn't notice -- it's not clear that error_report_err also frees
the error.

> Do I need post an separate patch to fix memory leak?

Yes, but the right fix in my opinion is to pass errp to find_vdi_name
instead.

Paolo

