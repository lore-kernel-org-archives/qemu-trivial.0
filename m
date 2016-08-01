Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bU9vM-0003Ad-12
	for mharc-qemu-trivial@gnu.org; Mon, 01 Aug 2016 05:54:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46341)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1bU9vK-00039S-E6
	for qemu-trivial@nongnu.org; Mon, 01 Aug 2016 05:54:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1bU9vJ-00019c-LT
	for qemu-trivial@nongnu.org; Mon, 01 Aug 2016 05:54:14 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44574)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1bU9vD-00015a-JY; Mon, 01 Aug 2016 05:54:07 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0CC5DC089A74;
	Mon,  1 Aug 2016 09:54:07 +0000 (UTC)
Received: from [10.36.112.46] (ovpn-112-46.ams2.redhat.com [10.36.112.46])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u719s1cH006070
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 1 Aug 2016 05:54:04 -0400
To: "Daniel P. Berrange" <berrange@redhat.com>,
	Cao jin <caoj.fnst@cn.fujitsu.com>
References: <1469758546-21040-1-git-send-email-caoj.fnst@cn.fujitsu.com>
	<20160729092015.GE4485@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>, Eric Blake <eblake@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <e842405a-b8fd-4ec0-9413-b67b1018da4d@redhat.com>
Date: Mon, 1 Aug 2016 11:54:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.1
MIME-Version: 1.0
In-Reply-To: <20160729092015.GE4485@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Mon, 01 Aug 2016 09:54:07 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH v2] util/qemu-sockets: revert Yoda
 Conditions to normal
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 01 Aug 2016 09:54:15 -0000



On 29/07/2016 11:20, Daniel P. Berrange wrote:
> Reviewed-by: Daniel P. Berrange <berrange@redhat.com>

Queued, thanks for the patch and the review.

Paolo

