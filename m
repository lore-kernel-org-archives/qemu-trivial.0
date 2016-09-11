Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bj4zE-00049c-42
	for mharc-qemu-trivial@gnu.org; Sun, 11 Sep 2016 09:39:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47673)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gxt@mprc.pku.edu.cn>) id 1bj4Gz-0005yi-Jw
	for qemu-trivial@nongnu.org; Sun, 11 Sep 2016 08:54:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gxt@mprc.pku.edu.cn>) id 1bj4Gw-0002Q8-Gg
	for qemu-trivial@nongnu.org; Sun, 11 Sep 2016 08:54:13 -0400
Received: from mprc.pku.edu.cn ([162.105.203.9]:48834)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gxt@mprc.pku.edu.cn>)
	id 1bj4Gv-0002Or-K9; Sun, 11 Sep 2016 08:54:10 -0400
Received: from mprc.pku.edu.cn (localhost [127.0.0.1] (may be forged))
	by mprc.pku.edu.cn (8.13.8/8.13.8) with ESMTP id u8BCqvHV001756;
	Sun, 11 Sep 2016 20:52:57 +0800
Received: (from apache@localhost)
	by mprc.pku.edu.cn (8.13.8/8.13.8/Submit) id u8BCqups001755;
	Sun, 11 Sep 2016 20:52:56 +0800
X-Authentication-Warning: mprc.pku.edu.cn: apache set sender to
	gxt@mprc.pku.edu.cn using -f
Received: from 117.114.135.40 (SquirrelMail authenticated user guanxuetao)
	by mprc.pku.edu.cn with HTTP; Sun, 11 Sep 2016 20:52:56 +0800 (CST)
Message-ID: <61416.117.114.135.40.1473598376.squirrel@mprc.pku.edu.cn>
In-Reply-To: <1473455763-27332-1-git-send-email-thuth@redhat.com>
References: <1473455763-27332-1-git-send-email-thuth@redhat.com>
Date: Sun, 11 Sep 2016 20:52:56 +0800 (CST)
From: "Xuetao Guan" <gxt@mprc.pku.edu.cn>
To: "Thomas Huth" <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	"Guan Xuetao" <gxt@mprc.pku.edu.cn>
Reply-To: gxt@mprc.pku.edu.cn
User-Agent: SquirrelMail/1.4.8-4.0.1.el5
MIME-Version: 1.0
Content-Type: text/plain;charset=gb2312
Content-Transfer-Encoding: 8bit
X-Priority: 3 (Normal)
Importance: Normal
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 162.105.203.9
X-Mailman-Approved-At: Sun, 11 Sep 2016 09:39:55 -0400
Subject: Re: [Qemu-trivial] [PATCH] MAINTAINERS: Add include/hw/unicore32/
 to UniCore32 section
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
X-List-Received-Date: Sun, 11 Sep 2016 12:54:14 -0000

> get_maintainer.pl now properly recognizes that the file in
> include/hw/unicore32/ belongs to UniCore32.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Looks ok to me.
Acked-by: Guan Xuetao <gxt@mprc.pku.edu.cn>

> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 9d17cb3..7196dba 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -204,6 +204,7 @@ M: Guan Xuetao <gxt@mprc.pku.edu.cn>
>  S: Maintained
>  F: target-unicore32/
>  F: hw/unicore32/
> +F: include/hw/unicore32/
>
>  X86
>  M: Paolo Bonzini <pbonzini@redhat.com>
> --
> 1.8.3.1
>


