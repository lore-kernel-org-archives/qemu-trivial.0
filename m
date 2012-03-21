Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SAShH-0001vt-EA
	for mharc-qemu-trivial@gnu.org; Wed, 21 Mar 2012 17:03:55 -0400
Received: from eggs.gnu.org ([208.118.235.92]:43857)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.portante@redhat.com>) id 1SAShE-0001uQ-2I
	for qemu-trivial@nongnu.org; Wed, 21 Mar 2012 17:03:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.portante@redhat.com>) id 1SAShB-00064K-Am
	for qemu-trivial@nongnu.org; Wed, 21 Mar 2012 17:03:51 -0400
Received: from mx1.redhat.com ([209.132.183.28]:6049)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.portante@redhat.com>)
	id 1SASh2-000607-E7; Wed, 21 Mar 2012 17:03:40 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q2LL3csm007868
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Wed, 21 Mar 2012 17:03:38 -0400
Received: from frodo.bos.redhat.com (frodo.bos.redhat.com [10.16.184.50])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q2LL3bdL024568; Wed, 21 Mar 2012 17:03:38 -0400
From: Peter Portante <peter.portante@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 21 Mar 2012 17:02:44 -0400
Message-Id: <1332363767-21327-2-git-send-email-peter.portante@redhat.com>
In-Reply-To: <1332363767-21327-1-git-send-email-peter.portante@redhat.com>
References: <1332363767-21327-1-git-send-email-peter.portante@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Peter Portante <pportant@redhat.com>
Subject: [Qemu-trivial] [PATCH 1/4] More whitespace cleanup in preparation
	for future commits.
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
X-List-Received-Date: Wed, 21 Mar 2012 21:03:54 -0000

Signed-off-by: Peter Portante <pportant@redhat.com>
---
 block_int.h   |    4 +-
 qemu-timer.c  |    6 +-
 slirp/slirp.c |  526 ++++++++++++++++++++++++++++----------------------------
 3 files changed, 268 insertions(+), 268 deletions(-)

diff --git a/block_int.h b/block_int.h
index b460c36..64e8b82 100644
--- a/block_int.h
+++ b/block_int.h
@@ -31,8 +31,8 @@
 #include "qemu-timer.h"
 #include "qapi-types.h"
 
-#define BLOCK_FLAG_ENCRYPT	1
-#define BLOCK_FLAG_COMPAT6	4
+#define BLOCK_FLAG_ENCRYPT      1
+#define BLOCK_FLAG_COMPAT6      4
 
 #define BLOCK_IO_LIMIT_READ     0
 #define BLOCK_IO_LIMIT_WRITE    1
