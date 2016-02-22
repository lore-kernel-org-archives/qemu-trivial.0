Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aXhYC-0005yp-MI
	for mharc-qemu-trivial@gnu.org; Sun, 21 Feb 2016 22:52:44 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48055)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <amit.shah@redhat.com>) id 1aXhYB-0005xo-5u
	for qemu-trivial@nongnu.org; Sun, 21 Feb 2016 22:52:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <amit.shah@redhat.com>) id 1aXhYA-0006L2-Aw
	for qemu-trivial@nongnu.org; Sun, 21 Feb 2016 22:52:43 -0500
Received: from mx1.redhat.com ([209.132.183.28]:55312)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <amit.shah@redhat.com>)
	id 1aXhY6-0006KY-3C; Sun, 21 Feb 2016 22:52:38 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id ED157627C5;
	Mon, 22 Feb 2016 03:52:36 +0000 (UTC)
Received: from localhost (ovpn-113-72.phx2.redhat.com [10.3.113.72])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u1M3qZpp031488; Sun, 21 Feb 2016 22:52:36 -0500
Date: Mon, 22 Feb 2016 09:22:30 +0530
From: Amit Shah <amit.shah@redhat.com>
To: Wei Yang <richard.weiyang@gmail.com>
Message-ID: <20160222035230.GA10967@grmbl.mre>
References: <1454626230-16334-1-git-send-email-richard.weiyang@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1454626230-16334-1-git-send-email-richard.weiyang@gmail.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Mon, 22 Feb 2016 03:52:37 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, quintela@redhat.com
Subject: Re: [Qemu-trivial] [PATCH] migration: reorder code to make it
	symmetric
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
X-List-Received-Date: Mon, 22 Feb 2016 03:52:44 -0000

On (Thu) 04 Feb 2016 [22:50:30], Wei Yang wrote:
> In qemu_savevm_state_complete_precopy(), it iterates on each device to add
> a json object and transfer related status to destination, while the order
> of the last two steps could be refined.
> 
> Current order:
> 
>     json_start_object()
>     	save_section_header()
>     	vmstate_save()
>     json_end_object()
>     	save_section_footer()
> 
> After the change:
> 
>     json_start_object()
>     	save_section_header()
>     	vmstate_save()
>     	save_section_footer()
>     json_end_object()
> 
> This patch reorder the code to to make it symmetric. No functional change.
> 
> Signed-off-by: Wei Yang <richard.weiyang@gmail.com>

Reviewed-by: Amit Shah <amit.shah@redhat.com>

Thanks,

		Amit

