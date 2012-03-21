Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SAShH-0001w4-GS
	for mharc-qemu-trivial@gnu.org; Wed, 21 Mar 2012 17:03:55 -0400
Received: from eggs.gnu.org ([208.118.235.92]:43833)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.portante@redhat.com>) id 1SAShB-0001rU-KE
	for qemu-trivial@nongnu.org; Wed, 21 Mar 2012 17:03:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.portante@redhat.com>) id 1SASh8-00063R-QY
	for qemu-trivial@nongnu.org; Wed, 21 Mar 2012 17:03:49 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56825)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.portante@redhat.com>)
	id 1SASh2-00060E-SI; Wed, 21 Mar 2012 17:03:41 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q2LL3dxR014499
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Wed, 21 Mar 2012 17:03:39 -0400
Received: from frodo.bos.redhat.com (frodo.bos.redhat.com [10.16.184.50])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q2LL3bdM024568; Wed, 21 Mar 2012 17:03:38 -0400
From: Peter Portante <peter.portante@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 21 Mar 2012 17:02:45 -0400
Message-Id: <1332363767-21327-3-git-send-email-peter.portante@redhat.com>
In-Reply-To: <1332363767-21327-1-git-send-email-peter.portante@redhat.com>
References: <1332363767-21327-1-git-send-email-peter.portante@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Peter Portante <pportant@redhat.com>
Subject: [Qemu-trivial] [PATCH 2/4] More work to fix up the formatting and
	the whitespace of this module to conform to the coding standard.
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
 slirp/slirp.c |  381 +++++++++++++++++++++++++++++++--------------------------
 1 files changed, 205 insertions(+), 176 deletions(-)

