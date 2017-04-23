Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1d2DQx-00006q-0B
	for mharc-qemu-trivial@gnu.org; Sun, 23 Apr 2017 05:03:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43634)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1d2DQu-00005C-VO
	for qemu-trivial@nongnu.org; Sun, 23 Apr 2017 05:03:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1d2DQu-0001tS-1J
	for qemu-trivial@nongnu.org; Sun, 23 Apr 2017 05:03:52 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:59935)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1d2DQo-0001s9-CA; Sun, 23 Apr 2017 05:03:46 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 7E24841F10;
	Sun, 23 Apr 2017 12:03:45 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id 689053F8;
	Sun, 23 Apr 2017 12:03:45 +0300 (MSK)
To: Herbie Robinson <Herbie.Robinson@stratus.com>, qemu-devel@nongnu.org
References: <1489161295-23864-1-git-send-email-Herbie.Robinson@stratus.com>
Cc: qemu-trivial@nongnu.org, lvivier@redhat.com
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <ca413099-649d-3e93-435a-e88685dc9fda@msgid.tls.msk.ru>
Date: Sun, 23 Apr 2017 12:03:45 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1489161295-23864-1-git-send-email-Herbie.Robinson@stratus.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH v3] SGABIOS: fix wrong video attrs for
 int 10h, ah==13h
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
X-List-Received-Date: Sun, 23 Apr 2017 09:03:54 -0000

10.03.2017 18:54, Herbie Robinson wrote:
> Fix Bug #1670509: wrong video attrs for int 10h, ah==13h
> The subroutine set_cursor_position is trashing %bx.
> Unfortunately, %bl contains the video attribute for write_string.
> 
> The fix saves %bx in the function prolog and restores it in
> the epilog. 
> 
> Signed-off-by: Herbie Robinson <Herbie.Robinson@stratus.com>
> ---
> Removed incorrect code deletions from set_current_cursor.
> Removed explanation of same from the commit message.
> 
> BTW, I didn't see any test cases for this code, but if they exist
> and somebody points me at them, I should be able to generate a 
> very small qcow2 file that demonstrates the problem.
> 
>  sgabios.S | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/sgabios.S b/sgabios.S

Now I'm not quite sure what to do with this.

It is part of sgabios, which is not qemu code but a submodule.

Maybe it's better to apply it upstream?
Or should we apply it directly?

Thanks,

/mjt

