Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UhaMv-0006wQ-BY
	for mharc-qemu-trivial@gnu.org; Wed, 29 May 2013 03:00:21 -0400
Received: from eggs.gnu.org ([208.118.235.92]:33614)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>) id 1UhaMt-0006u7-KO
	for qemu-trivial@nongnu.org; Wed, 29 May 2013 03:00:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>) id 1UhaMr-0002DJ-NH
	for qemu-trivial@nongnu.org; Wed, 29 May 2013 03:00:19 -0400
Received: from goliath.siemens.de ([192.35.17.28]:25268)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>)
	id 1UhaMk-0002AZ-1Y; Wed, 29 May 2013 03:00:10 -0400
Received: from mail3.siemens.de (localhost [127.0.0.1])
	by goliath.siemens.de (8.13.6/8.13.6) with ESMTP id r4T706YL004044;
	Wed, 29 May 2013 09:00:06 +0200
Received: from netbook.home ([146.254.78.143])
	by mail3.siemens.de (8.13.6/8.13.6) with SMTP id r4T701Y8031467;
	Wed, 29 May 2013 09:00:03 +0200
Message-ID: <51A5A76E.6010205@siemens.com>
Date: Wed, 29 May 2013 15:59:58 +0900
From: Jan Kiszka <jan.kiszka@siemens.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de;
	rv:1.8.1.12) Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12
	Mnenhy/0.7.5.666
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>
References: <1369687911-9731-1-git-send-email-mjt@msgid.tls.msk.ru>
In-Reply-To: <1369687911-9731-1-git-send-email-mjt@msgid.tls.msk.ru>
X-Enigmail-Version: 1.5.1
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x
X-Received-From: 192.35.17.28
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH trivial] slirp: cleanup leftovers from
	misc.h
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
X-List-Received-Date: Wed, 29 May 2013 07:00:20 -0000

On 2013-05-28 05:51, Michael Tokarev wrote:
> There are quite a few leftover declarations in slirp/misc.h.
> Remove them.
> 
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> ---
>  slirp/misc.h |   14 --------------
>  1 file changed, 14 deletions(-)
> 
> I'm not entirely sure we should do this, since this kind of
> changes just moves us more and more away from the upstream, but...

AFAIK, there is no upstream worth tracking, so this is fine.

Jan

> 
> diff --git a/slirp/misc.h b/slirp/misc.h
> index cc36aeb..ba8beb1 100644
> --- a/slirp/misc.h
> +++ b/slirp/misc.h
> @@ -20,8 +20,6 @@ struct ex_list {
>  char *strdup(const char *);
>  #endif
>  
> -void do_wait(int);
> -
>  #define EMU_NONE 0x0
>  
>  /* TCP emulations */
> @@ -51,21 +49,9 @@ struct emu_t {
>      struct emu_t *next;
>  };
>  
> -extern int x_port, x_server, x_display;
> -
> -int show_x(char *, struct socket *);
> -void redir_x(uint32_t, int, int, int);
>  void slirp_insque(void *, void *);
>  void slirp_remque(void *);
>  int add_exec(struct ex_list **, int, char *, struct in_addr, int);
> -int slirp_openpty(int *, int *);
>  int fork_exec(struct socket *so, const char *ex, int do_pty);
> -void snooze_hup(int);
> -void snooze(void);
> -void relay(int);
> -void add_emu(char *);
> -void fd_nonblock(int);
> -void fd_block(int);
> -int rsh_exec(struct socket *, struct socket *, char *, char *, char *);
>  
>  #endif
> 

-- 
Siemens AG, Corporate Technology, CT RTC ITP SDP-DE
Corporate Competence Center Embedded Linux

