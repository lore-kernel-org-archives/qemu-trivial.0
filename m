Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1S0rE6-0000Ly-FO
	for mharc-qemu-trivial@gnu.org; Fri, 24 Feb 2012 04:14:06 -0500
Received: from eggs.gnu.org ([140.186.70.92]:45428)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1S0rDy-0000Ka-Dx
	for qemu-trivial@nongnu.org; Fri, 24 Feb 2012 04:14:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1S0rDr-0006ac-H6
	for qemu-trivial@nongnu.org; Fri, 24 Feb 2012 04:13:57 -0500
Received: from mail-wi0-f173.google.com ([209.85.212.173]:33907)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1S0rDr-0006ZP-3O
	for qemu-trivial@nongnu.org; Fri, 24 Feb 2012 04:13:51 -0500
Received: by wibhi20 with SMTP id hi20so1564560wib.4
	for <qemu-trivial@nongnu.org>; Fri, 24 Feb 2012 01:13:50 -0800 (PST)
Received-SPF: pass (google.com: domain of stefanha@gmail.com designates
	10.180.78.6 as permitted sender) client-ip=10.180.78.6; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of stefanha@gmail.com
	designates 10.180.78.6 as permitted sender)
	smtp.mail=stefanha@gmail.com;
	dkim=pass header.i=stefanha@gmail.com
Received: from mr.google.com ([10.180.78.6])
	by 10.180.78.6 with SMTP id x6mr3113355wiw.18.1330074830426 (num_hops =
	1); Fri, 24 Feb 2012 01:13:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=LLRF2tjUIYSynncJzlk8AziPVsmG9iHgrFCLWa2LQkg=;
	b=QG1KKSqKuJ1hA0ZSZPPEYFTxjc+E+UKrhrtiP86wEzgttUsyim2sK+/G0mWXKFAVwQ
	U5qq05zU83TMvTzxrw6Qz8lWm2gBS3JH2qTt9EfcZQWhyARrXnFpAj6ElmhnN7uwhG8G
	VHDu9JiGkcDA2nVyQ8DRAOHYmWkobH1Imbx2w=
Received: by 10.180.78.6 with SMTP id x6mr2488825wiw.18.1330074830340;
	Fri, 24 Feb 2012 01:13:50 -0800 (PST)
Received: from localhost (gbibp9ph1--blueice3n2.emea.ibm.com. [195.212.29.84])
	by mx.google.com with ESMTPS id m8sm5654740wia.11.2012.02.24.01.13.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 24 Feb 2012 01:13:49 -0800 (PST)
Date: Fri, 24 Feb 2012 08:29:54 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Alon Levy <alevy@redhat.com>
Message-ID: <20120224082954.GA26938@stefanha-thinkpad.localdomain>
References: <1330028982-13973-1-git-send-email-alevy@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1330028982-13973-1-git-send-email-alevy@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.212.173
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] slirp: workaround gcc
 __warn_memset_zero_len warnings
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
X-List-Received-Date: Fri, 24 Feb 2012 09:14:04 -0000

On Thu, Feb 23, 2012 at 10:29:42PM +0200, Alon Levy wrote:
> --- a/slirp/misc.c
> +++ b/slirp/misc.c
> @@ -358,7 +358,9 @@ void slirp_connection_info(Slirp *slirp, Monitor *mon)
>              dst_port = so->so_fport;
>          }
>          n = snprintf(buf, sizeof(buf), "  TCP[%s]", state);
> -        memset(&buf[n], ' ', 19 - n);
> +        if (n < 19) {
> +            memset(&buf[n], ' ', 19 - n);
> +        }
>          buf[19] = 0;
>          monitor_printf(mon, "%s %3d %15s %5d ", buf, so->s,
>                         src.sin_addr.s_addr ? inet_ntoa(src.sin_addr) : "*",

This whole memset approach is not necessary.  Let's drop this and use a
left-justified format string to do the space padding.  Feel free to try
this and send the patch:

diff --git a/slirp/misc.c b/slirp/misc.c
index 3432fbf..0308a62 100644
--- a/slirp/misc.c
+++ b/slirp/misc.c
@@ -333,7 +333,6 @@ void slirp_connection_info(Slirp *slirp, Monitor *mon)
     struct socket *so;
     const char *state;
     char buf[20];
-    int n;
 
     monitor_printf(mon, "  Protocol[State]    FD  Source Address  Port   "
                         "Dest. Address  Port RecvQ SendQ\n");
@@ -357,10 +356,8 @@ void slirp_connection_info(Slirp *slirp, Monitor *mon)
             dst_addr = so->so_faddr;
             dst_port = so->so_fport;
         }