diff --git a/slirp/slirp.c b/slirp/slirp.c
index ca0ff94..40f7523 100644
--- a/slirp/slirp.c
+++ b/slirp/slirp.c
@@ -295,15 +295,17 @@ void slirp_select_fill(int *pnfds,
             /*
              * See if we need a tcp_fasttimo
              */
-            if (time_fasttimo == 0 && so->so_tcpcb->t_flags & TF_DELACK)
-               time_fasttimo = curtime; /* Flag when we want a fasttimo */
+            if (time_fasttimo == 0 && so->so_tcpcb->t_flags & TF_DELACK) {
+                time_fasttimo = curtime; /* Flag when we want a fasttimo */
+            }
 
             /*
              * NOFDREF can include still connecting to local-host,
              * newly socreated() sockets etc. Don't want to select these.
              */
-            if (so->so_state & SS_NOFDREF || so->s == -1)
-               continue;
+            if (so->so_state & SS_NOFDREF || so->s == -1) {
+                continue;
+            }
 
             /*
              * Set for reading sockets which are accepting
@@ -336,7 +338,8 @@ void slirp_select_fill(int *pnfds,
              * Set for reading (and urgent data) if we are connected, can
              * receive more, and we have room for it XXX /2 ?
              */
-            if (CONN_CANFRCV(so) && (so->so_snd.sb_cc < (so->so_snd.sb_datalen/2))) {
+            if (CONN_CANFRCV(so)
+                    && (so->so_snd.sb_cc < (so->so_snd.sb_datalen/2))) {
                 FD_SET(so->s, readfds);
                 FD_SET(so->s, xfds);
                 UPD_NFDS(so->s);
@@ -357,8 +360,9 @@ void slirp_select_fill(int *pnfds,
                 if (so->so_expire <= curtime) {
                     udp_detach(so);
                     continue;
-                } else
+                } else {
                     do_slowtimo = 1; /* Let socket expire */
+                }
             }
 
             /*
@@ -377,33 +381,33 @@ void slirp_select_fill(int *pnfds,
             }
         }
 
-                /*
-                 * ICMP sockets
-                 */
-                for (so = slirp->icmp.so_next; so != &slirp->icmp;
-                     so = so_next) {
-                    so_next = so->so_next;
-
-                    /*
-                     * See if it's timed out
-                     */
-                    if (so->so_expire) {
-                        if (so->so_expire <= curtime) {
-                            icmp_detach(so);
-                            continue;
-                        } else {
-                            do_slowtimo = 1; /* Let socket expire */
-                        }
-                    }
+        /*
+         * ICMP sockets
+         */
+        for (so = slirp->icmp.so_next; so != &slirp->icmp;
+             so = so_next) {
+            so_next = so->so_next;
 
-                    if (so->so_state & SS_ISFCONNECTED) {
-                        FD_SET(so->s, readfds);
-                        UPD_NFDS(so->s);
-                    }
+            /*
+             * See if it's timed out
+             */
+            if (so->so_expire) {
+                if (so->so_expire <= curtime) {
+                    icmp_detach(so);
+                    continue;
+                } else {
+                    do_slowtimo = 1; /* Let socket expire */
                 }
+            }
+
+            if (so->so_state & SS_ISFCONNECTED) {
+                FD_SET(so->s, readfds);
+                UPD_NFDS(so->s);
+            }
+        }
     }
 
-        *pnfds = nfds;
+    *pnfds = nfds;
 }
 
 void slirp_select_poll(fd_set *readfds, fd_set *writefds, fd_set *xfds,
@@ -424,9 +428,9 @@ void slirp_select_poll(fd_set *readfds, fd_set *writefds, fd_set *xfds,
     curtime = qemu_get_clock_ms(rt_clock);
 
     QTAILQ_FOREACH(slirp, &slirp_instances, entry) {
-    /*
-     * See if anything has timed out
-     */
+        /*
+         * See if anything has timed out
+         */
         if (time_fasttimo && ((curtime - time_fasttimo) >= 2)) {
             tcp_fasttimo(slirp);
             time_fasttimo = 0;
@@ -437,152 +441,157 @@ void slirp_select_poll(fd_set *readfds, fd_set *writefds, fd_set *xfds,
             last_slowtimo = curtime;
         }
 
-    /*
-     * Check sockets
-     */
-    if (!select_error) {
         /*
-         * Check TCP sockets
+         * Check sockets
          */
-        for (so = slirp->tcb.so_next; so != &slirp->tcb;
-             so = so_next) {
-            so_next = so->so_next;
-
+        if (!select_error) {
             /*
-             * FD_ISSET is meaningless on these sockets
-             * (and they can crash the program)
+             * Check TCP sockets
              */
-            if (so->so_state & SS_NOFDREF || so->s == -1)
-               continue;
+            for (so = slirp->tcb.so_next; so != &slirp->tcb;
+                 so = so_next) {
+                so_next = so->so_next;
 
-            /*
-             * Check for URG data
-             * This will soread as well, so no need to
-             * test for readfds below if this succeeds
-             */
-            if (FD_ISSET(so->s, xfds))
-               sorecvoob(so);
-            /*
-             * Check sockets for reading
-             */
-            else if (FD_ISSET(so->s, readfds)) {
                 /*
-                 * Check for incoming connections
+                 * FD_ISSET is meaningless on these sockets
+                 * (and they can crash the program)
                  */
-                if (so->so_state & SS_FACCEPTCONN) {
-                    tcp_connect(so);
-                    continue;
-                } /* else */
-                ret = soread(so);
+                if (so->so_state & SS_NOFDREF || so->s == -1) {
+                   continue;
+                }
 
-                /* Output it if we read something */
-                if (ret > 0)
-                   tcp_output(sototcpcb(so));
-            }
+                /*
+                 * Check for URG data
+                 * This will soread as well, so no need to
+                 * test for readfds below if this succeeds
+                 */
+                if (FD_ISSET(so->s, xfds)) {
+                    sorecvoob(so);
+                } else {
+                    /*
+                     * Check sockets for reading
+                     */
+                    if (FD_ISSET(so->s, readfds)) {
+                        /*
+                         * Check for incoming connections
+                         */
+                        if (so->so_state & SS_FACCEPTCONN) {
+                            tcp_connect(so);
+                            continue;
+                        } /* else */
+                        ret = soread(so);
 
-            /*
-             * Check sockets for writing
-             */
-            if (FD_ISSET(so->s, writefds)) {
-              /*
-               * Check for non-blocking, still-connecting sockets
-               */
-              if (so->so_state & SS_ISFCONNECTING) {
-                /* Connected */
-                so->so_state &= ~SS_ISFCONNECTING;
-
-                ret = send(so->s, (const void *) &ret, 0, 0);
-                if (ret < 0) {
-                  /* XXXXX Must fix, zero bytes is a NOP */
-                  if (errno == EAGAIN || errno == EWOULDBLOCK ||
-                  errno == EINPROGRESS || errno == ENOTCONN)
-                continue;
+                        /* Output it if we read something */
+                        if (ret > 0) {
+                            tcp_output(sototcpcb(so));
+                        }
+                    }
+                }
 
-                  /* else failed */
-                  so->so_state &= SS_PERSISTENT_MASK;
-                  so->so_state |= SS_NOFDREF;
+                /*
+                 * Check sockets for writing
+                 */
+                if (FD_ISSET(so->s, writefds)) {
+                    /*
+                     * Check for non-blocking, still-connecting sockets
+                     */
+                    if (so->so_state & SS_ISFCONNECTING) {
+                        /* Connected */
+                        so->so_state &= ~SS_ISFCONNECTING;
+
+                        ret = send(so->s, (const void *) &ret, 0, 0);
+                        if (ret < 0) {
+                            /* XXXXX Must fix, zero bytes is a NOP */
+                            if (errno == EAGAIN || errno == EWOULDBLOCK ||
+                                errno == EINPROGRESS || errno == ENOTCONN) {
+                                continue;
+                            }
+
+                            /* else failed */
+                            so->so_state &= SS_PERSISTENT_MASK;
+                            so->so_state |= SS_NOFDREF;
+                        }
+                        /* else so->so_state &= ~SS_ISFCONNECTING; */
+
+                        /*
+                         * Continue tcp_input
+                         */
+                        tcp_input((struct mbuf *)NULL, sizeof(struct ip), so);
+                        /* continue; */
+                    } else {
+                        ret = sowrite(so);
+                    }
+                    /*
+                     * XXXXX If we wrote something (a lot), there
+                     * could be a need for a window update.
+                     * In the worst case, the remote will send
+                     * a window probe to get things going again
+                     */
                 }
-                /* else so->so_state &= ~SS_ISFCONNECTING; */
 
                 /*
-                 * Continue tcp_input
+                 * Probe a still-connecting, non-blocking socket
+                 * to check if it's still alive
                  */
-                tcp_input((struct mbuf *)NULL, sizeof(struct ip), so);
-                /* continue; */
-              } else
-                ret = sowrite(so);
-              /*
-               * XXXXX If we wrote something (a lot), there
-               * could be a need for a window update.
-               * In the worst case, the remote will send
-               * a window probe to get things going again
-               */
+#ifdef PROBE_CONN
+                if (so->so_state & SS_ISFCONNECTING) {
+                    ret = qemu_recv(so->s, &ret, 0,0);
+
+                    if (ret < 0) {
+                        /* XXX */
+                        if (errno == EAGAIN || errno == EWOULDBLOCK ||
+                            errno == EINPROGRESS || errno == ENOTCONN) {
+                            continue; /* Still connecting, continue */
+                        }
+                        /* else failed */
+                        so->so_state &= SS_PERSISTENT_MASK;
+                        so->so_state |= SS_NOFDREF;
+
+                        /* tcp_input will take care of it */
+                    } else {
+                        ret = send(so->s, &ret, 0,0);
+                        if (ret < 0) {
+                            /* XXX */
+                            if (errno == EAGAIN || errno == EWOULDBLOCK ||
+                                errno == EINPROGRESS || errno == ENOTCONN) {
+                                continue;
+                            }
+                            /* else failed */
+                            so->so_state &= SS_PERSISTENT_MASK;
+                            so->so_state |= SS_NOFDREF;
+                        } else {
+                          so->so_state &= ~SS_ISFCONNECTING;
+                        }
+                    }
+                    tcp_input((struct mbuf *)NULL, sizeof(struct ip),so);
+                } /* SS_ISFCONNECTING */
+#endif
             }
 
             /*
-             * Probe a still-connecting, non-blocking socket
-             * to check if it's still alive
+             * Now UDP sockets.
+             * Incoming packets are sent straight away, they're not buffered.
+             * Incoming UDP data isn't buffered either.
              */
-#ifdef PROBE_CONN
-            if (so->so_state & SS_ISFCONNECTING) {
-                          ret = qemu_recv(so->s, &ret, 0,0);
-
-              if (ret < 0) {
-                /* XXX */
-                if (errno == EAGAIN || errno == EWOULDBLOCK ||
-                errno == EINPROGRESS || errno == ENOTCONN)
-                  continue; /* Still connecting, continue */
-
-                /* else failed */
-                so->so_state &= SS_PERSISTENT_MASK;
-                so->so_state |= SS_NOFDREF;
-
-                /* tcp_input will take care of it */
-              } else {
-                ret = send(so->s, &ret, 0,0);
-                if (ret < 0) {
-                  /* XXX */
-                  if (errno == EAGAIN || errno == EWOULDBLOCK ||
-                  errno == EINPROGRESS || errno == ENOTCONN)
-                continue;
-                  /* else failed */
-                  so->so_state &= SS_PERSISTENT_MASK;
-                  so->so_state |= SS_NOFDREF;
-                } else
-                  so->so_state &= ~SS_ISFCONNECTING;
-
-              }
-              tcp_input((struct mbuf *)NULL, sizeof(struct ip),so);
-            } /* SS_ISFCONNECTING */
-#endif
-        }
-
-        /*
-         * Now UDP sockets.
-         * Incoming packets are sent straight away, they're not buffered.
-         * Incoming UDP data isn't buffered either.
-         */
-        for (so = slirp->udb.so_next; so != &slirp->udb;
-             so = so_next) {
-            so_next = so->so_next;
+            for (so = slirp->udb.so_next; so != &slirp->udb; so = so_next) {
+                so_next = so->so_next;
 
-            if (so->s != -1 && FD_ISSET(so->s, readfds)) {
-                            sorecvfrom(so);
-                        }
-        }
+                if (so->s != -1 && FD_ISSET(so->s, readfds)) {
+                    sorecvfrom(so);
+                }
+            }
 
-                /*
-                 * Check incoming ICMP relies.
-                 */
-                for (so = slirp->icmp.so_next; so != &slirp->icmp;
-                     so = so_next) {
-                     so_next = so->so_next;
+            /*
+             * Check incoming ICMP relies.
+             */
+            for (so = slirp->icmp.so_next; so != &slirp->icmp; so = so_next) {
+                so_next = so->so_next;
 
-                    if (so->s != -1 && FD_ISSET(so->s, readfds)) {
-                        icmp_receive(so);
-                    }
+                if (so->s != -1 && FD_ISSET(so->s, readfds)) {
+                    icmp_receive(so);
                 }
-    }
+            }
+        }
 
         if_start(slirp);
     }
@@ -618,11 +627,13 @@ static void arp_input(Slirp *slirp, const uint8_t *pkt, int pkt_len)
         if ((ah->ar_tip & slirp->vnetwork_mask.s_addr) ==
             slirp->vnetwork_addr.s_addr) {
             if (ah->ar_tip == slirp->vnameserver_addr.s_addr ||
-                ah->ar_tip == slirp->vhost_addr.s_addr)
+                ah->ar_tip == slirp->vhost_addr.s_addr) {
                 goto arp_ok;
+            }
             for (ex_ptr = slirp->exec_list; ex_ptr; ex_ptr = ex_ptr->ex_next) {
-                if (ex_ptr->ex_addr.s_addr == ah->ar_tip)
+                if (ex_ptr->ex_addr.s_addr == ah->ar_tip) {
                     goto arp_ok;
+                }
             }
             return;
         arp_ok:
@@ -661,8 +672,9 @@ void slirp_input(Slirp *slirp, const uint8_t *pkt, int pkt_len)
     struct mbuf *m;
     int proto;
 
-    if (pkt_len < ETH_HLEN)
+    if (pkt_len < ETH_HLEN) {
         return;
+    }
 
     proto = ntohs(*(uint16_t *)(pkt + 12));
     switch(proto) {
@@ -671,8 +683,9 @@ void slirp_input(Slirp *slirp, const uint8_t *pkt, int pkt_len)
         break;
     case ETH_P_IP:
         m = m_get(slirp);
-        if (!m)
+        if (!m) {
             return;
+        }
         /* Note: we add to align the IP header */
         if (M_FREEROOM(m) < pkt_len + 2) {
             m_inc(m, pkt_len + 2);
@@ -786,12 +799,14 @@ int slirp_add_hostfwd(Slirp *slirp, int is_udp, struct in_addr host_addr,
     }
     if (is_udp) {
         if (!udp_listen(slirp, host_addr.s_addr, htons(host_port),
-                        guest_addr.s_addr, htons(guest_port), SS_HOSTFWD))
+                        guest_addr.s_addr, htons(guest_port), SS_HOSTFWD)) {
             return -1;
+        }
     } else {
         if (!tcp_listen(slirp, host_addr.s_addr, htons(host_port),
-                        guest_addr.s_addr, htons(guest_port), SS_HOSTFWD))
+                        guest_addr.s_addr, htons(guest_port), SS_HOSTFWD)) {
             return -1;
+        }
     }
     return 0;
 }
@@ -845,11 +860,13 @@ size_t slirp_socket_can_recv(Slirp *slirp, struct in_addr guest_addr,
 
     so = slirp_find_ctl_socket(slirp, guest_addr, guest_port);
 
-    if (!so || so->so_state & SS_NOFDREF)
+    if (!so || so->so_state & SS_NOFDREF) {
         return 0;
+    }
 
-    if (!CONN_CANFRCV(so) || so->so_snd.sb_cc >= (so->so_snd.sb_datalen/2))
+    if (!CONN_CANFRCV(so) || so->so_snd.sb_cc >= (so->so_snd.sb_datalen/2)) {
         return 0;
+    }
 
     return sopreprbuf(so, iov, NULL);
 }
@@ -860,13 +877,15 @@ void slirp_socket_recv(Slirp *slirp, struct in_addr guest_addr, int guest_port,
     int ret;
     struct socket *so = slirp_find_ctl_socket(slirp, guest_addr, guest_port);
 
-    if (!so)
+    if (!so) {
         return;
+    }
 
     ret = soreadbuf(so, (const char *)buf, size);
 
-    if (ret > 0)
+    if (ret > 0) {
         tcp_output(sototcpcb(so));
+    }
 }
 
 static void slirp_tcp_save(QEMUFile *f, struct tcpcb *tp)
@@ -960,17 +979,19 @@ static void slirp_state_save(QEMUFile *f, void *opaque)
     Slirp *slirp = opaque;
     struct ex_list *ex_ptr;
 
-    for (ex_ptr = slirp->exec_list; ex_ptr; ex_ptr = ex_ptr->ex_next)
+    for (ex_ptr = slirp->exec_list; ex_ptr; ex_ptr = ex_ptr->ex_next) {
         if (ex_ptr->ex_pty == 3) {
             struct socket *so;
             so = slirp_find_ctl_socket(slirp, ex_ptr->ex_addr,
                                        ntohs(ex_ptr->ex_fport));
-            if (!so)
+            if (!so) {
                 continue;
+            }
 
             qemu_put_byte(f, 42);
             slirp_socket_save(f, so);
         }
+    }
     qemu_put_byte(f, 0);
 
     qemu_put_be16(f, slirp->ip_id);
@@ -983,8 +1004,9 @@ static void slirp_tcp_load(QEMUFile *f, struct tcpcb *tp)
     int i;
 
     tp->t_state = qemu_get_sbe16(f);
-    for (i = 0; i < TCPT_NTIMERS; i++)
+    for (i = 0; i < TCPT_NTIMERS; i++) {
         tp->t_timer[i] = qemu_get_sbe16(f);
+    }
     tp->t_rxtshift = qemu_get_sbe16(f);
     tp->t_rxtcur = qemu_get_sbe16(f);
     tp->t_dupacks = qemu_get_sbe16(f);
@@ -1035,8 +1057,9 @@ static int slirp_sbuf_load(QEMUFile *f, struct sbuf *sbuf)
 
     sbreserve(sbuf, sb_datalen);
 
-    if (sbuf->sb_datalen != sb_datalen)
+    if (sbuf->sb_datalen != sb_datalen) {
         return -ENOMEM;
+    }
 
     sbuf->sb_cc = sb_cc;
 
@@ -1051,8 +1074,9 @@ static int slirp_sbuf_load(QEMUFile *f, struct sbuf *sbuf)
 
 static int slirp_socket_load(QEMUFile *f, struct socket *so)
 {
-    if (tcp_attach(so) < 0)
+    if (tcp_attach(so) < 0) {
         return -ENOMEM;
+    }
 
     so->so_urgc = qemu_get_be32(f);
     so->so_faddr.s_addr = qemu_get_be32(f);
@@ -1063,10 +1087,12 @@ static int slirp_socket_load(QEMUFile *f, struct socket *so)
     so->so_emu = qemu_get_byte(f);
     so->so_type = qemu_get_byte(f);
     so->so_state = qemu_get_be32(f);
-    if (slirp_sbuf_load(f, &so->so_rcv) < 0)
+    if (slirp_sbuf_load(f, &so->so_rcv) < 0) {
         return -ENOMEM;
-    if (slirp_sbuf_load(f, &so->so_snd) < 0)
+    }
+    if (slirp_sbuf_load(f, &so->so_snd) < 0) {
         return -ENOMEM;
+    }
     slirp_tcp_load(f, so->so_tcpcb);
 
     return 0;
@@ -1091,13 +1117,15 @@ static int slirp_state_load(QEMUFile *f, void *opaque, int version_id)
         int ret;
         struct socket *so = socreate(slirp);
 
-        if (!so)
+        if (!so) {
             return -ENOMEM;
+        }
 
         ret = slirp_socket_load(f, so);
 
-        if (ret < 0)
+        if (ret < 0) {
             return ret;
+        }
 
         if ((so->so_faddr.s_addr & slirp->vnetwork_mask.s_addr) !=
             slirp->vnetwork_addr.s_addr) {
@@ -1110,8 +1138,9 @@ static int slirp_state_load(QEMUFile *f, void *opaque, int version_id)
                 break;
             }
         }
-        if (!ex_ptr)
+        if (!ex_ptr) {
             return -EINVAL;
+        }
 
         so->extra = (void *)ex_ptr->ex_exec;
     }
-- 
1.7.7.6


