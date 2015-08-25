Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZU1xo-0005gt-5r
	for mharc-qemu-trivial@gnu.org; Mon, 24 Aug 2015 20:19:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36386)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1ZU1xl-0005cw-W1
	for qemu-trivial@nongnu.org; Mon, 24 Aug 2015 20:19:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1ZU1xl-0002PT-5F
	for qemu-trivial@nongnu.org; Mon, 24 Aug 2015 20:19:41 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46340)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jsnow@redhat.com>)
	id 1ZU1xf-0002JP-P5; Mon, 24 Aug 2015 20:19:35 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (Postfix) with ESMTPS id 500FD8E220;
	Tue, 25 Aug 2015 00:19:35 +0000 (UTC)
Received: from scv.usersys.redhat.com (dhcp-17-163.bos.redhat.com
	[10.18.17.163])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t7P0JYsi004744; Mon, 24 Aug 2015 20:19:34 -0400
To: Stefan Hajnoczi <stefanha@gmail.com>
References: <1435611386-29316-1-git-send-email-jsnow@redhat.com>
	<20150709102623.GC28530@stefanha-thinkpad.redhat.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <55DBB496.2070605@redhat.com>
Date: Mon, 24 Aug 2015 20:19:34 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <20150709102623.GC28530@stefanha-thinkpad.redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] trivial: remove trailing
 newline from error_report
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
X-List-Received-Date: Tue, 25 Aug 2015 00:19:43 -0000



On 07/09/2015 06:26 AM, Stefan Hajnoczi wrote:
> On Mon, Jun 29, 2015 at 04:56:26PM -0400, John Snow wrote:
>> Minor cleanup.
>> 
>> Signed-off-by: John Snow <jsnow@redhat.com> --- hw/ide/ahci.c
>> | 2 +- hw/vfio/platform.c | 2 +- net/tap-linux.c    | 4 ++-- 3
>> files changed, 4 insertions(+), 4 deletions(-)
> 
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> 
> Laszlo Ersek suggested a compile-time check (e.g. BUILD_BUG_ON()).
> Have you looked into this?
> 
> Perhaps something along the lines of:
> 
> BUILD_BUG_ON(__builtin_constant_p(fmt) && __builtin_strlen(fmt) > 0
> && fmt[__builtin_strlen(fmt) - 1] == '\n')
> 

ping for 2.5; I don't think this ever made it in.

