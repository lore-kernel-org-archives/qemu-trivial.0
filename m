Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WPUHY-0003JU-3o
	for mharc-qemu-trivial@gnu.org; Mon, 17 Mar 2014 05:56:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45681)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1WPUHR-0003Hr-69
	for qemu-trivial@nongnu.org; Mon, 17 Mar 2014 05:56:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1WPUHM-0004jL-AJ
	for qemu-trivial@nongnu.org; Mon, 17 Mar 2014 05:56:25 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58934)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1WPUHM-0004jH-2m; Mon, 17 Mar 2014 05:56:20 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s2H9uG3H010518
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 17 Mar 2014 05:56:17 -0400
Received: from yakj.usersys.redhat.com (ovpn-112-56.ams2.redhat.com
	[10.36.112.56])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s2H9uBZQ011843; Mon, 17 Mar 2014 05:56:12 -0400
Message-ID: <5326C6BB.40105@redhat.com>
Date: Mon, 17 Mar 2014 10:56:11 +0100
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>, qemu-trivial@nongnu.org
References: <1394978621-19738-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1394978621-19738-1-git-send-email-sw@weilnetz.de>
X-Enigmail-Version: 1.6
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: Marcelo Tosatti <mtosatti@redhat.com>, qemu-ppc@nongnu.org,
	qemu-devel@nongnu.org, kvm@vger.kernel.org,
	=?ISO-8859-15?Q?Andreas_?= =?ISO-8859-15?Q?F=E4rber?= <afaerber@suse.de>
Subject: Re: [Qemu-trivial] [PATCH] target-i386: Add missing 'static' and
	'const' attributes
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
X-List-Received-Date: Mon, 17 Mar 2014 09:56:30 -0000

Il 16/03/2014 15:03, Stefan Weil ha scritto:
> This fixes warnings from the static code analysis (smatch).
>
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>
> Why is array para_features in kvm.c terminated by a dummy entry?
> It is only used in a for loop with upper limit ARRAY_SIZE(para_features) - 1.

No particular reason.

Paolo

