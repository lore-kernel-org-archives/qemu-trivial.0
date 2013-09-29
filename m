Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VQMrr-00006Q-Hn
	for mharc-qemu-trivial@gnu.org; Sun, 29 Sep 2013 15:41:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37319)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VQMrk-0008PG-55
	for qemu-trivial@nongnu.org; Sun, 29 Sep 2013 15:41:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VQMre-0001Wm-3x
	for qemu-trivial@nongnu.org; Sun, 29 Sep 2013 15:41:16 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:46536)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VQMrP-0001UU-ID; Sun, 29 Sep 2013 15:40:55 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 74DA04292C;
	Sun, 29 Sep 2013 23:40:54 +0400 (MSK)
Message-ID: <52488246.5050509@msgid.tls.msk.ru>
Date: Sun, 29 Sep 2013 23:40:54 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130922 Icedove/17.0.9
MIME-Version: 1.0
To: Paolo Bonzini <pbonzini@redhat.com>
References: <1380245138-9716-1-git-send-email-akong@redhat.com>
	<524533A1.6030305@redhat.com>
In-Reply-To: <524533A1.6030305@redhat.com>
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial <qemu-trivial@nongnu.org>, peter.maydell@linaro.org,
	qemu-devel@nongnu.org, anthony@codemonkey.ws
Subject: Re: [Qemu-trivial] [PATCH] exec: cleanup DEBUG_SUBPAGE
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
X-List-Received-Date: Sun, 29 Sep 2013 19:41:22 -0000

27.09.2013 11:28, Paolo Bonzini wrote:
> Michael, want to pick this up for -trivial?
>
> Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
>
> Il 27/09/2013 03:25, Amos Kong ha scritto:
>> Touched some error after enabling DEBUG_SUBPAGE.

Thanks, applied to the trivial patches queue.

/mjt

