Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UxvtI-0002u5-Gb
	for mharc-qemu-trivial@gnu.org; Sat, 13 Jul 2013 05:13:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38170)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UxvtF-0002qG-PP
	for qemu-trivial@nongnu.org; Sat, 13 Jul 2013 05:13:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UxvtE-000845-DO
	for qemu-trivial@nongnu.org; Sat, 13 Jul 2013 05:13:17 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:36768)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1UxvtA-0007yr-1K; Sat, 13 Jul 2013 05:13:12 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 2C7DE41232;
	Sat, 13 Jul 2013 13:13:01 +0400 (MSK)
Message-ID: <51E11A1B.2020503@msgid.tls.msk.ru>
Date: Sat, 13 Jul 2013 13:12:59 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:17.0) Gecko/20130704 Icedove/17.0.7
MIME-Version: 1.0
To: Ed Maste <emaste@freebsd.org>
References: <1373660992-92075-1-git-send-email-emaste@freebsd.org>
In-Reply-To: <1373660992-92075-1-git-send-email-emaste@freebsd.org>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: multipart/mixed; boundary="------------060800090904070904060300"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Jan Kiszka <jan.kiszka@siemens.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] slirp: reorder include to fix FreeBSD
 build failure
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
X-List-Received-Date: Sat, 13 Jul 2013 09:13:19 -0000

This is a multi-part message in MIME format.
--------------060800090904070904060300
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

13.07.2013 00:29, Ed Maste wrote:
> Signed-off-by: Ed Maste <emaste@freebsd.org>
> ---
> The issue comes from slirp/mbuf.h #defining m_flags, which conflicts with
> a header included via <semaphore.h> on FreeBSD.

