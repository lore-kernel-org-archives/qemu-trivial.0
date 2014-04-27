Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WeKlE-00087A-BJ
	for mharc-qemu-trivial@gnu.org; Sun, 27 Apr 2014 04:48:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51106)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1WeKl6-00086x-VK
	for qemu-trivial@nongnu.org; Sun, 27 Apr 2014 04:48:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1WeKl0-0005Mo-RN
	for qemu-trivial@nongnu.org; Sun, 27 Apr 2014 04:48:24 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36039)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1WeKl0-0005Mk-Jt; Sun, 27 Apr 2014 04:48:18 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s3R8mFGY016830
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Sun, 27 Apr 2014 04:48:15 -0400
Received: from yakj.usersys.redhat.com ([10.10.112.19])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s3R8m9RK022205; Sun, 27 Apr 2014 04:48:11 -0400
Message-ID: <535CC449.5030507@redhat.com>
Date: Sun, 27 Apr 2014 10:48:09 +0200
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: "Michael R. Hines" <mrhines@linux.vnet.ibm.com>,
	Laszlo Ersek <lersek@redhat.com>, Amos Kong <akong@redhat.com>,
	qemu-trivial@nongnu.org
References: <1397442420-25626-1-git-send-email-akong@redhat.com>
	<534BA81C.9060807@redhat.com> <534C7584.2090301@linux.vnet.ibm.com>
In-Reply-To: <534C7584.2090301@linux.vnet.ibm.com>
X-Enigmail-Version: 1.6
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: yamahata@private.email.ne.jp, mjt@tls.msk.ru, qemu-devel@nongnu.org,
	"Michael R. Hines" <mrhines@us.ibm.com>
Subject: Re: [Qemu-trivial] [PATCH] arch_init.c: remove duplicate function
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
X-List-Received-Date: Sun, 27 Apr 2014 08:48:31 -0000

Il 15/04/2014 01:55, Michael R. Hines ha scritto:
> Paolo? I see that some of the block-migration code and the qemu-img code
> is also
> calling buffer_is_zero() - are you guys depending on the performance of any
> buffer_is_zero() calls to use the vector-optimized version like
> migration does?

Yes, definitely.  Not to the point that we care about which functions 
are inlined, but the constant-factor improvement that comes for 
vectorization can have a noticeable impact.

Paolo

