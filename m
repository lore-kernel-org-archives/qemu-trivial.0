Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RySNq-0006RW-3X
	for mharc-qemu-trivial@gnu.org; Fri, 17 Feb 2012 13:18:14 -0500
Received: from eggs.gnu.org ([140.186.70.92]:40077)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1RySNj-00065R-S7
	for qemu-trivial@nongnu.org; Fri, 17 Feb 2012 13:18:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1RySNg-0003Bw-0e
	for qemu-trivial@nongnu.org; Fri, 17 Feb 2012 13:18:07 -0500
Received: from mail-pw0-f45.google.com ([209.85.160.45]:33374)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>)
	id 1RySNX-00039X-Gv; Fri, 17 Feb 2012 13:17:55 -0500
Received: by pbbro12 with SMTP id ro12so4830428pbb.4
	for <multiple recipients>; Fri, 17 Feb 2012 10:17:53 -0800 (PST)
Received: by 10.68.195.99 with SMTP id id3mr21056118pbc.149.1329502673852;
	Fri, 17 Feb 2012 10:17:53 -0800 (PST)
Received: from [192.168.0.103] (cpe-70-123-132-139.austin.res.rr.com.
	[70.123.132.139])
	by mx.google.com with ESMTPS id m3sm5736949pbg.44.2012.02.17.10.17.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 17 Feb 2012 10:17:52 -0800 (PST)
Message-ID: <4F3E99CE.7090905@codemonkey.ws>
Date: Fri, 17 Feb 2012 12:17:50 -0600
From: Anthony Liguori <anthony@codemonkey.ws>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.23) Gecko/20110922 Lightning/1.0b2 Thunderbird/3.1.15
MIME-Version: 1.0
To: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
References: <1329411799-4266-1-git-send-email-afaerber@suse.de>
In-Reply-To: <1329411799-4266-1-git-send-email-afaerber@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Gm-Message-State: ALoCoQmRorHd94G0rgQuQb/Q/fdS9z+GLpxRMm+aYUeWOD2QDyQ8LeXi/QoHKK5uknuPMPHWd+Xn
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.160.45
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 0/2] Some small
	documentation fixes
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
X-List-Received-Date: Fri, 17 Feb 2012 18:18:12 -0000

On 02/16/2012 11:03 AM, Andreas Färber wrote:
> Hey,
>
> I've taken the liberty of rebasing Anthony's gtk-doc patches to verify the
> documentation I'm adding in the CPU series. Here's some warning fixes that
> came out of this endeavor.
>
> Two open issues remain:
> * Identifier extensions (e.g., #Objects) lead to warnings.
> * Some structs are not picked up correctly, such as Object.

Applied all.  Thanks.

Regards,

Anthony Liguori

>
> Regards,
> Andreas
>
> Cc: Anthony Liguori<anthony@codemonkey.ws>
>
> Andreas Färber (2):
>    qom: Fix typo in Object's documentation
>    qom: Fix identifiers in documentation
>
>   include/qemu/object.h |    6 +++---
>   1 files changed, 3 insertions(+), 3 deletions(-)
>