Umgh.  How.. disgusting... :(

Here's the code in question.


/* header at beginning of each mbuf: */
struct m_hdr {
        struct  mbuf *mh_next;          /* Linked list of mbufs */
        struct  mbuf *mh_prev;
        struct  mbuf *mh_nextpkt;       /* Next packet in queue/record */
        struct  mbuf *mh_prevpkt; /* Flags aren't used in the output queue */
        int     mh_flags;         /* Misc flags */
...
};

struct mbuf {
        struct  m_hdr m_hdr;
        Slirp *slirp;
        bool    arp_requested;
...
};

#define m_next          m_hdr.mh_next
#define m_prev          m_hdr.mh_prev
#define m_nextpkt       m_hdr.mh_nextpkt
#define m_prevpkt       m_hdr.mh_prevpkt
#define m_flags         m_hdr.mh_flags
...

It looks to me that we should just get rid of all this.
struct m_hdr isn't used anywhere else so all its
members can be included directly into struct mbuf,
removing a good portion of those disgusting #defines.

Remaining:

struct mbuf {
        union M_dat {
                char    m_dat_[1]; /* ANSI don't like 0 sized arrays */
                char    *m_ext_;
        } M_dat;
};

#define m_dat           M_dat.m_dat_
#define m_ext           M_dat.m_ext_

This can be done by using an unnamed union, ie, by omitting
M_dat.

And since the code almost everywhere uses those m_* defines, it
is trivial to fix this for real.

Something like the attached.

Maybe we should get rid of the rest of indirections here too,
ifq_prev ifs_prev etc, but i'm not sure about these.

Thanks,

/mjt

--------------060800090904070904060300
Content-Type: text/x-patch;
 name="slirp-remove-mbuf-m_hdr-m_dat-indirection.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="slirp-remove-mbuf-m_hdr-m_dat-indirection.patch"

From ca96db1db67a6d244ce983450929a0c32c26a9cd Mon Sep 17 00:00:00 2001
From: Michael Tokarev <mjt@tls.msk.ru>
Date: Sat, 13 Jul 2013 13:10:05 +0400
Subject: [PATCH] slirp: remove mbuf(m_hdr,m_dat) indirection

Signed-off-By: Michael Tokarev <mjt@tls.msk.ru>
---
 slirp/mbuf.h     |   51 ++++++++++++++++++---------------------------------
 slirp/tcp_subr.c |   12 ++++++------
 2 files changed, 24 insertions(+), 39 deletions(-)

diff --git a/slirp/mbuf.h b/slirp/mbuf.h
index 3f3ab09..b144f1c 100644
--- a/slirp/mbuf.h
+++ b/slirp/mbuf.h
@@ -49,22 +49,6 @@
  * free the m_ext.  This is inefficient memory-wise, but who cares.
  */
 
-/* XXX should union some of these! */
-/* header at beginning of each mbuf: */
-struct m_hdr {
-	struct	mbuf *mh_next;		/* Linked list of mbufs */
-	struct	mbuf *mh_prev;
-	struct	mbuf *mh_nextpkt;	/* Next packet in queue/record */
-	struct	mbuf *mh_prevpkt; /* Flags aren't used in the output queue */
-	int	mh_flags;	  /* Misc flags */
-
-	int	mh_size;		/* Size of data */
-	struct	socket *mh_so;
-
-	caddr_t	mh_data;		/* Location of data */
-	int	mh_len;			/* Amount of data in this mbuf */
-};
-
 /*
  * How much room is in the mbuf, from m_data to the end of the mbuf
  */
@@ -80,29 +64,30 @@ struct m_hdr {
 #define M_TRAILINGSPACE M_FREEROOM
 
 struct mbuf {
-	struct	m_hdr m_hdr;
+	/* XXX should union some of these! */
+	/* header at beginning of each mbuf: */
+	struct	mbuf *m_next;		/* Linked list of mbufs */
+	struct	mbuf *m_prev;
+	struct	mbuf *m_nextpkt;	/* Next packet in queue/record */
+	struct	mbuf *m_prevpkt;	/* Flags aren't used in the output queue */
+	int	m_flags;		/* Misc flags */
+
+	int	m_size;			/* Size of data */
+	struct	socket *m_so;
+
+	caddr_t	m_data;			/* Location of data */
+	int	m_len;			/* Amount of data in this mbuf */
+
 	Slirp *slirp;
 	bool	arp_requested;
 	uint64_t expiration_date;
 	/* start of dynamic buffer area, must be last element */
-	union M_dat {
-		char	m_dat_[1]; /* ANSI don't like 0 sized arrays */
-		char	*m_ext_;
-	} M_dat;
+	union {
+		char	m_dat[1]; /* ANSI don't like 0 sized arrays */
+		char	*m_ext;
+	};
 };
 
-#define m_next		m_hdr.mh_next
-#define m_prev		m_hdr.mh_prev
-#define m_nextpkt	m_hdr.mh_nextpkt
-#define m_prevpkt	m_hdr.mh_prevpkt
-#define m_flags		m_hdr.mh_flags
-#define	m_len		m_hdr.mh_len
-#define	m_data		m_hdr.mh_data
-#define m_size		m_hdr.mh_size
-#define m_dat		M_dat.m_dat_
-#define m_ext		M_dat.m_ext_
-#define m_so		m_hdr.mh_so
-
 #define ifq_prev m_prev
 #define ifq_next m_next
 #define ifs_prev m_prevpkt
diff --git a/slirp/tcp_subr.c b/slirp/tcp_subr.c
index e98ce1a..043f28f 100644
--- a/slirp/tcp_subr.c
+++ b/slirp/tcp_subr.c
@@ -647,7 +647,7 @@ tcp_emu(struct socket *so, struct mbuf *m)
 			n4 =  (laddr & 0xff);
 
 			m->m_len = bptr - m->m_data; /* Adjust length */
-                        m->m_len += snprintf(bptr, m->m_hdr.mh_size - m->m_len,
+                        m->m_len += snprintf(bptr, m->m_size - m->m_len,
                                              "ORT %d,%d,%d,%d,%d,%d\r\n%s",
                                              n1, n2, n3, n4, n5, n6, x==7?buff:"");
 			return 1;
@@ -680,7 +680,7 @@ tcp_emu(struct socket *so, struct mbuf *m)
 			n4 =  (laddr & 0xff);
 
 			m->m_len = bptr - m->m_data; /* Adjust length */
-			m->m_len += snprintf(bptr, m->m_hdr.mh_size - m->m_len,
+			m->m_len += snprintf(bptr, m->m_size - m->m_len,
                                              "27 Entering Passive Mode (%d,%d,%d,%d,%d,%d)\r\n%s",
                                              n1, n2, n3, n4, n5, n6, x==7?buff:"");
 
@@ -706,7 +706,7 @@ tcp_emu(struct socket *so, struct mbuf *m)
 		if (m->m_data[m->m_len-1] == '\0' && lport != 0 &&
 		    (so = tcp_listen(slirp, INADDR_ANY, 0, so->so_laddr.s_addr,
 		                     htons(lport), SS_FACCEPTONCE)) != NULL)
-                    m->m_len = snprintf(m->m_data, m->m_hdr.mh_size, "%d",
+                    m->m_len = snprintf(m->m_data, m->m_size, "%d",
                                         ntohs(so->so_fport)) + 1;
 		return 1;
 
@@ -726,7 +726,7 @@ tcp_emu(struct socket *so, struct mbuf *m)
 				return 1;
 			}
 			m->m_len = bptr - m->m_data; /* Adjust length */
-                        m->m_len += snprintf(bptr, m->m_hdr.mh_size,
+                        m->m_len += snprintf(bptr, m->m_size,
                                              "DCC CHAT chat %lu %u%c\n",
                                              (unsigned long)ntohl(so->so_faddr.s_addr),
                                              ntohs(so->so_fport), 1);
@@ -737,7 +737,7 @@ tcp_emu(struct socket *so, struct mbuf *m)
 				return 1;
 			}
 			m->m_len = bptr - m->m_data; /* Adjust length */
-                        m->m_len += snprintf(bptr, m->m_hdr.mh_size,
+                        m->m_len += snprintf(bptr, m->m_size,
                                              "DCC SEND %s %lu %u %u%c\n", buff,
                                              (unsigned long)ntohl(so->so_faddr.s_addr),
                                              ntohs(so->so_fport), n1, 1);
@@ -748,7 +748,7 @@ tcp_emu(struct socket *so, struct mbuf *m)
 				return 1;
 			}
 			m->m_len = bptr - m->m_data; /* Adjust length */
-                        m->m_len += snprintf(bptr, m->m_hdr.mh_size,
+                        m->m_len += snprintf(bptr, m->m_size,
                                              "DCC MOVE %s %lu %u %u%c\n", buff,
                                              (unsigned long)ntohl(so->so_faddr.s_addr),
                                              ntohs(so->so_fport), n1, 1);
-- 
1.7.10.4


--------------060800090904070904060300--