diff --git a/qemu-timer.c b/qemu-timer.c
index d7f56e5..0eedf6e 100644
--- a/qemu-timer.c
+++ b/qemu-timer.c
@@ -65,7 +65,7 @@ struct QEMUClock {
 
 struct QEMUTimer {
     QEMUClock *clock;
-    int64_t expire_time;	/* in nanoseconds */
+    int64_t expire_time;    /* in nanoseconds */
     int scale;
     QEMUTimerCB *cb;
     void *opaque;
@@ -231,7 +231,7 @@ void configure_alarms(char const *opt)
             /* Ignore */
             goto next;
 
-	/* Swap */
+        /* Swap */
         tmp = alarm_timers[i];
         alarm_timers[i] = alarm_timers[cur];
         alarm_timers[cur] = tmp;
@@ -492,7 +492,7 @@ static void host_alarm_handler(int host_signum)
 {
     struct qemu_alarm_timer *t = alarm_timer;
     if (!t)
-	return;
+        return;
 
     if (alarm_has_dynticks(t) ||
         qemu_next_alarm_deadline () <= 0) {
diff --git a/slirp/slirp.c b/slirp/slirp.c
index 1502830..ca0ff94 100644
--- a/slirp/slirp.c
+++ b/slirp/slirp.c
@@ -275,107 +275,107 @@ void slirp_select_fill(int *pnfds,
     global_xfds = NULL;
 
     nfds = *pnfds;
-	/*
-	 * First, TCP sockets
-	 */
-	do_slowtimo = 0;
-
-	QTAILQ_FOREACH(slirp, &slirp_instances, entry) {
-		/*
-		 * *_slowtimo needs calling if there are IP fragments
-		 * in the fragment queue, or there are TCP connections active
-		 */
-		do_slowtimo |= ((slirp->tcb.so_next != &slirp->tcb) ||
-		    (&slirp->ipq.ip_link != slirp->ipq.ip_link.next));
-
-		for (so = slirp->tcb.so_next; so != &slirp->tcb;
-		     so = so_next) {
-			so_next = so->so_next;
-
-			/*
-			 * See if we need a tcp_fasttimo
-			 */
-			if (time_fasttimo == 0 && so->so_tcpcb->t_flags & TF_DELACK)
-			   time_fasttimo = curtime; /* Flag when we want a fasttimo */
-
-			/*
-			 * NOFDREF can include still connecting to local-host,
-			 * newly socreated() sockets etc. Don't want to select these.
-	 		 */
-			if (so->so_state & SS_NOFDREF || so->s == -1)
-			   continue;
-
-			/*
-			 * Set for reading sockets which are accepting
-			 */
-			if (so->so_state & SS_FACCEPTCONN) {
+    /*
+     * First, TCP sockets
+     */
+    do_slowtimo = 0;
+
+    QTAILQ_FOREACH(slirp, &slirp_instances, entry) {
+        /*
+         * *_slowtimo needs calling if there are IP fragments
+         * in the fragment queue, or there are TCP connections active
+         */
+        do_slowtimo |= ((slirp->tcb.so_next != &slirp->tcb) ||
+            (&slirp->ipq.ip_link != slirp->ipq.ip_link.next));
+
+        for (so = slirp->tcb.so_next; so != &slirp->tcb;
+             so = so_next) {
+            so_next = so->so_next;
+
+            /*
+             * See if we need a tcp_fasttimo
+             */
+            if (time_fasttimo == 0 && so->so_tcpcb->t_flags & TF_DELACK)
+               time_fasttimo = curtime; /* Flag when we want a fasttimo */
+
+            /*
+             * NOFDREF can include still connecting to local-host,
+             * newly socreated() sockets etc. Don't want to select these.
+             */
+            if (so->so_state & SS_NOFDREF || so->s == -1)
+               continue;
+
+            /*
+             * Set for reading sockets which are accepting
+             */
+            if (so->so_state & SS_FACCEPTCONN) {
                                 FD_SET(so->s, readfds);
-				UPD_NFDS(so->s);
-				continue;
-			}
-
-			/*
-			 * Set for writing sockets which are connecting
-			 */
-			if (so->so_state & SS_ISFCONNECTING) {
-				FD_SET(so->s, writefds);
-				UPD_NFDS(so->s);
-				continue;
-			}
-
-			/*
-			 * Set for writing if we are connected, can send more, and
-			 * we have something to send
-			 */
-			if (CONN_CANFSEND(so) && so->so_rcv.sb_cc) {
-				FD_SET(so->s, writefds);
-				UPD_NFDS(so->s);
-			}
-
-			/*
-			 * Set for reading (and urgent data) if we are connected, can
-			 * receive more, and we have room for it XXX /2 ?
-			 */
-			if (CONN_CANFRCV(so) && (so->so_snd.sb_cc < (so->so_snd.sb_datalen/2))) {
-				FD_SET(so->s, readfds);
-				FD_SET(so->s, xfds);
-				UPD_NFDS(so->s);
-			}
-		}
-
-		/*
-		 * UDP sockets
-		 */
-		for (so = slirp->udb.so_next; so != &slirp->udb;
-		     so = so_next) {
-			so_next = so->so_next;
-
-			/*
-			 * See if it's timed out
-			 */
-			if (so->so_expire) {
-				if (so->so_expire <= curtime) {
-					udp_detach(so);
-					continue;
-				} else
-					do_slowtimo = 1; /* Let socket expire */
-			}
-
-			/*
-			 * When UDP packets are received from over the
-			 * link, they're sendto()'d straight away, so
-			 * no need for setting for writing
-			 * Limit the number of packets queued by this session
-			 * to 4.  Note that even though we try and limit this
-			 * to 4 packets, the session could have more queued
-			 * if the packets needed to be fragmented
-			 * (XXX <= 4 ?)
-			 */
-			if ((so->so_state & SS_ISFCONNECTED) && so->so_queued <= 4) {
-				FD_SET(so->s, readfds);
-				UPD_NFDS(so->s);
-			}
-		}
+                UPD_NFDS(so->s);
+                continue;
+            }
+
+            /*
+             * Set for writing sockets which are connecting
+             */
+            if (so->so_state & SS_ISFCONNECTING) {
+                FD_SET(so->s, writefds);
+                UPD_NFDS(so->s);
+                continue;
+            }
+
+            /*
+             * Set for writing if we are connected, can send more, and
+             * we have something to send
+             */
+            if (CONN_CANFSEND(so) && so->so_rcv.sb_cc) {
+                FD_SET(so->s, writefds);
+                UPD_NFDS(so->s);
+            }
+
+            /*
+             * Set for reading (and urgent data) if we are connected, can
+             * receive more, and we have room for it XXX /2 ?
+             */
+            if (CONN_CANFRCV(so) && (so->so_snd.sb_cc < (so->so_snd.sb_datalen/2))) {
+                FD_SET(so->s, readfds);
+                FD_SET(so->s, xfds);
+                UPD_NFDS(so->s);
+            }
+        }
+
+        /*
+         * UDP sockets
+         */
+        for (so = slirp->udb.so_next; so != &slirp->udb;
+             so = so_next) {
+            so_next = so->so_next;
+
+            /*
+             * See if it's timed out
+             */
+            if (so->so_expire) {
+                if (so->so_expire <= curtime) {
+                    udp_detach(so);
+                    continue;
+                } else
+                    do_slowtimo = 1; /* Let socket expire */
+            }
+
+            /*
+             * When UDP packets are received from over the
+             * link, they're sendto()'d straight away, so
+             * no need for setting for writing
+             * Limit the number of packets queued by this session
+             * to 4.  Note that even though we try and limit this
+             * to 4 packets, the session could have more queued
+             * if the packets needed to be fragmented
+             * (XXX <= 4 ?)
+             */
+            if ((so->so_state & SS_ISFCONNECTED) && so->so_queued <= 4) {
+                FD_SET(so->s, readfds);
+                UPD_NFDS(so->s);
+            }
+        }
 
                 /*
                  * ICMP sockets
@@ -401,7 +401,7 @@ void slirp_select_fill(int *pnfds,
                         UPD_NFDS(so->s);
                     }
                 }
-	}
+    }
 
         *pnfds = nfds;
 }
@@ -424,152 +424,152 @@ void slirp_select_poll(fd_set *readfds, fd_set *writefds, fd_set *xfds,
     curtime = qemu_get_clock_ms(rt_clock);
 
     QTAILQ_FOREACH(slirp, &slirp_instances, entry) {
-	/*
-	 * See if anything has timed out
-	 */
-		if (time_fasttimo && ((curtime - time_fasttimo) >= 2)) {
-			tcp_fasttimo(slirp);
-			time_fasttimo = 0;
-		}
-		if (do_slowtimo && ((curtime - last_slowtimo) >= 499)) {
-			ip_slowtimo(slirp);
-			tcp_slowtimo(slirp);
-			last_slowtimo = curtime;
-		}
-
-	/*
-	 * Check sockets
-	 */
-	if (!select_error) {
-		/*
-		 * Check TCP sockets
-		 */
-		for (so = slirp->tcb.so_next; so != &slirp->tcb;
-		     so = so_next) {
-			so_next = so->so_next;
-
-			/*
-			 * FD_ISSET is meaningless on these sockets
-			 * (and they can crash the program)
-			 */
-			if (so->so_state & SS_NOFDREF || so->s == -1)
-			   continue;
-
-			/*
-			 * Check for URG data
-			 * This will soread as well, so no need to
-			 * test for readfds below if this succeeds
-			 */
-			if (FD_ISSET(so->s, xfds))
-			   sorecvoob(so);
-			/*
-			 * Check sockets for reading
-			 */
-			else if (FD_ISSET(so->s, readfds)) {
-				/*
-				 * Check for incoming connections
-				 */
-				if (so->so_state & SS_FACCEPTCONN) {
-					tcp_connect(so);
-					continue;
-				} /* else */
-				ret = soread(so);
-
-				/* Output it if we read something */
-				if (ret > 0)
-				   tcp_output(sototcpcb(so));
-			}
-
-			/*
-			 * Check sockets for writing
-			 */
-			if (FD_ISSET(so->s, writefds)) {
-			  /*
-			   * Check for non-blocking, still-connecting sockets
-			   */
-			  if (so->so_state & SS_ISFCONNECTING) {
-			    /* Connected */
-			    so->so_state &= ~SS_ISFCONNECTING;
-
-			    ret = send(so->s, (const void *) &ret, 0, 0);
-			    if (ret < 0) {
-			      /* XXXXX Must fix, zero bytes is a NOP */
-			      if (errno == EAGAIN || errno == EWOULDBLOCK ||
-				  errno == EINPROGRESS || errno == ENOTCONN)
-				continue;
-
-			      /* else failed */
-			      so->so_state &= SS_PERSISTENT_MASK;
-			      so->so_state |= SS_NOFDREF;
-			    }
-			    /* else so->so_state &= ~SS_ISFCONNECTING; */
-
-			    /*
-			     * Continue tcp_input
-			     */
-			    tcp_input((struct mbuf *)NULL, sizeof(struct ip), so);
-			    /* continue; */
-			  } else
-			    ret = sowrite(so);
-			  /*
-			   * XXXXX If we wrote something (a lot), there
-			   * could be a need for a window update.
-			   * In the worst case, the remote will send
-			   * a window probe to get things going again
-			   */
-			}
-
-			/*
-			 * Probe a still-connecting, non-blocking socket
-			 * to check if it's still alive
-	 	 	 */
+    /*
+     * See if anything has timed out
+     */
+        if (time_fasttimo && ((curtime - time_fasttimo) >= 2)) {
+            tcp_fasttimo(slirp);
+            time_fasttimo = 0;
+        }
+        if (do_slowtimo && ((curtime - last_slowtimo) >= 499)) {
+            ip_slowtimo(slirp);
+            tcp_slowtimo(slirp);
+            last_slowtimo = curtime;
+        }
+
+    /*
+     * Check sockets
+     */
+    if (!select_error) {
+        /*
+         * Check TCP sockets
+         */
+        for (so = slirp->tcb.so_next; so != &slirp->tcb;
+             so = so_next) {
+            so_next = so->so_next;
+
+            /*
+             * FD_ISSET is meaningless on these sockets
+             * (and they can crash the program)
+             */
+            if (so->so_state & SS_NOFDREF || so->s == -1)
+               continue;
+
+            /*
+             * Check for URG data
+             * This will soread as well, so no need to
+             * test for readfds below if this succeeds
+             */
+            if (FD_ISSET(so->s, xfds))
+               sorecvoob(so);
+            /*
+             * Check sockets for reading
+             */
+            else if (FD_ISSET(so->s, readfds)) {
+                /*
+                 * Check for incoming connections
+                 */
+                if (so->so_state & SS_FACCEPTCONN) {
+                    tcp_connect(so);
+                    continue;
+                } /* else */
+                ret = soread(so);
+
+                /* Output it if we read something */
+                if (ret > 0)
+                   tcp_output(sototcpcb(so));
+            }
+
+            /*
+             * Check sockets for writing
+             */
+            if (FD_ISSET(so->s, writefds)) {
+              /*
+               * Check for non-blocking, still-connecting sockets
+               */
+              if (so->so_state & SS_ISFCONNECTING) {
+                /* Connected */
+                so->so_state &= ~SS_ISFCONNECTING;
+
+                ret = send(so->s, (const void *) &ret, 0, 0);
+                if (ret < 0) {
+                  /* XXXXX Must fix, zero bytes is a NOP */
+                  if (errno == EAGAIN || errno == EWOULDBLOCK ||
+                  errno == EINPROGRESS || errno == ENOTCONN)
+                continue;
+
+                  /* else failed */
+                  so->so_state &= SS_PERSISTENT_MASK;
+                  so->so_state |= SS_NOFDREF;
+                }
+                /* else so->so_state &= ~SS_ISFCONNECTING; */
+
+                /*
+                 * Continue tcp_input
+                 */
+                tcp_input((struct mbuf *)NULL, sizeof(struct ip), so);
+                /* continue; */
+              } else
+                ret = sowrite(so);
+              /*
+               * XXXXX If we wrote something (a lot), there
+               * could be a need for a window update.
+               * In the worst case, the remote will send
+               * a window probe to get things going again
+               */
+            }
+
+            /*
+             * Probe a still-connecting, non-blocking socket
+             * to check if it's still alive
+             */
 #ifdef PROBE_CONN
-			if (so->so_state & SS_ISFCONNECTING) {
+            if (so->so_state & SS_ISFCONNECTING) {
                           ret = qemu_recv(so->s, &ret, 0,0);
 
-			  if (ret < 0) {
-			    /* XXX */
-			    if (errno == EAGAIN || errno == EWOULDBLOCK ||
-				errno == EINPROGRESS || errno == ENOTCONN)
-			      continue; /* Still connecting, continue */
-
-			    /* else failed */
-			    so->so_state &= SS_PERSISTENT_MASK;
-			    so->so_state |= SS_NOFDREF;
-
-			    /* tcp_input will take care of it */
-			  } else {
-			    ret = send(so->s, &ret, 0,0);
-			    if (ret < 0) {
-			      /* XXX */
-			      if (errno == EAGAIN || errno == EWOULDBLOCK ||
-				  errno == EINPROGRESS || errno == ENOTCONN)
-				continue;
-			      /* else failed */
-			      so->so_state &= SS_PERSISTENT_MASK;
-			      so->so_state |= SS_NOFDREF;
-			    } else
-			      so->so_state &= ~SS_ISFCONNECTING;
-
-			  }
-			  tcp_input((struct mbuf *)NULL, sizeof(struct ip),so);
-			} /* SS_ISFCONNECTING */
+              if (ret < 0) {
+                /* XXX */
+                if (errno == EAGAIN || errno == EWOULDBLOCK ||
+                errno == EINPROGRESS || errno == ENOTCONN)
+                  continue; /* Still connecting, continue */
+
+                /* else failed */
+                so->so_state &= SS_PERSISTENT_MASK;
+                so->so_state |= SS_NOFDREF;
+
+                /* tcp_input will take care of it */
+              } else {
+                ret = send(so->s, &ret, 0,0);
+                if (ret < 0) {
+                  /* XXX */
+                  if (errno == EAGAIN || errno == EWOULDBLOCK ||
+                  errno == EINPROGRESS || errno == ENOTCONN)
+                continue;
+                  /* else failed */
+                  so->so_state &= SS_PERSISTENT_MASK;
+                  so->so_state |= SS_NOFDREF;
+                } else
+                  so->so_state &= ~SS_ISFCONNECTING;
+
+              }
+              tcp_input((struct mbuf *)NULL, sizeof(struct ip),so);
+            } /* SS_ISFCONNECTING */
 #endif
-		}
-
-		/*
-		 * Now UDP sockets.
-		 * Incoming packets are sent straight away, they're not buffered.
-		 * Incoming UDP data isn't buffered either.
-		 */
-		for (so = slirp->udb.so_next; so != &slirp->udb;
-		     so = so_next) {
-			so_next = so->so_next;
-
-			if (so->s != -1 && FD_ISSET(so->s, readfds)) {
+        }
+
+        /*
+         * Now UDP sockets.
+         * Incoming packets are sent straight away, they're not buffered.
+         * Incoming UDP data isn't buffered either.
+         */
+        for (so = slirp->udb.so_next; so != &slirp->udb;
+             so = so_next) {
+            so_next = so->so_next;
+
+            if (so->s != -1 && FD_ISSET(so->s, readfds)) {
                             sorecvfrom(so);
                         }
-		}
+        }
 
                 /*
                  * Check incoming ICMP relies.
@@ -582,19 +582,19 @@ void slirp_select_poll(fd_set *readfds, fd_set *writefds, fd_set *xfds,
                         icmp_receive(so);
                     }
                 }
-	}
+    }
 
         if_start(slirp);
     }
 
-	/* clear global file descriptor sets.
-	 * these reside on the stack in vl.c
-	 * so they're unusable if we're not in
-	 * slirp_select_fill or slirp_select_poll.
-	 */
-	 global_readfds = NULL;
-	 global_writefds = NULL;
-	 global_xfds = NULL;
+    /* clear global file descriptor sets.
+     * these reside on the stack in vl.c
+     * so they're unusable if we're not in
+     * slirp_select_fill or slirp_select_poll.
+     */
+     global_readfds = NULL;
+     global_writefds = NULL;
+     global_xfds = NULL;
 }
 
 static void arp_input(Slirp *slirp, const uint8_t *pkt, int pkt_len)
@@ -815,12 +815,12 @@ int slirp_add_exec(Slirp *slirp, int do_pty, const void *args,
 
 ssize_t slirp_send(struct socket *so, const void *buf, size_t len, int flags)
 {
-	if (so->s == -1 && so->extra) {
-		qemu_chr_fe_write(so->extra, buf, len);
-		return len;
-	}
+    if (so->s == -1 && so->extra) {
+        qemu_chr_fe_write(so->extra, buf, len);
+        return len;
+    }
 
-	return send(so->s, buf, len, flags);
+    return send(so->s, buf, len, flags);
 }
 
 static struct socket *
@@ -840,18 +840,18 @@ slirp_find_ctl_socket(Slirp *slirp, struct in_addr guest_addr, int guest_port)
 size_t slirp_socket_can_recv(Slirp *slirp, struct in_addr guest_addr,
                              int guest_port)
 {
-	struct iovec iov[2];
-	struct socket *so;
+    struct iovec iov[2];
+    struct socket *so;
 
-	so = slirp_find_ctl_socket(slirp, guest_addr, guest_port);
+    so = slirp_find_ctl_socket(slirp, guest_addr, guest_port);
 
-	if (!so || so->so_state & SS_NOFDREF)
-		return 0;
+    if (!so || so->so_state & SS_NOFDREF)
+        return 0;
 
-	if (!CONN_CANFRCV(so) || so->so_snd.sb_cc >= (so->so_snd.sb_datalen/2))
-		return 0;
+    if (!CONN_CANFRCV(so) || so->so_snd.sb_cc >= (so->so_snd.sb_datalen/2))
+        return 0;
 
-	return sopreprbuf(so, iov, NULL);
+    return sopreprbuf(so, iov, NULL);
 }
 
 void slirp_socket_recv(Slirp *slirp, struct in_addr guest_addr, int guest_port,
-- 
1.7.7.6