-        n = snprintf(buf, sizeof(buf), "  TCP[%s]", state);
-        memset(&buf[n], ' ', 19 - n);
-        buf[19] = 0;
-        monitor_printf(mon, "%s %3d %15s %5d ", buf, so->s,
+        snprintf(buf, sizeof(buf), "  TCP[%s]", state);
+        monitor_printf(mon, "%-19s %3d %15s %5d ", buf, so->s,
                        src.sin_addr.s_addr ? inet_ntoa(src.sin_addr) : "*",
                        ntohs(src.sin_port));
         monitor_printf(mon, "%15s %5d %5d %5d\n",
@@ -370,22 +367,20 @@ void slirp_connection_info(Slirp *slirp, Monitor *mon)
 
     for (so = slirp->udb.so_next; so != &slirp->udb; so = so->so_next) {
         if (so->so_state & SS_HOSTFWD) {
-            n = snprintf(buf, sizeof(buf), "  UDP[HOST_FORWARD]");
+            snprintf(buf, sizeof(buf), "  UDP[HOST_FORWARD]");
             src_len = sizeof(src);
             getsockname(so->s, (struct sockaddr *)&src, &src_len);
             dst_addr = so->so_laddr;
             dst_port = so->so_lport;
         } else {
-            n = snprintf(buf, sizeof(buf), "  UDP[%d sec]",
+            snprintf(buf, sizeof(buf), "  UDP[%d sec]",
                          (so->so_expire - curtime) / 1000);
             src.sin_addr = so->so_laddr;
             src.sin_port = so->so_lport;
             dst_addr = so->so_faddr;
             dst_port = so->so_fport;
         }
-        memset(&buf[n], ' ', 19 - n);
-        buf[19] = 0;
-        monitor_printf(mon, "%s %3d %15s %5d ", buf, so->s,
+        monitor_printf(mon, "%-19s %3d %15s %5d ", buf, so->s,
                        src.sin_addr.s_addr ? inet_ntoa(src.sin_addr) : "*",
                        ntohs(src.sin_port));
         monitor_printf(mon, "%15s %5d %5d %5d\n",
@@ -394,13 +389,11 @@ void slirp_connection_info(Slirp *slirp, Monitor *mon)
     }
 
     for (so = slirp->icmp.so_next; so != &slirp->icmp; so = so->so_next) {
-        n = snprintf(buf, sizeof(buf), "  ICMP[%d sec]",
+        snprintf(buf, sizeof(buf), "  ICMP[%d sec]",
                      (so->so_expire - curtime) / 1000);
         src.sin_addr = so->so_laddr;
         dst_addr = so->so_faddr;
-        memset(&buf[n], ' ', 19 - n);
-        buf[19] = 0;
-        monitor_printf(mon, "%s %3d %15s  -    ", buf, so->s,
+        monitor_printf(mon, "%-19s %3d %15s  -    ", buf, so->s,
                        src.sin_addr.s_addr ? inet_ntoa(src.sin_addr) : "*");
         monitor_printf(mon, "%15s  -    %5d %5d\n", inet_ntoa(dst_addr),
                        so->so_rcv.sb_cc, so->so_snd.sb_cc);

