Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Um1I3-000132-Gc
	for mharc-qemu-trivial@gnu.org; Mon, 10 Jun 2013 08:33:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55128)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1Um1Hz-0000wb-UG
	for qemu-trivial@nongnu.org; Mon, 10 Jun 2013 08:33:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1Um1Hy-0005Wv-QQ
	for qemu-trivial@nongnu.org; Mon, 10 Jun 2013 08:33:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:11931)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>)
	id 1Um1Hv-0005W2-VY; Mon, 10 Jun 2013 08:33:32 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r5ACXU2g024163
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 10 Jun 2013 08:33:30 -0400
Received: from dhcp-200-207.str.redhat.com (dhcp-192-246.str.redhat.com
	[10.33.192.246])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with SMTP
	id r5ACXSZQ030115; Mon, 10 Jun 2013 08:33:29 -0400
Date: Mon, 10 Jun 2013 14:33:28 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Peter Wu <lekensteyn@gmail.com>
Message-ID: <20130610123328.GF3636@dhcp-200-207.str.redhat.com>
References: <11837115.9GZ72nQAUt@al>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <11837115.9GZ72nQAUt@al>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Anthony Liguori <aliguori@us.ibm.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] gtk: implement -full-screen
	and -no-frame
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
X-List-Received-Date: Mon, 10 Jun 2013 12:33:37 -0000

Am 09.06.2013 um 12:30 hat Peter Wu geschrieben:
> Aiming for GTK as replacement for SDL, features like -full-screen and -no-frame
> should also be implemented.
> 
> Bringing the window into full-screen mode is done by faking activating the full
> screen menu item with a NULL menu item (which currently is not used by
> gd_menu_full_screen). This is done after showing the windows to make the cursor
> and menu hidden.
> 
> Signed-off-by: Peter Wu <lekensteyn@gmail.com>
> ---
>  include/ui/console.h |  2 +-
>  ui/gtk.c             | 10 +++++++++-
>  vl.c                 |  2 +-
>  3 files changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/include/ui/console.h b/include/ui/console.h
> index 4307b5f..7174ba9 100644
> --- a/include/ui/console.h
> +++ b/include/ui/console.h
> @@ -339,6 +339,6 @@ int index_from_keycode(int code);
>  
>  /* gtk.c */
>  void early_gtk_display_init(void);
> -void gtk_display_init(DisplayState *ds);
> +void gtk_display_init(DisplayState *ds, int full_screen, int no_frame);

Should the new arguments be bool?

Kevin

