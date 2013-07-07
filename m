Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Uw60y-0000AU-Pj
	for mharc-qemu-trivial@gnu.org; Mon, 08 Jul 2013 03:37:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35724)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex@alex.org.uk>) id 1Uvx5x-000559-PT
	for qemu-trivial@nongnu.org; Sun, 07 Jul 2013 18:06:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex@alex.org.uk>) id 1Uvx5v-0002ic-MI
	for qemu-trivial@nongnu.org; Sun, 07 Jul 2013 18:06:13 -0400
Received: from mail.avalus.com ([89.16.176.221]:46074)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex@alex.org.uk>) id 1Uvx5v-0002iT-GY
	for qemu-trivial@nongnu.org; Sun, 07 Jul 2013 18:06:11 -0400
Received: by mail.avalus.com (Postfix) with ESMTPSA id 5C455C56195;
	Sun,  7 Jul 2013 23:05:55 +0100 (BST)
Date: Sun, 07 Jul 2013 23:05:54 +0100
From: Alex Bligh <alex@alex.org.uk>
To: Stefan Weil <sw@weilnetz.de>, qemu-trivial@nongnu.org
Message-ID: <037D60EF2A5746E468BF0A04@nimrod.local>
In-Reply-To: <1373228703-26226-1-git-send-email-sw@weilnetz.de>
References: <1373228703-26226-1-git-send-email-sw@weilnetz.de>
X-Mailer: Mulberry/4.0.8 (Mac OS X)
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 89.16.176.221
X-Mailman-Approved-At: Mon, 08 Jul 2013 03:37:40 -0400
Cc: Jan Kiszka <jan.kiszka@siemens.com>, Anthony Liguori <aliguori@us.ibm.com>,
	qemu-devel@nongnu.org, Alex Bligh <alex@alex.org.uk>,
	Stefan Weil <sw@weilnetz.de>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Spelling fixes
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
Reply-To: Alex Bligh <alex@alex.org.uk>
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sun, 07 Jul 2013 22:06:15 -0000



--On 7 July 2013 22:25:02 +0200 Stefan Weil <sw@weilnetz.de> wrote:

> --- a/ui/vnc-enc-zywrle.h
> +++ b/ui/vnc-enc-zywrle.h
> @@ -305,9 +305,9 @@ static inline void harr(int8_t *px0, int8_t *px1)
>     |L1H0H1H0|L1H0H1H0|L1H0H1H0|L1H0H1H0| : level 1
>
>   In this method, H/L and X0/X1 is always same position.
> - This lead us to more speed and less memory.
> - Of cause, the result of both method is quite same
> - because it's only difference that coefficient position.
> + This leads us to more speed and less memory.
> + Of course, the result of both methods is quite same
> + because its only difference is that coefficient position.
>  */
>  static inline void wavelet_level(int *data, int size, int l, int
> skip_pixel)  {

If we're doing spelling/grammar fixes, that should be "is quite the same"
and "that of coefficient position".

-- 
Alex Bligh

