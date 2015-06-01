Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YzNwj-0006w8-TF
	for mharc-qemu-trivial@gnu.org; Mon, 01 Jun 2015 07:31:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50257)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1YzNwh-0006qe-7C
	for qemu-trivial@nongnu.org; Mon, 01 Jun 2015 07:31:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1YzNwg-0005hc-Dp
	for qemu-trivial@nongnu.org; Mon, 01 Jun 2015 07:31:55 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60151)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1YzNwa-0005em-1O; Mon, 01 Jun 2015 07:31:48 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (Postfix) with ESMTPS id 688718F27E;
	Mon,  1 Jun 2015 11:31:47 +0000 (UTC)
Received: from [10.36.112.76] (ovpn-112-76.ams2.redhat.com [10.36.112.76])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t51BVhd0016999
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 1 Jun 2015 07:31:45 -0400
Message-ID: <556C429F.3070802@redhat.com>
Date: Mon, 01 Jun 2015 13:31:43 +0200
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: "Michael S. Tsirkin" <mst@redhat.com>, Gonglei <arei.gonglei@huawei.com>
References: <1431477807-12220-1-git-send-email-arei.gonglei@huawei.com>
	<555AEA20.3090501@huawei.com> <556C0B7A.3070601@huawei.com>
	<20150601122437-mutt-send-email-mst@redhat.com>
In-Reply-To: <20150601122437-mutt-send-email-mst@redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>, qemu-devel@nongnu.org,
	peter.huangpeng@huawei.com
Subject: Re: [Qemu-trivial] [PATCH 0/6] pci/isa: QOMify
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
X-List-Received-Date: Mon, 01 Jun 2015 11:31:56 -0000



On 01/06/2015 12:25, Michael S. Tsirkin wrote:
>> > Hi, Michael, Paolo
>> > 
>> > Can you please ack or review those patches?
>> > 
>> > Regards,
>> > -Gonglei
> I think this belongs in the QOM tree, not mine.

Recently Gerd at least has taken similar patches, so I guess it belongs
all over the place, including Xen, KVM and PC trees.

Let's say it belongs in qemu-trivial (CCed)...

Paolo

